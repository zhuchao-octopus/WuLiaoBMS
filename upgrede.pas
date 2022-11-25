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
 memo1.Lines.Add('正在连接升级文件所在的服务器！！');
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
Function DelTheDir(ThePath:String):boolean;//删除该目录下的所有子目录和文件
var
  TheState  : integer;
  SearchRec : TSearchRec;
begin
  TheState := FindFirst(ThePath+'*.*', faAnyFile - faDirectory, SearchRec);
  while TheState = 0 do  //先删除文件-----
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
  while TheState = 0 do //再删除目录-----
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
 // DowntoTheDir    :String;//下载到这个目录
 // FromDir         :String;//下载的远程目录
  NewSubDir       :String;//提取新的目录，便于创建
  TheRootDir      :String;//子目录所在的目录
  TempStr         :String;//临时的字符串
  SaveToTheFile   :String;//保存到该文件
  desfilepath:string;
  aa:string;
  j,k,l:integer;
begin
  Self.Tag:=1;

 // FromDir:=Edit3.Text;
 // DownToTheDir:=Edit2.Text;

  memo1.Lines.Add('开始准备下载升级文件.....');
  if FromDir[Length(FromDir)]='\' then
     TempStr:=StrUtils.LeftStr(FromDir,Length(FromDir)-1) else
     TempStr:=FromDir;

  NewSubDir:=ExtractFileName(TempStr);//提取新的子目录名
  TheRootDir:=ExtractFilePath(TempStr);
  desfilepath:=DownToTheDir+'\'+NewSubDir;
 { if DirectoryExists(desfilepath) then
     if Application.MessageBox('=====目标目录已经存在!====='+
	      #10#13+'如果选择确定则覆盖原目录下的所有文件！',				 
		'移动提示：',MB_OKCANCEL+MB_ICONSTOP)<>IDOK then
    begin
		animate1.Active:=false;
    exit;
    end;     }
 // if Form1.ConnectRemoteHost(DownLoadTcp,Form1.TheFileConnectRec) then
  begin //============================================================
 //    Animate1.Active:=True;                                 // 还是网络的原因
 //    Bitbtn1.Enabled:=False;
     try
 //      iReturn:=DownLoadTcp.ReadInteger;//读取连接后反馈的信息,表示是验证的原因
       DownLoadTcp.Write('系统升级'+EOL);    //1-SendfileCMD         // 还是网络的原因
       DownLoadTcp.Write('系统升级'+EOL);    //2-Send The Directory name
     except
      // self.Caption:='网络传输失败！';
         memo1.Lines.Add('下栽更新失败！！！！');
       beep;
      // Animate1.Active:=False;
     //  Bitbtn1.Enabled:=True;
       exit;
     end;

     TheFilelist:=TStringList.Create;
     ReadFListStream:=TStringStream.Create(''); 

     try
       memo1.Lines.Add('正在获取升级文件列表大小...');
       ReadLen:=DownLoadTcp.ReadInteger; //读取流长度
              memo1.Lines.Add('正在获取升级文件列表...');
       DownLoadTcp.ReadStream(ReadFListStream,ReadLen,false); //读取文件列表流
     except
     //  self.Caption:='网络传输失败！';
        memo1.Lines.Add('下栽更新失败！！！！');
       beep;
       TheFileList.Free;
       ReadFListStream.Free;
      // Animate1.Active:=False;
      // Bitbtn1.Enabled:=True;
       exit;
     end;
       ReadFListStream.position:=0;
       TheFileList.LoadFromStream(ReadFListStream);//转化成文件列表

     DelTheDir(DownToTheDir+'\'+NewSubDir+'\'); //清空目录

  For i:=0 to TheFileList.Count-1 do    //getfiles
  begin
  if   ExtractFileName(TheFileList[i])='upgrade.exe' then
       continue;
	if self.Tag=0 then//查看停止标志 
	begin
	  Try
	   DownLoadTcp.write('可以断开了'+EOL);
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
   memo1.Lines.Add('正在获取升级文件大小...');
	  DownLoadTcp.write('文件连续申请'+EOL);
	  DownLoadTcp.Write(DownLoadFile+EOL);
	  ReadLen:=DownLoadTcp.ReadInteger;
	except
	 //  self.Caption:='网络传输失败！';
      memo1.Lines.Add('下栽更新失败！！！！');
	   beep;
	   TheFileList.Free;
	   ReadFListStream.Free;
	 //  Animate1.Active:=False;
	//   Bitbtn1.Enabled:=True;
	   exit;
	end;
	  memo1.Lines.Add(ExtractFileName(DownLoadFile)+' ,大小：'+IntToStr(ReadLen)+'字节');
	  memo1.Lines.Add('要更新的文件有：'+IntToStr(TheFileList.Count)+'个，'+
		       '正在下栽第'+IntToStr(i+1)+'个');
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
	    SaveToTheFile:=DownToTheDir+'\'+aa;  //合成新文件名



	 // Edit2.Text:=ExtractFilePath(SaveToTheFile); //显示复制到该目录下
	//-----创建目录	
	  if ForceDirectories(ExtractFilePath(SaveToTheFile))=false then
	      if Application.MessageBox('目标目录创建错误！',
		       '错误：',MB_OKCANCEL+MB_ICONSTOP)<>IDOK Then
	   begin
	     self.Caption:='已经取消了后续的操作！';
	     beep;
	     TheFileList.Free;
	     ReadFListStream.Free;
	     //Animate1.Active:=False;
	    // Bitbtn1.Enabled:=True;
	     exit;   
	   end;
	//下载并写到该文件
       try
    memo1.Lines.Add('正在安装更新...');
	  RFStream:=TFileStream.Create(SaveToTheFile,fmCreate);
	  DownLoadTcp.ReadStream(RFStream,ReadLen,false); //下载到该文件流
          RFStream.Free;
       except
 //	 self.Caption:='网络传输失败！';
    memo1.Lines.Add('下栽更新失败！！！！');
	 beep;
	 RFStream.Free;
	 TheFileList.Free;
	 ReadFListStream.Free;
	// Animate1.Active:=False;
	// Bitbtn1.Enabled:=True;
	 exit;
       end;  	
     end; //传输完毕=====================================
     try
       DownLoadTcp.write('可以断开了'+EOL);
     except
     end;
     beep;
    // Bitbtn1.Enabled:=True;
    // Animate1.Active:=False;
     TheFilelist.Free;
     ReadFListStream.Free;
     memo1.Lines.Add('完成！！！！');
      memo1.Lines.Add('完成！！！！');
       memo1.Lines.Add('完成！！！！');
        memo1.Lines.Add('完成！！！！');
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
      //   MessageBox(self.handle,PChar(e.message),'无法获得升级文件！！！',64);        //PChar(e.message)
         
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
  //   MessageBox(self.handle,PChar(e.message),'连接被断开',64);        //PChar(e.message)
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
memo1.Lines.Add('正在准备升级.....');
memo1.Lines.Add('正在获得升级信息.....');
//ShowMessage(ExtractFileDir(Application.Exename)); // 如: c:\temp
//ExtractFilePath(Application.Exename); // 如: c:\temp\ 　
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
     application.MessageBox('系统没有注册或注册信息不完整，版本信息丢失无法升级！请重新注册！！            ','提示',mb_ok+Mb_iconinformation);
     abort;
end;
//'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=HMEBOM;Data Source='+sqlserver;
sqlstr:='Provider=SQLOLEDB.1;Password=sqlhme;Persist Security Info=True;User ID=sa;Initial Catalog=FALCON;Data Source='+sqlserver;
aq.Close;
aq.ConnectionString:='';
aq.ConnectionString:=sqlstr;
aq.SQL.Clear;
aq.SQL.Add('select * from client where client_id='+''''+trim(clientid)+'''');
memo1.Lines.Add('正在准备连接主控服务器.....');
try
aq.Open;
except
   application.MessageBox('网络不通，无法访问服务器！！！！！！            ','提示',mb_ok+Mb_iconinformation);
   memo1.Lines.Add('网络不通，无法访问服务器....');
    button1.Enabled:=true;
            abort;
end;
if aq.RecordCount<1 then
begin
    application.MessageBox('系统没有注册，请获取系统识别码后注册，无法升级！请重新注册！！            ','提示',mb_ok+Mb_iconinformation);
     memo1.Lines.Add('系统没有注册，请获取系统识别码后注册....');
      button1.Enabled:=true;
    abort;
end;


try
memo1.Lines.Add('正在准备获取升级信息.....');
ad.Close;
ad.ConnectionString:=sqlstr;
//ad.TableName:='VERSION';
ad.Open;
except
   application.MessageBox('网络不通，无法访问服务器！！！！！！            ','提示',mb_ok+Mb_iconinformation);
     button1.Enabled:=true;
       memo1.Lines.Add('网络不通，无法访问服务器....');
            abort;
end;
if ad.RecordCount<1 then
begin
      memo1.Lines.Add('无法获得足够有效的升级信息，可能没有更新....');
      button1.Enabled:=true;
    abort;
    ad.Close;
end;

memo1.Lines.Add('正在准备搜索最新版本.....');
ad.Last;
hostiplist:=TStringList.Create;	
updatedversion:=ad.FieldValues['VERSION'];
label6.Caption:=updatedversion;
//ad.Next;
if ad.RecordCount<1 then
begin
      memo1.Lines.Add('无法获得升级文件所在的服务器列表....');
      button1.Enabled:=true;

    ad.Close;
     abort;
end;
memo1.Lines.Add('正在准备获取可用的生计服务器.....');
AD.First;
while not ad.Eof do
begin

  hostiplist.Add(ad.FieldValues['IPLIST']);
  ad.Next;
end;

if   strtodate(updatedversion)>strtodate(clientversion) then// ad.RecordCount>1 then
begin
     memo1.Lines.Add('发现更新版本！！！版本号：'+updatedversion);
     memo1.Update;
     trim(updatedversion);
     trim(clientversion);
    if strtodate(updatedversion)>strtodate(clientversion) then
      begin
                if updatedfile<>'' then
                begin
                      memo1.Lines.Add('系统正在准备升级！！！！');

                      if  not ConnectRemoteHost() then
                      begin
                         memo1.Lines.Add('无法获得升级文件，请与供应商联系！！！！');
                         application.MessageBox('无法获得升级文件，请与供应商联系！！！！','提示',mb_okcancel+Mb_iconinformation);
                         exit;
                      end;
                      closeapplication('物料管理系统');
                     // closeapplication('物料管理系统');
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
                     //   application.MessageBox('系统升级成功完成！！！              ','提示',mb_okcancel+Mb_iconinformation)
                    ////  else
                    //  begin
                    //     showmessage('覆盖现有文件失败！！');
                       //  pr.Caption:='覆盖现有文件失败！！！';
                    //     button1.Enabled:=true;
                   //      exit;
                    //  end;
                      modifyversion(updatedversion);
                 end
                    else begin
                         //  ps.Position:=ps.Max;
                           exit;
                     end;
                   //-----------registerHMEBMS('HME物料管理系统',updateversionversion);

                   runapplication(handle,'ErpBms.exe');
                   closeapplication('系统升级');
      end;
    if strtodate(updatedversion)=strtodate(clientversion) then
    begin
         if application.MessageBox('找到的版本与你现在使用的版本相同！是否要修复现有系统，但并不检测本地系统的完整性','提示',mb_okcancel+Mb_iconinformation)=ID_Ok then
            begin
                memo1.Lines.Add('找到的版本与你现在使用的版本相同！是否要修复现有系统，但并不检测本地系统的完整性');
              if updatedfile<>'' then
                begin
                      memo1.Lines.Add('系统正在准备升级！！！！');
                       if not ConnectRemoteHost() then
                      begin
                         memo1.Lines.Add('无法获得升级文件，请与供应商联系！！！！');
                         application.MessageBox('无法获得升级文件，请与供应商联系！！！！','提示',mb_okcancel+Mb_iconinformation);
                         exit;
                      end;
                       closeapplication('物料管理系统');
                     //  closeapplication('物料管理系统');
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
                     //   application.MessageBox('系统升级成功完成！！！              ','提示',mb_okcancel+Mb_iconinformation)
                    //  else
                    //  begin
                    //     showmessage('覆盖现有文件失败！！');
                     // end;
                      modifyversion(updatedversion);
                 end
                else
                   begin
                       //ps.Position:=ps.Max;
                        exit;
                    end;
                   //------------registerHMEBMS('HME物料管理系统',updatedversion);
                   //application.MessageBox('系统升级完成！！！              ','提示',mb_ok+Mb_iconinformation);
                   runapplication(handle,'ErpBms.exe');
                   closeapplication('系统升级');
         end
         else
            begin
            memo1.Lines.Add('更新已被取消！！');
            exit;
            end;
    end;
   if strtodate(updatedversion)<strtodate(clientversion) then
    begin
            application.MessageBox('没有更新的版本！！！您使用的已经是最新版本了            ','提示',mb_ok+Mb_iconinformation);
               memo1.Lines.Add('没有更新的版本！！！您使用的已经是最新版本了 ！！');
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
    label2.Caption:='版本信息丢失！！  ';
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
memo1.Lines.Add(ExtractFileName('X:\物料管理系统（ERP）\ErpBms\upgrade.exe'));
memo1.Lines.Add(ExtractFilePath('X:\物料管理系统（ERP）\ErpBms\upgrade.exe'));
memo1.Lines.Add(ExtractFiledir('X:\物料管理系统（ERP）\ErpBms\upgrade.exe'));
end;

end.
