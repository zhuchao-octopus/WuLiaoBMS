unit shenqingprintut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, ExtCtrls, QuickRpt, DB, ADODB,
  QRCtrls, StdCtrls;

type
  Tshenqingprint = class(TForm)
    qp: TQuickRep;
    ADOTable1: TADOTable;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel2: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel12: TQRLabel;
    username: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRImage1: TQRImage;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var  shenqingprint: Tshenqingprint;

implementation
      uses dmut;
{$R *.dfm}

procedure Tshenqingprint.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tshenqingprint.BitBtn1Click(Sender: TObject);
begin
//qp.Print;
end;

end.
