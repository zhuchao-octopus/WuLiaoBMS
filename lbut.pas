unit lbut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, DB, ADODB, Grids, DBGrids, StdCtrls,
  ExtCtrls;

type
  Tlbfm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton6: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    FontDialog1: TFontDialog;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Edit4: TEdit;
    FontDialog2: TFontDialog;
    SpeedButton3: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure lookupbom(keystr,fieldname:string);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure browsedata();
   // procedure lookupbom(tablename:string;var count:integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lbfm: Tlbfm;

implementation
uses glbut,luut;
{$R *.dfm}

{procedure tlbfm.lookupbom(tablename:string;var count:integer);
var
str:string;
begin
    str:='select * from sysobjects where id = object_id('+''''+tablename+''''+')';
     //str:='select * from sysobjects where id=object_id(''''bomlist'''')';
     with adoquery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(str);
             Open;
             count:=RecordCount;
         end;
end;                 }

procedure Tlbfm.browsedata();
VAR
   sqlstr:string;
begin

   sqlstr:='select 品名, 料号, 规格说明,客户 from  lingjianliaohao where 品名 like'+ ''''+'%成品%'+'''' ;

     with adoquery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
end;

procedure tlbfm.lookupbom(keystr,fieldname:string);
VAR
   sqlstr:string;
begin

   sqlstr:='select 品名, 料号, 规格说明,客户 from  lingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+''''  +  ' and 品名 like'+ ''''+'%成品%'+'''' ;

     with adoquery1 do
         begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
end;
procedure Tlbfm.SpeedButton11Click(Sender: TObject);
begin
if edit1.Text<>'' then
    lookupbom(edit1.Text,'料号')
else if edit2.Text<>'' then
    lookupbom(edit2.Text,'品名')
else if edit3.Text<>'' then
    lookupbom(edit3.Text,'规格说明')
else if edit4.Text<>'' then
    lookupbom(edit4.Text,'客户');

end;

procedure Tlbfm.SpeedButton2Click(Sender: TObject);
begin
if fontdialog1.Execute then
   dbgrid1.Font:=fontdialog1.Font;
end;

procedure Tlbfm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tlbfm.SpeedButton9Click(Sender: TObject);
begin
if edit1.Text<>'' then
    lookupbom(edit1.Text,'料号')
else if edit2.Text<>'' then
    lookupbom(edit2.Text,'品名')
else if edit3.Text<>'' then
    lookupbom(edit3.Text,'规格说明')
else if edit4.Text<>'' then
 lookupbom(edit4.Text,'客户');

end;

procedure Tlbfm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupbom(edit2.Text,'品名');
   end;
end;

procedure Tlbfm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupbom(edit1.Text,'料号');
   end;
end;

procedure Tlbfm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupbom(edit3.Text,'规格说明');
   end;
end;

procedure Tlbfm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupbom(edit4.Text,'客户');
   end;
end;

procedure Tlbfm.SpeedButton3Click(Sender: TObject);
begin
browsedata();
end;

end.
