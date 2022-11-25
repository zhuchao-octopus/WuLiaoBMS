unit newbomoption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tnewbomoptinfm = class(TForm)
    R1: TRadioButton;
    R2: TRadioButton;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
  end;

var
  newbomoptinfm: Tnewbomoptinfm;

implementation

{$R *.dfm}

procedure Tnewbomoptinfm.Button2Click(Sender: TObject);
begin
cancel:=true ;
close;
end;

procedure Tnewbomoptinfm.FormActivate(Sender: TObject);
begin
cancel:=true;;
edit2.Clear;
end;

procedure Tnewbomoptinfm.Button1Click(Sender: TObject);
begin
if r2.Checked=true then
   begin
   if trim(edit2.Text)='' then
      begin
          showmessage('你没有填写规格说明！！！！！　　　　');
          exit;
      end;

   end;
cancel:=false;
close;
end;

end.
