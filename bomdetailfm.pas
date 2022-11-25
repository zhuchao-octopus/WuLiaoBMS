unit bomdetailfm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, DB, ADODB, Grids, DBGrids;

type
  Tbomdetail = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ToolButton1: TToolButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    ADOTable1: TADOTable;
    FontDialog1: TFontDialog;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    costomer,model,liaohao,versions,dates,guige,ecn1,ecn2:string;
    cus:boolean;
  end;

var
  bomdetail: Tbomdetail;
  jc,pm,lh,gg,yl,ljwz,cr,gdyl,dj,hj:string;
implementation
     uses dmut,glbut, ecnlist, extendbomprint, chengrenshu, extendbomqp;
{$R *.dfm}

procedure Tbomdetail.SpeedButton3Click(Sender: TObject);
begin

close;
end;

procedure Tbomdetail.SpeedButton2Click(Sender: TObject);
begin
if cus=false then
begin
chengrenshufm.ADOTable1.Close;
chengrenshufm.ADOTable1.TableName:=adotable1.TableName;
chengrenshufm.ADOTable1.Open;
chengrenshufm.customer.Caption:=costomer;
chengrenshufm.model.Caption:=model;
chengrenshufm.liaohao.Caption:=liaohao;
chengrenshufm.versions.Caption:=versions;
chengrenshufm.dates.Caption:=dates;
chengrenshufm.guige.Caption:=guige;
chengrenshufm.Preview;
end
else
begin
extendbomqpfm.ADOTable1.Close;
extendbomqpfm.ADOTable1.TableName:=adotable1.TableName;
extendbomqpfm.ADOTable1.Open;
extendbomqpfm.customer.Caption:=costomer;
extendbomqpfm.model.Caption:=model;
extendbomqpfm.liaohao.Caption:=liaohao;
extendbomqpfm.versions.Caption:=versions;
extendbomqpfm.dates.Caption:=dates;
extendbomqpfm.guige.Caption:=guige;
extendbomqpfm.QuickRep1.Preview;
end;
end;

procedure Tbomdetail.SpeedButton1Click(Sender: TObject);
begin
chengrenshufm.ADOTable1.Close;
chengrenshufm.ADOTable1.Open;
chengrenshufm.customer.Caption:=costomer;
chengrenshufm.model.Caption:=model;
chengrenshufm.liaohao.Caption:=liaohao;
chengrenshufm.versions.Caption:=versions;
chengrenshufm.dates.Caption:=dates;
chengrenshufm.guige.Caption:=guige;


chengrenshufm.Print;
end;

procedure Tbomdetail.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  liaohao:string;
begin
try
liaohao:=adotable1.FieldValues['�Ϻ�'];
except
end;
with DBGrid1 do 
begin 
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then 
begin 
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy; 
end 
else 
begin
if (liaohao[1]='9')and(liaohao[3]='X') then
    canvas.Font.Style:=[fsbold];
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=Clcream {����������У�DBGrid�����԰�ɫ��ʾ}

//else if adotable1.FieldValues['��������']='Proplem' then
//   Canvas.brush.Color :=clRed {�����ż���У�DBGrid������ǳ��ɫ��ʾ}                      //set bursh
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}

end;


DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��} 
end; 
end;

procedure Tbomdetail.FormActivate(Sender: TObject);
begin
 MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
statusbar1.Panels.Items[2].Text:=inttostr(adotable1.RecordCount);
end;

procedure Tbomdetail.SpeedButton4Click(Sender: TObject);
begin
if fontdialog1.Execute then
dbgrid1.Font:=fontdialog1.Font
end;

procedure Tbomdetail.SpeedButton5Click(Sender: TObject);
var
i:integer;
begin
ecnlistfm.ADOQuery1.Close;
ecnlistfm.ADOQuery1.SQL.Clear;
ecnlistfm.ADOQuery1.SQL.Add('select * from ecr where liaohao='+''''+trim(liaohao)+'''');
ecnlistfm.ADOQuery1.Open;
ecnlistfm.ADOQuery1.Edit;
for i:=0 to ecnlistfm.ADOQuery1.RecordCount-1 do
begin
    ecnlistfm.ADOQuery1.FieldValues['Ecn_ID']:=i+1;
    ecnlistfm.ADOQuery1.Post;

end;
ECNLISTFM.customer.Caption:=costomer;
ECNLISTfm.model.Caption:=model;
ECNLISTfm.liaohao.Caption:=liaohao;
ECNLISTfm.versions.Caption:=versions;
ECNLISTfm.dates.Caption:=dates;
ECNLISTfm.guige.Caption:=guige;
ecnlistfm.username.caption:=userrealname;
ECNLISTFM.Preview;
end;

procedure Tbomdetail.SpeedButton6Click(Sender: TObject);
begin
adotable1.Edit;
adotable1.Delete;
end;

procedure Tbomdetail.SpeedButton7Click(Sender: TObject);
var
counter:integer;
begin

{if adotable1.Fields.Count=8 then
   begin
       pm:=adotable1.FieldValues['Ʒ��'];
       jc:=adotable1.FieldValues['�ײ�'];
       lh:=adotable1.FieldValues['�Ϻ�'];
       gg:=adotable1.FieldValues['���˵��'];
       yl:=adotable1.FieldValues['��λ����'];
       gdyl:=adotable1.FieldValues['��������'];
       ljwz:=adotable1.FieldValues['���λ��'];
   end
else
begin
       pm:=adotable1.FieldValues['Ʒ��'];
       jc:=adotable1.FieldValues['�ײ�'];
       lh:=adotable1.FieldValues['�Ϻ�'];
       gg:=adotable1.FieldValues['���˵��'];
       yl:=adotable1.FieldValues['��λ����'];
       gdyl:=adotable1.FieldValues['��������'];
       ljwz:=adotable1.FieldValues['���λ��'];
       cr:=adotable1.FieldValues['����'] ;
       dj:=adotable1.FieldValues['����'];
       hj:=adotable1.fieldvalues['�ϼ�'];
end;
adotable1.Delete; }
//adotable1.Prior;

counter:=adotable1.FieldValues['NO_ID'];

adotable1.Edit;
adotable1.FieldValues['NO_ID']:=9999;
adotable1.Post;
adotable1.Refresh;

adotable1.Locate('NO_ID',counter-1, []);
adotable1.Edit;
adotable1.FieldValues['NO_ID']:=counter;
adotable1.Post;
adotable1.Refresh;

adotable1.Locate('NO_ID',9999, []);
adotable1.Edit;
adotable1.FieldValues['NO_ID']:=counter-1;
adotable1.Post;
adotable1.Refresh;
adotable1.Close;
adotable1.Open;
adotable1.Locate('NO_ID',counter-1, []);
//adotable1.Insert;
{if adotable1.Fields.Count=8 then
   begin
       adotable1.FieldValues['NO_ID']:=counter-1;
       adotable1.FieldValues['Ʒ��']:=pm;
       adotable1.FieldValues['�ײ�']:=jc;
       adotable1.FieldValues['�Ϻ�']:=lh;
       adotable1.FieldValues['���˵��']:=gg;
       adotable1.FieldValues['��λ����']:=yl;
       adotable1.FieldValues['��������']:=gdyl;
       adotable1.FieldValues['���λ��']:=ljwz;
   end
else
begin
       adotable1.FieldValues['NO_ID']:=counter-1;
       adotable1.FieldValues['Ʒ��']:=pm;
       adotable1.FieldValues['�ײ�']:=jc;
       adotable1.FieldValues['�Ϻ�']:=lh;
       adotable1.FieldValues['���˵��']:=gg;
       adotable1.FieldValues['��λ����']:=yl;
       adotable1.FieldValues['��������']:=gdyl;
       adotable1.FieldValues['���λ��']:=ljwz;
       adotable1.FieldValues['����']:=cr ;
       adotable1.FieldValues['����']:=dj;
       adotable1.fieldvalues['�ϼ�']:=hj;
end;  }
//adotable1.Edit;


end;

procedure Tbomdetail.SpeedButton8Click(Sender: TObject);
var
counter:integer;
begin
 
counter:=adotable1.FieldValues['NO_ID'];

adotable1.Edit;
adotable1.FieldValues['NO_ID']:=9999;
adotable1.Post;
adotable1.Refresh;

adotable1.Locate('NO_ID',counter+1, []);
adotable1.Edit;
adotable1.FieldValues['NO_ID']:=counter;
adotable1.Post;
adotable1.Refresh;

adotable1.Locate('NO_ID',9999, []);
adotable1.Edit;
adotable1.FieldValues['NO_ID']:=counter+1;
adotable1.Post;
adotable1.Refresh;
adotable1.Close;
adotable1.Open;
adotable1.Locate('NO_ID',counter+1, []);
{if adotable1.Fields.Count=8 then
   begin
       pm:=adotable1.FieldValues['Ʒ��'];
       jc:=adotable1.FieldValues['�ײ�'];
       lh:=adotable1.FieldValues['�Ϻ�'];
       gg:=adotable1.FieldValues['���˵��'];
       yl:=adotable1.FieldValues['��λ����'];
       gdyl:=adotable1.FieldValues['��������'];
       ljwz:=adotable1.FieldValues['���λ��'];
   end
else
begin
       pm:=adotable1.FieldValues['Ʒ��'];
       jc:=adotable1.FieldValues['�ײ�'];
       lh:=adotable1.FieldValues['�Ϻ�'];
       gg:=adotable1.FieldValues['���˵��'];
       yl:=adotable1.FieldValues['��λ����'];
       gdyl:=adotable1.FieldValues['��������'];
       ljwz:=adotable1.FieldValues['���λ��'];
       cr:=adotable1.FieldValues['����'] ;
       dj:=adotable1.FieldValues['����'];
       hj:=adotable1.fieldvalues['�ϼ�'];
end;
adotable1.Delete;
adotable1.Next;
adotable1.Insert;
if adotable1.Fields.Count=8 then
   begin
       adotable1.FieldValues['Ʒ��']:=pm;
       adotable1.FieldValues['�ײ�']:=jc;
       adotable1.FieldValues['�Ϻ�']:=lh;
       adotable1.FieldValues['���˵��']:=gg;
       adotable1.FieldValues['��λ����']:=yl;
       adotable1.FieldValues['��������']:=gdyl;
       adotable1.FieldValues['���λ��']:=ljwz;
   end
else
begin
       adotable1.FieldValues['Ʒ��']:=pm;
       adotable1.FieldValues['�ײ�']:=jc;
       adotable1.FieldValues['�Ϻ�']:=lh;
       adotable1.FieldValues['���˵��']:=gg;
       adotable1.FieldValues['��λ����']:=yl;
       adotable1.FieldValues['��������']:=gdyl;
       adotable1.FieldValues['���λ��']:=ljwz;
       adotable1.FieldValues['����']:=cr ;
       adotable1.FieldValues['����']:=dj;
       adotable1.fieldvalues['�ϼ�']:=hj;
end;    }
//adotable1.Edit;
//adotable1.Post;
end;

end.
