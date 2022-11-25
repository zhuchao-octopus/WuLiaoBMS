unit CHECKECN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, DB, ADODB, ExtCtrls,
  Buttons;

type
  TCHECKECNFM = class(TForm)
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    C1: TCheckBox;
    C2: TCheckBox;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
  end;

var
  CHECKECNFM: TCHECKECNFM;

implementation
    USES DMUT;
{$R *.dfm}

procedure TCHECKECNFM.BitBtn2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure TCHECKECNFM.BitBtn1Click(Sender: TObject);
begin
if c2.Checked=true then
   begin
      if application.MessageBox('你已选种核准后立即应用，此操作不可逆转！！！是否继续？              ','提示！',mb_yesno+MB_ICONinformation)=ID_NO then
         begin
         cancel:=true;
         exit;
         end;
   end;
cancel:=false;
close;
end;

procedure TCHECKECNFM.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

end.
