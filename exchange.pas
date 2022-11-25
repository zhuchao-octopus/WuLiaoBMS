unit exchange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  Texchangefm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOTable1: TADOTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  exchangefm: Texchangefm;

implementation
          uses dmut;
{$R *.dfm}

procedure Texchangefm.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Texchangefm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
   key:=#0;
end;

procedure Texchangefm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
   key:=#0;
end;

procedure Texchangefm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
   key:=#0;
end;

procedure Texchangefm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','.',#8]) then
   key:=#0;
end;

procedure Texchangefm.BitBtn2Click(Sender: TObject);
var
 f:textfile;
   filename:string;
begin
      filename:='rate.dat';
      AssignFile(F, FileName);
      Rewrite(F);
      writeln(F,edit1.text);
      writeln(F,edit2.text);
      writeln(F,edit3.text);
      writeln(F,edit4.text);
      closefile(f);
close;
end;

procedure Texchangefm.FormCreate(Sender: TObject);
var
 f:textfile;
   filename:string;
   s:string;
begin
      filename:='rate.dat';
      AssignFile(F, FileName);
      Reset(F);
      readln(F,s);
      edit1.Text:=s;
      readln(F,s);
      edit2.Text:=s;
      readln(F,s);
      edit3.Text:=s;
      readln(F,s);
      edit4.Text:=s;
      closefile(f);
close;
end;
end.
