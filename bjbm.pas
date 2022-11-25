unit bjbm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TBJBMFM = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit4: TEdit;
    Label5: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
  cancel:boolean;
    { Public declarations }
  end;

var
  BJBMFM: TBJBMFM;

implementation
    uses bomedit;
{$R *.dfm}

procedure TBJBMFM.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure TBJBMFM.Button1Click(Sender: TObject);
begin
cancel:=false;
close;
end;

procedure TBJBMFM.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

procedure TBJBMFM.Button3Click(Sender: TObject);
var
count:double;
weizhi,pwh,str,yongliang,yl,dw:string;
i:integer;
begin
str:=trim(memo1.Text);
count:=0;
weizhi:='';
pwh:='';
bomeditfm.sumno(str,count,weizhi,pwh);

yongliang:= trim(edit3.Text);
for i:=1 to length(yongliang)  do     //get yongliang
    begin
        try
           if (not (yongliang[i]  in ['A'..'Z','a'..'z']))and ((yongliang[i]  in ['0'..'9','.'])) then
               yl:=yl+trim(yongliang[i])
           else
             dw:=dw+trim(yongliang[i]);
        except
        end;
    end;
if trim(yl)='' then
   yl:='0';
edit3.Text:=yl+dw;
memo1.Text:=trim(weizhi);
edit4.Text:=pwh;

    
end;

end.
