unit liaohaoshencha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, checkappliaout, DB, ADODB, Grids, DBGrids, ComCtrls, Buttons,
  ToolWin, Menus, ExtCtrls, StdCtrls, DBCtrls, Mask;

type
  Tcheckappliaofm2 = class(Tcheckappliaofm)
    ToolButton1: TToolButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SpeedButton8: TSpeedButton;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    N2: TMenuItem;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checkappliaofm2: Tcheckappliaofm2;

implementation
      uses shenqingprintut,glbut,glut,outexcel, lookup,dmut;
{$R *.dfm}

procedure Tcheckappliaofm2.SpeedButton4Click(Sender: TObject);
begin
   shenqingprint.ADOTable1.Close;
   shenqingprint.qp.DataSet:=shenqingprint.ADOTable1;
   shenqingprint.ADOTable1.Open;
   shenqingprint.username.Caption:=userrealname;
   try
   shenqingprint.qp.Preview;
   except
       application.MessageBox('    未知错误！！ ','HME提示！',mb_ok+MB_ICONerror);

   end;

end;

procedure Tcheckappliaofm2.SpeedButton3Click(Sender: TObject);
begin
//   runapplication(handle,'.\ftp.exe');
{if adotable1.Active=true then
begin
    ftpfm.liaohao:=trim(adotable1.FieldValues['料号']);
     ftpfm.Edit8.ReadOnly:=false;
     ftpfm.SpeedButton1.Enabled:=true;
    ftpfm.show;
if ftpfm.uploaded=true then
    begin
    if ftpfm.cancel=true then
        exit;
    if trim(adotable1.FieldValues['料号'])<>'' then
    begin
    adotable1.Edit;
    adotable1.FieldValues['规格书']:=ftpfm.Edit8.Text;
    adotable1.Post;
    end;
end;   
end;    }

end;

procedure Tcheckappliaofm2.N1Click(Sender: TObject);
var
excelfilename:string;
surplyer:string;
begin
  inherited;
if  adotable1.Active=true then
begin
if adotable1.FieldValues['料号']<>'' then
begin
surplyer:=lookupsurplyerfm.surplyer;
 excelfilename:=ExtractFilePath(Application.Exename)+'ECR\judagebook.xls';
 if not fileexists(excelfilename) then
    begin
       application.MessageBox('ECN摸板丢失！！                  ','错误',mb_ok+MB_ICONinformation);
       exit;
    end;
 try
 outexcelfm.createExcelbyfile(excelfilename);
 except
 exit;
 end;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,2]:=adotable1.FieldValues['料号'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,2]:=adotable1.FieldValues['规格说明'];
 //outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,5]:=adotable1.FieldValues['使用机种'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,5]:=adotable1.FieldValues['制造商'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[7,2]:=surplyer;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[8,2]:=adotable1.FieldValues['厂家料号'];
 outexcelfm.ShowModal;
 end;
 end;
end;

procedure Tcheckappliaofm2.SpeedButton8Click(Sender: TObject);
begin
    if (adotable1.Active=true)and(trim(adotable1.FieldValues['料号'])<>'') then
      begin
          adotable1.Edit;
          adotable1.FieldValues['状态']:='已审查';
          adotable1.Post;
      end;

end;

procedure Tcheckappliaofm2.Button1Click(Sender: TObject);
begin
  inherited;
adotable1.Post;
panel1.Visible:=false;
end;

procedure Tcheckappliaofm2.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if adotable1.Active<>true then
  exit;
  try
panel1.Visible:=true;
adotable1.Edit;
except
end;
end;

procedure Tcheckappliaofm2.Button2Click(Sender: TObject);
begin
  inherited;

panel1.Visible:=false;
end;

procedure Tcheckappliaofm2.N2Click(Sender: TObject);
var
filename:string;
begin
try
if adotable1.Active=true then
filename:=adotable1.FieldValues['规格书'];
except

end;
runapplication(handle,commondir+'\'+filename);
end;
end.
