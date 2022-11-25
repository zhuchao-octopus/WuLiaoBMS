unit makebom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, ExtCtrls, Buttons, ADODB, DB,
  StdCtrls, DBTables, OleCtnrs, Menus;

type
  Tmakebomfm = class(TForm)
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Splitter3: TSplitter;
    DBGrid3: TDBGrid;
    ADOQuery2: TADOQuery;
    DataSource3: TDataSource;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    Panel8: TPanel;
    tq: TADOQuery;
    t2: TADOTable;
    t3: TADOTable;
    t4: TADOTable;
    t5: TADOTable;
    t6: TADOTable;
    t7: TADOTable;
    ADOQuery3: TADOQuery;
    preljlh: TADOTable;
    AQljlh: TADOQuery;
    DataSource4: TDataSource;
    OpenDialog1: TOpenDialog;
    ADOQuery3DSDesigner: TStringField;
    ADOQuery3DSDesigner2: TWideStringField;
    ADOQuery3DSDesigner3: TStringField;
    ADOQuery3DSDesigner4: TStringField;
    ADOQuery3DSDesigner5: TWideStringField;
    ADOQuery3DSDesigner6: TStringField;
    ADOQuery3DSDesigner7: TStringField;
    ADOQuery3DSDesigner8: TStringField;
    ADOQuery3DSDesigner10: TStringField;
    ADOQuery3DSDesigner11: TStringField;
    ADOCommand1: TADOCommand;
    indexliao: TADOQuery;
    ADOTable1: TADOTable;
    ADOQuery3DSDesigner9: TStringField;
    ADOQuery3P_ID: TAutoIncField;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    ComboBox1: TComboBox;
    TabSheet2: TTabSheet;
    TV: TTreeView;
    Panel6: TPanel;
    ComboBox2: TComboBox;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton12: TSpeedButton;
    CoolBar4: TCoolBar;
    CoolBar5: TCoolBar;
    SpeedButton8: TSpeedButton;
    SpeedButton11: TSpeedButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    SpeedButton3: TSpeedButton;
    N6: TMenuItem;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    StringGrid1: TStringGrid;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    ADOQuery4: TADOQuery;
    ToolBar1: TToolBar;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Edit2: TEdit;
    aqdelete: TADOQuery;
    N10: TMenuItem;
    SpeedButton2: TSpeedButton;
    PopupMenu2: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    BOMEXCEL1: TMenuItem;
    BOM1: TMenuItem;
    N14: TMenuItem;
    BOMEXCEL2: TMenuItem;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    TabSheet5: TTabSheet;
    DBGrid5: TDBGrid;
    DataSource5: TDataSource;
    bomliaolist: TADOQuery;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Panel3: TPanel;
    PB: TProgressBar;
    SpeedButton15: TSpeedButton;
    BOM2: TMenuItem;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure createbom(liaohao:string);
    procedure createtable(tablename:string);
    procedure TVDblClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure checkedliao(gg:string;var liaohao:string);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure readfiletobombobox(combobox:Tcombobox);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure setreadonly(flag:boolean);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure N10Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure BOMEXCEL1Click(Sender: TObject);
    procedure BOM1Click(Sender: TObject);
    procedure BOMEXCEL2Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure TabSheet5Show(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5TitleClick(Column: TColumn);
    function getliaohao(str:string):string;
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure BOM2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function isowner(liaohao:string):boolean;
    function ischecked(liaohao:string):boolean;
  end;

var
  makebomfm: Tmakebomfm;
  al,ar:integer;
  tabpage1show,tabpage3show:boolean;
  openliao:string;
  Quantity,Reference:string;
  currenttablename:string;
  relbom:string;
implementation
     uses dmut, CREATEBOM2,glbut, ole, appliaohao, openbom, opendialog,
  deleteoption, newbomoption, luut, bjbm, thhp,bomedit, printsetup,comobj,
  bomdetailfm, saveas, BOMINFO;
{$R *.dfm}
procedure getbominfo();
var
liaohao:string;
begin
    liaohao:=makebomfm.getliaohao(trim(makebomfm.ComboBox1.Text));
    BOMINFOFM.ADOQuery1.Close;
    BOMINFOFM.ADOQuery1.SQL.Clear;
    BOMINFOFM.ADOQuery1.SQL.Add('select * from lingjianliaohao where 料号='+''''+liaohao+'''');
    BOMINFOFM.ADOQuery1.Open;
    if (ischecked(liaohao)=false)and(makebomfm.isowner(liaohao)=true) then
        begin
           // bominfofm.DBEdit1.ReadOnly:=false;
            bominfofm.DBEdit2.ReadOnly:=false;
           // bominfofm.DBEdit3.ReadOnly:=false;
            bominfofm.DBEdit4.ReadOnly:=false;
            bominfofm.DBEdit5.ReadOnly:=false;
            bominfofm.DBEdit6.ReadOnly:=false;
            bominfofm.DBEdit7.ReadOnly:=false;
            bominfofm.DBEdit8.ReadOnly:=false;
            bominfofm.DBEdit9.ReadOnly:=false;
            bominfofm.DBEdit10.ReadOnly:=false;
            bominfofm.DBEdit11.ReadOnly:=false;
            bominfofm.BitBtn1.Enabled:=true;
        end
    else
        begin
            bominfofm.DBEdit1.ReadOnly:=true;
            bominfofm.DBEdit2.ReadOnly:=true;
            bominfofm.DBEdit3.ReadOnly:=true;
            bominfofm.DBEdit4.ReadOnly:=true;
            bominfofm.DBEdit5.ReadOnly:=true;
            bominfofm.DBEdit6.ReadOnly:=true;
            bominfofm.DBEdit7.ReadOnly:=true;
            bominfofm.DBEdit8.ReadOnly:=true;
            bominfofm.DBEdit9.ReadOnly:=true;
            bominfofm.DBEdit10.ReadOnly:=true;
            bominfofm.DBEdit11.ReadOnly:=true;
            bominfofm.BitBtn1.Enabled:=false;
        end;
end;
function Tmakebomfm.getliaohao(str:string):string;
var
liaohao:string;
begin
liaohao:=trim(str);
if liaohao='' then
  begin
    // showmessage('没有选种要导出的BOM！！！');
     exit;
  END;
if (LIAOHAO[1]='P')and(LIAOHAO[2]='B') then
begin
  indexliao.Close;
  indexliao.SQL.Clear;
  indexliao.SQL.Add('select * from indexliao where gg='+''''+liaohao+'''');
  indexliao.Open;
  if indexliao.RecordCount<>1 then
     begin
         showmessage('BOM已不存在！！,BOM影射错误！！！刷新后再试！');
         exit;
     end;
  if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
     begin
       liaohao:=trim(indexliao.FieldValues['newliao']);
     end
  else
  begin
     liaohao:=trim(indexliao.FieldValues['predex']);
  end;
end;
result:=liaohao;
end;
procedure createExcel(var v:variant;tname:string);
var
sheet:variant;
begin
v:=createoleobject('Excel.Application');
v.visible:=true;
v.workbooks.add(-4167);
v.workbooks[1].sheets[1].name:=tname;
sheet:=v.workbooks[1].sheets[tname];
end;
function Tmakebomfm.isowner(liaohao:string):boolean;
var
   aq:Tadoquery;
begin
try
   aq:=Tadoquery.Create(application);
   aq.Connection:=dm.ADOConnection1;
   aq.Close;
   aq.SQL.Clear;
   aq.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(liaohao)+'''');
   aq.Open;
   if aq.RecordCount>=1 then
    begin
        if aq.FieldValues['申请人']=Null then
        begin
           result:=false;
           exit;
        end;
        if trim(aq.FieldValues['申请人'])=trim(userrealname) then
            result:=true
        else
           result:=false;
    end;
finally
    aq.Close;
    aq.Free;
end;
end;
function Tmakebomfm.ischecked(liaohao:string):boolean;
var
   aq:Tadoquery;
begin
   result:=false;
try
   aq:=Tadoquery.Create(application);
   aq.Connection:=dm.ADOConnection1;
   aq.Close;
   aq.SQL.Clear;
   aq.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(liaohao)+'''');
   aq.Open;
   if aq.RecordCount>=1 then
    begin
        if aq.FieldValues['承认']=Null then
            result:=false
        else if (trim(aq.FieldValues['承认'])='已审核')or(trim(aq.FieldValues['承认'])='已核准')or(aq.FieldValues['锁']=true) then
            result:=true
        else
           result:=false;
    end;
finally
    aq.Close;
    aq.Free;
end;
end;
procedure Tmakebomfm.createtable(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[xuhao_ID] [int] IDENTITY (1, 1) NOT NULL  ,                       '+
 '	[料号] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL primary key,         '+
 '	[阶层] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[单位用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[工单用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[零件位置] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL,         '+
 ' 	[承认] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,           '+
 '  [单价] [float] NULL default 0.00,                                               '+

 ' 	[合计] [float] NULL default 0.00                                              '+
') ON [PRIMARY]';

    //primary key
   //  ' 	[数量] [float] NULL default 0.00,                 '+
  // '	[序号] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

   with ADOCommand1 do
         begin

             CommandText:='';
             CommandText:=str;
             execute;

         end;

end;
procedure Tmakebomfm.createbom(liaohao:string);
var
sqlstr:string;
begin
fomatliaohao(liaohao,liaohao);
if existbom(liaohao)=true then
  begin
     if application.MessageBox(' 你要创建的BOM已经存在！是否要覆盖现有的BOM！！！！  ','HME提示！',mb_YESNO+MB_ICONINFORMATION)=ID_NO then
       begin
        exit;
      end
      else
        begin
            sqlstr:='drop table '+trim(liaohao);
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute;
        end;
  end;


  try
     createtable(liaohao);
     application.MessageBox('BOM创建成功完成！！                 ','FALCON ERP提示',mb_ok+MB_ICONINFORMATION);
 except
      application.MessageBox('创建BOM失败！请确认BOM相关信息是否满足现有规则                 ','创建BOM错误',mb_ok+MB_ICONERROR);
 end;

 end;

function isexistsliao(liaohao:string;tname:string):boolean;
var
   aq:Tadoquery;
begin
try
   //fomatliaohao(tname,tname);
   aq:=Tadoquery.Create(application);
   aq.Connection:=dm.ADOConnection1;
   aq.Close;
   aq.SQL.Clear;
   aq.SQL.Add('select * from '+trim(tname)+' where 料号='+''''+liaohao+'''');
   aq.Open;
   if aq.RecordCount>=1 then
      result:=true
   else
      result:=false;

finally
aq.Close;
aq.Free;
end;


end;
procedure Tmakebomfm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
      adoquery1.Close;
      adoquery1.SQL.Clear;
      adoquery1.SQL.Add('select  品名, 规格说明,料号, 供应商, 承认, 使用机种 from lingjianliaohao where 料号 like '+''''+'%'+trim(edit1.Text)+'%'+''''+' and 规格说明 like '+''''+'%'+trim(edit2.Text)+'%'+'''');
      adoquery1.Open;
      MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;
end;

procedure Tmakebomfm.SpeedButton8Click(Sender: TObject);
var
tname:string;
begin

if (adoquery1.Active=true)and(aqljlh.Active=true) then
   begin
   tname:=trim(combobox1.Text);
   if tname='' then
   begin
       showmessage(' 还没有选种要操作的BOM料号了啦！！！操作列表为空！                 ');
       exit;
   end;
  if (tname[1]='P')and(tname[2]='B') then      ////////////////////////  temporary bom
   begin
   indexliao.Close;
   indexliao.SQL.Clear;
   indexliao.SQL.Add('select * from indexliao where gg='+''''+tname+'''');
   indexliao.Open;
   if indexliao.RecordCount<>1 then
   begin
       showmessage('关键字影射出现错误');
       exit;
   end;

   if  indexliao.FieldValues['newliao']<>'XXXXXXXXX-XX'  then
       tname:=indexliao.FieldValues['newliao']
   else
       tname:=indexliao.FieldValues['predex'];
   end;   //  if (tname[1]='P')and(tname[2]='B') then

   fomatliaohao(tname,tname);
   if trim(adoquery1.FieldValues['料号'])='' then
         exit;
   if Isexistsliao(adoquery1.FieldValues['料号'],tname)=true then
         begin
            if application.MessageBox('此物料已存在当前BOM中！！！！是否进行零件位置合并或替换料号？','操作提示！',mb_YESNO+Mb_iconinformation)=id_YES then
                begin
                if aqljlh.Locate('料号',trim(adoquery1.FieldValues['料号']),[])=false then
                   begin
                       showmessage('定位错误！！！');
                       exit;
                   end;
                 thhpfm.Edit1.Text:=aqljlh.FieldValues['料号'];
                 thhpfm.Edit2.Text:=aqljlh.FieldValues['规格说明'];
                 thhpfm.Edit3.Text:=aqljlh.FieldValues['单位用量'];
                 thhpfm.Edit4.Text:='';
                 thhpfm.Memo1.Text:=aqljlh.FieldValues['零件位置'];
                 thhpfm.oldljwz:=aqljlh.FieldValues['零件位置'];
                 if tabpage3show=false then
                   begin
                     if adoquery4.Active=true then
                          begin
                             thhpfm.newliaowz:=adoquery4.FieldValues['零件位置'];
                          end
                    else exit;
                  end
                else if tabpage3show=true then
                      begin
                       thhpfm.newliaowz:=Reference;
                      end;

                 thhpfm.showmodal;
                 if thhpfm.cancel=true then
                    exit;
                 aqljlh.Edit;
                 aqljlh.FieldValues['单位用量']:=thhpfm.Edit3.Text;
                 aqljlh.FieldValues['零件位置']:=thhpfm.Memo1.Text;
                 aqljlh.Post;
                 exit;   
          end  // if application.MessageBox('此物料已存在当前
         else  exit;
       end; //if Isexistsliao(adoquery1.FieldValues['料号'],tname)=true then


       
       aqljlh.Append;
       aqljlh.FieldValues['料号']:=adoquery1.FieldValues['料号'];
       //adotable1.FieldValues['规格说明']:=adoquery1.FieldValues['规格说明'];
       //aqljlh.FieldValues['阶层']:=adoquery1.FieldValues['阶层'];
       if tabpage3show=false then
        begin
          if adoquery4.Active=true then
             begin
               aqljlh.FieldValues['单位用量']:=adoquery4.FieldValues['单位用量'];
               aqljlh.FieldValues['零件位置']:=adoquery4.FieldValues['零件位置'];
             end
          else exit;
        end
       else if tabpage3show=true then
          begin
              aqljlh.FieldValues['单位用量']:=Quantity;
              aqljlh.FieldValues['零件位置']:=Reference;
          end;
       aqljlh.Append;
   end;
end;

procedure Tmakebomfm.SpeedButton9Click(Sender: TObject);
var
//indexliaohao:integer;
liaohao,bomliao:string;
//f:textfile;
//filename:string;
begin
if (adoquery4.Active=true)and(aqljlh.Active=true) then
   begin
        try
        aqljlh.Append;
        aqljlh.FieldValues['料号']:=adoquery4.FieldValues['料号'];
        aqljlh.FieldValues['零件位置']:=adoquery4.FieldValues['零件位置'];
        aqljlh.FieldValues['用量']:=adoquery4.FieldValues['用量'];
        aqljlh.Post;
        except
           showmessage('剪切失败！！！');
        end;
   end;

{newbomoptinfm.showmodal;
IF newbomoptinfm.R2.Checked=TRUE THEN
 begin
if trim(newbomoptinfm.Edit2.Text)='' then
begin
     showmessage('您至少要为你要创建的BOM给一个简单的描述！！');
     exit;
end;
 
  try
            indexliao.Close;
            indexliao.SQL.Clear;
            indexliao.SQL.Add('select * from indexliao where gg='+''''+'PB'+trim(newbomoptinfm.Edit2.Text)+'''');
            indexliao.Open;
            if indexliao.RecordCount>=1 then
               begin
                   showmessage('与说明描述相关联的BOM已经存在！！');
                   exit;
               end;


            preljlh.Close;
            preljlh.Open;
            preljlh.Append;
            preljlh.FieldValues['料号']:='XXXXXXXXX-XX';
            preljlh.FieldValues['品名']:='XXXXX';
            preljlh.FieldValues['规格说明']:=trim(newbomoptinfm.Edit2.Text);
            preljlh.FieldValues['申请人']:=userrealname;
            preljlh.post;
            adoquery3.Close;
            adoquery3.SQL.Clear;
            adoquery3.SQL.Add('select * from prelingjianliaohao where 申请人='+''''+trim(userrealname)+'''');
            adoquery3.Open;
            MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
            adoquery3.Locate('规格说明',trim(newbomoptinfm.edit2.Text),[]);
            indexliaohao:=adoquery3.FieldValues['P_ID'];
            indexliao.Close;
            indexliao.Open;
            indexliao.Append;
            indexliao.FieldValues['predex']:=indexliaohao;
            indexliao.FieldValues['gg']:=trim('PB'+newbomoptinfm.edit2.Text);
            indexliao.Post;
  except
      showmessage(' 自动申请料号失败！无法创建临时BOM！！！');
      exit;
  end;
  fomatliaohao(inttostr(indexliaohao),liaohao);
  createbom(trim(liaohao));
  filename:='.\userbomlist.dat';
  AssignFile(F, FileName);
  if not fileexists('.\userbomlist.dat') then
  Rewrite(F)
  else
  Append(f);
  writeln(F,'PB'+newbomoptinfm.edit2.text);
  closefile(f);
end
else if newbomoptinfm.R1.Checked=true    then
   begin
       CREATEBOMFM2.SHOWMODAL;
   end
else
begin
    exit;
end;
         }

end;
procedure Tmakebomfm.DBGrid1DblClick(Sender: TObject);
var
tname:string;
begin
exit;///////////////////////////////
if (adoquery1.Active=true)and(aqljlh.Active=true) then
   begin
      tname:=trim(combobox1.Text);

   if tname='' then
   begin
       showmessage('  未选种！！！                 ');
       exit;
   end;
   if (tname[1]='P')and(tname[2]='B') then
   begin
   indexliao.Close;
   indexliao.SQL.Clear;
   indexliao.SQL.Add('select * from indexliao where gg='+''''+tname+'''');
   indexliao.Open;
   if indexliao.RecordCount<>1 then
   begin
       showmessage('关键子影射出现错误');
       exit;
   end;
   if  indexliao.FieldValues['newliao']<>'XXXXXXXXX-XX'  then
       tname:=indexliao.FieldValues['newliao']
   else
       tname:=indexliao.FieldValues['predex'];
   end;


      fomatliaohao(tname,tname);
       if Isexistsliao(adoquery1.FieldValues['料号'],tname)=true then
         begin
             showmessage('此物料已存在当前BOM中！！！');
             exit;
         end;
       aqljlh.Append;
       aqljlh.FieldValues['料号']:=adoquery1.FieldValues['料号'];
       //adotable1.FieldValues['规格说明']:=adoquery1.FieldValues['规格说明'];
       aqljlh.FieldValues['阶层']:=adoquery1.FieldValues['阶层'];
       //aqljlh.FieldValues['单位用量']:=table1.FieldValues['Quantity'];
      // aqljlh.FieldValues['零件位置']:=table1.FieldValues['Reference'];
       aqljlh.Append;
   end;
end;

procedure Tmakebomfm.ComboBox1Change(Sender: TObject);
var
estr:string;
liaohao,lh:string;
gg:string;
begin
aqljlh.Close;
caption:='制作BOM  '+combobox1.Text;

      
if trim(combobox1.Text)='' then
   exit;
gg:=trim(combobox1.Text);
if (gg[1]='P')and(gg[2]='B') then
begin
indexliao.Close;
indexliao.SQL.Clear;
indexliao.SQL.Add('select * from indexliao where gg='+''''+gg+'''');
indexliao.Open;
if indexliao.RecordCount<>1 then
   begin
       showmessage('BOM已不存在！！');
       exit;
   end;
if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
   begin
      if ischecked(indexliao.FieldValues['newliao'])=true then
       begin
          // showmessage('当前BOM已被审核或核准，不可再编辑！！');
           aqljlh.DataSource.AutoEdit:=false;
           dbgrid2.ReadOnly:=true;
           setreadonly(true);
       end
       else
       begin
           setreadonly(false);
           aqljlh.close;
           //aqljlh.DataSource.AutoEdit:=true;
           datasource2.AutoEdit:=true;
           dbgrid2.ReadOnly:=false;
       end;

   liaohao:=trim(indexliao.FieldValues['newliao']);
   end
else
begin
   liaohao:=trim(indexliao.FieldValues['predex']);
   setreadonly(false);
end;
 //  fomatliaohao(liaohao,liaohao);

end   //  if (gg[1]='P')and(gg[2]='B') then
else
begin
liaohao:=trim(combobox1.Text);
if (ischecked(liaohao)=true) then           //(isowner(liaohao)=false)or
    setreadonly(true)
else  setreadonly(false);
end;

lh:=liaohao;

fomatliaohao(liaohao,liaohao);
currenttablename:=liaohao;
 estr:='SELECT '+liaohao+'.料号 AS 料号, '+ liaohao+'.阶层 AS 阶层, ' +liaohao+'.单位用量 AS 单位用量, '+liaohao+'.零件位置 AS 零件位置, '   +
      'lingjianliaohao.品名 AS 品名, lingjianliaohao.规格说明 AS 规格说明,  '+
      'lingjianliaohao.承认 AS 承认 ' +
      'FROM '+liaohao+' cross JOIN lingjianliaohao '+
      'where '+liaohao+'.料号 = lingjianliaohao.料号  order by 料号';
aqljlh.Close;
aqljlh.SQL.Clear;
aqljlh.SQL.Add(estr);
try
aqljlh.Open ;
except
currenttablename:='';
end;
getbominfo;

    tq.Close;
    tq.SQL.Clear;
    tq.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(lh)+'''');
    tq.Open;
    if tq.RecordCount=1 then
    begin
    if tq.FieldValues['锁']=true then
       speedbutton7.Caption:='解锁'
    else speedbutton7.Caption:='锁定';
    end ;


MakeDBGridColumnsAutoFixItsWidth(DBGrid2);
 speedbutton13.Enabled:=false;
     speedbutton14.Enabled:=false;
end;
procedure acttable(liaohao:string;ds:Tadotable);
var
tablename:string;
begin
      tablename:=liaohao;
      ds.Close;
      ds.TableName:=tablename;
      ds.Active:=true;
      ds.First;
end;
procedure Tmakebomfm.ComboBox2Change(Sender: TObject);
var
  l1, l2,l3,l4,l5,l6,l7: TTreeNode;
  i1,i2,i3,i4,i5,i6,i7:integer;
  liaohao:string;
  sqlstr,gg:string;
begin
if trim(combobox2.Text)='' then
   exit;
begin
 statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
 statusbar1.Update;
caption:='制作BOM  '+combobox2.Text;
gg:=trim(combobox2.Text);
if (gg[1]='P')and(gg[2]='B') then
begin
indexliao.Close;
indexliao.SQL.Clear;
indexliao.SQL.Add('select * from indexliao where gg='+''''+gg+'''');
indexliao.Open;
if indexliao.RecordCount<>1 then
   begin
       showmessage('BOM已不存在！！');
       statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';
       exit;
   end;
if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
   liaohao:=trim(indexliao.FieldValues['newliao'])
else
   liaohao:=trim(indexliao.FieldValues['predex']);
   fomatliaohao(liaohao,liaohao);

end
else
begin
fomatliaohao(trim(combobox2.Text),liaohao);
end;

tv.Items.Clear;
with tv.Items do
   begin
       l1:=add(nil ,liaohao);
                   if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['料号']));
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['料号']));
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['料号']));
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['料号']));
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            l6:=AddChild(l5 ,trim(t6.FieldValues['料号']));
                                                                            fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['料号']));
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;


end;

end;
   speedbutton13.Enabled:=false;
     speedbutton14.Enabled:=false;
  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';
end;

procedure Tmakebomfm.SpeedButton4Click(Sender: TObject);
var
  bomliao,newbomliao,sqlstr:string;
  i,j:integer;

begin


bomliao:=trim(combobox1.Text);
///////////////////////////////////////////////////get bomliao if aotoapp
if (bomliao[1]='P')and(bomliao[2]='B') then
begin
    indexliao.Close;
    indexliao.SQL.Clear;
    indexliao.SQL.Add('select * from indexliao where gg='+''''+trim(combobox1.Text)+'''');
    indexliao.Open;
    if indexliao.RecordCount=1 then
       begin
         if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
         begin
            bomliao:=trim(indexliao.FieldValues['predex']);
            showmessage('有新料审核通过，按刷新菜单可得到已申请核准通过的新料！！');
           //newbomliao:=trim(indexliao.FieldValues['newliao']);
            {fomatliaohao(bomliao,bomliao);
            fomatliaohao(newbomliao,newbomliao);
            //if existbom(newbomliao)=false then
            if(existbom(bomliao)=true)and(existbom(newbomliao)=false) then
            begin
            sqlstr:='sp_rename '+bomliao+','+newbomliao;
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute;
            end; }
           // bomliao:=newbomliao;
         end      // if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
         else
         begin
             bomliao:=trim(indexliao.FieldValues['predex']);
         end;

       end;
    if indexliao.RecordCount<>1 then
       begin
       showmessage('在影射过程中失败！请记录出错位置：'+inttostr(indexliao.FieldValues['predex'])+',寻求技术支持！');

       exit;
       end;
end;  // if (bomliao[1]='P')and(bomliao[2]='B') then

if bomliao='' then
   begin
       showmessage('请在下拉列表中选种要保存的BOM！！！');

       exit;
   end;
///////////////////////////////////////////////////post liao
pb.Position:=0;
adotable1.Close;
fomatliaohao(bomliao,bomliao);
adotable1.TableName:=trim(bomliao);
adotable1.Open;
pb.Max:=100;
adotable1.First;
for i:=0 to adotable1.RecordCount-1 do
  begin
      if (Isexistsliao(trim(adotable1.FieldValues['料号']),'lingjianliaohao')=false)and(Isexistsliao(trim(adotable1.FieldValues['料号']),'prelingjianliaohao')=false) then
         begin
         try
            preljlh.Close;
            preljlh.Open;
            preljlh.Append;
            preljlh.FieldValues['料号']:=adotable1.FieldValues['料号'];
            preljlh.FieldValues['品名']:='待定';
            preljlh.FieldValues['规格说明']:='待定';
            preljlh.FieldValues['申请人']:=userrealname;
            preljlh.post;

         except


         end;
         end;
      adotable1.Next;
      aqljlh.Next;
      for j:=0 to pb.Max-1 do
      begin
      pb.StepBy(1);
      if pb.Position=pb.max then
         pb.Position:=0;
      pb.Update;
      end;
  end;
//////////////////////////////////////////post liao
aqljlh.Edit;
aqljlh.Post;
////////////////////////////////// auto apply liao
try
  adoquery3.Close;
  adoquery3.SQL.Clear;
  adoquery3.SQL.Add('select * from prelingjianliaohao where 申请人='+''''+trim(userrealname)+'''');
  adoquery3.Open;
  MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
except

end;

adotable1.Close;
end;

procedure Tmakebomfm.SpeedButton5Click(Sender: TObject);
var
liaohao,sqlstr,gg,deleteliao:string;
begin
deleteoptionfm.showmodal;
if deleteoptionfm.cancel=true then
   exit;

if trim(currenttablename)='' then
   begin
       showmessage('失去要操作的BOM！！！');
       exit;
   end;
if deleteoptionfm.R1.Checked=true then
begin
deleteliao:=trim(aqljlh.FieldValues['料号']);
if deleteliao='' then
   begin
       showmessage('请选种要删除的料号！！！');
       exit;
   end;
if application.MessageBox('你正在删除当前BOM中的料号！要继续吗？','删除提示！',mb_okcancel+Mb_iconinformation)=id_ok then
   begin
   try
      if deleteliao='' then
         begin
             showmessage('失去操作对象，请重史！！！');
             exit;
         end;
      aqdelete.Close;
      aqdelete.SQL.Clear;
      aqdelete.SQL.Add('delete from '+currenttablename+' where 料号='+''''+deleteliao+'''');
      aqdelete.ExecSQL;
      combobox1.OnChange(self);
   except
      showmessage('删除失败！！！      ');
   end;
  // showmessage('已在当前ＢＯＭ中删除此料号！！！！！');
   end;
end
else if deleteoptionfm.R2.Checked=true then
     begin
         gg:=trim(combobox1.Text) ;
if gg='' then
exit;
if (gg[1]='P') and(gg[2]='B') then
begin
indexliao.Close;
indexliao.SQL.Clear;
indexliao.SQL.Add('select * from indexliao where gg='+''''+gg+'''');
indexliao.Open;
if indexliao.RecordCount<>1 then
 begin
     showmessage('现存BOM出现问题，无法删除，请寻求技术支持！！');
     exit;
 end;
if  trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
   begin
    if ischecked(indexliao.FieldValues['newliao'])=true then
       begin
           showmessage('当前BOM已被审核或核准，不可删除！！');
           exit;
       end;
    fomatliaohao(trim(indexliao.FieldValues['newliao']),liaohao);
    end
else
fomatliaohao(trim(indexliao.FieldValues['predex']),liaohao);

if existbom(liaohao)=true then
  begin
            sqlstr:='drop table '+trim(liaohao);
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute;
            indexliao.Delete;
            showmessage('ＢＯＭ删除成功！！！！！！　　　　　　　　　　　　　　　');

  end
  else
  begin
      application.MessageBox(' BOM已不存在！！  ','HME提示！',mb_YESNO+MB_ICONINFORMATION);
  end;
end
else
begin
if ischecked(trim(combobox1.Text))=true then
       begin
           showmessage('当前BOM已被审核或核准，不可删除！！');
           exit;
       end;
fomatliaohao(trim(combobox1.Text),liaohao);
    if existbom(liaohao)=true then
  begin
            sqlstr:='drop table '+trim(liaohao);
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute;

  end
  else
  begin
      application.MessageBox(' BOM已不存在！！  ','HME提示！',mb_YESNO+MB_ICONINFORMATION);
  end;
end;

     end
else
   showmessage('无效的操作！！！！');
end;

procedure Tmakebomfm.SpeedButton6Click(Sender: TObject);
begin
aqljlh.Insert;
end;
procedure Tmakebomfm.readfiletobombobox(combobox:Tcombobox);
var
 f:textfile;
   filename:string;
   s:string;
begin
     if not fileexists('.\userbomlist.dat') then
       begin
           showmessage('文件丢失！！！');
           exit;
       end;
      filename:='.\userbomlist.dat';
      AssignFile(F, FileName);
      Reset(F);
      combobox.Clear;
      while not eof(f) do
      begin
       readln(F,s);
       combobox.Items.Append(s);
      end;
      closefile(f);
    //  showmessage('ok');
    if openliao<>'' then
       begin
       if combobox.Items.ValueFromIndex[combobox.Items.Count-1]<>openliao then
       combobox.Items.Append(openliao);
       //openliao:='';
       end;
end;
procedure Tmakebomfm.ComboBox1DropDown(Sender: TObject);
//var
// f:textfile;
//   filename:string;
//   s:string;
begin
//readfiletobombobox(combobox1);
//getuserbomlist();
 {    if not fileexists('.\userbomlist.dat') then
       begin
           showmessage('文件丢失！！！');
           exit;
       end;
      filename:='.\userbomlist.dat';
      AssignFile(F, FileName);
      Reset(F);
      combobox1.Clear;
      while not eof(f) do
      begin
       readln(F,s);
       combobox1.Items.Append(s);
      end;
      closefile(f);
    //  showmessage('ok');
    if openliao<>'' then
       begin
       combobox1.Items.Append(openliao);
       openliao:='';
       end;      }
end;
procedure Tmakebomfm.ComboBox2DropDown(Sender: TObject);
//var
// f:textfile;
//   filename:string;
//   s:string;
begin
readfiletobombobox(combobox2);
  {    filename:='.\userbomlist.dat';
      AssignFile(F, FileName);
      Reset(F);
      combobox2.Clear;
      while not eof(f) do
      begin
       readln(F,s);
       combobox2.Items.Append(s);
      end;
      closefile(f);
      //showmessage('ok');
       if openliao<>'' then
       begin
       combobox2.Items.Append(openliao);
       openliao:='';
       end;   }
end;

procedure Tmakebomfm.SpeedButton7Click(Sender: TObject);
var
gg:string;
begin
gg:=trim(combobox1.Text) ;
if gg='' then
begin
showmessage('没有选种要操作的BOM');
AQLJLH.Close;
exit;
END;
if (gg[1]='P') and(gg[2]='B') then
begin
indexliao.Close;
indexliao.SQL.Clear;
indexliao.SQL.Add('select * from indexliao where gg='+''''+gg+'''');
indexliao.Open;
if indexliao.RecordCount<>1 then
 begin
     showmessage('现存BOM出现问题，无法操作，请寻求技术支持！！');
     exit;
 end;
if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
begin
    tq.Close;
    tq.SQL.Clear;
    tq.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(indexliao.FieldValues['newliao'])+'''');
    tq.Open;
    if tq.RecordCount<>1 then
    begin
       showmessage('问题BOM，无法操作该BOM');
       exit;
    end;
    TQ.Edit;
    if  tq.FieldValues['锁']=false then
    begin
      tq.FieldValues['锁']:=true;
      showmessage('BOM已经锁定               ');
      speedbutton7.Caption:='解锁';
    end
    else
    begin
    tq.FieldValues['锁']:=false;
       showmessage('BOM已经解除锁定               ');
       speedbutton7.Caption:='锁定';
    end;
    tq.Post;

end
 else
       begin
           showmessage('此BOM尚未提交，无须设置锁定信息！！');
           exit;
       end;
end   //gg[1]='P' gg[2]='B'
else
begin
 tq.Close;
    tq.SQL.Clear;
    tq.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(combobox1.Text)+'''');
    tq.Open;
    if tq.RecordCount<>1 then
    begin
       showmessage('问题BOM，无法操作该BOM');
       exit;
    end;
    TQ.Edit;
    if  tq.FieldValues['锁']=false then
    begin
      tq.FieldValues['锁']:=true;
      showmessage('BOM已经锁定               ');
      speedbutton7.Caption:='解锁';
    end
    else
    begin
    tq.FieldValues['锁']:=false;
       showmessage('BOM已经解除锁定               ');
       speedbutton7.Caption:='锁定';
    end;
    tq.Post;

end;

end;

procedure Tmakebomfm.DBGrid4CellClick(Column: TColumn);
begin
try




 adoquery1.Close;
 adoquery1.SQL.Clear;

// adoquery1.SQL.Add('select * from lingjianliaohao where 规格说明 like '+''''+'%'+trim(adoquery4.FieldValues['规格说明'])+'%'+'''')

 adoquery1.SQL.Add('select  品名, 规格说明,料号, 供应商, 承认, 使用机种 from lingjianliaohao where 料号 like '+''''+'%'+trim(adoquery4.FieldValues['料号'])+'%'+'''');
 adoquery1.Open;
 if adoquery1.RecordCount<30 then
 MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
except
end;
end;

procedure Tmakebomfm.DBGrid4KeyPress(Sender: TObject; var Key: Char);
begin
{if key=#13 then
begin
try
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select * from lingjianliaohao where 规格说明 like '+''''+'%'+trim(adoquery4.FieldValues['PART'])+'%'+'''');
 adoquery1.Open;
  if adoquery1.RecordCount<30 then
 MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
except
end;
end;  }
end;

procedure Tmakebomfm.FormActivate(Sender: TObject);
begin
try
  adoquery3.Close;
  adoquery3.SQL.Clear;
  adoquery3.SQL.Add('select * from prelingjianliaohao where 申请人='+''''+trim(userrealname)+'''');
  adoquery3.Open;
//  table1.Open;
  MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
 // MakeDBGridColumnsAutoFixItsWidth(DBGrid4);
except

end;
stringgrid1.Cells[1,0]:='Part';
STRINGGRID1.Cells[2,0]:='Reference';
STRINGGRID1.Cells[3,0]:='Quantity';
STRINGGRID1.Cells[4,0]:='Package';

end;

procedure Tmakebomfm.SpeedButton1Click(Sender: TObject);
var
str,no,bomfile,s,so:string;
i,j,k,last_row,gridrow:integer;
begin
no:='';
try //finally
last_row:=0;
gridrow:=1;
statusbar1.Panels.Items[3].Text:='请稍等！！正在导入BOM............... ';
STATUSBAR1.Update;
dbgrid4.ReadOnly:=false;
opendialogfm.showmodal;
if opendialogfm.cancel=true then
   exit;
str:=trim(opendialogfm.ComboBox1.Text);
bomfile:=str;
if AnsiStricomp(pchar(ExtractFileExt(str)),'.BOM')<>0 then
begin
   showmessage('文件格式不对，无法打开此类型的文件！！');
   exit;
end;
try
  if ExtractFileExt(str)<>'.xls' then
     begin
         str:=ChangeFileExt(str,'.xls');
         RenameFile(bomfile, str);
     end;
except
  exit;
end;
  {if opendialog1.Execute then
   begin
           str:=opendialog1.FileName;
           bomfile:=str;
      try
      if ExtractFileExt(str)<>'.xls' then
         begin
         str:=ChangeFileExt(str,'.xls');
         RenameFile(opendialog1.FileName, str);
         end;
      except
         exit;
      end;
   end; }
   //table1.Close;
  // try
  // table1.Open;
   //except
   // if ExtractFileExt(str)='.xls' then
   //      begin
         //str:=ChangeFileExt(str,'.BOM');
   //      RenameFile(str,bomfile);
   //      end;
   //end;
 //  for j:=0 to table1.RecordCount-1 do
  // begin
 //      table1.Delete;
  //     table1.Next;
  // end;
         try
         olefm.olecontainer1.createObjectFromFile(str,false);
         olefm.olecontainer1.DoVerb(0);
         except
         olefm.olecontainer1.Close;
         end;

   for j:=1 to 100 do
        begin
           no:=olefm.OleContainer1.OleObject.application.cells[j,1].value;
           if no='1' then
           begin
              k:=j;
              break;
           end;
        end;
   
   for i:=k to  1024 do
        begin
             no:=trim(olefm.OleContainer1.OleObject.application.cells[i,1].value);
             stringgrid1.Cells[0,i-k+1]:=inttostr(i-k+1);
             if trim(no)<>'' then
             begin
              last_row:=gridrow;
              stringgrid1.Cells[3,gridrow]:=olefm.OleContainer1.OleObject.application.cells[i,2].value;
              stringgrid1.Cells[2,gridrow]:=olefm.OleContainer1.OleObject.application.cells[i,3].value;
              stringgrid1.Cells[1,gridrow]:=olefm.OleContainer1.OleObject.application.cells[i,4].value;
              stringgrid1.Cells[4,gridrow]:=olefm.OleContainer1.OleObject.application.cells[i,5].value;
              gridrow:=gridrow+1;  

            { table1.Append;
             table1.FieldValues['Quantity']:=olefm.OleContainer1.OleObject.application.cells[i,2].value;
             table1.FieldValues['Reference']:=olefm.OleContainer1.OleObject.application.cells[i,3].value;
             table1.FieldValues['Part']:=olefm.OleContainer1.OleObject.application.cells[i,4].value;}

             end
             else
             begin
           //  table1.Last;
            // table1.Edit;
             s:='';
             s:=stringgrid1.Cells[2,last_row];
             so:=olefm.OleContainer1.OleObject.application.cells[i,3].value;
             stringgrid1.Cells[2,last_row]:=s+so;
           //  table1.FieldValues['Reference']:=table1.FieldValues['Reference']+olefm.OleContainer1.OleObject.application.cells[i,3].value; }
             end;
            // table1.Post;

            if trim(olefm.OleContainer1.OleObject.application.cells[i+1,3].value)='' then
               break;

        end;
   if ExtractFileExt(str)='.xls' then
         begin
         //str:=ChangeFileExt(str,'.BOM');
         RenameFile(str,bomfile);
         end;
 finally
  showmessage('导入BOM 完成！！！                       ') ;
  statusbar1.Panels.Items[3].Text:='导入BOM 完成！！！ ';
 end;
end;

procedure Tmakebomfm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid1 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource1.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行}
Canvas.brush.Color :=Clcream {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
end; 

end;

procedure Tmakebomfm.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid2 do
begin 
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then 
begin 
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy; 
end 
else 
begin 
if DataSource2.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行} 
Canvas.brush.Color :=Clcream {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示} 
end; 
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
end; 

end;

procedure Tmakebomfm.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid4 do
begin 
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then 
begin 
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy; 
end 
else
begin 
if DataSource4.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行} 
Canvas.brush.Color :=Clcream {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示} 
end; 
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了} 
end; 

end;

procedure Tmakebomfm.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   with DBGrid3 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource3.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行}
Canvas.brush.Color :=Clcream {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
end; 
end;
procedure createtable(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[xuhao_ID] [int] IDENTITY (1, 1) NOT NULL  ,                       '+
 '	[料号] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL primary key,         '+
 '	[阶层] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[单位用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[工单用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[零件位置] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL,         '+
 ' 	[承认] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,           '+
 '  [单价] [float] NULL default 0.00,                                               '+

 ' 	[合计] [float] NULL default 0.00                                              '+
') ON [PRIMARY]';

    //primary key
   //  ' 	[数量] [float] NULL default 0.00,                 '+
  // '	[序号] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

   with makebomfm.ADOCommand1 do
         begin

             CommandText:='';
             CommandText:=str;
             execute;

         end;

end;
procedure Tmakebomfm.SpeedButton2Click(Sender: TObject);
//var
//indexliaohao:integer;
begin

 adoquery3.Edit;
 adoquery3.Post;



//  appliaohaofm.show;
{if trim(edit2.Text)='' then
   exit;
  try
            preljlh.Close;
            preljlh.Open;
            preljlh.Append;
            preljlh.FieldValues['料号']:='XXXXXXXXX-XX';
            preljlh.FieldValues['品名']:='XXXXX';
            preljlh.FieldValues['规格说明']:=trim(edit2.Text);
            preljlh.FieldValues['申请人']:=userrealname;
            preljlh.post;
            adoquery3.close;
            adoquery3.Open;
            adoquery3.Locate('规格说明',trim(edit2.Text),[]);
            indexliaohao:=adoquery3.FieldValues['P_ID'];
            indexliao.Close;
            indexliao.Open;
            indexliao.Append;
            indexliao.FieldValues['predex']:=indexliaohao;
            indexliao.Post;
  except
      showmessage(' 自动申请料号失败！无法创建临时BOM！！！');
      exit;
  end;
       }
  

end;

procedure Tmakebomfm.TVDblClick(Sender: TObject);
begin
{try
      adoquery1.Close;
      adoquery1.SQL.Clear;
      adoquery1.SQL.Add('select * from lingjianliaohao where 料号 ='+''''+trim(tv.Selected.Text)+'''');
      adoquery1.Open;
      if adoquery1.RecordCount<1 then
         showmessage('此料号料库中不存在！！')
      else
      MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
except

end;  }
end;
procedure Tmakebomfm.setreadonly(flag:boolean);
begin
      DataSource2.AutoEdit:=not flag;
      dbgrid2.ReadOnly:=flag;
      speedbutton7.Enabled:=not flag;
      speedbutton4.Enabled:=not flag;
      speedbutton5.Enabled:=not flag;
      speedbutton6.Enabled:=not flag;
      speedbutton8.Enabled:=not flag;
      speedbutton12.Enabled:=not flag;
      speedbutton9.Enabled:=not flag;
      speedbutton10.Enabled:=not flag;
      speedbutton13.Enabled:=not flag;
      speedbutton14.Enabled:=not flag;
      dbgrid5.ReadOnly:=flag;
end;

procedure Tmakebomfm.SpeedButton11Click(Sender: TObject);
var
liaohao,estr:string;
GUIGE:STRING;
begin
openbomfm.showmodal;
if openbomfm.cancel=true then
   exit;
GUIGE:=TRIM(OPENBOMFM.Memo1.Text);
liaohao:=trim(openbomfm.Edit1.Text);
combobox2.Text:=liaohao;
combobox1.text:=liaohao;
combobox2.Items.Add(liaohao);
combobox1.Items.Add(liaohao);
openliao:=liaohao;
CAPTION:='制作BOM '+ '料号 '+LIAOHAO+'规格说明 '+GUIGE;
if ischecked(liaohao)=true then             //(isowner(liaohao)=false)or
    setreadonly(true)
else
begin
setreadonly(false);
speedbutton13.Enabled:=false;
speedbutton14.Enabled:=false;
end;

fomatliaohao(liaohao,liaohao);
 estr:='SELECT '+liaohao+'.料号 AS 料号, '+ liaohao+'.阶层 AS 阶层, ' +liaohao+'.单位用量 AS 单位用量, '+liaohao+'.零件位置 AS 零件位置, '   +
      'lingjianliaohao.品名 AS 品名, lingjianliaohao.规格说明 AS 规格说明,  '+
      'lingjianliaohao.承认 AS 承认 ' +
      'FROM '+liaohao+' cross JOIN lingjianliaohao '+
      'where '+liaohao+'.料号 = lingjianliaohao.料号  order by 料号';
aqljlh.Close;
aqljlh.SQL.Clear;
aqljlh.SQL.Add(estr);
aqljlh.Open ;
getbominfo;

    

MakeDBGridColumnsAutoFixItsWidth(DBGrid2);

end;
procedure Tmakebomfm.checkedliao(gg:string;var liaohao:string);
var
sqlstr,bomliao,newbomliao:string;
begin
   if trim(gg)='' then
      exit;
     indexliao.Close;
     indexliao.SQL.Clear;
     indexliao.SQL.Add('select * from indexliao where gg='+''''+trim(gg)+'''');
     indexliao.Open;
   if indexliao.RecordCount<>1 then
        begin
            showmessage('临时BOM影射出错！！');
            //showmessage('请记录：'+BOMLIAO+' 到 '+liaohao+' 的影射错误 要提交的BOM已存在！！！！');
            liaohao:='';
            exit;
        end;
   if  trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
       begin
       bomliao:=trim(indexliao.FieldValues['predex']);
       liaohao:=trim(indexliao.FieldValues['newliao']);
       newbomliao:=liaohao;  //return liaohao as a  new liao
       fomatliaohao(bomliao,bomliao);
       fomatliaohao(newbomliao,newbomliao);
       if (existbom(bomliao)=true)and(existbom(newbomliao)=false) then
       begin
            sqlstr:='sp_rename '+bomliao+','+newbomliao;
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute;
            indexliao.Delete;
            
       end
       else
       begin
           showmessage('请记录：'+BOMLIAO+' 到 '+liaohao+' 的影射错误 要提交的BOM已存在！！！！');
       end;
       end  // if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
   else
       liaohao:='';
   indexliao.Close;

end;
procedure getuserbomlist();
var
   aq:tadoquery;
   i:integer;
begin
   aq:=Tadoquery.Create(application);
   aq.Connection:=dm.ADOConnection1;
   aq.Close;
   aq.SQL.Clear;
   aq.SQL.Add('select * from indexliao where users='+''''+userrealname+'''');
   aq.Open;
   aq.First;
   if aq.RecordCount>=1 then
      begin
          for i:=0 to aq.RecordCount-1 do
             begin
                 makebomfm.ComboBox1.Items.Add(aq.FieldValues['gg']);
                 aq.Next;
             end;
      end;
      aq.Close;
      aq.Free;

end;
procedure Tmakebomfm.SpeedButton12Click(Sender: TObject);
var
 f:textfile;
 filename,s:string;
 sl:Tstringlist;
 i,sc:integer;
 liaohao:string;
begin
readfiletobombobox(combobox1);
getuserbomlist();


//if trim(combobox1.Text)='' then
//   begin
//       showmessage('没有选种要刷新的BOM！！！');
//       EXIT;
//   end;

 sl:=Tstringlist.Create;
 filename:='.\userbomlist.dat';
 AssignFile(F, FileName);
if  fileexists('.\userbomlist.dat') then
    begin
    reset(f);
     while not eof(f) do
        begin
            readln(F,s);
            sl.Add(trim(s));
        end;
     closefile(f);
     sc:= sl.Count;
     for i:=0 to sc-1 do
         begin
             s:=sl.Strings[i];
             if trim(s)='' then
                continue;
             if (s[1]='P') and (s[2]='B')  then
                 begin
                    liaohao:='';
                    checkedliao(s,liaohao);
                    if trim(liaohao)<>'' then
                    sl.Strings[i]:=trim(liaohao)
                    else
                       begin
                       //    showmessage('BOM影射错误！！！');
                       end;
                 end
             else
                begin
                    liaohao:='';
                    fomatliaohao(s,s);
                    if (existbom(s)=false)or(trim(sl[i])='') then
                       begin
                          sl.Strings[i]:='';
                         // sl.Delete(i);
                       end;
                    if sl.Count>10 then
                       sl.Delete(i);
                end;
         end;
    try
      for i:=0 to sl.Count-1 do
      begin
           s:=trim(sl.Strings[i]);
           if s='' then
              sl.Delete(i);
      end;
    except
    end;
      Rewrite(F);
      for i:=0 to sl.Count-1 do
      begin
         writeln(F,sl.strings[i]);
      end;
      closefile(f);
      sl.Free;
   end;
 if trim(combobox1.Text)<>'' then
 try
 if trim(combobox1.Text)<>'' then
   combobox1.OnChange(self);
 except
 end;
end;

procedure Tmakebomfm.N2Click(Sender: TObject);
begin
CREATEBOMFM2.SHOWMODAL;
end;

procedure Tmakebomfm.N3Click(Sender: TObject);
var
indexliaohao:integer;
liaohao:string;
f:textfile;
filename:string;
begin

newbomoptinfm.showmodal;
if newbomoptinfm.cancel=true then
   exit;
IF newbomoptinfm.R2.Checked=TRUE THEN
 begin
if trim(newbomoptinfm.Edit2.Text)='' then
begin
     showmessage('您至少要为你要创建的BOM给一个简单的描述！！');
     exit;
end;
 
  try
            indexliao.Close;
            indexliao.SQL.Clear;
            indexliao.SQL.Add('select * from indexliao where gg='+''''+'PB'+trim(newbomoptinfm.Edit2.Text)+'''');
            indexliao.Open;
            if indexliao.RecordCount>=1 then
               begin
                   showmessage('与说明描述相关联的BOM已经存在！！');
                   exit;
               end;


            preljlh.Close;
            preljlh.Open;
            preljlh.Append;
            preljlh.FieldValues['料号']:='XXXXXXXXX-XX';
            preljlh.FieldValues['品名']:='XXXXX';
            preljlh.FieldValues['规格说明']:=trim(newbomoptinfm.Edit2.Text);
            preljlh.FieldValues['申请人']:=userrealname;
            preljlh.post;
            adoquery3.Close;
            adoquery3.SQL.Clear;
            adoquery3.SQL.Add('select * from prelingjianliaohao where 申请人='+''''+trim(userrealname)+'''');
            adoquery3.Open;
            MakeDBGridColumnsAutoFixItsWidth(DBGrid3);
            adoquery3.Locate('规格说明',trim(newbomoptinfm.edit2.Text),[]);
            indexliaohao:=adoquery3.FieldValues['P_ID'];
            indexliao.Close;
            indexliao.Open;
            indexliao.Append;
            indexliao.FieldValues['predex']:=indexliaohao;
            indexliao.FieldValues['gg']:=trim('PB'+newbomoptinfm.edit2.Text);
            indexliao.FieldValues['users']:=trim(userrealname);
            indexliao.Post;
  except
      showmessage(' 自动申请料号失败！无法创建临时BOM！！！');
      exit;
  end;
  fomatliaohao(inttostr(indexliaohao),liaohao);
  createbom(trim(liaohao));
  //filename:='.\userbomlist.dat';
  //AssignFile(F, FileName);
 // if not fileexists('.\userbomlist.dat') then
 // Rewrite(F)
 // else
 // Append(f);
 // writeln(F,'PB'+newbomoptinfm.edit2.text);
 // closefile(f);
end
else if newbomoptinfm.R1.Checked=true    then
   begin
       CREATEBOMFM2.SHOWMODAL;
   end
else
begin
    exit;
end;


end;
procedure Tmakebomfm.N4Click(Sender: TObject);
begin
close;
end;

procedure Tmakebomfm.SpeedButton3Click(Sender: TObject);
var
liaohao,estr:string;
GUIGE,sqlstr,bomliao:STRING;
begin
openbomfm.showmodal;

if openbomfm.cancel=true then
   exit;
GUIGE:=TRIM(OPENBOMFM.Memo1.Text);
liaohao:=trim(openbomfm.Edit1.Text);
relbom:=trim(liaohao);
fomatliaohao(liaohao,bomliao);
//relbom:=trim(bomliao);
dbgrid4.ReadOnly:=true;
sqlstr:='SELECT '+bomliao+'.料号 AS 料号, '+ 'lingjianliaohao.品名 AS 品名, lingjianliaohao.规格说明 AS 规格说明,  '+ bomliao+'.阶层 AS 阶层, ' +bomliao+'.单位用量 AS 单位用量, '+bomliao+'.零件位置 AS 零件位置, '   +
      'lingjianliaohao.承认 AS 承认 ' +
      'FROM '+bomliao+' cross JOIN lingjianliaohao '+
      'where '+bomliao+'.料号 = lingjianliaohao.料号  order by 料号';
adoquery4.Close;
adoquery4.SQL.Clear;
adoquery4.SQL.Add(sqlstr);
adoquery4.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid4);
if (ischecked(liaohao)=true)or(isowner(liaohao)=false) then
    speedbutton10.Enabled:=false
else
    speedbutton10.Enabled:=true;
end;

procedure Tmakebomfm.N6Click(Sender: TObject);
begin
  appliaohaofm.show;
end;

procedure Tmakebomfm.TabSheet1Show(Sender: TObject);
var
liaohao:string;
begin
tabpage1show:=true;
liaohao:=trim(combobox1.Text);
if (ischecked(liaohao)=true) then       //(isowner(liaohao)=false)or
    setreadonly(true)
else
begin
setreadonly(false);
end;
speedbutton13.Enabled:=false;
speedbutton14.Enabled:=false;

//speedbutton4.Enabled:=true;
//speedbutton5.Enabled:=true;
//speedbutton6.Enabled:=true;
//speedbutton7.Enabled:=true;
//speedbutton8.Enabled:=true;
//speedbutton12.Enabled:=true;
end;

procedure Tmakebomfm.TabSheet2Show(Sender: TObject);
begin
tabpage1show:=false;
setreadonly(true);
end;

procedure Tmakebomfm.TVClick(Sender: TObject);
var
liaohao,bomliao,sqlstr:string;
begin
    try
    liaohao:=trim(tv.Selected.Text);
    except
    adoquery1.Close;
    exit;
    end;
    if liaohao='' then
       begin
       adoquery1.Close;
       exit;
       end;
    fomatliaohao(liaohao,bomliao);
    if existbom(bomliao)=true then
    begin
    sqlstr:='SELECT '+ 'lingjianliaohao.品名 AS 品名, lingjianliaohao.规格说明 AS 规格说明,  '+bomliao+'.料号 AS 料号, '+ bomliao+'.阶层 AS 阶层, ' +bomliao+'.单位用量 AS 单位用量, '+bomliao+'.零件位置 AS 零件位置, '   +
      'lingjianliaohao.承认 AS 承认 ' +
      'FROM '+bomliao+' cross JOIN lingjianliaohao '+
      'where '+bomliao+'.料号 = lingjianliaohao.料号  order by 料号';
    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add(sqlstr);
    adoquery1.Open;
    MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
    end
    else if adoquery1.Active=true then
     if  adoquery1.Locate('料号',liaohao,[])=false then
     adoquery1.Close;
     speedbutton13.Enabled:=false;
     speedbutton14.Enabled:=false;
end;

procedure Tmakebomfm.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  gg:string;
begin
try
 gg:=trim(stringgrid1.Cells[Acol,Arow]);
 stringgrid1.Hint:=gg;
 al:=acol;
 ar:=arow;
 Reference:=stringgrid1.Cells[2,ar];
 Quantity:=stringgrid1.Cells[3,ar];
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select 料号, 品名, 规格说明, 供应商, 承认, 使用机种 from lingjianliaohao where 规格说明 like '+''''+'%'+gg+'%'+'''');
 adoquery1.Open;
 if adoquery1.RecordCount<30 then
 MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
except
end;
end;

procedure Tmakebomfm.DBGrid2DblClick(Sender: TObject);
var
liaohao,estr,bomliao:string;
GUIGE:STRING;
rdo:boolean;
begin

if aqljlh.Active=false then
   exit;
try
liaohao:=trim(aqljlh.FieldValues['料号']);
guige:=trim(aqljlh.FieldValues['规格说明']);
except

exit;
end;
if liaohao='' then
exit;

fomatliaohao(liaohao,bomliao);
if existbom(bomliao)=true then
begin
aqljlh.Close;
CAPTION:='制作BOM '+ '料号 '+LIAOHAO+'规格说明 '+GUIGE;
if (isowner(liaohao)=false)or(ischecked(liaohao)=true) then
begin
    setreadonly(true);
    rdo:=true;
end
else
begin
setreadonly(false);
rdo:=false;
end;     //if (isowner(liaohao)=false)or(ischecked(liaohao)=true) then


 estr:='SELECT '+bomliao+'.料号 AS 料号, '+ bomliao+'.阶层 AS 阶层, ' +bomliao+'.单位用量 AS 单位用量, '+bomliao+'.零件位置 AS 零件位置, '   +
      'lingjianliaohao.品名 AS 品名, lingjianliaohao.规格说明 AS 规格说明,  '+
      'lingjianliaohao.承认 AS 承认 ' +
      'FROM '+bomliao+' cross JOIN lingjianliaohao '+
      'where '+bomliao+'.料号 = lingjianliaohao.料号  order by 料号';
aqljlh.Close;
aqljlh.SQL.Clear;
aqljlh.SQL.Add(estr);
aqljlh.Open ;
MakeDBGridColumnsAutoFixItsWidth(DBGrid2);
end
else
begin
  if (isowner(liaohao)=false)or(ischecked(liaohao)=true) then
      exit;
  if rdo=true then
     exit;
    BJBMFM.Edit1.Text:=liaohao;
    BJBMFM.Edit2.Text:=guige;
    BJBMFM.Edit3.Text:=aqljlh.FieldValues['单位用量'];
    bjbmfm.Memo1.Text:=aqljlh.FieldValues['零件位置'];
    bjbmfm.edit4.Text:='';
    BJBMFM.showmodal;
    if bjbmfm.cancel=true then
       exit;
    aqljlh.Edit;
    aqljlh.FieldValues['单位用量']:=trim(bjbmfm.Edit3.Text);
    aqljlh.FieldValues['零件位置']:=trim(bjbmfm.Memo1.Text);
    aqljlh.Post;
end;   //if
end;

procedure Tmakebomfm.StringGrid1KeyPress(Sender: TObject; var Key: Char);
var
part:string;
begin
if key=#13 then
   begin
       part:=trim(stringgrid1.Cells[al,ar]);
       if part='' then
          exit;
       adoquery1.Close;
       adoquery1.SQL.Clear;
       adoquery1.SQL.Add('select 品名, 规格说明,料号,  供应商, 承认, 使用机种  from lingjianliaohao where 规格说明 like '+''''+'%'+part+'%'+'''');
       adoquery1.Open;
   end;
end;

procedure Tmakebomfm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
      adoquery1.Close;
      adoquery1.SQL.Clear;
      adoquery1.SQL.Add('select 品名, 规格说明,料号,  供应商, 承认, 使用机种   from lingjianliaohao where 规格说明 like '+''''+'%'+trim(edit2.Text)+'%'+''''+' and 料号 like '+''''+'%'+trim(edit1.Text)+'%'+'''');
      adoquery1.Open;
      MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;
end;

procedure Tmakebomfm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       combobox1.onchange(self);
   end;
end;

procedure Tmakebomfm.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       combobox2.onchange(self);
   end;
end;

procedure Tmakebomfm.N10Click(Sender: TObject);
begin
lufm.show;
end;

procedure Tmakebomfm.TabSheet3Show(Sender: TObject);
begin
tabpage3show:=true;
speedbutton9.Enabled:=false;
speedbutton10.Enabled:=false;
speedbutton15.Enabled:=false;
end;

procedure Tmakebomfm.TabSheet4Show(Sender: TObject);
begin
tabpage3show:=false;
speedbutton9.Enabled:=true;
speedbutton15.Enabled:=true;
end;

procedure Tmakebomfm.N11Click(Sender: TObject);
begin
adoquery3.Delete;
end;

procedure Tmakebomfm.N12Click(Sender: TObject);
begin
    tq.Close;
    tq.SQL.Clear;
    tq.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(combobox1.Text)+'''');
    tq.Open;
    if tq.RecordCount<>1 then
    begin
       showmessage('没有发现要操作的有效BOM！！！');
       exit;
    end;
 if isowner(trim(combobox1.Text))=true then
  {  begin
    TQ.Edit;
    if  tq.FieldValues['锁']=false then
    begin
      tq.FieldValues['锁']:=true;
      showmessage('BOM已经锁定               ');
      speedbutton7.Caption:='解锁';
    end
    else  }
    begin
       TQ.Edit;
       tq.FieldValues['锁']:=false;
       showmessage('BOM已经解除锁定               ');
       speedbutton7.Caption:='锁定';
    end;
    tq.Post;
end;


procedure Tmakebomfm.BOMEXCEL1Click(Sender: TObject);
var
liaohao,tname:string;
v:variant;
begin
////////////////////////////////////////////////////////////////////////get liaohao
liaohao:=TRIM(combobox1.Text);
if liaohao='' then
  begin
     showmessage('没有选种要导出的BOM！！！');
     exit;
  END;
if (LIAOHAO[1]='P')and(LIAOHAO[2]='B') then
begin
  indexliao.Close;
  indexliao.SQL.Clear;
  indexliao.SQL.Add('select * from indexliao where gg='+''''+liaohao+'''');
  indexliao.Open;
  if indexliao.RecordCount<>1 then
     begin
         showmessage('BOM已不存在！！,BOM影射错误！！！刷新后再试！');
         exit;
     end;
  if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
     begin
       liaohao:=trim(indexliao.FieldValues['newliao']);
     end
  else
  begin
     liaohao:=trim(indexliao.FieldValues['predex']);
  end;
end;
/////////////////////////////////////////////////////////////////////////////////get liaohao




fomatliaohao(liaohao,tname);
           //judge that is it a bom
 if existbom(tname)<>true then
 begin
    application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);
    exit;
 end;

if trim(liaohao)<>'' then
   begin
         try
          createExcel(v,liaohao);
          bomeditfm.printbomtoexcel(v,trim(liaohao));
         except
           application.MessageBox('导出失败！！','导出数据错误',mb_ok+MB_ICONSTOP);
           exit;
         end;
   end
else
      application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);

end;

procedure Tmakebomfm.BOM1Click(Sender: TObject);
var
liaohao,tname:string;
v:Tadotable;
i:integer;
wenhao:string;
j:integer;
bomliststn,gg:string;
begin
gg:='';
/////////////////////////////////////////////////////////////////////////////////get liaohao
liaohao:=TRIM(combobox1.Text);
if liaohao='' then
  begin
     showmessage('没有选种要导出的BOM！！！');
     exit;
  END;
if (LIAOHAO[1]='P')and(LIAOHAO[2]='B') then
begin
  gg:=liaohao;
  indexliao.Close;
  indexliao.SQL.Clear;
  indexliao.SQL.Add('select * from indexliao where gg='+''''+liaohao+'''');
  indexliao.Open;
  if indexliao.RecordCount<>1 then
     begin
         showmessage('BOM已不存在！！,BOM影射错误！！！刷新后再试！');
         exit;
     end;
  if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
     begin
       liaohao:=trim(indexliao.FieldValues['newliao']);
     end
  else
  begin
     liaohao:=trim(indexliao.FieldValues['predex']);
  end;
end;
//////////////////////////////////////////////getliaohao
 //costomer,model,liaohao,versions,dates,guige

 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(liaohao)+'''');
 adoquery1.Open;
 if adoquery1.RecordCount>=1 then
 begin
 if adoquery1.FieldValues['客户']<>Null then
 bomdetail.costomer:=adoquery1.FieldValues['客户'];
 if adoquery1.FieldValues['使用机种']<>Null then
 bomdetail.model:=adoquery1.FieldValues['使用机种'];
 if adoquery1.FieldValues['最新版本']<>Null then
 bomdetail.versions:=adoquery1.FieldValues['最新版本'];
 if adoquery1.FieldValues['规格说明']<>Null then
 bomdetail.guige:=adoquery1.FieldValues['规格说明'];
 bomdetail.dates:=datetostr(date());
 adoquery1.Close;
 end;

printsetupfm.showmodal;
if printsetupfm.cancel=true then
   exit;
if printsetupfm.Allbom.Checked=true then
   lastliao:='fullextend' ;
if printsetupfm.partbom.Checked=true then
   lastliao:='';
if printsetupfm.rdonelayer.Checked=true then
   printonelayer:=true
else printonelayer:=false;

cus:=false;
bomdetail.cus:=false;
statusbar1.Panels.Items[3].Text:='请稍等...正在生成预览.................' ;
statusbar1.Update;
bomliststn:='B'+hardno;
if existbom(bomliststn)=true then
  begin
      with ADOCommand1 do
            begin
              CommandText:='';
              CommandText:='drop table '+bomliststn;
              try
              execute;
              except
              application.MessageBox('无法创建临时文件！         ','提示？',MB_OK+MB_iconinformation) ;
              exit;
              end;
          end;
  end;

 //print extend bom
if (printsetupfm.C1.Checked=true)or(printsetupfm.C2.Checked=true)or(printsetupfm.C3.Checked=true) then
begin
    bomeditfm.createbomforprint(bomliststn) ;
    v:=Tadotable.Create(application);
    v.Connection:=dm.ADOConnection1;
    v.Close;
    v.TableName:=trim(bomliststn);
   cus:=true;
   bomdetail.cus:=true;

 //costomer,model,liaohao,versions,dates,guige
  bomdetail.liaohao:=liaohao;
  if gg<>'' then
  if (gg[1]='P')and(gg[2]='B') then
     bomdetail.guige:=gg;
  
{try
    liaohao:=adoquery1.FieldValues['料号'];
if  adoquery1.FieldValues['客户']=null then
    bomdetail.costomer:=''
else
bomdetail.costomer:=trim(adoquery1.FieldValues['客户']);
if  adoquery1.FieldValues['使用机种']=null then
    bomdetail.model:=''
else
bomdetail.model:=trim(adoquery1.FieldValues['使用机种']);
if  adoquery1.FieldValues['料号']=null then
    bomdetail.liaohao:=''
else
bomdetail.liaohao:=trim(adoquery1.FieldValues['料号']);
if  adoquery1.FieldValues['最新版本']=null then
    bomdetail.versions:=''
else
bomdetail.versions:=trim(adoquery1.FieldValues['最新版本']);
bomdetail.dates:=datetostr(date());
if  adoquery1.FieldValues['规格说明']=null then
    bomdetail.guige:=''
else
bomdetail.guige:=trim(adoquery1.FieldValues['规格说明']);

fomatliaohao(liaohao,tname);
except
  application.MessageBox('常规错误，无法获取BOM料号！！，请选择BOM料号后重试','导出数据错误',mb_ok+MB_ICONSTOP);
  statusbar1.Panels.Items[3].Text:='完成！！！！' ;
  statusbar1.Update;
  exit;
end;        }      //judge that is it a bom
fomatliaohao(liaohao,tname);
 if existbom(tname)<>true then
 begin
    application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);
    statusbar1.Panels.Items[3].Text:='完成！！！！' ;
    statusbar1.Update;
    exit;
 end;
    if trim(liaohao)<>'' then
       begin

         try
          bomeditfm.printbomtotable(v,trim(liaohao));      //get data and insetinto bomlist
          bomdetail.ADOTable1.Close;
          bomdetail.ADOTable1.TableName:=v.TableName;
          bomdetail.ADOTable1.Open ;

          bomdetail.ShowModal;
                                                 //print to printer;
          except
           application.MessageBox('无法收集展开BOM所需要的数据，可能当前BOM数据信息不完整！！','导出数据错误',mb_ok+MB_ICONSTOP);
           statusbar1.Panels.Items[3].Text:='完成！！！！' ;
           statusbar1.Update;
           exit;
          end;
       end
   else
      application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);

 v.Close;
 v.Free;


    statusbar1.Panels.Items[3].Text:='完成！！！！' ;
    statusbar1.Update;
    exit;
end;     //print extend bom



 // print normal bom
 bomeditfm.createprintbom(bomliststn) ;
 v:=Tadotable.Create(application);
 v.Connection:=dm.ADOConnection1;
 v.Close;
 v.TableName:=trim(bomliststn);

 bomdetail.liaohao:=liaohao;
 if gg<>'' then
 if (gg[1]='P')and(gg[2]='B') then
 bomdetail.guige:=gg;
{
try
 liaohao:=adoquery1.FieldValues['料号'];
if  adoquery1.FieldValues['客户']=null then
    bomdetail.costomer:=''
else
bomdetail.costomer:=trim(adoquery1.FieldValues['客户']);
if  adoquery1.FieldValues['使用机种']=null then
    bomdetail.model:=''
else
bomdetail.model:=trim(adoquery1.FieldValues['使用机种']);
if  adoquery1.FieldValues['料号']=null then
    bomdetail.liaohao:=''
else
bomdetail.liaohao:=trim(adoquery1.FieldValues['料号']);
if  adoquery1.FieldValues['最新版本']=null then
    bomdetail.versions:=''
else
bomdetail.versions:=trim(adoquery1.FieldValues['最新版本']);
bomdetail.dates:=datetostr(date());
if  adoquery1.FieldValues['规格说明']=null then
    bomdetail.guige:=''
else
bomdetail.guige:=trim(adoquery1.FieldValues['规格说明']);

fomatliaohao(liaohao,tname);
except
  application.MessageBox('常规错误，无法获取BOM料号！！，请选择BOM料号后重试','导出数据错误',mb_ok+MB_ICONSTOP);
  statusbar1.Panels.Items[3].Text:='完成！！！！' ;
  statusbar1.Update;
  exit;
end; }            //judge that is it a bom
fomatliaohao(liaohao,tname);
 if existbom(tname)<>true then
 begin
    application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);
    statusbar1.Panels.Items[3].Text:='完成！！！！' ;
    statusbar1.Update;
    exit;
 end;
    if trim(liaohao)<>'' then
       begin
         //exportdata()
         try
          bomeditfm.printbomtotable(v,trim(liaohao));      //get data and insetinto bomlist
          bomdetail.ADOTable1.Close;
          bomdetail.ADOTable1.TableName:=v.TableName;
          bomdetail.ADOTable1.Open ;

          bomdetail.ShowModal;
                                                 //print to printer;
          except
           application.MessageBox('无法收集展开BOM所需要的数据，可能当前BOM数据信息不完整！！','导出数据错误',mb_ok+MB_ICONSTOP);
           statusbar1.Panels.Items[3].Text:='完成！！！！' ;
           statusbar1.Update;
           exit;
          end;
       end
   else
      application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);

 v.Close;
 v.Free;
statusbar1.Panels.Items[3].Text:='完成！！！！' ;
statusbar1.Update; 
end;
            


procedure Tmakebomfm.BOMEXCEL2Click(Sender: TObject);
var
liaohao,tname,s:string;
v:variant;
i,j:integer;
begin
////////////////////////////////////////////////////////////////////////get liaohao
liaohao:=TRIM(combobox1.Text);
if liaohao='' then
  begin
     showmessage('没有选种要导出的BOM！！！');
     exit;
  END;
if (LIAOHAO[1]='P')and(LIAOHAO[2]='B') then
begin
  indexliao.Close;
  indexliao.SQL.Clear;
  indexliao.SQL.Add('select * from indexliao where gg='+''''+liaohao+'''');
  indexliao.Open;
  if indexliao.RecordCount<>1 then
     begin
         showmessage('BOM已不存在！！,BOM影射错误！！！刷新后再试！');
         exit;
     end;
  if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
     begin
       liaohao:=trim(indexliao.FieldValues['newliao']);
     end
  else
  begin
     liaohao:=trim(indexliao.FieldValues['predex']);
  end;
end;
/////////////////////////////////////////////////////////////////////////////////get liaohao

createExcel(v,liaohao);
for i:=0 to aqljlh.Fields.Count-1 do
begin
   v.workbooks[1].sheets[1].cells[1,i+1]:=aqljlh.Fields.Fields[i].FieldName;
end;

if aqljlh.Active=true then
begin
aqljlh.First;
for i:=2 to aqljlh.RecordCount+1 do
    begin
        for j:=0 to aqljlh.Fields.Count-1 do
            begin
                 if aqljlh.Fields.Fields[j].Value<>Null then
                 s:=trim(aqljlh.Fields.Fields[j].Value)
                 else s:='';
                 v.workbooks[1].sheets[1].cells[i,j+1]:=s;
            end;
        aqljlh.Next;
    end;
v.workbooks[1].sheets[1].cells[i+2,1]:='Export Successfully';
end;
end;

procedure Tmakebomfm.DBGrid2TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid2.Columns.Count do
  begin
    DBGrid2.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid2.Columns[i-1].Title.Font.Style := [];
  end;

if aqljlh.Sort<>Column.FieldName+' DESC' then
begin
   aqljlh.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      aqljlh.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //改变标题行字体为红色，表示当前的排序方式为降序
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tmakebomfm.TabSheet5Show(Sender: TObject);
var
   liaohao:string;
   bomliao:string;
begin
tabpage1show:=false;
////////////////////////////////////////////get liaohao
liaohao:=getliaohao(TRIM(combobox1.Text));
if liaohao='' then
  begin
    // showmessage('没有发现可操作的BOM！！！   ');
     bomliaolist.Close;
     exit;
  END;
{if (LIAOHAO[1]='P')and(LIAOHAO[2]='B') then
begin
  indexliao.Close;
  indexliao.SQL.Clear;
  indexliao.SQL.Add('select * from indexliao where gg='+''''+liaohao+'''');
  indexliao.Open;
  if indexliao.RecordCount<>1 then
     begin
         showmessage('BOM已不存在！！,BOM影射错误！！！刷新后再试！');
         exit;
     end;
  if trim(indexliao.FieldValues['newliao'])<>'XXXXXXXXX-XX' then
     begin
       liaohao:=trim(indexliao.FieldValues['newliao']);
     end
  else
  begin
     liaohao:=trim(indexliao.FieldValues['predex']);
  end;
end;    }
//////////////////////////////////////////////////////////////getliaohao
fomatliaohao(liaohao,bomliao);
bomliaolist.Close;
bomliaolist.SQL.Clear;
bomliaolist.SQL.Add('select 料号, 阶层,零件位置,单位用量 from '+bomliao);
bomliaolist.Open;
if ischecked(liaohao)=true then
begin          //(isowner(liaohao)=false)or
    setreadonly(true);
    speedbutton13.Enabled:=false;
    speedbutton14.Enabled:=false;
end
else
    setreadonly(false);
speedbutton4.Enabled:=false;
speedbutton5.Enabled:=false;
speedbutton6.Enabled:=false;
speedbutton7.Enabled:=false;
speedbutton12.Enabled:=false;
speedbutton8.Enabled:=false;
if bomliaolist.Active=true then
begin
   // speedbutton13.Enabled:=true;
   // speedbutton14.Enabled:=true;
    MakeDBGridColumnsAutoFixItsWidth(DBGrid5);
end


end;

procedure Tmakebomfm.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid5 do
begin 
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then 
begin 
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy; 
end 
else 
begin 
if DataSource5.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行} 
Canvas.brush.Color :=Clcream {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示} 
end; 
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
end;
end;

procedure Tmakebomfm.DBGrid5TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid5.Columns.Count do
  begin
    DBGrid5.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid5.Columns[i-1].Title.Font.Style := [];
  end;

if bomliaolist.Sort<>Column.FieldName+' DESC' then
begin
   bomliaolist.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      bomliaolist.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //改变标题行字体为红色，表示当前的排序方式为降序
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tmakebomfm.SpeedButton13Click(Sender: TObject);
begin
bomliaolist.Edit;
bomliaolist.Post;
end;

procedure Tmakebomfm.SpeedButton14Click(Sender: TObject);
var
   liaohao:string;
begin
liaohao:=bomliaolist.FieldValues['料号'];
if application.MessageBox('你正在删除当前BOM中的料号！要继续吗？','删除提示！',mb_okcancel+Mb_iconinformation)=id_ok then
   begin
     try
     if ischecked(liaohao)<>true then
           bomliaolist.Delete
     else
        showmessage('为授权的操作！！！');
     except
       showmessage('删除失败！！     ');
     end;

   end;
end;

procedure Tmakebomfm.SpeedButton10Click(Sender: TObject);
var
liaohao:string;
begin
liaohao:=trim(adoquery4.FieldValues['料号']);
if (makebomfm.isowner(liaohao)=true)and(makebomfm.ischecked(liaohao)=false) then
begin
if (adoquery4.Active=true)and(aqljlh.Active=true) then
   begin
        try
        aqljlh.Append;
        aqljlh.FieldValues['料号']:=adoquery4.FieldValues['料号'];
        aqljlh.FieldValues['零件位置']:=adoquery4.FieldValues['零件位置'];
        aqljlh.FieldValues['用量']:=adoquery4.FieldValues['用量'];
        aqljlh.Post;
        adoquery4.Delete;
        except
           showmessage('剪切失败！！！');
        end;
   end;
end
else
begin
    showmessage('未授权操作！！！');
    speedbutton10.Enabled:=false;
end;
end;

procedure Tmakebomfm.SpeedButton15Click(Sender: TObject);
var
  liaohao,bomliao,sqlstr,oldtable,filename:string;
  f:textfile;
begin

oldtable:=relbom;
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where 料号='+''''+relbom+'''');
adoquery1.Open;


saveasfm.ComboBox1.Text:=relbom;
//saveasfm.ComboBox1.OnKeyPress(self,'13');
saveasfm.Edit1.Text:=relbom;
saveasfm.Caption:='ＢＯＭ另存为';
saveasfm.showmodal;
saveasfm.Edit1.Update;
if saveasfm.cancel=true then
   exit;

liaohao:=trim(saveasfm.Edit1.Text);

if oldtable='' then
   begin
       showmessage('无效的BOM 料号，料号为空！请选择一个有效的BOM！！！');
       exit;
   end;
if oldtable='' then
   begin
       showmessage('要另存的BOM 料号无效！！！');
       exit;
   end;
fomatliaohao(oldtable,oldtable);
if existbom(oldtable)=false then
   begin
       showmessage('要另存的BOM 不存在！！！！');
       exit;
   end;

 adoquery3.Close;
 adoquery3.SQL.Clear;
 adoquery3.SQL.Add('select * from prelingjianliaohao where 料号='+''''+liaohao+'''');
 adoquery3.Open;
 if adoquery3.RecordCount>=1 then
    begin
        showmessage('此料号已被申请！！！！');
        exit;
    end;
 fomatliaohao(liaohao,bomliao);
 if existbom(bomliao)=true then
   begin
       showmessage('目标BOM已存在，料号不可用 无发另存为！！');
       EXIT;
   end;
 try
 adoquery3.Append;
 adoquery3.FieldValues['料号']:=liaohao;
 adoquery3.FieldValues['规格说明']:=adoquery1.FieldValues['规格说明'];
 adoquery3.FieldValues['品名']:=adoquery1.FieldValues['品名'];
 adoquery3.FieldValues['版本']:=adoquery1.FieldValues['最新版本'];
 adoquery3.FieldValues['使用机种']:=adoquery1.FieldValues['使用机种'];
 adoquery3.FieldValues['承认']:=adoquery1.FieldValues['承认'];
 adoquery3.FieldValues['申请人']:=userrealname;
 adoquery3.Post;

 indexliao.Close;
 indexliao.Open;
 indexliao.Append;
 indexliao.FieldValues['predex']:=liaohao;
 indexliao.FieldValues['gg']:=trim('PB'+liaohao);
 indexliao.Post;

  filename:='.\userbomlist.dat';
  AssignFile(F, FileName);
  if not fileexists('.\userbomlist.dat') then
  Rewrite(F)
  else
  Append(f);
  writeln(F,'PB'+newbomoptinfm.edit2.text);
  closefile(f);
 except
 showmessage('申请新料号失败！！     ');
 exit;
 end;


sqlstr:='insert into '+bomliao +' select 料号, 阶层, 单位用量, 工单用量, 零件位置,单价,合计  from '+oldtable;

try
createtable(bomliao);
adocommand1.CommandText:='';
adocommand1.CommandText:=sqlstr;
adocommand1.Execute;
except
application.MessageBox('出现异常！，复制数据表失败 请寻求技术支持解决此问题！！！  ','复制失败!',mb_ok+MB_ICONerror);
abort;
end;
application.MessageBox('另存为BOM成功！！！               ','HBS提示!',mb_ok+MB_ICONinformation);

end;

procedure Tmakebomfm.BOM2Click(Sender: TObject);
begin
BOMINFOFM.SHOWMODAL;
end;

end.
