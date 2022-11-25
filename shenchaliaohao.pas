unit shenchaliaohao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, checkliaohaout, ADODB, Menus, DB, StdCtrls, Mask, DBCtrls,
  ComCtrls, Grids, DBGrids, ExtCtrls, Buttons, ToolWin;

type
  Tshenchaliaohaofm = class(Tcheckliaohaofm)
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  shenchaliaohaofm: Tshenchaliaohaofm;

implementation

{$R *.dfm}

procedure Tshenchaliaohaofm.SpeedButton8Click(Sender: TObject);
begin
    if (adoquery1.Active=true)and(trim(adoquery1.FieldValues['ÁÏºÅ'])<>'') then
      begin
          adoquery1.Edit;
          adoquery1.FieldValues['×´Ì¬']:='ÒÑÉó²é';
          adoquery1.Post;
      end;

end;

end.
