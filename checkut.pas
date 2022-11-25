unit checkut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, Buttons, ToolWin, DB, ADODB;

type
  Tcheckfm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    SpeedButton6: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checkfm: Tcheckfm;

implementation
   uses glbut,dmut;
{$R *.dfm}

procedure Tcheckfm.SpeedButton9Click(Sender: TObject);
begin
     stop:=true;
close;
end;

procedure Tcheckfm.SpeedButton5Click(Sender: TObject);
begin
if   application.MessageBox('你真的要删除当前记录吗？？','HME提示？          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
         ADOQuery1.Delete;
      except

           showmessage('删除失败！！！    ') ;
      end;

      end;

end;

procedure Tcheckfm.SpeedButton1Click(Sender: TObject);
begin
try
  adoquery1.Post;
except

end;
end;

procedure Tcheckfm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tcheckfm.FormActivate(Sender: TObject);
begin
//datasource1.DataSet:=dm.ADOQuery1;
//dm.ADOQuery1.Open;
end;

procedure Tcheckfm.SpeedButton3Click(Sender: TObject);
begin
stop:=false;
close;
end;

end.
