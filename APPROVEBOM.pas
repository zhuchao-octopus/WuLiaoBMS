unit APPROVEBOM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, DB, ADODB;

type
  TAPPROVEBOMFM = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    C1: TCheckBox;
    C2: TCheckBox;
    C3: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    C4: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
  end;

var
  APPROVEBOMFM: TAPPROVEBOMFM;

implementation
  uses dmut;
{$R *.dfm}

procedure TAPPROVEBOMFM.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure TAPPROVEBOMFM.Button1Click(Sender: TObject);
begin
cancel:=false;
close;
end;

procedure TAPPROVEBOMFM.FormActivate(Sender: TObject);
begin
cancel:=true;
c1.Checked:=true;
c2.Checked:=true;
c3.Checked:=true;
end;

end.
