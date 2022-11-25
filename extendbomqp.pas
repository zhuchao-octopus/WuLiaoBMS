unit extendbomqp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls;

type
  Textendbomqpfm = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape7: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
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
    PageFooterBand1: TQRBand;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRSysData1: TQRSysData;
    ADOTable1: TADOTable;
    ADOTable1NO_ID: TAutoIncField;
    ADOTable1DSDesigner: TStringField;
    ADOTable1DSDesigner2: TStringField;
    ADOTable1DSDesigner3: TStringField;
    ADOTable1DSDesigner4: TStringField;
    ADOTable1DSDesigner5: TStringField;
    ADOTable1DSDesigner7: TStringField;
    ADOTable1DSDesigner6: TStringField;
    ADOTable1DSDesigner8: TFloatField;
    ADOTable1DSDesigner9: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  extendbomqpfm: Textendbomqpfm;

implementation

{$R *.dfm}

end.
