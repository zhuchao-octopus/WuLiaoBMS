unit extendbomprint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, chengrenshu, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls;

type
  Textendbomprintfm = class(Tchengrenshufm)
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    ADOTable1DSDesigner6: TStringField;
    ADOTable1DSDesigner8: TFloatField;
    ADOTable1DSDesigner9: TFloatField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  extendbomprintfm: Textendbomprintfm;

implementation

{$R *.dfm}

end.
