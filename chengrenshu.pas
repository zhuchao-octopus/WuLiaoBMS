unit chengrenshu;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB;

type
  Tchengrenshufm = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape7: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    ADOTable1: TADOTable;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape8: TQRShape;
    customer: TQRLabel;
    model: TQRLabel;
    liaohao: TQRLabel;
    guige: TQRLabel;
    versions: TQRLabel;
    dates: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    ADOTable1NO_ID: TAutoIncField;
    ADOTable1DSDesigner: TStringField;
    ADOTable1DSDesigner2: TStringField;
    ADOTable1DSDesigner3: TStringField;
    ADOTable1DSDesigner4: TStringField;
    ADOTable1DSDesigner5: TStringField;
    ADOTable1DSDesigner7: TStringField;
    PageFooterBand1: TQRBand;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
 
  private

  public

  end;

var
  chengrenshufm: Tchengrenshufm;

implementation
     uses dmut;
{$R *.DFM}

end.
