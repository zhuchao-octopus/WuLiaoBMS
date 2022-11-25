unit editbom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Teditbomffm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    yongliang,jieceng,weizhi:string;
    flag:boolean;
  end;

var
  editbomffm: Teditbomffm;

implementation

{$R *.dfm}

procedure Teditbomffm.Button2Click(Sender: TObject);
begin
flag:=true;
close;
end;

procedure Teditbomffm.Button1Click(Sender: TObject);
begin
jieceng:=edit1.Text;
yongliang:=edit2.Text;
weizhi:=memo1.Text;
flag:=false;
close;
end;

procedure Teditbomffm.FormActivate(Sender: TObject);
begin
edit1.Text:=jieceng;
edit2.Text:=yongliang;
memo1.Text:=weizhi;
flag:=true;
end;

end.
