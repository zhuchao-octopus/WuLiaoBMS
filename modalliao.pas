unit modalliao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, Buttons, DB, ADODB;

type
  Tmodalliaofm = class(TForm)
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    ADOQuery1: TADOQuery;
    bomlist: TADOQuery;
    SpeedButton2: TSpeedButton;
    LV: TListView;
    ADOQuery2: TADOQuery;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    keyliao:string;
  end;

var
  modalliaofm: Tmodalliaofm;

implementation
     uses dmut;
{$R *.dfm}

procedure Tmodalliaofm.SpeedButton1Click(Sender: TObject);
begin
close;
end;
function parseliaohao(liaohao:string):string;
var
   i:integer;
   newliaohao:string;
begin
newliaohao:='';
if liaohao[1]='B' then                             //1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
     for i:=0 to length(liaohao)do                 //A A X B B B B B B -  C  C  -  D:
     begin
         if i+2>length(liaohao) then
         break;
         if i+2=11 then
         newliaohao:=newliaohao+'-';

         newliaohao:=newliaohao+liaohao[i+2];

     end;
     result:=newliaohao;
end;
procedure getmodel(liaohao:string);
begin

end;
procedure Tmodalliaofm.SpeedButton2Click(Sender: TObject);
var
i,count:integer;
strsql,tname,liaohao:string;
begin
bomlist.Close;
bomlist.Open;
lv.Clear;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin
               tname:=bomlist.FieldValues['name'];
               strsql:='select �Ϻ� from '+tname+' where �Ϻ�= '+''''+keyliao+'''';
               adoquery1.Close;
               adoquery1.SQL.Clear;
               adoquery1.SQL.Add(strsql);
               adoquery1.Open;

               if  adoquery1.RecordCount=1 then
                   begin
                      liaohao:=parseliaohao(tname);
                      adoquery2.Close;
                      adoquery2.SQL.Clear;
                      adoquery2.SQL.Add('select * from lingjianliaohao where �Ϻ�= '+''''+liaohao+'''');
                      adoquery2.Open;
                      lv.Items.Add;
                      count:=lv.Items.Count;
                      lv.Items[count-1].Caption:=adoquery2.FieldValues['�Ϻ�'];
                      if  adoquery2.FieldValues['Ʒ��']<>null then
                      lv.Items[count-1].SubItems.add(adoquery2.FieldValues['Ʒ��']);
                      lv.Items[count-1].SubItems.add(adoquery2.FieldValues['���˵��']);

                   end;


               bomlist.Next;
            end;
   end;
end;

procedure Tmodalliaofm.SpeedButton3Click(Sender: TObject);
var
  i:integer;
  str:string;
begin
                     adoquery2.Close;
                     adoquery2.SQL.Clear;
                     adoquery2.SQL.Add('select * from lingjianliaohao where �Ϻ�= '+''''+trim(keyliao)+'''');
                     adoquery2.Open;
                     adoquery2.Edit;
     adoquery2.FieldValues['ʹ�û���']:='';
     adoquery2.Post;
    for i:=0 to  lv.Items.Count-1 do
    begin
        str:=lv.Items[i].Caption;
           begin
                     adoquery2.Edit;
                     adoquery2.FieldValues['ʹ�û���']:=adoquery2.FieldValues['ʹ�û���']+trim(str)+' ';
                     adoquery2.Post;
            end;
     end;
end;

end.
