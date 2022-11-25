unit CREATEECN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB;

type
  TCREATEECNFM = class(TForm)
    Edit2: TEdit;
    Label3: TLabel;
    SpeedButton8: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner10: TStringField;
    ADOQuery1DSDesigner11: TWideStringField;
    ADOQuery1DSDesigner12: TStringField;
    ADOQuery1DSDesigner13: TStringField;
    ADOQuery1DSDesigner14: TWideStringField;
    ADOQuery1DSDesigner15: TStringField;
    ADOQuery1DSDesigner16: TStringField;
    ADOQuery1DSDesigner19: TStringField;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    Memo2: TMemo;
    procedure SpeedButton8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   
    cancel:boolean;
  end;

var
  CREATEECNFM: TCREATEECNFM;
  pwh:string;
implementation

uses lookupliaohao,bomedit,dmut,glbut;

{$R *.dfm}

procedure TCREATEECNFM.SpeedButton8Click(Sender: TObject);
begin
//adoquery1.Close;
if (trim(edit3.Text)<>trim(edit4.Text))or(trim(edit2.Text)<>trim(edit5.Text))  then
   begin
      // showmessage('��Ч�Ĳ�����ǰ���ϺŻ����������');
      // exit;
    //  dbgrid1.OnCellClick(self);
   //   if  application.MessageBox('��ȷʵҪ�����ѡ�ֵ��Ϻ���        ','FALCON ERP ��ʾ',mb_okCANCEL+MB_ICONinformation)=id_ok then
     //   begin
        dbgrid1.OnDblClick(self);
        cancel:=false;
        close;
     //   end;
   end ;


if pwh<>'' then
   begin
       showmessage('λ���ظ�ʹ�ã���'+pwh);
       exit;
   end;
cancel:=false;
close;
end;

procedure TCREATEECNFM.Button1Click(Sender: TObject);
begin

close;
cancel:=true;
end;

procedure TCREATEECNFM.FormActivate(Sender: TObject);
begin
     adoquery1.Close;

     pwh:='';

     cancel:=true;
end;

procedure TCREATEECNFM.SpeedButton2Click(Sender: TObject);
var
 e1:double;
 m1:string;
 i:integer;
 yl,yongliang:string;
 dw:string;
begin
pwh:='';
yl:=trim(edit6.Text);
yongliang:='';
dw:='';
for i:=1 to length(yl)+1 do
begin
     if yl[i] in ['0'..'9'] then
        yongliang:=yongliang+yl[i]
     else
         dw:=dw+yl[i];
end;
if AnsiStricomp(pchar(dw),'EA')=0 then
   begin
        bomeditfm.sumno(memo2.Text,e1,m1,pwh);
        if pwh<>'' then
           showmessage('  '+pwh+'���λ�ŷ������ã�����');
        edit6.Text:=floattostr(e1)+dw;
        memo2.Text:=m1;
   end;
//speedbutton8.Enabled:=true;

end;

procedure TCREATEECNFM.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid1 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=ClYellow;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=ClWhite {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
end;
end;

procedure TCREATEECNFM.Edit4KeyPress(Sender: TObject; var Key: Char);
//var
 // str:string;
begin
if key=#13 then
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+trim(edit4.Text)+'%'+'''');
adoquery1.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;
end;

procedure TCREATEECNFM.Edit5KeyPress(Sender: TObject; var Key: Char);
//var
//  str:string;
begin
if key=#13 then
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where ���˵�� like '+''''+'%'+trim(edit4.Text)+'%'+'''');
adoquery1.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;
end;

procedure TCREATEECNFM.DBGrid1CellClick(Column: TColumn);
begin
if adoquery1.Active=true then
begin
edit4.Text:=adoquery1.FieldValues['�Ϻ�'];
edit5.Text:=adoquery1.FieldValues['���˵��'];
if trim(edit4.Text)='' then
   begin
       showmessage('����ȷ�Ĳ���������');
       exit;
   end;
end;
end;

procedure TCREATEECNFM.DBGrid1DblClick(Sender: TObject);
begin
dbgrid1.OnCellClick(dbgrid1.Columns.Items[1]);
if  application.MessageBox('��ȷʵҪ�����ѡ�ֵ��Ϻ���        ','FALCON ERP ��ʾ',mb_okCANCEL+MB_ICONinformation)=id_cancel then
    exit;
if adoquery1.Active=true then
begin
edit4.Text:=adoquery1.FieldValues['�Ϻ�'];
edit4.Update;
edit5.Text:=adoquery1.FieldValues['���˵��'];
edit5.Update;
if trim(edit4.Text)='' then
   begin
       showmessage('����ȷ�Ĳ���������');
       exit;
   end;
if pwh<>'' then
   begin
       showmessage('λ���ظ�ʹ�ã���'+pwh);
       exit;
   end;
 cancel:=false;
 close;
end  //adoquery=true
else
   begin
       showmessage('��Ч�Ĳ���������');
       exit;
   end;

end;

end.
