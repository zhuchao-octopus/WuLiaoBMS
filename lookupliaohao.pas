unit lookupliaohao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, luut, Menus, DB, ADODB, ComCtrls, Grids, DBGrids, StdCtrls,
  ExtCtrls, Buttons, ToolWin;

type
  Tlookupliaohaofm = class(Tlufm)
    SpeedButton1: TSpeedButton;
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
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    liaohao:string;
    guigeshuoming:string;
    pinming,customer,cusno,versions,model:string;
    yongliang:string;
    
  end;

var
  lookupliaohaofm: Tlookupliaohaofm;

implementation

{$R *.dfm}

procedure Tlookupliaohaofm.SpeedButton1Click(Sender: TObject);
begin
 if adoquery1.Active=true then
    begin
        if  adoquery1.FieldValues['料号']=null then
        liaohao:='' else
        liaohao:=adoquery1.FieldValues['料号'];
        if adoquery1.FieldValues['规格说明']=null then
        guigeshuoming:='' else
        guigeshuoming:=adoquery1.FieldValues['规格说明'];
        if adoquery1.FieldValues['品名']=null then
        pinming:='' else
        pinming:=adoquery1.FieldValues['品名'];
      //  if adoquery1.FieldValues['客户机种号']=null then
      //  customer:='' else
      //  customer:=adoquery1.FieldValues['客户机种号'];
      //  if adoquery1.FieldValues['客户']=null then
     //   cusno:='' else
     //   cusno:=adoquery1.FieldValues['客户'];
     //   if adoquery1.FieldValues['机种']=null then
     //   model:='' else
     //   model:=adoquery1.FieldValues['机种'];
     //   versions:=adoquery1.FieldValues['最新版本'];

       // yongliang:=adoquery1.FieldValues['单位用量'];
    end;
    close;
end;

procedure Tlookupliaohaofm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
edit2.Text:=edit4.Text;
  inherited;

end;

procedure Tlookupliaohaofm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
edit1.Text:=edit5.Text;
  inherited;

end;

procedure Tlookupliaohaofm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
edit3.Text:=edit6.Text;
  inherited;

end;

procedure Tlookupliaohaofm.SpeedButton6Click(Sender: TObject);
begin
guigeshuoming:='cancel';
  inherited;

end;

end.
