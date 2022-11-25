unit ole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs;

type
  Tolefm = class(TForm)
    OleContainer1: TOleContainer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  olefm: Tolefm;

implementation

{$R *.dfm}

end.
