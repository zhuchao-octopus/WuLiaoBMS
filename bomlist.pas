unit bomlist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, Buttons, ExtCtrls;

type
  Tbomlistfm = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton2: TSpeedButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    liaohao:string;
  end;

var
  bomlistfm: Tbomlistfm;

implementation
     uses dmut,glbut;
{$R *.dfm}

procedure Tbomlistfm.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure Tbomlistfm.FormActivate(Sender: TObject);
begin
adoquery1.Close;
adoquery1.Open;
MakeDBGridColumnsAutoFixItsWidth(DBGrid1) ;
end;

procedure Tbomlistfm.SpeedButton1Click(Sender: TObject);
begin
liaohao:=adoquery1.FieldValues['¡œ∫≈'];
close;
end;

end.
