unit saveas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, openbom, DB, ADODB, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids,
  Buttons;

type
  Tsaveasfm = class(Topenbomfm)
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  saveasfm: Tsaveasfm;

implementation

{$R *.dfm}

procedure Tsaveasfm.Button1Click(Sender: TObject);
var
liaohao:string;
begin
if trim(edit1.Text)='' then
   exit;
 liaohao:=trim(edit1.Text);
 if  not(liaohao[1] in ['0'..'9'])or(not(liaohao[2] in ['0'..'9'])) or(not(liaohao[3] in ['A'..'Z']))     then
    begin
        showmessage('不规范的料号！！！！      ');
        exit;
    end;
 if caption='ＢＯＭ另存为' then
 begin
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(edit1.Text)+'''');
 adoquery1.Open;
 if adoquery1.RecordCount>=1 then
    begin
        showmessage('此料号在料号库中已存在！！！     ');
        exit;
    end;
 end;
 cancel:=false;
 close;

end;

procedure Tsaveasfm.FormActivate(Sender: TObject);
begin
 // inherited;
  ;
end;

end.
