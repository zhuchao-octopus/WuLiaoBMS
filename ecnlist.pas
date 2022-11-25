unit ecnlist;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  Tecnlistfm = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRShape12: TQRShape;
    PageFooterBand1: TQRBand;
    QRShape10: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape11: TQRShape;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRShape9: TQRShape;
    customer: TQRLabel;
    model: TQRLabel;
    liaohao: TQRLabel;
    guige: TQRLabel;
    versions: TQRLabel;
    dates: TQRLabel;
    ADOQuery1: TADOQuery;
    username: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
  private

  public

  end;

var
  ecnlistfm: Tecnlistfm;

implementation
      uses dmut;
{$R *.DFM}

end.
