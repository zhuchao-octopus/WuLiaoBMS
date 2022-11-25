unit tidailiao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB;

type
  Ttidailiaofm = class(TForm)
    R1: TRadioButton;
    R2: TRadioButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Edit3: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner11: TWideStringField;
    ADOQuery1DSDesigner12: TStringField;
    ADOQuery1DSDesigner13: TStringField;
    ADOQuery1DSDesigner14: TWideStringField;
    ADOQuery1DSDesigner15: TStringField;
    ADOQuery1DSDesigner16: TStringField;
    ADOQuery1DSDesigner19: TStringField;
    ADOQuery1DSDesigner20: TStringField;
    Edit4: TEdit;
    Label3: TLabel;
    Edit5: TEdit;
    Memo1: TMemo;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
  end;

var
  tidailiaofm: Ttidailiaofm;

implementation
      uses dmut,glbut;
{$R *.dfm}

procedure Ttidailiaofm.BitBtn1Click(Sender: TObject);
begin
if adoquery1.Active=true then
begin
dbgrid1.OnDblClick(self);
end; 
end;

procedure Ttidailiaofm.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Ttidailiaofm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+trim(edit2.Text)+'%'+'''');
adoquery1.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;
end;

procedure Ttidailiaofm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
    adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where ���˵�� like '+''''+'%'+trim(edit3.Text)+'%'+'''');
adoquery1.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;
end;

procedure Ttidailiaofm.Button1Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure Ttidailiaofm.FormActivate(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
adoquery1.Close;
cancel:=true;
end;

procedure Ttidailiaofm.Edit4KeyPress(Sender: TObject; var Key: Char);
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

procedure Ttidailiaofm.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
    adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where ���˵�� like '+''''+'%'+trim(edit5.Text)+'%'+'''');
adoquery1.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
end;
end;

procedure Ttidailiaofm.DBGrid1CellClick(Column: TColumn);
begin
if r1.Checked=true then
begin
    if adoquery1.Active=true then
       begin
           edit2.Text:=adoquery1.FieldValues['�Ϻ�'];
           edit3.Text:=adoquery1.FieldValues['���˵��'];
       end;
end;
if r2.Checked=true then
begin
    if adoquery1.Active=true then
       begin
           edit4.Text:=adoquery1.FieldValues['�Ϻ�'];
           edit5.Text:=adoquery1.FieldValues['���˵��'];
       end;
end;
end;

procedure Ttidailiaofm.DBGrid1DblClick(Sender: TObject);
begin
   if adoquery1.Active=true then
      begin
         try
          if trim(adoquery1.FieldValues['�Ϻ�'])<>'' then
             begin
              if r1.Checked=true then
                  begin

                       edit2.Text:=adoquery1.FieldValues['�Ϻ�'];
                       edit2.Update;
                       edit3.Text:=adoquery1.FieldValues['���˵��'];
                       edit3.Update;
                       if trim(edit2.Text)='' then
                           begin
                               showmessage('����Ĳ���������');
                               exit;
                           end;
                  end;
             if r2.Checked=true then
                begin
                    edit4.Text:=adoquery1.FieldValues['�Ϻ�'];
                    edit4.Update;
                    edit5.Text:=adoquery1.FieldValues['���˵��'];
                    edit5.Update;
                    if trim(edit4.Text)='' then
                           begin
                               showmessage('����Ĳ���������');
                               exit;
                           end;
                end;

             cancel:=false;
             close;
             end;
             except
                 showmessage('��Ч�Ĳ���������');
                 cancel:=true;
                 exit;
             end;
      end;
end;

procedure Ttidailiaofm.R2Click(Sender: TObject);
begin
   edit1.Clear;
   edit2.Clear;
   edit3.Clear;
end;

procedure Ttidailiaofm.R1Click(Sender: TObject);
begin
edit4.Clear;
edit5.Clear;
end;

end.
