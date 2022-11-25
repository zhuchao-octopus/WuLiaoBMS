unit upgrede;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, jpeg, ComCtrls,Grids, DBGrids,registry,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,StrUtils,IdGlobal,
  Gauges, Buttons;

type
  Tupgradefm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    AD: TADOTable;
    aq: TADOQuery;
    DataSource1: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    DownLoadTcp: TIdTCPClient;
    Memo1: TMemo;
    Panel2: TPanel;
    Image1: TImage;
    Gauge1: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure getupdatedfile(RemoteFile, LocalFile: string);
    procedure connect(host,port,user,password:string);
    procedure Timer1Timer(Sender: TObject);
    procedure downloadfile(fromdir,DownToTheDir:string);
    procedure getprogress();
    procedure DownLoadTcpWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure DownLoadTcpWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
      function ConnectRemoteHost():boolean;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  upgradefm: Tupgradefm;

//appname:string;
//sqlserver:string;
//ftpserver:string;
//updatedfile:string;
//ftpport:string;
//ftpuser:string;
//ftppassword:string;
//clientversion:string;
//clientId:string;
updatedversion:string;
constr:string;
updateds:string;
hostiplist:Tstrings;
implementation
uses glbut;
//Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=HMEBOM;Data Source=ww
{$R *.dfm}
function Tupgradefm.ConnectRemoteHost():boolean;
var
i,port:integer;
//const hostiparry:array[0..1] of string=('192.168.4.145','');
begin
port:=7788;
result:=false;
for i:=0 to hostiplist.Count-1 do
begin
 memo1.Lines.Add('�������������ļ����ڵķ���������');
    try
    downloadtcp.Disconnect;
    downloadtcp.Host:=trim(hostiplist[i]);
    downloadtcp.Port:=port;
    downloadtcp.Connect;
    except
    result:=false;
    downloadtcp.Disconnect;
    end;
    if downloadtcp.Connected=true then
    begin
       result:=true;
       break;
    end;
end;
hostiplist.Clear;
hostiplist.Free;
//result:=true;
end;
procedure Tupgradefm.getprogress();
var
 i,b:word;
 x,y,dx,dy:real;
 ig:Timage;
 count:dword;
begin
  ig:=image1;
  count:=50;
  dx:=ig.Width/256;
  dy:=ig.Height;
  y:=0;
  x:=0;

  b:=255;
  ig.Canvas.Brush.Color:=rgb(255,255,255);
  ig.Canvas.FillRect(rect(0,0,ig.Width,ig.Height));
  ig.Update;
  for i:=0 to 255 do
  begin
     ig.Canvas.Brush.Color:=rgb(i,0,b);
     ig.Canvas.FillRect(rect(round(x),round(y),round(x+dx),round(dy)));
     x:=x+dx;
     b:=b-1;
    // wait(count);
  end;

end;
Function DelTheDir(ThePath:String):boolean;//ɾ����Ŀ¼�µ�������Ŀ¼���ļ�
var
  TheState  : integer;
  SearchRec : TSearchRec;
begin
  TheState := FindFirst(ThePath+'*.*', faAnyFile - faDirectory, SearchRec);
  while TheState = 0 do  //��ɾ���ļ�-----
  begin
      if not DeleteFile(PChar(ThePath + SearchRec.name)) then
      begin
       FileSetAttr (ThePath + SearchRec.name, 0); { reset all flags }
       DeleteFile (PChar(ThePath + SearchRec.name));       
      end;
   TheState := FindNext(SearchRec);
  end;
  SysUtils.FindClose(SearchRec);   
  TheState := FindFirst(ThePath + '*.*',faDirectory, SearchRec);
  while TheState = 0 do //��ɾ��Ŀ¼-----
  begin
    if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
    begin 
     if not RemoveDir(ThePath + SearchRec.name) then
     begin
       FileSetAttr (ThePath + SearchRec.name, faDirectory);
       DelTheDir(ThePath + SearchRec.name+'\');      
       RemoveDir(ThePath + SearchRec.name);     
     end;
    end;
    TheState := FindNext(SearchRec);
  end;
  SysUtils.FindClose(SearchRec);
  if ThePath[Length(ThePath)]='\' then 
  begin
   if RemoveDir(LeftStr(ThePath,length(ThePath)-1)) then
   DelTheDir:=True else DelTheDir:=False;   
  end;
  if ThePath[Length(ThePath)]<>'\' then 
  begin
   if RemoveDir(ThePath) then
   DelTheDir:=True else DelTheDir:=False;
  end;
end;
procedure Tupgradefm.downloadfile(fromdir,DownToTheDir:string);
var
  iReturn,i       :integer;
  ReadLen         :integer;//read Stream Length
  TheFileList     :TStringlist; //change to File list
  ReadFListStream :TStringStream; //read remote filelist stream
  DownLoadFile    :String;
  RFStream        :TFileStream;//read single file Stream
 // DowntoTheDir    :String;//���ص����Ŀ¼
 // FromDir         :String;//���ص�Զ��Ŀ¼
  NewSubDir       :String;//��ȡ�µ�Ŀ¼�����ڴ���
  TheRootDir      :String;//��Ŀ¼���ڵ�Ŀ¼
  TempStr         :String;//��ʱ���ַ���
  SaveToTheFile   :String;//���浽���ļ�
  desfilepath:string;
  aa:string;
  j,k,l:integer;
begin
  Self.Tag:=1;

 // FromDir:=Edit3.Text;
 // DownToTheDir:=Edit2.Text;

  memo1.Lines.Add('��ʼ׼�����������ļ�.....');
  if FromDir[Length(FromDir)]='\' then
     TempStr:=StrUtils.LeftStr(FromDir,Length(FromDir)-1) else
     TempStr:=FromDir;

  NewSubDir:=ExtractFileName(TempStr);//��ȡ�µ���Ŀ¼��
  TheRootDir:=ExtractFilePath(TempStr);
  desfilepath:=DownToTheDir+'\'+NewSubDir;
 { if DirectoryExists(desfilepath) then
     if Application.MessageBox('=====Ŀ��Ŀ¼�Ѿ�����!====='+
	      #10#13+'���ѡ��ȷ���򸲸�ԭĿ¼�µ������ļ���',				 
		'�ƶ���ʾ��',MB_OKCANCEL+MB_ICONSTOP)<>IDOK then
    begin
		animate1.Active:=false;
    exit;
    end;     }
 // if Form1.ConnectRemoteHost(DownLoadTcp,Form1.TheFileConnectRec) then
  begin //============================================================
 //    Animate1.Active:=True;                                 // ���������ԭ��
 //    Bitbtn1.Enabled:=False;
     try
 //      iReturn:=DownLoadTcp.ReadInteger;//��ȡ���Ӻ�������Ϣ,��ʾ����֤��ԭ��
       DownLoadTcp.Write('ϵͳ����'+EOL);    //1-SendfileCMD         // ���������ԭ��
       DownLoadTcp.Write('ϵͳ����'+EOL);    //2-Send The Directory name
     except
      // self.Caption:='���紫��ʧ�ܣ�';
         memo1.Lines.Add('���Ը���ʧ�ܣ�������');
       beep;
      // Animate1.Active:=False;
     //  Bitbtn1.Enabled:=True;
       exit;
     end;

     TheFilelist:=TStringList.Create;
     ReadFListStream:=TStringStream.Create(''); 

     try
       memo1.Lines.Add('���ڻ�ȡ�����ļ��б��С...');
       ReadLen:=DownLoadTcp.ReadInteger; //��ȡ������
              memo1.Lines.Add('���ڻ�ȡ�����ļ��б�...');
       DownLoadTcp.ReadStream(ReadFListStream,ReadLen,false); //��ȡ�ļ��б���
     except
     //  self.Caption:='���紫��ʧ�ܣ�';
        memo1.Lines.Add('���Ը���ʧ�ܣ�������');
       beep;
       TheFileList.Free;
       ReadFListStream.Free;
      // Animate1.Active:=False;
      // Bitbtn1.Enabled:=True;
       exit;
     end;
       ReadFListStream.position:=0;
       TheFileList.LoadFromStream(ReadFListStream);//ת�����ļ��б�

     DelTheDir(DownToTheDir+'\'+NewSubDir+'\'); //���Ŀ¼

  For i:=0 to TheFileList.Count-1 do    //getfiles
  begin
  if   ExtractFileName(TheFileList[i])='upgrade.exe' then
       continue;
	if self.Tag=0 then//�鿴ֹͣ��־ 
	begin
	  Try
	   DownLoadTcp.write('���ԶϿ���'+EOL);
	   DownLoadTcp.Disconnect;
	  except
	   TheFilelist.Free;
	   ReadFListStream.Free;
	   beep;
	  // Bitbtn1.Enabled:=True;
	  // Animate1.Active:=False;
	   exit;
	  end;
	   TheFilelist.Free;
	   ReadFListStream.Free; 	   
	   beep;
	   //Bitbtn1.Enabled:=True;
	 //  Animate1.Active:=False;
	   exit;
	end;
	DownLoadFile:=TheFileList[i];
	try
   memo1.Lines.Add('���ڻ�ȡ�����ļ���С...');
	  DownLoadTcp.write('�ļ���������'+EOL);
	  DownLoadTcp.Write(DownLoadFile+EOL);
	  ReadLen:=DownLoadTcp.ReadInteger;
	except
	 //  self.Caption:='���紫��ʧ�ܣ�';
      memo1.Lines.Add('���Ը���ʧ�ܣ�������');
	   beep;
	   TheFileList.Free;
	   ReadFListStream.Free;
	 //  Animate1.Active:=False;
	//   Bitbtn1.Enabled:=True;
	   exit;
	end;
	  memo1.Lines.Add(ExtractFileName(DownLoadFile)+' ,��С��'+IntToStr(ReadLen)+'�ֽ�');
	  memo1.Lines.Add('Ҫ���µ��ļ��У�'+IntToStr(TheFileList.Count)+'����'+
		       '�������Ե�'+IntToStr(i+1)+'��');
	 // memo1.Lines.Add(ExtractFilePath(DownLOadFile));


      j:=Length(DownLoadFile);
      k:=Length(TheRootDir);
      aa:='';
      l:=0;
      for l:=k+1 to j do
         begin
           aa:=aa+DownLoadFile[l];
         end;
     // aa:=StrUtils.RightStr(DownLoadFile,j-k);
	    SaveToTheFile:=DownToTheDir+'\'+aa;  //�ϳ����ļ���



	 // Edit2.Text:=ExtractFilePath(SaveToTheFile); //��ʾ���Ƶ���Ŀ¼��
	//-----����Ŀ¼	
	  if ForceDirectories(ExtractFilePath(SaveToTheFile))=false then
	      if Application.MessageBox('Ŀ��Ŀ¼��������',
		       '����',MB_OKCANCEL+MB_ICONSTOP)<>IDOK Then
	   begin
	     self.Caption:='�Ѿ�ȡ���˺����Ĳ�����';
	     beep;
	     TheFileList.Free;
	     ReadFListStream.Free;
	     //Animate1.Active:=False;
	    // Bitbtn1.Enabled:=True;
	     exit;   
	   end;
	//���ز�д�����ļ�
       try
    memo1.Lines.Add('���ڰ�װ����...');
	  RFStream:=TFileStream.Create(SaveToTheFile,fmCreate);
	  DownLoadTcp.ReadStream(RFStream,ReadLen,false); //���ص����ļ���
          RFStream.Free;
       except
 //	 self.Caption:='���紫��ʧ�ܣ�';
    memo1.Lines.Add('���Ը���ʧ�ܣ�������');
	 beep;
	 RFStream.Free;
	 TheFileList.Free;
	 ReadFListStream.Free;
	// Animate1.Active:=False;
	// Bitbtn1.Enabled:=True;
	 exit;
       end;  	
     end; //�������=====================================
     try
       DownLoadTcp.write('���ԶϿ���'+EOL);
     except
     end;
     beep;
    // Bitbtn1.Enabled:=True;
    // Animate1.Active:=False;
     TheFilelist.Free;
     ReadFListStream.Free;
     memo1.Lines.Add('��ɣ�������');
      memo1.Lines.Add('��ɣ�������');
       memo1.Lines.Add('��ɣ�������');
        memo1.Lines.Add('��ɣ�������');
    gauge1.Progress:=gauge1.MaxValue;
    // if checkbox1.Checked=true then close;
  end;
	 
end;
procedure Tupgradefm.getupdatedfile(RemoteFile, LocalFile: string);

begin
    try
     // NMFTP1.Download(RemoteFile, LocalFile);
    except
     //     On E:Exception do
      //   MessageBox(self.handle,PChar(e.message),'�޷���������ļ�������',64);        //PChar(e.message)
         
    end;
end;
procedure tupgradefm.connect(host,port,user,password:string);
begin
 // NMFTP1.Disconnect;
 // NMFTP1.Host :=host;
 // NMFTP1.Port := strtoint(port);
 // NMFTP1.Timeout := 0;
 // NMFTP1.UserID := user;
 // NMFTP1.Password :=password;
  // try
  //     NMFTP1.Connect;
  //  except
  //     On E:Exception do
  //   MessageBox(self.handle,PChar(e.message),'���ӱ��Ͽ�',64);        //PChar(e.message)
  //   end;
end;
procedure modifyversion(versions:string);

var
reg:tregistry;
begin
     reg:=Tregistry.Create;
     try
         reg.RootKey:=HKEY_CURRENT_USER;
         if (reg.OpenKey('Software\HMEBMS',true)) then
          reg.WriteString('Version',updatedversion);
     finally
        reg.CloseKey;
        reg.Free;
     end;

end;
procedure Tupgradefm.Button1Click(Sender: TObject);
var
//  updatedversion:string;
   sqlstr:string;
   rv:boolean;
   newfilename:string;
   i,j,sum:integer;
   fromdir:string;
begin
sum:=0;
memo1.Lines.Add('����׼������.....');
memo1.Lines.Add('���ڻ��������Ϣ.....');
//ShowMessage(ExtractFileDir(Application.Exename)); // ��: c:\temp
//ExtractFilePath(Application.Exename); // ��: c:\temp\ ��
newfilename:=ExtractFileDir(Application.Exename);
newfilename:=ExtractFileDir(newfilename);
//ExtractFileName(newfilename);
fromdir:='falcon_update_flag';
button1.Enabled:=false;

   //sqlserver:string;
   //updatedfile:string;
   //port:string;
   //ftpuser:string;
   //password:string;
   //ftpserver:string;
   //clientversion;
//getreginf(sqlserver,ftpserver,appname,ftpuser,ftppassword,
//                        updatedfile,clientversion,clientID);
getreginf();

if (trim(clientversion)='')or(trim(sqlserver)='') then
begin
     application.MessageBox('ϵͳû��ע���ע����Ϣ���������汾��Ϣ��ʧ�޷�������������ע�ᣡ��            ','��ʾ',mb_ok+Mb_iconinformation);
     abort;
end;
//'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=HMEBOM;Data Source='+sqlserver;
sqlstr:='Provider=SQLOLEDB.1;Password=sqlhme;Persist Security Info=True;User ID=sa;Initial Catalog=FALCON;Data Source='+sqlserver;
aq.Close;
aq.ConnectionString:='';
aq.ConnectionString:=sqlstr;
aq.SQL.Clear;
aq.SQL.Add('select * from client where client_id='+''''+trim(clientid)+'''');
memo1.Lines.Add('����׼���������ط�����.....');
try
aq.Open;
except
   application.MessageBox('���粻ͨ���޷����ʷ�����������������            ','��ʾ',mb_ok+Mb_iconinformation);
   memo1.Lines.Add('���粻ͨ���޷����ʷ�����....');
    button1.Enabled:=true;
            abort;
end;
if aq.RecordCount<1 then
begin
    application.MessageBox('ϵͳû��ע�ᣬ���ȡϵͳʶ�����ע�ᣬ�޷�������������ע�ᣡ��            ','��ʾ',mb_ok+Mb_iconinformation);
     memo1.Lines.Add('ϵͳû��ע�ᣬ���ȡϵͳʶ�����ע��....');
      button1.Enabled:=true;
    abort;
end;


try
memo1.Lines.Add('����׼����ȡ������Ϣ.....');
ad.Close;
ad.ConnectionString:=sqlstr;
//ad.TableName:='VERSION';
ad.Open;
except
   application.MessageBox('���粻ͨ���޷����ʷ�����������������            ','��ʾ',mb_ok+Mb_iconinformation);
     button1.Enabled:=true;
       memo1.Lines.Add('���粻ͨ���޷����ʷ�����....');
            abort;
end;
if ad.RecordCount<1 then
begin
      memo1.Lines.Add('�޷�����㹻��Ч��������Ϣ������û�и���....');
      button1.Enabled:=true;
    abort;
    ad.Close;
end;

memo1.Lines.Add('����׼���������°汾.....');
ad.Last;
hostiplist:=TStringList.Create;	
updatedversion:=ad.FieldValues['VERSION'];
label6.Caption:=updatedversion;
//ad.Next;
if ad.RecordCount<1 then
begin
      memo1.Lines.Add('�޷���������ļ����ڵķ������б�....');
      button1.Enabled:=true;

    ad.Close;
     abort;
end;
memo1.Lines.Add('����׼����ȡ���õ����Ʒ�����.....');
AD.First;
while not ad.Eof do
begin

  hostiplist.Add(ad.FieldValues['IPLIST']);
  ad.Next;
end;

if   strtodate(updatedversion)>strtodate(clientversion) then// ad.RecordCount>1 then
begin
     memo1.Lines.Add('���ָ��°汾�������汾�ţ�'+updatedversion);
     memo1.Update;
     trim(updatedversion);
     trim(clientversion);
    if strtodate(updatedversion)>strtodate(clientversion) then
      begin
                if updatedfile<>'' then
                begin
                      memo1.Lines.Add('ϵͳ����׼��������������');

                      if  not ConnectRemoteHost() then
                      begin
                         memo1.Lines.Add('�޷���������ļ������빩Ӧ����ϵ��������');
                         application.MessageBox('�޷���������ļ������빩Ӧ����ϵ��������','��ʾ',mb_okcancel+Mb_iconinformation);
                         exit;
                      end;
                      closeapplication('���Ϲ���ϵͳ');
                     // closeapplication('���Ϲ���ϵͳ');
                      for i:=0 to 100000 do
                      begin
                       for j:=0 to 1000 do
                        begin
                          sum:=sum+j;
                        end;
                      end;
                      //deletefile(newfilename+'HMEBMS.exe');
                      downloadfile(fromdir,newfilename);
                   //  rv:=copyfile(pchar(commondir+'HMEBMS.exe'),pchar(newfilename+'HMEBMS.exe'),false);
                     //  ps.Position:=ps.Max;
                   //  if  rv=true then
                     //   application.MessageBox('ϵͳ�����ɹ���ɣ�����              ','��ʾ',mb_okcancel+Mb_iconinformation)
                    ////  else
                    //  begin
                    //     showmessage('���������ļ�ʧ�ܣ���');
                       //  pr.Caption:='���������ļ�ʧ�ܣ�����';
                    //     button1.Enabled:=true;
                   //      exit;
                    //  end;
                      modifyversion(updatedversion);
                 end
                    else begin
                         //  ps.Position:=ps.Max;
                           exit;
                     end;
                   //-----------registerHMEBMS('HME���Ϲ���ϵͳ',updateversionversion);

                   runapplication(handle,'ErpBms.exe');
                   closeapplication('ϵͳ����');
      end;
    if strtodate(updatedversion)=strtodate(clientversion) then
    begin
         if application.MessageBox('�ҵ��İ汾��������ʹ�õİ汾��ͬ���Ƿ�Ҫ�޸�����ϵͳ����������Ȿ��ϵͳ��������','��ʾ',mb_okcancel+Mb_iconinformation)=ID_Ok then
            begin
                memo1.Lines.Add('�ҵ��İ汾��������ʹ�õİ汾��ͬ���Ƿ�Ҫ�޸�����ϵͳ����������Ȿ��ϵͳ��������');
              if updatedfile<>'' then
                begin
                      memo1.Lines.Add('ϵͳ����׼��������������');
                       if not ConnectRemoteHost() then
                      begin
                         memo1.Lines.Add('�޷���������ļ������빩Ӧ����ϵ��������');
                         application.MessageBox('�޷���������ļ������빩Ӧ����ϵ��������','��ʾ',mb_okcancel+Mb_iconinformation);
                         exit;
                      end;
                       closeapplication('���Ϲ���ϵͳ');
                     //  closeapplication('���Ϲ���ϵͳ');
                      // deletefile(newfilename+'ERPBMS.exe');
                         for i:=0 to 100000 do
                           begin
                            for j:=0 to 1000 do
                                 begin
                                    sum:=sum+j;
                                 end;
                           end;
                       downloadfile(fromdir,newfilename);
                      // rv:=copyfile(pchar(commondir+'HMEBMS.exe'),pchar(newfilename+'HMEBMS.exe'),false);
                       //  ps.Position:=ps.Max;
                     //if  rv=true then
                     //   application.MessageBox('ϵͳ�����ɹ���ɣ�����              ','��ʾ',mb_okcancel+Mb_iconinformation)
                    //  else
                    //  begin
                    //     showmessage('���������ļ�ʧ�ܣ���');
                     // end;
                      modifyversion(updatedversion);
                 end
                else
                   begin
                       //ps.Position:=ps.Max;
                        exit;
                    end;
                   //------------registerHMEBMS('HME���Ϲ���ϵͳ',updatedversion);
                   //application.MessageBox('ϵͳ������ɣ�����              ','��ʾ',mb_ok+Mb_iconinformation);
                   runapplication(handle,'ErpBms.exe');
                   closeapplication('ϵͳ����');
         end
         else
            begin
            memo1.Lines.Add('�����ѱ�ȡ������');
            exit;
            end;
    end;
   if strtodate(updatedversion)<strtodate(clientversion) then
    begin
            application.MessageBox('û�и��µİ汾��������ʹ�õ��Ѿ������°汾��            ','��ʾ',mb_ok+Mb_iconinformation);
               memo1.Lines.Add('û�и��µİ汾��������ʹ�õ��Ѿ������°汾�� ����');
               button1.Enabled:=true;
           exit;
    end;
end; //if ad.RecordCount=1 then

end;
procedure getrupdated(var updated:string);
var
reg:tregistry;
begin
     reg:=Tregistry.Create;
     try
         reg.RootKey:=HKEY_CURRENT_USER;
         if (reg.OpenKey('Software\HMEBMS',true)) then
            begin
              updated:=Reg.ReadString('autoupdate');
              reg.CloseKey;
            end;
     finally
        reg.CloseKey;
        reg.Free;
     end;
end;

procedure Tupgradefm.Button2Click(Sender: TObject);
begin
button1.Enabled:=true;
close;
end;

procedure Tupgradefm.FormActivate(Sender: TObject);
var
updated:string;
begin
upgradefm.Update;
 getreginf();
 //getreginf(sqlserver,ftpserver,appname,ftpuser,ftppassword,
 //                       updatedfile,clientversion,clientID);
// getrupdated(updated);
   label2.Caption:=clientversion+'  ';
   label5.Caption:=clientid+' ';
   if clientversion='' then
    label2.Caption:='�汾��Ϣ��ʧ����  ';
   // timer1.Enabled:=true;
    updateds:='true';





end;

procedure Tupgradefm.Timer1Timer(Sender: TObject);
begin
if updateds='true' then
   begin
   // timer1.Enabled:=false;
    Button1Click(upgradefm);
   end;
end;

procedure Tupgradefm.DownLoadTcpWorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
gauge1.Progress:=0;
gauge1.MaxValue:=AWorkCountMax;
end;

procedure Tupgradefm.DownLoadTcpWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
  var
  posi:int64;
begin
posi:=aworkcount*100 div gauge1.MaxValue;
gauge1.AddProgress(posi);
gauge1.Update;
end;

procedure Tupgradefm.BitBtn1Click(Sender: TObject);
begin
memo1.Lines.Add(ExtractFileName('X:\���Ϲ���ϵͳ��ERP��\ErpBms\upgrade.exe'));
memo1.Lines.Add(ExtractFilePath('X:\���Ϲ���ϵͳ��ERP��\ErpBms\upgrade.exe'));
memo1.Lines.Add(ExtractFiledir('X:\���Ϲ���ϵͳ��ERP��\ErpBms\upgrade.exe'));
end;

end.
