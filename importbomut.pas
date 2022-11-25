unit importbomut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, Menus;

type
  Timportbom = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N5: TMenuItem;
    N2: TMenuItem;
    N41: TMenuItem;
    N3: TMenuItem;
    EXCEL2: TMenuItem;
    EXCEL1: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N4: TMenuItem;
    N13: TMenuItem;
    N35: TMenuItem;
    N14: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton11: TSpeedButton;
    ToolButton4: TToolButton;
    SpeedButton7: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton6: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure N5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  importbom: Timportbom;

implementation

uses dmut;

{$R *.dfm}

procedure Timportbom.N5Click(Sender: TObject);
begin
close;
end;

procedure Timportbom.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Timportbom.N48Click(Sender: TObject);
var
 i,j,jieceng,nextjieceng:integer;
 p,pl,ti:integer;
strs:string;
liaohao,preliaohao:string;
ldb,dbl:Tadotable;
tn:array[0..100] of string;
tj:array[0..100] of integer;
begin
ldb:=form1.ldb;
ti:=0;
for p:=low(tn) to high(tn) do
   begin
       tn[p]:='';
       tj[p]:=101;
   end;
i:=k;
j:=l;
jieceng:=0;
nextjieceng:=0;
   //ds.Close;
   //ds.TableName:=tablename;
   //ds.Active:=true;
   form11.ProgressBar1.Position:=0;
   form11.ProgressBar2.Position:=0;
   form11.ProgressBar2.Max:=strtoint(form11.Edit1.Text);
   form11.ProgressBar1.Max:=strtoint(form11.Edit2.Text);
 // form1.adotable1.First;
   //form1.ADOTable1.Open;
   for i:=k to m do
    begin
       form11.Edit1.Text:=inttostr(i);
       form11.Update;

         liaohao:=form1.OleContainer1.OleObject.application.cells[i,4].value;
         jieceng:=strtoint(form1.OleContainer1.OleObject.application.cells[i,3].value);
         nextjieceng:=strtoint(form1.OleContainer1.OleObject.application.cells[i+1,3].value);
         fomatliaohao(liaohao,liaohao);
        { case jieceng of
            0: tn[0]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            1: tn[1]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            2: tn[2]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            3: tn[3]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            4: tn[4]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            5: tn[5]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            6: tn[6]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            7: tn[7]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
            8: tn[8]:=form1.OleContainer1.OleObject.application.cells[i,4].value;
         end; }


         if jieceng<nextjieceng then
             begin
                   if existbom(liaohao)=false then
                    dm.createtable(liaohao);
                    ldb.Close;
                    ldb.TableName:='lingjianliaohao';
                    ldb.Active:=true;
                    ds.Active:=false;
                    dbl:=ldb;
                    tn[ti]:=liaohao;
                    tj[ti]:=jieceng;
                    ti:=ti+1;
             end
             else
            begin
                      for   pl:=low(tj) to high(tj)   do
                       begin
                           if tj[100-pl]<>101 then
                           begin
                               if tj[100-pl]=jieceng-1 then
                               begin
                               preliaohao:=tn[100-pl];
                               break;
                               end;
                           end;
                       end;
                    ds.Close;
                    ds.TableName:=preliaohao;
                    ds.Active:=true;
                    ldb.Active:=false;
                    dbl:=ds;
            end;
              dbl.Close;
              dbl.Open;
         if ldb.TableName<>'lingjianliao' then
                      begin
                          l:=6;
                      end;
         for j:=0 to l-1 do
              begin
                   dbl.Edit;
                   strs:=form1.OleContainer1.OleObject.application.cells[i,j+2].value;                //stringreplace(str,'''','',[rfReplaceAll]);
                   dbl.Fields.Fields[j].Value:=strs;
                   form11.ProgressBar1.StepBy(1);

              end;
           try
           dbl.Append;
           except
           //application.MessageBox('导入数据表时出现错误！','导入数据错误',mb_ok+MB_ICONSTOP);
           //abort;
           end;

           form11.ProgressBar1.Position:=0;
           form11.ProgressBar2.StepBy(1);
          // form1.ADOTable1.Insert;;
          // form1.adotable1.Last;

          // form1.adotable1.Append;
         //  form1.ADOTable1.
        // form1.ADODataSet1.DataSetField.FieldValues[1]:=form1.OleContainer1.OleObject.application.cells[i,j].value;
    end;
   // form1.ADOTable1.Post;
   form11.ProgressBar1.Position:=strtoint(form11.Edit2.Text);

end;


end.
