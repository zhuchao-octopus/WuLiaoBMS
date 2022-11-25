unit checkliaohaout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls,
  Buttons, ToolWin, Menus, Mask, DBCtrls;

type
  Tcheckliaohaofm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton11: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton6: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    FontDialog1: TFontDialog;
    SpeedButton9: TSpeedButton;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SpeedButton8: TSpeedButton;
    ToolButton4: TToolButton;
    N5: TMenuItem;
    N6: TMenuItem;
    ADOTable1: TADOTable;
    N7: TMenuItem;
    Panel2: TPanel;
    SpeedButton10: TSpeedButton;
    N8: TMenuItem;
    SpeedButton12: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Splitter1: TSplitter;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery2DSDesigner: TStringField;
    ADOQuery2DSDesigner2: TStringField;
    ADOQuery2DSDesigner3: TStringField;
    ADOQuery3DSDesigner: TStringField;
    ADOQuery3DSDesigner2: TStringField;
    ADOQuery3DSDesigner3: TStringField;
    ADOQuery4: TADOQuery;
    aqindexliao: TADOQuery;
    N9: TMenuItem;
    N10: TMenuItem;
    SpeedButton13: TSpeedButton;
    N11: TMenuItem;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure lookupdata(keystr,fieldname:string);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure browsedata();
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    function isexistslingjianliaohao(liaohao:string):boolean;
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checkliaohaofm: Tcheckliaohaofm;

implementation

uses editbomut, luut,glbut,dmut, shenqingprintut,glut;

{$R *.dfm}

procedure Tcheckliaohaofm.browsedata();
VAR
   sqlstr:string;
begin

   sqlstr:='select 品名, 料号, 规格说明,版本, 供应商,制造商,使用机种,选项, 厂家料号, 规格书, 承认,申请人,状态,返回信息 ,P_ID from  prelingjianliaohao';

     with adoquery1 do
         begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
end;


procedure tcheckliaohaofm.lookupdata(keystr,fieldname:string);
VAR
   sqlstr:string;
begin

   sqlstr:='select 品名, 料号, 规格说明, 供应商, 厂家料号,申请人,选项,制造商, 规格书,使用机种, 承认,状态 from  prelingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+'''';

     with adoquery1 do
         begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
end;

procedure Tcheckliaohaofm.SpeedButton2Click(Sender: TObject);
begin
if fontdialog1.Execute then
   editbomfm.Font:=fontdialog1.Font;
end;

procedure Tcheckliaohaofm.SpeedButton9Click(Sender: TObject);
begin
lufm.show;
end;

procedure Tcheckliaohaofm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit2.Text,'品名');
   end;
end;

procedure Tcheckliaohaofm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit1.Text,'料号');
   end;
end;

procedure Tcheckliaohaofm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit3.Text,'规格说明');
   end;
end;

procedure Tcheckliaohaofm.SpeedButton11Click(Sender: TObject);
begin
if   edit1.Text<>'' then
    lookupdata(edit1.Text,'料号')
else if edit2.Text<>'' then
    lookupdata(edit2.Text,'品名')
else if edit3.Text<>'' then
    lookupdata(edit3.Text,'规格说明');
end;

procedure Tcheckliaohaofm.SpeedButton3Click(Sender: TObject);
begin
browsedata();
end;

procedure Tcheckliaohaofm.SpeedButton5Click(Sender: TObject);
begin
if   application.MessageBox('你真的要删除当前记录吗？？','HME提示？          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
         adoquery1.Delete;
      except

           showmessage('删除失败！！！    ') ;
      end;

      end;

end;

procedure Tcheckliaohaofm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tcheckliaohaofm.SpeedButton8Click(Sender: TObject);
begin
try
    if (adoquery1.Active=true)and(trim(adoquery1.FieldValues['料号'])<>'') then
    try
       adoquery1.Edit;
       adoquery1.FieldValues['状态']:='OK';
       adoquery1.Post;
    except
    application.MessageBox('  没有可以操作的有效料号！请选择一个有效料号!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

    end
       else
         application.MessageBox('  没有可以操作的料号！请选择一个料号!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
  except
      showmessage('无效操作！     ');
  end;
end;

procedure Tcheckliaohaofm.N5Click(Sender: TObject);
begin
      if adoquery1.Active=true then
    try
       adoquery1.Edit;
       adoquery1.FieldValues['状态']:='No';
       adoquery1.Post;
    except
    application.MessageBox('  没有可以操作的有效料号！请选择一个有效料号!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

    end
       else
         application.MessageBox('  没有可以操作的料号！请选择一个料号!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

end;

procedure Tcheckliaohaofm.N1Click(Sender: TObject);
begin
try
 if (adoquery1.Active=true)and(trim(adoquery1.FieldValues['料号'])<>'') then
    try
       adoquery1.Edit;
       adoquery1.FieldValues['状态']:='OK';
       adoquery1.Post;
    except
        application.MessageBox('  没有可以操作的有效料号！请选择一个有效料号!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

    end
       else
         application.MessageBox('  没有可以操作的料号！请选择一个料号!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
 except
     showmessage('无效操作！   ');
 end;
end;

procedure Tcheckliaohaofm.N3Click(Sender: TObject);
var
i:integer;
begin
  adoquery1.Edit;
  adoquery1.First;
    for i:=0 to adoquery1.RecordCount-1 do
      begin
         if adoquery1.Active=true then
    try
           adoquery1.Edit;
           adoquery1.FieldValues['状态']:='OK';
           adoquery1.Post;
           adoquery1.Next;
    except
    application.MessageBox('  没有可以操作的有效料号！请选择一个有效料号，核准不完全!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

    end
       else
       begin
         application.MessageBox('  没有可以操作的料号！请选择一个料号!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
         abort;
         end;

      end;
     application.MessageBox('  物料已全部核准完毕！！!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

end;

procedure Tcheckliaohaofm.N4Click(Sender: TObject);
var
i:integer;
begin
  adoquery1.Edit;
  adoquery1.First;
    for i:=0 to adoquery1.RecordCount-1 do
      begin
         if adoquery1.Active=true then
    try
           adoquery1.Edit;
           adoquery1.FieldValues['状态']:='No';
           adoquery1.Post;
           adoquery1.Next;
    except
    application.MessageBox('  没有可以操作的有效料号！请选择一个有效料号，取消核准不完全!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

    end
       else
       begin
         application.MessageBox('  没有可以操作的料号！请选择一个料号!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
         abort;
         end;

      end;
     application.MessageBox('  物料已全部取消核准！！!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

end;
function Tcheckliaohaofm.isexistslingjianliaohao(liaohao:string):boolean;
begin
  adoquery4.Close;
  adoquery4.SQL.Clear;
  adoquery4.SQL.Add('select * from lingjianliaohao where  料号='+''''+liaohao+'''');
  adoquery4.Open;
  if adoquery4.RecordCount>=1 then
     begin
         result:=true;
     end
  else  result:=false;

end;
procedure Tcheckliaohaofm.SpeedButton7Click(Sender: TObject);
var
  i:integer;
begin
       if adoquery1.Active=true then
          begin
          adotable1.Active:=true;
          adotable1.Edit;
          adoquery1.first;
              for i:=0 to adoquery1.RecordCount-1 do
                  begin
                   if trim(adoquery1.FieldValues['状态'])='OK' then
                      begin
                      try
                        if isexistslingjianliaohao(adoquery1.FieldValues['料号'])=false then
                        begin
                        adotable1.Append;
                        adotable1.FieldValues['品名']:=adoquery1.FieldValues['品名'];

                        adotable1.FieldValues['料号']:=adoquery1.FieldValues['料号'];

                        adotable1.FieldValues['规格说明']:=adoquery1.FieldValues['规格说明'];

                        adotable1.FieldValues['供应商']:=adoquery1.FieldValues['供应商'];
                        adotable1.FieldValues['制造商']:=adoquery1.FieldValues['制造商'];
                        adotable1.FieldValues['使用机种']:=adoquery1.FieldValues['使用机种'];

                        adotable1.FieldValues['厂家料号']:=adoquery1.FieldValues['厂家料号'];

                        adotable1.FieldValues['规格书']:=adoquery1.FieldValues['规格书'];
                        adotable1.FieldValues['申请人']:=adoquery1.FieldValues['申请人'];      //trim(userrealname);
                        adotable1.FieldValues['最新版本']:=adoquery1.FieldValues['版本'];
                       // adotable1.FieldValues['承认']:='已承认';
                       ////////////////////////////////////////////////  set mapping liao
                         aqindexliao.Close;
                         aqindexliao.SQL.Clear;
                         aqindexliao.SQL.Add('select * from indexliao where predex='+''''+inttostr(adoquery1.FieldValues['P_ID'])+'''');
                         aqindexliao.Open;
                         if aqindexliao.RecordCount=1 then
                            begin
                                aqindexliao.Edit;
                                aqindexliao.FieldValues['newliao']:=trim(adoquery1.FieldValues['料号']);
                                aqindexliao.Post;
                            end;
                         if aqindexliao.RecordCount>1 then
                             showmessage('在料号列表中存在自动申请的料号，且在影射过程中失败！请记录出错位置：'+inttostr(adoquery1.FieldValues['P_ID'])+',寻求技术支持！');
                        ///////////////////////////////////////////
                        adotable1.Post;
                        adoquery1.Delete;
                       end
                       else
                        showmessage('发现一条在料库中已存在的料号，提交已跳过此料号：'+adoquery1.FieldValues['料号']);
                        adoquery1.Next;
                      except
                         application.MessageBox('  提交物料被迫终止，部分工作没有完成，请确认！！!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

                      end;
                       

                     end
                   else
                     adoquery1.Next;

                  end;

                  application.MessageBox('  提交操作完成！！                ','FALCON ERP 提示',mb_ok+MB_ICONinformation);




          
          end
          else
            begin
                application.MessageBox('  没有可以操作的有效料号！!                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

            end;
end;

procedure Tcheckliaohaofm.N7Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from prelingjianliaohao where 选项='+''''+'打印'+'''');
adoquery1.Open;

   shenqingprint.ADOTable1.Close;
   shenqingprint.qp.DataSet:=adoquery1;
   shenqingprint.QRDBText2.DataSet:=adoquery1;
   shenqingprint.QRDBText3.DataSet:=adoquery1;
   shenqingprint.QRDBText4.DataSet:=adoquery1;
   shenqingprint.QRDBText5.DataSet:=adoquery1;
   shenqingprint.QRDBText6.DataSet:=adoquery1;
   shenqingprint.username.Caption:=userrealname;
   try
   shenqingprint.qp.Preview;
   except
       application.MessageBox('    未知错误！！ ','HME提示！',mb_ok+MB_ICONerror);

   end;

end;

procedure Tcheckliaohaofm.Button2Click(Sender: TObject);
begin

panel2.Visible:=false;
end;

procedure Tcheckliaohaofm.Button1Click(Sender: TObject);
begin
adoquery1.Post;
//panel2.Visible:=false;
end;

procedure Tcheckliaohaofm.DBGrid1DblClick(Sender: TObject);
begin
{if adoquery1.Active<>true then
exit;
if adoquery1.FieldValues['选项']<>'打印' then
   checkbox1.Checked:=false
else if adoquery1.FieldValues['选项']='打印' then
   checkbox1.Checked:=true;        }

end;

procedure Tcheckliaohaofm.SpeedButton10Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from prelingjianliaohao where 选项='+''''+'打印'+'''');
adoquery1.Open;

   shenqingprint.ADOTable1.Close;
   shenqingprint.qp.DataSet:=adoquery1;
   shenqingprint.QRDBText1.DataSet:=adoquery1;
   shenqingprint.QRDBText2.DataSet:=adoquery1;
   shenqingprint.QRDBText3.DataSet:=adoquery1;
   shenqingprint.QRDBText4.DataSet:=adoquery1;
   shenqingprint.QRDBText5.DataSet:=adoquery1;
   shenqingprint.QRDBText6.DataSet:=adoquery1;
   shenqingprint.QRDBText7.DataSet:=adoquery1;
   shenqingprint.QRDBText8.DataSet:=adoquery1;
   shenqingprint.username.Caption:=userrealname;
   try
   shenqingprint.qp.Preview;
   except
       application.MessageBox('    未知错误！！ ','HME提示！',mb_ok+MB_ICONerror);

   end;

end;

procedure Tcheckliaohaofm.N8Click(Sender: TObject);
var
filename:string;
begin
try
if adoquery1.Active=true then
filename:=adoquery1.FieldValues['规格书'];
except

end;
runapplication(handle,commondir+'\'+filename);
end;

procedure Tcheckliaohaofm.SpeedButton1Click(Sender: TObject);
begin
adoquery1.Post;
end;

procedure Tcheckliaohaofm.CheckBox1Click(Sender: TObject);
begin
if adoquery1.Active=false then
exit;
if adoquery1.FieldValues['料号']='' then
exit;
if checkbox1.Checked=true then
  begin
  adoquery1.Edit;
   adoquery1.FieldValues['选项']:='打印'   ;
   end
   else adoquery1.FieldValues['选项']:='不打印'  ;

adoquery1.Post;
end;

procedure Tcheckliaohaofm.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Tcheckliaohaofm.SpeedButton12Click(Sender: TObject);
begin
adoquery1.Edit;
adoquery1.FieldValues['返回信息']:='料号未通过审核 被拒绝';
adoquery1.FieldValues['状态']:='拒绝';
adoquery1.Post;
end;

procedure Tcheckliaohaofm.DBGrid1CellClick(Column: TColumn);
var
 liaohao,partliao,partgg,gg:string;
 i:integer;
 count:integer;
begin
if adoquery1.Active=true then
   begin
    if trim(adoquery1.FieldValues['料号'])='' then
     exit;
    partliao:='';
    partgg:='';
   liaohao:=trim(adoquery1.FieldValues['料号']);
   gg:=trim(adoquery1.FieldValues['规格说明']);
   count:=length(trim(adoquery1.FieldValues['料号']))div 2;
   count:=count+count div 2;
   if count>6 then
      count:=6
   else count:=5;
       for i:=0 to count do
       begin
          partliao:=partliao+trim(liaohao[i+1]);
       end;
       count:=length(trim(adoquery1.FieldValues['规格说明']))div 2   ;
       //count:=count+count div 2;
        for i:=0 to count do
       begin
          partgg:=partgg+trim(gg[i+1]);
       end;

       adoquery2.Close;
       adoquery2.SQL.Clear;
       adoquery2.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+trim(partliao)+'%'+'''');
        try
       adoquery2.Open;
       except
       end;
       MakeDBGridColumnsAutoFixItsWidth(dbgrid2);
       adoquery3.Close;
       adoquery3.SQL.Clear;
       adoquery3.SQL.Add('select * from lingjianliaohao where 规格说明 like '+''''+'%'+trim(partgg)+'%'+'''');
       try
       adoquery3.Open;
       except
       end;
       MakeDBGridColumnsAutoFixItsWidth(dbgrid3);
   end;
end;

procedure Tcheckliaohaofm.DBGrid3DrawColumnCell(Sender: TObject;
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

procedure Tcheckliaohaofm.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure Tcheckliaohaofm.DBGrid1TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid1.Columns.Count do
  begin
    DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid1.Columns[i-1].Title.Font.Style := [];
  end;

if ADOQuery1.Sort<>Column.FieldName+' DESC' then
begin
   ADOQuery1.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      ADOQuery1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //改变标题行字体为红色，表示当前的排序方式为降序
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tcheckliaohaofm.N9Click(Sender: TObject);
begin
if adoquery1.Active=true then
begin                      //VK_SPACE
       adoquery1.Edit;
       adoquery1.FieldValues['选项']:='打印' ;

       adoquery1.Post;
end;
end;

procedure Tcheckliaohaofm.N10Click(Sender: TObject);
begin
     if adoquery1.Active=true then
begin                      //VK_SPACE
       adoquery1.Edit;
       adoquery1.FieldValues['选项']:='不打印' ;
       adoquery1.Post;
end;
end;

procedure Tcheckliaohaofm.SpeedButton13Click(Sender: TObject);
VAR
   sqlstr:string;
begin

   sqlstr:='select * from  prelingjianliaohao where 申请人='+''''+userrealname+'''';

with adoquery1 do
   begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

   end;

end;

procedure Tcheckliaohaofm.N11Click(Sender: TObject);
begin
try
panel2.Visible:=true;
adoquery1.Edit;
except
end;
end;

end.
