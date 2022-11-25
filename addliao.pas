unit addliao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  Taddliaofm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
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
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    adotable:Tadotable;
  end;

var
  addliaofm: Taddliaofm;

implementation
      uses dmut,glbut,bomedit;
{$R *.dfm}

procedure Taddliaofm.Button2Click(Sender: TObject);
begin
close;
end;

procedure Taddliaofm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       adoquery1.Close;
       adoquery1.SQL.Clear;
       adoquery1.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+trim(edit1.Text)+'%'+'''');
       adoquery1.Open;
       MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
   end;
end;

procedure Taddliaofm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       adoquery1.Close;
       adoquery1.SQL.Clear;
       adoquery1.SQL.Add('select * from lingjianliaohao where ���˵�� like '+''''+'%'+trim(edit2.Text)+'%'+'''');
       adoquery1.Open;
       MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
   end;
end;

procedure Taddliaofm.DBGrid1CellClick(Column: TColumn);
begin
if adoquery1.Active=true then
   begin
         if trim(adoquery1.FieldValues['�Ϻ�'])<>'' then
            begin
                 edit1.Text:=adoquery1.FieldValues['�Ϻ�'];
                 edit2.Text:=adoquery1.FieldValues['���˵��'];
            end
         else
            begin
                edit1.Clear;
                edit2.Clear;
            end;
   end
else
  begin
      edit1.Clear;
      edit2.Clear;
  end;
end;

procedure Taddliaofm.Button1Click(Sender: TObject);
begin
if (trim(edit1.Text)<>'')and(trim(edit2.Text)<>'') then
   begin
     if isexistsliaohao(adotable,trim(edit1.Text))=false then
     begin
     addliaohao(adotable,trim(edit1.Text),trim(edit2.Text),trim(edit3.Text),trim(memo1.Text));
     showmessage('�����Ϻųɹ���������');
     end
     else
        begin
            showmessage('���Ϻ��Ѵ��ڵ�ǰBOM�У�������');
            exit;
        end;
   end
else
   begin
       showmessage('�����ܽ�һ���յ��Ϻ���ӵ�BOM������');
       exit;
   end;
end;

procedure Taddliaofm.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Taddliaofm.Button3Click(Sender: TObject);
var
count:double;
weizhi,pwh:string;
begin
count:=0;
weizhi:='';
pwh:='';
bomeditfm.sumno(trim(memo1.Text),count,weizhi,pwh);
edit3.Text:=floattostr(count)+'EA';
memo1.Clear;
memo1.Text:=weizhi;
if pwh<>'' then
  begin
      showmessage('���λ���ظ�ʹ�ã���'+pwh);
  end;
end;

procedure Taddliaofm.DBGrid1DblClick(Sender: TObject);
begin
button1.OnClick(self);
end;

end.
