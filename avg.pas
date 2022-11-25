unit avg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, DB, Grids, DBGrids, ADODB, Mxstore,
  MXDB, ExtCtrls, TeeProcs, TeEngine, Chart, MXGRAPH, Series, StdCtrls,
  DBTables, MXTABLES;

type
  Tavgfm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton6: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ToolBar2: TToolBar;
    cb: TComboBox;
    StatusBar1: TStatusBar;
    DQ: TADOQuery;
    DQBOM: TStringField;
    DQDSDesigner: TBCDField;
    DQDSDesigner2: TDateTimeField;
    DQDSDesigner3: TStringField;
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    DecisionGraph1: TDecisionGraph;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    deq: TDecisionQuery;
    Pb: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Splitter1: TSplitter;
    Database1: TDatabase;
    Database2: TDatabase;
    Series1: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  avgfm: Tavgfm;

implementation
       uses dmut,glbut;
{$R *.dfm}

procedure Tavgfm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tavgfm.SpeedButton1Click(Sender: TObject);
var
db:string;
begin
if taozhang='量产用套帐' then
db:='HB'
ELSE if taozhang='试产用套帐' then
db:='HB' ;

try
dq.Close;
dq.Open;
except
   application.MessageBox('连接失败！！！','HME提示          ',MB_OKCANCEL+MB_iconinformation);
end;
try
   deq.Close;
   deq.DatabaseName:=db;
   deq.Active:=true;
except
//    application.MessageBox('创建示图失败！！！','HME提示          ',MB_OKCANCEL+MB_iconinformation);
end;
end;

procedure Tavgfm.SpeedButton5Click(Sender: TObject);
begin
if   application.MessageBox('你真的要删除选种的计算结果吗？','HME提示          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
     //   try
         dq.Edit;
         dq.Delete;
     //   except

     //      showmessage(' 删除失败！！！    ') ;
      //  end;

      end;

end;

procedure Tavgfm.SpeedButton3Click(Sender: TObject);
begin
try
 dq.Edit;
 dq.Post;
 except
 end;
end;

procedure Tavgfm.SpeedButton2Click(Sender: TObject);
var
i:integer;
sum:double;
begin
pb.Position:=0;

      if dq.Active=true then
      begin
      pb.Max:=dq.RecordCount-1;
          for i:=0 to dq.RecordCount-1 do
             begin

                 sum:=sum+dq.FieldValues['计算结果'];
                  pb.StepBy(1);
                  dq.Next;
             end;
             label2.Caption:=floattostr(sum/dq.RecordCount);
      end;
end;


procedure Tavgfm.BitBtn1Click(Sender: TObject);
var
i:integer;
sum:double;
begin
pb.Position:=0;

      if dq.Active=true then
      begin
      pb.Max:=dq.RecordCount-1;
          for i:=0 to dq.RecordCount-1 do
             begin

                 sum:=sum+dq.FieldValues['计算结果'];
                  pb.StepBy(1);
                  dq.Next;
             end;
             label2.Caption:=floattostr(sum/dq.RecordCount);
      end;
end;

procedure Tavgfm.cbKeyPress(Sender: TObject; var Key: Char);
var
str:string;
db:string;
begin

if taozhang='量产用套帐' then
db:='HB'
ELSE if taozhang='试产用套帐' then
db:='HB' ;
if key=#13 then
begin
str:='SELECT BOM名称, 计算结果, 日期, 备注, SUM( 计算结果 ), COUNT( 计算结果 ) '+
' FROM staresult '+
' where  BOM名称='+''''+trim(cb.Text)+'''' +
' GROUP BY BOM名称, 计算结果, 日期, 备注'   ;
dq.Close;
dq.SQL.Clear;
dq.SQL.Add(str);
dq.Open;

try
deq.Close;
deq.DatabaseName:=db;
deq.SQL.Clear;
deq.SQL.Add(str);
deq.Open;

except
   // application.MessageBox('创建示图失败！！！','HME提示          ',MB_OKCANCEL+MB_iconinformation);
end;

end;
end;

procedure Tavgfm.DBGrid1CellClick(Column: TColumn);
begin
if dq.Active=true then
begin
try
    cb.Text:=dq.FieldValues['BOM名称'];
except

end;
end;
end;

procedure Tavgfm.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

end.
