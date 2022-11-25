unit upload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  Tuploadfm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    filename:string;
    cancel:boolean;
    liaohao:string;
  end;

var
  uploadfm: Tuploadfm;

implementation
       uses glbut;
{$R *.dfm}

procedure Tuploadfm.SpeedButton1Click(Sender: TObject);
begin
if opendialog1.Execute then
   edit1.Text:=opendialog1.FileName;
    edit2.Text:=liaohao+'_'+ExtractFileName(edit1.Text);
end;

procedure Tuploadfm.Button1Click(Sender: TObject);
var
 i:boolean;
begin

 filename:=trim(commondir)+trim(edit2.Text);
    i:=copyfile(pchar(trim(edit1.Text)),pchar(filename),false);
    if i=true then
    begin
       showmessage('上传成功');
       cancel:=false;
       close;
    end
    else 
    showmessage('上传失败，请检测服务器是否正常');
end;

procedure Tuploadfm.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure Tuploadfm.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

end.
