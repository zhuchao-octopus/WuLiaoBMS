unit lookup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, editsurplyer, DB, ADODB, ComCtrls, Grids, DBGrids, StdCtrls,
  ExtCtrls, DBCtrls, Buttons, ToolWin;

type
  Tlookupsurplyerfm = class(Teditsurplyerfm)
    Label2: TLabel;
    ToolBar3: TToolBar;
    ComboBox2: TComboBox;
    Label1: TLabel;
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    surplyer:string;
      cancel:boolean;
  end;

var
  lookupsurplyerfm: Tlookupsurplyerfm;

implementation

{$R *.dfm}

procedure Tlookupsurplyerfm.ComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if key=#13 then
   begin
       aq.Close;
       aq.SQL.Clear;
       aq.SQL.Add('select * from surplyer where ÁªÂçÈË like '+''''+'%'+combobox2.Text+'%'+'''' );
       aq.Open;
   end;
end;

procedure Tlookupsurplyerfm.SpeedButton2Click(Sender: TObject);
begin
if aq.Active=true then
   begin
       if aq.fieldvalues['¼ò³Æ']<>Null then
       surplyer:=aq.fieldvalues['¼ò³Æ'];
       cancel:=false;
       close;
   end;

end;

procedure Tlookupsurplyerfm.FormActivate(Sender: TObject);
begin
  inherited;
cancel:=true;
end;

end.
