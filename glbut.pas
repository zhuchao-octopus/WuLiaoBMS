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
    if adotable.Locate('料号',trim(liaohao),[])=true then
        result:=true
    else
        result:=false;
end;
procedure addliaohao(adotable:Tadotable;liaohao,guige,yongliang,wz:string);
begin
    if adotable.Active=true then
       begin
          adotable.Append;
          adotable.FieldValues['料号']:=liaohao;
         // adotable.FieldValues['规格说明']:=guige;
          adotable.FieldValues['单位用量']:=yongliang;
          adotable.FieldValues['零件位置']:=wz;
          adotable.Post;
       end
    else
       begin
           showmessage('无法在关闭的数据集中插入数据！！');
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
hWndClose: HWnd;                                     // file://存储指定的外部应用程序窗口句柄
                                                      //str: String; //file://存储指定的外部应用程序的窗口名
begin
hWndClose:=1;
                                                 //str := InputBox('提示','请输入应用程序名：',''); file://获取要关闭的应用程序窗口名
if str <> '' then begin
hWndClose := FindWindow(nil, PChar(str));
while (hWndClose<>0)do
begin                                                     //file://根据窗口名查找要关闭的窗口句柄                        //file://如果查找成功，则发送消息，关闭指定的窗口
     SendMessage(hWndClose,WM_CLOSE,0,0);
     hWndClose := FindWindow(nil, PChar(str));
end;
                                                  //file://否则，给出提示信息
//ShowMessage('没找到指定的应用程序，所以无法关闭！');
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
//name:='HME物料管理系统';

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
    str:='select * from lingjianliaohao where 料号 = '+''''+liaohao+'''';
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
            //  if qb.FieldValues['料号']='95x100000-01' then
             //    showmessage('ok');
             //if  qb.FieldValues['承认']<>Null then
               try
                  if (trim(qb.FieldValues['承认'])='已核准')or(trim(qb.FieldValues['承认'])='已审核') then
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

   setlength(aDgCLength,cc+1);  //file://取/标题字段的长度
   for i:=0 to  cc do
    begin
     aDgCLength[i]:= length(objDbGrid.Columns[i].Title.Caption);
     end;


  objDataSet.First;
  while not objDataSet.Eof do
   begin  //  file://取/列中每个字段的长度
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

   setlength(aDgCLength,cc+1);  //file://取/标题字段的长度
   for i:=0 to  cc do
    begin
     aDgCLength[i]:= length(objDbGrid.Columns[i].Title.Caption);
     end;


  objDataSet.First;
  while not objDataSet.Eof do
   begin  //  file://取/列中每个字段的长度
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
TotWidth : integer;//定义整个宽度
VarWidth : integer;//定义变化的宽度
ResizableColumnCount : integer;//定义变化宽度列的总数
AColumn : TColumn;
begin
//在重新调整前所有列的宽度
TotWidth := 0;
VarWidth := 0;
//有多少列需要自动调整
ResizableColumnCount := 0;

for i := 0 to -1 + DBGrid.Columns.Count do
begin
TotWidth := TotWidth + DBGrid.Columns[i].Width;
if DBGrid.Columns[i].Field.Tag <> 0 then
Inc(ResizableColumnCount);
end;

//为每个列分隔线增加1PX
if dgColLines in DBGrid.Options then
TotWidth := TotWidth + DBGrid.Columns.Count;

if dgIndicator in DBGrid.Options then
TotWidth := TotWidth + IndicatorWidth;

VarWidth := DBGrid.ClientWidth - TotWidth;

//平均分配变化宽度的值
//给所有需要自动调整的列
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

   sqlstr:='select 品名, 料号, 规格说明, 制造商, 供应商, 厂家料号, 规格书, 承认 from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+'''';

     with ds do
         begin
             ds.Close;
             ds.SQL.Clear;
             ds.SQL.Add(sqlstr);
             ds.Open;
         end;
end;



end.
