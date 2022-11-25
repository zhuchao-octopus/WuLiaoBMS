unit saveecr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tsaveecrfm = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    liaohao:string;
  end;

var
  saveecrfm: Tsaveecrfm;

implementation

{$R *.dfm}

procedure Tsaveecrfm.Button2Click(Sender: TObject);
begin
liaohao:='';
close;
end;

procedure Tsaveecrfm.Button1Click(Sender: TObject);
begin
if edit1.Text='' then
begin
    application.MessageBox(' 无效的文件名！！                  ','错误',mb_ok+MB_ICONSTOP);
    abort;
end;
 if FileExists(liaohao) then
 begin
      IF application.MessageBox(' 此ECR文件已经存在！！是否覆盖它！！                  ','错误',mb_YESNO+MB_ICONSTOP)=ID_NO THEN
      abort;
 end;
liaohao:=trim(edit1.Text);
close;
end;

end.
