unit glbut ;


interface
       uses DBGrids,db,SysUtils,forms,Registry,windows, messages,dialogs,shellapi,ADODB,fixitemwidththre,Graphics;


       
       procedure MakeDBGridColumnsAutoFixItsWidth(objDBGrid:TDBGrid);
       Procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
       procedure fomatliaohao(oldliaohao:string;var newliaohao:string);
       function existbom(tablename:string):boolean;
       procedure getreginf();
       procedure registerFALCON(sqlserver:string;appname:string;clientversion:string;ftpserver:string;
                        FTPuser:string;ftppass:string;updatedfile:string;clientID:string;commondir:string);
       procedure closeapplication(str:string);
       procedure runapplication(h:hwnd; filename:string);
       function Ischecked(liaohao:string):boolean;
       procedure addliaohao(adotable:Tadotable;liaohao,guige,yongliang,wz:string);
       function isexistsliaohao(adotable:Tadotable;liaohao:string):boolean;
       procedure MakeDBGridColumnsAutoFixItsWidth_thre(objDBGrid:TDBGrid);
var
   taozhang:string;
   user,userrealname:string;
   USERGP:STRING;
   appname:string;
   sqlserver:string;
   stop:boolean;
   liaock,desck:boolean;
   updatedfile:string;
   ftpport:string;
   ftpuser:string;
   ftppassword:string;
   ftpserver:string;
   clientversion:string;
   ClientID:string;
   ip,host,mac,hardno:string;
   commondir:string;
   versions:string;

   debug:boolean;
//   checkupdatefile:boolean;
   //clientversion:string;
    breaked:boolean;
    _dbgrid :Tdbgrid;
    fixdbgridwidth:TFixitemwidth;
     bcolor,fcolor: Tcolor;
implementation
uses dmut,glut;
function isexistsliaohao(adotable:Tadotable;liaohao:string):boolean;
begin
    if adotable.Locate('�Ϻ�',trim(liaohao),[])=true then
        result:=true
    else
        result:=false;
end;
procedure addliaohao(adotable:Tadotable;liaohao,guige,yongliang,wz:string);
begin
    if adotable.Active=true then
       begin
          adotable.Append;
          adotable.FieldValues['�Ϻ�']:=liaohao;
         // adotable.FieldValues['���˵��']:=guige;
          adotable.FieldValues['��λ����']:=yongliang;
          adotable.FieldValues['���λ��']:=wz;
          adotable.Post;
       end
    else
       begin
           showmessage('�޷��ڹرյ����ݼ��в������ݣ���');
           exit;
       end;
end;
procedure runapplication(h:hwnd; filename:string);
begin
//if opendialog1.Execute then
//begin
//str := opendialog1.FileName; file:
//winexec(PChar(str), SW_SHOWNORMAL);
ShellExecute(h,'open',pchar(filename),'-s','',SW_SHOWNORMAL);
//ShellExecute(handle,'open','msimn.exe','-s','',SW_SHOWNORMAL);

end;
procedure closeapplication(str:string);
var
hWndClose: HWnd;                                     // file://�洢ָ�����ⲿӦ�ó��򴰿ھ��
                                                      //str: String; //file://�洢ָ�����ⲿӦ�ó���Ĵ�����
begin
hWndClose:=1;
                                                 //str := InputBox('��ʾ','������Ӧ�ó�������',''); file://��ȡҪ�رյ�Ӧ�ó��򴰿���
if str <> '' then begin
hWndClose := FindWindow(nil, PChar(str));
while (hWndClose<>0)do
begin                                                     //file://���ݴ���������Ҫ�رյĴ��ھ��                        //file://������ҳɹ���������Ϣ���ر�ָ���Ĵ���
     SendMessage(hWndClose,WM_CLOSE,0,0);
     hWndClose := FindWindow(nil, PChar(str));
end;
                                                  //file://���򣬸�����ʾ��Ϣ
//ShowMessage('û�ҵ�ָ����Ӧ�ó��������޷��رգ�');
end;

end;

//procedure getreginf(var sqlserver,ftpserver,appname,ftpuser,ftppass,
//                        updatedfile,version,clientID:string);
procedure getreginf();
var
reg:tregistry;
begin
     reg:=Tregistry.Create;
     try
         reg.RootKey:=HKEY_CURRENT_USER;
         if (reg.OpenKey('Software\FALCON',true)) then
            begin
              appname:=Reg.ReadString('appname');
              versions:=trim(Reg.ReadString('version'));
              sqlserver:=trim(Reg.ReadString('sqlserver'));
              ftpserver:=Reg.ReadString('ftpserver');
              ftpuser:=Reg.ReadString('ftpuser');
              ftppassword:=Reg.ReadString('ftppass');
              updatedfile:=Reg.ReadString('updatedfile');
              clientID:=Reg.ReadString('clientID');
              commondir:=Reg.ReadString('commondir');
              clientversion:=trim(versions);
              reg.CloseKey;
            end;
     finally
        reg.CloseKey;
        reg.Free;
     end;
end;
procedure registerFALCON(sqlserver:string;appname:string;clientversion:string;ftpserver:string;
                        FTPuser:string;ftppass:string;updatedfile:string;clientID:string;commondir:string);
var
reg:tregistry;
begin
//name:='HME���Ϲ���ϵͳ';

     reg:=Tregistry.Create;
     try
        reg.RootKey:=HKEY_CURRENT_USER;
        reg.DeleteKey('Software\FALCON');
         //if (reg.OpenKey('Software\FALCON',false))=false then
            begin
              reg.CreateKey('Software\FALCON');
              reg.OpenKey('Software\FALCON',true);
              reg.WriteString('Version',clientversion);
              reg.WriteString('appname',appname);
              reg.WriteString('sqlserver',sqlserver);
              reg.WriteString('ftpserver',ftpserver);
              reg.WriteString('ftppass',ftppass);
              reg.WriteString('ftpuser',ftpuser);
              reg.WriteString('updatedfile',updatedfile);
              reg.WriteString('clientID',clientID);
              reg.WriteString('commondir',commondir);
            //  reg.WriteString('serverstring',commondir);
              reg.CloseKey;
            end;
     finally
        reg.CloseKey;
        reg.Free;
     end;
end;
function Ischecked(liaohao:string):boolean;
var
str:string;
qb:Tadoquery;
begin
    str:='select * from lingjianliaohao where �Ϻ� = '+''''+liaohao+'''';
    qb:=tadoquery.Create(application);
    qb.Connection:=dm.ADOConnection1;
    result:=false;
     with qb do
         begin
             Close;
             SQL.Clear;
             SQL.Add(str);
             Open;
             if recordcount>=1 then
             begin
            //  if qb.FieldValues['�Ϻ�']='95x100000-01' then
             //    showmessage('ok');
             //if  qb.FieldValues['����']<>Null then
               try
                  if (trim(qb.FieldValues['����'])='�Ѻ�׼')or(trim(qb.FieldValues['����'])='�����') then
                     result:=true
                    else result:=false;
               except
                 result:=false;
               end;
             end;
            // else result:=false;
         end;
     qb.Close;
     qb.Free;
end;
function existbom(tablename:string):boolean;
var
str:string;
qb:Tadoquery;
begin
    str:='select * from sysobjects where id = object_id('+''''+tablename+''''+')';
    qb:=tadoquery.Create(application);
    qb.Connection:=dm.ADOConnection1;
     with qb do
         begin
             Close;
             SQL.Clear;
             SQL.Add(str);
             Open;
             if recordcount>=1 then
                result:=true
             else result:=false;
         end;
     qb.Close;
     qb.Free;
end;


procedure fomatliaohao(oldliaohao:string;var newliaohao:string);
var
i:integer;
begin
  if oldliaohao[1]<>'B' then
     oldliaohao:='B'+oldliaohao;
     newliaohao:=stringreplace(oldliaohao,'-','',[rfReplaceAll]);
     newliaohao:=trim(newliaohao);
end;

 
procedure MakeDBGridColumnsAutoFixItsWidth_thre(objDBGrid:TDBGrid);
var  cc:integer;
i,tmpLength:integer;
 objDataSet:TDataSet;
 aDgCLength:array of integer;
 begin  cc:=objDbGrid.Columns.Count-1;
  objDataSet:=objDbGrid.DataSource.DataSet;

   setlength(aDgCLength,cc+1);  //file://ȡ/�����ֶεĳ���
   for i:=0 to  cc do
    begin
     aDgCLength[i]:= length(objDbGrid.Columns[i].Title.Caption);
     end;


  objDataSet.First;
  while not objDataSet.Eof do
   begin  //  file://ȡ/����ÿ���ֶεĳ���
    for i:=0 to  cc do
      begin
      tmpLength:=length(objDataSet.Fields.Fields[i].AsString);
          if tmpLength>aDgCLength[i]      then
          aDgCLength[i]:=tmpLength;
            end;
            objDataSet.Next;

       if breaked=true then
           break;
             end;

  for i:=0 to  cc do
   begin
   objDbGrid.Columns[i].Width:=aDgCLength[i]*7;
   end;
end;
procedure MakeDBGridColumnsAutoFixItsWidth(objDBGrid:TDBGrid);
var  cc:integer;
i,tmpLength:integer;
 objDataSet:TDataSet;
 aDgCLength:array of integer;
 begin
 _dbgrid:=objdbgrid;
 fixdbgridwidth:=TFixitemwidth.Create(false);
 _dbgrid:=nil;

// exit;



   cc:=objDbGrid.Columns.Count-1;



  objDataSet:=objDbGrid.DataSource.DataSet;

   setlength(aDgCLength,cc+1);  //file://ȡ/�����ֶεĳ���
   for i:=0 to  cc do
    begin
     aDgCLength[i]:= length(objDbGrid.Columns[i].Title.Caption);
     end;


  objDataSet.First;
  while not objDataSet.Eof do
   begin  //  file://ȡ/����ÿ���ֶεĳ���
    for i:=0 to  cc do
      begin
      tmpLength:=length(objDataSet.Fields.Fields[i].AsString);
          if tmpLength>aDgCLength[i]      then
          aDgCLength[i]:=tmpLength;
            end;
            objDataSet.Next;

       if breaked=true then
           break;
             end;

  for i:=0 to  cc do
   begin
   objDbGrid.Columns[i].Width:=aDgCLength[i]*7;
   end;
end;


Procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
var
i : integer;
TotWidth : integer;//�����������
VarWidth : integer;//����仯�Ŀ��
ResizableColumnCount : integer;//����仯����е�����
AColumn : TColumn;
begin
//�����µ���ǰ�����еĿ��
TotWidth := 0;
VarWidth := 0;
//�ж�������Ҫ�Զ�����
ResizableColumnCount := 0;

for i := 0 to -1 + DBGrid.Columns.Count do
begin
TotWidth := TotWidth + DBGrid.Columns[i].Width;
if DBGrid.Columns[i].Field.Tag <> 0 then
Inc(ResizableColumnCount);
end;

//Ϊÿ���зָ�������1PX
if dgColLines in DBGrid.Options then
TotWidth := TotWidth + DBGrid.Columns.Count;

if dgIndicator in DBGrid.Options then
TotWidth := TotWidth + IndicatorWidth;

VarWidth := DBGrid.ClientWidth - TotWidth;

//ƽ������仯��ȵ�ֵ
//��������Ҫ�Զ���������
if ResizableColumnCount > 0 then
VarWidth := varWidth div ResizableColumnCount;

for i := 0 to -1 + DBGrid.Columns.Count do
begin
AColumn := DBGrid.Columns[i];
if AColumn.Field.Tag <> 0 then
begin
AColumn.Width := AColumn.Width + VarWidth;
if AColumn.Width < AColumn.Field.Tag then
AColumn.Width := AColumn.Field.Tag;
end;
end;
end;
procedure lookupdata(keystr,fieldname:string;ds:tadoquery);
VAR
   sqlstr:string;
begin

   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����, ���� from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+'''';

     with ds do
         begin
             ds.Close;
             ds.SQL.Clear;
             ds.SQL.Add(sqlstr);
             ds.Open;
         end;
end;



end.
