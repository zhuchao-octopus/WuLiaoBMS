unit checksurplyer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, editsurplyer, DB, ADODB, ComCtrls, Grids, DBGrids, StdCtrls,
  ExtCtrls, DBCtrls, Buttons, ToolWin;

type
  Tchecksurplyerfm = class(Teditsurplyerfm)
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checksurplyerfm: Tchecksurplyerfm;

implementation

{$R *.dfm}

procedure Tchecksurplyerfm.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if (aq.Active<>true)or (aq.FieldValues['���']='') then
  begin
      application.MessageBox('û��ѡ�ֹ�Ӧ��','��ʾ',mb_ok+mb_iconerror);
      abort;
  end;
  aq.Edit;
  aq.FieldValues['���']:='�����';
  aq.Post;
 // aq.Close;
end;

end.
