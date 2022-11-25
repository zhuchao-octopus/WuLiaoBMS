unit checkappliaout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ComCtrls, Buttons, ToolWin;

type
  Tcheckappliaofm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    SpeedButton9: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButton6: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    StatusBar1: TStatusBar;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checkappliaofm: Tcheckappliaofm;

implementation
     uses dmut,glbut;
{$R *.dfm}

procedure Tcheckappliaofm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tcheckappliaofm.SpeedButton1Click(Sender: TObject);
begin
adotable1.Edit;
adotable1.Post;
end;

procedure Tcheckappliaofm.SpeedButton2Click(Sender: TObject);
begin
adotable1.Refresh;
end;

procedure Tcheckappliaofm.SpeedButton9Click(Sender: TObject);
begin
adotable1.Close;
adotable1.Active:=true;
MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
end;

procedure Tcheckappliaofm.SpeedButton5Click(Sender: TObject);
begin
if   application.MessageBox('你真的要删除当前记录吗？？','HME提示？          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
         adotable1.Delete;
      except

           showmessage('删除失败！！！    ') ;
      end;

      end;
      MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
end;

procedure Tcheckappliaofm.SpeedButton7Click(Sender: TObject);
begin
adotable1.Edit;
end;

procedure Tcheckappliaofm.ADOTable1BeforePost(DataSet: TDataSet);
begin
if   application.MessageBox('你要保存编辑过的记录吗？','HME提示？          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
          abort;
        // adoquery1.Post;
      except

          // showmessage('fdfdsfs') ;
      end;

      end
      else
      begin
              adotable1.Cancel;
              dataset.Cancel;
              abort;
        end;

end;

end.
