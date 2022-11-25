unit CREATEBOM2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, createbomut, ADODB, DB, StdCtrls, ExtCtrls, Buttons, Grids,
  DBGrids;

type
  TCREATEBOMFM2 = class(TCREATEBOMFM)
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CREATEBOMFM2: TCREATEBOMFM2;

implementation
      uses dmut;
{$R *.dfm}

procedure TCREATEBOMFM2.SpeedButton1Click(Sender: TObject);
var
 f:textfile;
   filename:string;
begin
      inherited;
      filename:='.\userbomlist.dat';
      AssignFile(F, FileName);
      if not fileexists('.\userbomlist.dat') then
          Rewrite(F)
      else
          Append(f);

      writeln(F,edit1.text);
      closefile(f);

end;

procedure TCREATEBOMFM2.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
      adoquery2.Close;
      adoquery2.SQL.Clear;
      adoquery2.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+trim(edit6.Text)+'%'+'''');
      adoquery2.Open;
  end;

end;

procedure TCREATEBOMFM2.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
      adoquery2.Close;
      adoquery2.SQL.Clear;
      adoquery2.SQL.Add('select * from lingjianliaohao where 规格说明 like '+''''+trim(edit8.Text)+'%'+'''');
      adoquery2.Open;
  end;
end;

procedure TCREATEBOMFM2.SpeedButton4Click(Sender: TObject);
begin
 edit1.Text:=adoquery2.FieldValues['料号'];
 if   adoquery2.FieldValues['品名']<>Null then
 edit2.Text:=adoquery2.FieldValues['品名'];
 if adoquery2.FieldValues['客户']<>Null then
 edit4.Text:=adoquery2.FieldValues['客户'];
 if adoquery2.FieldValues['客户机种号']<>Null then
 edit5.Text:=adoquery2.FieldValues['客户机种号'];
 if adoquery2.FieldValues['最新版本']<>Null then
 edit3.Text:=adoquery2.FieldValues['最新版本'];
 if adoquery2.FieldValues['使用机种']<>Null then
 edit7.Text:=adoquery2.FieldValues['使用机种'];
 if adoquery2.FieldValues['规格说明']<>Null then
 memo1.Text:=adoquery2.FieldValues['规格说明'];

end;

procedure TCREATEBOMFM2.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    edit5.SetFocus;

end;

procedure TCREATEBOMFM2.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
    edit3.SetFocus;

end;

procedure TCREATEBOMFM2.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
    edit7.SetFocus;

end;

end.
