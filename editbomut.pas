unit editbomut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, ToolWin, DB, ADODB,
  Grids, DBGrids;

type
  Teditbomfm = class(TForm)
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton6: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    FontDialog1: TFontDialog;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Memo1: TMemo;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    SpeedButton8: TSpeedButton;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    Label7: TLabel;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Label10: TLabel;
    Label11: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure lookupbom(keystr,fieldname:string);
    procedure SpeedButton11Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure lookupwuliao(keystr,fieldname:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editbomfm: Teditbomfm;

implementation
    uses dmut,glbut, lbut;
{$R *.dfm}


procedure teditbomfm.lookupwuliao(keystr,fieldname:string);
VAR
   sqlstr:string;
begin
   fieldname:='lingjianliaohao';
   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ������, ��Ӧ��, �����Ϻ�, �����, ���� from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+'''';

     with adoquery2 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid2);
             label7.Caption :='';
             label10.Caption:='';
         end;
end;

procedure teditbomfm.lookupbom(keystr,fieldname:string);
VAR
   sqlstr:string;
begin

   sqlstr:='select Ʒ��, �Ϻ�, ���˵��,�ͻ� from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+''''  +  ' and Ʒ�� like'+ ''''+'%��Ʒ%'+'''' +  ' and Ʒ�� like'+ ''''+'B%'+'''' ;

     with adoquery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid2);
         end;
end;

procedure Teditbomfm.SpeedButton2Click(Sender: TObject);
begin
if fontdialog1.Execute then
   editbomfm.Font:=fontdialog1.Font;
end;

procedure Teditbomfm.SpeedButton9Click(Sender: TObject);
begin
lbfm.show;
end;

procedure Teditbomfm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Teditbomfm.SpeedButton1Click(Sender: TObject);
begin
adoquery1.Post;
end;

procedure Teditbomfm.SpeedButton7Click(Sender: TObject);
var
liaohao:string;
sqlstr:string;
strliaohao,pinming:string;
begin
liaohao:=adoquery1.FieldValues['�Ϻ�'];
pinming:=adoquery1.FieldValues['Ʒ��'];
strliaohao:=liaohao;
fomatliaohao(liaohao,liaohao);
sqlstr:='select �Ϻ�,�ײ�,��������,��λ����,���λ��,���� from '+liaohao ;
with adoquery1 do
    begin
       Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
             label7.Caption:=' '+strliaohao+' ';
             label10.Caption:= ' '+pinming+' ';
    end;
end;

procedure Teditbomfm.SpeedButton5Click(Sender: TObject);
begin
if   application.MessageBox('�����Ҫɾ����ǰ��¼�𣿣�','HME��ʾ��          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
         adoquery1.Delete;
      except

           showmessage('ɾ��ʧ�ܣ�����    ') ;
      end;

      end;

end;

procedure Teditbomfm.ADOQuery1BeforePost(DataSet: TDataSet);
begin
if   application.MessageBox('��Ҫ����༭���ļ�¼��','HME��ʾ��          ',MB_OKCANCEL+MB_iconinformation)<>idok then
      begin
      try
          adoquery1.Cancel;
          dataset.Cancel;
      except

          // showmessage('fdfdsfs') ;
      end;

      end;
      abort;
end;

procedure Teditbomfm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupbom(edit1.Text,'�Ϻ�');
   end;
end;

procedure Teditbomfm.SpeedButton11Click(Sender: TObject);
begin
 lookupbom(edit1.Text,'�Ϻ�');
end;

procedure Teditbomfm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupwuliao(edit2.Text,'�Ϻ�');
   end;
end;

end.
