unit noruleut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, ExtCtrls, ComCtrls,
  Buttons, ToolWin;

type
  Tnorulefm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton11: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton6: TSpeedButton;
    Panel1: TPanel;
    Label2: TLabel;
    Edit2: TEdit;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ToolButton1: TToolButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure SpeedButton6Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  norulefm: Tnorulefm;

implementation
    uses dmut, addruleut,glbut;
{$R *.dfm}

procedure Tnorulefm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tnorulefm.Edit2KeyPress(Sender: TObject; var Key: Char);
VAR
   sqlstr:string;
begin
if key =#13 then
begin
   sqlstr:='select * from numberrule where ����  like '+ ''''+'%'+edit2.Text+'%'+'''';

     with ADOQuery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             //count:=RecordCount;
         end;
          MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
end;
end;

procedure Tnorulefm.SpeedButton11Click(Sender: TObject);
begin
adoquery1.Refresh;
end;

procedure Tnorulefm.SpeedButton3Click(Sender: TObject);
VAR
   sqlstr:string;
begin


   sqlstr:='select * from numberrule order by ȷ��' ;

     with ADOQuery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             //count:=RecordCount;
         end;
       MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
end;



procedure Tnorulefm.SpeedButton4Click(Sender: TObject);
begin
adoquery1.Edit;
adoquery1.Post;
end;

procedure Tnorulefm.SpeedButton2Click(Sender: TObject);
begin
adoquery1.Edit;
end;

procedure Tnorulefm.SpeedButton1Click(Sender: TObject);
begin
if   application.MessageBox('�����Ҫɾ��ѡ���Ĺ����𣿣�','HME��ʾ��          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
         adoquery1.Delete;
      except

           showmessage('ɾ��ʧ�ܣ�����    ') ;
      end;

      end;
end;

procedure Tnorulefm.SpeedButton5Click(Sender: TObject);
begin
addrulefm.showmodal;
end;

procedure Tnorulefm.SpeedButton7Click(Sender: TObject);
begin
try
    if (adoquery1.Active=true)and(trim(adoquery1.FieldValues['����'])<>'') then
    try
       adoquery1.Edit;
       adoquery1.FieldValues['״̬']:='��ȷ��';
       adoquery1.Post;
    except
    application.MessageBox('  û�п��Բ�������Ч�У���ѡ��һ����Ч�У���                ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

    end
       else
         application.MessageBox('  û�п��Բ�����Ч�У���ѡ��һ����Ч�У���               ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
  except
         showmessage('��Ч������     ');
  end;
end;

end.
