unit liaohaoprintut;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  Tliaohaoprint = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    liaohao: TQRDBText;
    pingming: TQRDBText;
    guigeshuoming: TQRDBText;
    QRShape4: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    username: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape5: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape15: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
  private

  public

  end;

var
  liaohaoprint: Tliaohaoprint;

implementation
       uses dmut;
{$R *.DFM}

end.
