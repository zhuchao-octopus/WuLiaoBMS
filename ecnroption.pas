unit ecnroption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tecnroptionfm = class(TForm)
    ECN: TRadioButton;
    ECR: TRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flag:boolean;
     strs:string ;
  end;

var
  ecnroptionfm: Tecnroptionfm;

implementation

{$R *.dfm}

procedure Tecnroptionfm.BitBtn2Click(Sender: TObject);
begin
flag:=true;
close;
end;

procedure Tecnroptionfm.BitBtn1Click(Sender: TObject);
var
  strlist:Tstringlist;
  i:integer;
begin
strs:='';
strlist:=Tstringlist.Create;
strlist.Clear;
if checkbox1.Checked=true then
   strlist.Add('QAD')
   else   strlist.Add('---') ;
if checkbox2.Checked=true then
   strlist.Add('ENG')
   else  strlist.Add('---');
if checkbox3.Checked=true then
   strlist.Add('PQ')
   else  strlist.Add('---');
if checkbox4.Checked=true then
   strlist.Add('RD')
   else  strlist.Add('---') ;
if checkbox5.Checked=true then
   strlist.Add('PD')
   else strlist.Add('--');
if checkbox6.Checked=true then
   strlist.Add('MARKET')
   else strlist.Add('---');
if checkbox7.Checked=true then
   strlist.Add('MC')
      else strlist.Add('---');
   for i:=0 to strlist.Count-1 do
   begin
       strs:=strs+strlist[i];
      strs:=Format('%S8',[strs]);
   end;
strlist.Free;
flag:=false;
close;
end;

end.
