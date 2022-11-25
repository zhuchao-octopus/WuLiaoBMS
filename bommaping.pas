unit bommaping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB;

type
  Tbommapingfm = class(TForm)
    AQ: TADOQuery;
    DBGrid3: TDBGrid;
    DataSource1: TDataSource;
    AQmn2: TStringField;
    AQcn: TWideStringField;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  bommapingfm: Tbommapingfm;

implementation
          uses dmut;
{$R *.dfm}

procedure Tbommapingfm.FormActivate(Sender: TObject);
begin
SetWindowPos(handle, HWND_TOPMOST,
Left, Top, Width, Height,0);



end;

end.
