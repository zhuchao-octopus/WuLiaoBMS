unit lingjian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, luut, Menus, DB, ADODB, ComCtrls, Grids, DBGrids, StdCtrls,
  ExtCtrls, Buttons, ToolWin;

type
  Tlufm2 = class(Tlufm)
    SpeedButton1: TSpeedButton;
    map: TADOTable;
    querybom: TADOQuery;
    ToolBar6: TToolBar;
    ToolBar7: TToolBar;
    Label3: TLabel;
    Edit4: TEdit;
    CoolBar4: TCoolBar;
    ToolBar8: TToolBar;
    Label5: TLabel;
    Edit5: TEdit;
    CoolBar5: TCoolBar;
    ToolBar9: TToolBar;
    Label6: TLabel;
    Edit6: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    mn:string;
  end;

var
  lufm2: Tlufm2;

implementation
          uses bomedit,bommaping,dmut;
{$R *.dfm}
function existbom(tablename:string):boolean;
var
str:string;

begin
    str:='select * from sysobjects where id = object_id('+''''+tablename+''''+')';

     with lufm2.querybom do
         begin
             Close;
             SQL.Clear;
             SQL.Add(str);
             Open;
             if recordcount>=1 then
                result:=true
             else result:=false;
         end;

end;
procedure Tlufm2.SpeedButton1Click(Sender: TObject);
var
  liaohao :string;
begin

 if bomeditfm.ADOTable1.Active<>true then
    begin
         application.MessageBox('��ѡ��Ҫ�༭��BOM ���� û��BOM�ɹ�������           ','HME��ʾ��',mb_ok+MB_ICONERROR);
         abort;
    end;
 liaohao:=bomeditfm.ADOQuery1.FieldValues['�Ϻ�'];
//liaohao:=bomeditfm.ADOTable1.TableName
 if liaohao=adoquery1.FieldValues['�Ϻ�'] then
 begin
     application.MessageBox('�㲻�ܽ�������룬���Ϻ�Ϊ��ǰBOM�Ϻ�           ','HME��ʾ��',mb_ok+MB_ICONERROR);
     abort;
 end;
  liaohao:=ADOQuery1.FieldValues['�Ϻ�'];
 if (liaohao[1]='9')and(liaohao[2]='9') then
 begin
     application.MessageBox('���Ϻ�Ϊһ��Ʒ�Ϻţ����ܼ��뵱ǰBOM          ','HME��ʾ��',mb_ok+MB_ICONERROR);
     abort;
 end;


    try
       bomeditfm.ADOTable1.Append;
       bomeditfm.ADOTable1.FieldValues['�Ϻ�']:=adoquery1.FieldValues['�Ϻ�'];
       bomeditfm.ADOTable1.Post;
       application.MessageBox('  ��ӳɹ�����                ','��ʾ',mb_ok+MB_ICONinformation);
    except
       application.MessageBox('  ��Ӵ�ʧ�ܣ������ܵ�ǰBOM���Ѵ��ڴ���                 ','����',mb_ok+MB_ICONERROR);
    end;
end;

procedure Tlufm2.FormActivate(Sender: TObject);
begin
  //speedbutton3.Click;
end;

procedure Tlufm2.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
edit3.Text:=edit6.Text;
  inherited;

end;

procedure Tlufm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
edit1.Text:=edit5.Text;
  inherited;

end;

procedure Tlufm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
edit2.Text:=edit4.Text;
  inherited;

end;

procedure Tlufm2.SpeedButton4Click(Sender: TObject);
begin
  inherited;
lufm2.Update;
edit1.Update;
edit1.Visible:=true;
edit1.Text:='asfdsfdsfdsfdsfdsf';
end;

procedure Tlufm2.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  edit5.Text:=adoquery1.FieldValues['�Ϻ�'];
  edit6.Text:=adoquery1.FieldValues['���˵��'];
  edit4.Text:=adoquery1.FieldValues['Ʒ��'];
end;

end.
