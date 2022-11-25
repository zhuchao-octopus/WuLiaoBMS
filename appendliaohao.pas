unit appendliaohao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls,
  Buttons, ToolWin;

type
  Tappliaofm = class(TForm)
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton6: TSpeedButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    FontDialog2: TFontDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ADOCommand1: TADOCommand;
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
   
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ADOQuery1BeforeEdit(DataSet: TDataSet);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  appliaofm: Tappliaofm;

implementation

uses luut,glbut,  appliaohao, shenqingprintut;

{$R *.dfm}

procedure Tappliaofm.SpeedButton9Click(Sender: TObject);
begin
lufm.show;
end;

procedure Tappliaofm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tappliaofm.SpeedButton1Click(Sender: TObject);
begin
    //lhappffm.show;
    appliaohaofm.show;
end;

procedure Tappliaofm.BitBtn1Click(Sender: TObject);
begin
 adoquery1.Refresh;
end;

procedure Tappliaofm.Edit1KeyPress(Sender: TObject; var Key: Char);
VAR
   sqlstr:string;
begin
if key=#13 then
 begin
   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ��Ӧ��, �����Ϻ�, �����, ����, ������,״̬ from  prelingjianliaohao where �Ϻ� like '+''''+'%'+edit1.Text+'%'+'''';

with adoquery1 do
   begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

   end;
   end;
end;

procedure Tappliaofm.SpeedButton3Click(Sender: TObject);
VAR
   sqlstr:string;
begin

   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ��Ӧ��,������,ʹ�û���, �����Ϻ�, �����, ����, ������,״̬ from  prelingjianliaohao';

with adoquery1 do
   begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

   end;

end;

procedure Tappliaofm.SpeedButton11Click(Sender: TObject);
VAR
   sqlstr:string;
begin

   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ��Ӧ��, �����Ϻ�, �����, ����, ������,״̬ from  prelingjianliaohao';

with adoquery1 do
   begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

   end;

end;

procedure Tappliaofm.DBGrid1DrawColumnCell(Sender: TObject;
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
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=Clcream {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
end; 
end;

procedure Tappliaofm.DBGrid1CellClick(Column: TColumn);
begin
if trim(adoquery1.FieldValues['������'])<>trim(userrealname) then
   begin
       showmessage('�����ܱ༭������¼������');
       dbgrid1.ReadOnly:=true;
       exit;
   end
   else
   dbgrid1.ReadOnly:=false;
end;

procedure Tappliaofm.ADOQuery1BeforeEdit(DataSet: TDataSet);
begin
if trim(adoquery1.FieldValues['������'])<>trim(userrealname) then
   begin
       showmessage('�����ܱ༭������¼,�ܾ��༭������');
       dbgrid1.ReadOnly:=true;
       exit;
   end
   else
   dbgrid1.ReadOnly:=false;
end;

procedure Tappliaofm.SpeedButton5Click(Sender: TObject);
VAR
   sqlstr:string;
begin

   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ��Ӧ��, �����Ϻ�, �����, ����, ������,״̬,P_ID from  prelingjianliaohao where ������='+''''+userrealname+'''';

with adoquery1 do
   begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

   end;

end;

procedure Tappliaofm.SpeedButton7Click(Sender: TObject);
var
 bomid: integer;
 bomliao:string;
begin
if adoquery1.Active=true then
  begin
      bomid:=adoquery1.FieldValues['P_ID'];
      fomatliaohao(inttostr(bomid),bomliao);
      if adoquery1.FieldValues['������']=trim(userrealname) then
        begin
             if  application.MessageBox('��Ҫɾ����       ','ɾ����ʾ��',mb_yesno+MB_ICONinformation)=ID_yes then
                 begin
                     if existbom(bomliao) then
                        begin
                          try
                           adocommand1.CommandText:='';
                           adocommand1.CommandText:='drop table '+bomliao;
                           adocommand1.Execute;
                           except
                             showmessage('ɾ��ʧ�ܣ���             ');
                             exit;
                           end;
                        end;
                     adoquery1.Delete;
                 end
             else
                exit;
        end
      else
         begin
              showmessage('�㲻��ɾ���������Լ��������Ϻţ�����');
              exit;
         end;
  end;
end;

procedure Tappliaofm.DBGrid1TitleClick(Column: TColumn);
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
   Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      ADOQuery1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tappliaofm.SpeedButton8Click(Sender: TObject);
begin
//adoquery1.Close;
//adoquery1.SQL.Clear;
//adoquery1.SQL.Add('select * from prelingjianliaohao where ѡ��='+''''+'��ӡ'+'''');
//adoquery1.Open;

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
       application.MessageBox('    δ֪���󣡣� ','HME��ʾ��',mb_ok+MB_ICONerror);

   end;
end;

end.


