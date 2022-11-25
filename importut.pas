unit importut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, Buttons, ImgList, ExtCtrls, Grids,
  DBGrids, DB, DBTables, ADODB,comobj, StdCtrls, OleCtnrs, jpeg,unit2,shellapi,
  dbcgrids,QGraphics;

type
  Timportfm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    SpeedButton2: TSpeedButton;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    N5: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    ImageList1: TImageList;
    EXCEL2: TMenuItem;
    SpeedButton7: TSpeedButton;
    OleContainer1: TOleContainer;
    ToolButton1: TToolButton;
    SpeedButton6: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ToolButton4: TToolButton;
    N35: TMenuItem;
    EXCEL1: TMenuItem;
    N41: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    N47: TMenuItem;
    N48: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    FontDialog1: TFontDialog;
    ADOTable1DSDesigner: TStringField;
    ADOTable1DSDesigner2: TWideStringField;
    ADOTable1DSDesigner3: TStringField;
    ADOTable1DSDesigner4: TStringField;
    ADOTable1DSDesigner5: TStringField;
    ADOTable1DSDesigner6: TWideStringField;
    ADOTable1DSDesigner7: TStringField;
    ADOTable1DSDesigner8: TStringField;
    SpeedButton12: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N7: TMenuItem;
    N19: TMenuItem;
    ADOTable1DSDesigner9: TStringField;
    ADOTable4: TADOTable;
    N20: TMenuItem;
    N23: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
   // procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure EXCEL2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure ADOTable1BeforeInsert(DataSet: TDataSet);
    procedure N37Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure BOM1Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure insettodatabase(k,m,l:integer;tablename:string;ds:tadotable);
    procedure FormActivate(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure BOMLIST1Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure ENC1Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BOM5Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure BOM6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    PROCEDURE setcommonuser();
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure setedit();
    procedure createExcelbyfile(excelfilename:string);
    procedure exportData();
   // procedure SpeedButton13Click(Sender: TObject);
  
  private
    { Private declarations }

  public
    { Public declarations }
  end;
  //  procedure insettodatabase(k,l:integer;tablename:string);
var
  importfm: Timportfm;
  v,excel:variant;
 // excelfilename:string;
implementation

uses  Unit11, dmut, Unit22;

{$R *.dfm}
procedure snapole(ole:boolean);
begin
    if ole=false then
     begin
      importfm.OleContainer1.Visible:=false;
      importfm.DBGrid1.Visible:=true;
      importfm.Panel3.Visible:=true;
      end
     else
        begin
           importfm.OleContainer1.Visible:=true;
           importfm.DBGrid1.Visible:=false;
           importfm.Panel3.Visible:=false;
           importfm.OleContainer1.Align:=alclient;
        end;
end;


procedure timportfm.createExcelbyfile(excelfilename:string);
begin

olecontainer1.createObjectFromFile(excelfilename,false);
  snapole(true);
  //olecontainer1.Visible:=true;
 OleContainer1.doverb(0);
 OleContainer1.OleObject.application.CommandBars['Standard'].Visible:=false;
 OleContainer1.OleObject.application.CommandBars['Formatting'].Visible:=false;
 OleContainer1.OleObject.application.CommandBars['Reviewing'].Visible:=false;
 OleContainer1.doverb(0);
//olecontainer1.Align:=alclient;
//olecontainer1.show;

excelflag:=true;


end;


PROCEDURE timportfm.setcommonuser();
begin
   importfm.EXCEL1.Enabled:=false;
   importfm.N47.Enabled:=false;
   importfm.N48.Enabled:=false;
end;
procedure getdatas();
begin
 // excel.range:=excel_grid1.OleObject.application.selection;
end;
procedure getexcel(excel:variant);
begin

end;

//procedure createExcelbyfile(excelfilename:string);
//type
//Texarr=array[0..500,0..20] of variant;
//var
//datas:_recordset;
//olecon:Tolecontainer;
//c,r,I,j:integer;
//exarr:texarr;

//begin
//Olecon:= TOleContainer.Create(olecon);
//importfm.olecontainer1.createObjectFromFile(excelfilename,false);
//importfm.olecontainer1.show;
//importfm.olecontainer1.doverb(0);
//v:=olecon.OleObject;
//importfm.dbgrid1.Visible:=false;
//importfm.olecontainer1.Align:=alclient;
//importfm.OleContainer1.visible:=true;
 //importfm.AC.CommandText:='';
 //importfm.AC.CommandText:='select * from '+tn+'';
 //datas:=importfm.AC.Execute;
 //c:=datas.Fields.Count;
 //r:=datas.RecordCount;

 
//excel:=importfm.OleContainer1.OleObject;
//v.workbooks.add(-4167);
//v.workbooks[1].sheets[1].name:=excelfilename;
//sheet:=v.workbooks[1].sheets[excelfilename];

//end;

procedure timportfm.setedit;
begin
   importfm.dbgrid1.ReadOnly:=false;
   //importfm.adotable1.Close;
  // importfm.adotable1.ReadOnly:=false;
  // importfm.adotable1.Open;
   importfm.adotable1.Edit;
end;

procedure createExcel(var v:variant);
var
sheet:variant;
tablename:string;
begin
tablename:=importfm.ADOTable1.TableName;
v:=createoleobject('Excel.Application');
v.visible:=true;
v.workbooks.add(-4167);
v.workbooks[1].sheets[1].name:=tablename;
sheet:=v.workbooks[1].sheets[tablename];
end;

procedure gettitles(vv:variant);
var l :integer ;
begin
            for l:=1 to importfm.ADOTable1.FieldCount do
                begin
                   vv.workbooks[1].sheets[1].cells[1,l]:=importfm.ADOTable1.Fields.Fields[l-1].FieldName  ;
                end;
end;

procedure Timportfm.exportData();
var
I,j:integer;
begin
createExcel(v);
gettitles(v);
importfm.ADOTable1.First;
for I:=1 to importfm.ADOTable1.RecordCount do
    begin

         for j:=1 to importfm.ADOTable1.FieldCount do
             begin

                 v.workbooks[1].sheets[1].cells[I,j]:=importfm.ADOTable1.Fields.Fields[j-1].Value;

             end;
        importfm.ADOTable1.Next;
    end;
END;
procedure Timportfm.BOM5Click(Sender: TObject);
var
  // fieldnamelist:tstringlist;
  count:integer;
  tablename :string;
   i:integer;
begin
//setedit;
if tablename='' then
tablename:=adotable1.TableName;
if (dbgrid1.Visible<>true)or(adotable1.Active<>true)then
   application.MessageBox('没有数据对象可供操作，请打开一个数据表文件!','数据核查错误',mb_ok+MB_ICONSTOP)

else
        begin
               stop:=false;
               importfm.ADOTable1.First;
            // dm.getfieldname(tablename);
              for i:=0 to adotable1.RecordCount-1 do
                  begin
                    //  dm.checkrecords(tablename,importfm.ADOTable1.FieldValues['规格说明'],count);
                      importfm.ADOTable1.Next;
                      if count>1 then
                      begin
                          if stop=false then
                          //   form17.showmodal
                             else
                               break;
                      end;
                  end;
           application.MessageBox('    数据核查完成!!!','数据核查',mb_ok+MB_ICONinformation);

        end;


end;


procedure Timportfm.SpeedButton6Click(Sender: TObject);
begin
close;
//if  application.MessageBox('  你真的要退出FALCON ERP系统吗？？        ','FALCON ERP 提示',mb_okCANCEL+MB_ICONinformation)=id_ok then
//application.Terminate;
end;

procedure Timportfm.N5Click(Sender: TObject);
begin
close;
//application.Terminate;
end;

{procedure Timportfm.SpeedButton8Click(Sender: TObject);
Var  //olecon: TOleContainer;
    sheet:variant;
    i,j:integer;
begin

  // olecontainer1.CreateObject('Excel.Application',true);
    //olecontainer1.Visible:=true;
    //olecontainer1.Close;
    //olecontainer1.

   // Olecon:= TOleContainer.Create(self);
     olecontainer1.InsertObjectDialog;
    //OleContainer1.OleObject.Application.ActiveCell;
    // olecon.show;
    // OleContainer1.OleObject.Application.visible:=true;
    if olecontainer1.OleClassName='Excel.Sheet.8' then
    begin
    OleContainer1.OleObject.Application.workbooks.add(-4167);
    OleContainer1.OleObject.Application.workbooks[1].sheets[1].name:='test';
    sheet:=OleContainer1.OleObject.Application.workbooks[1].sheets['test'];
    OleContainer1.OleObject.application.CommandBars['Standard'].Visible:=false;
    OleContainer1.OleObject.application.CommandBars['Formatting'].Visible:=false;
    OleContainer1.OleObject.application.CommandBars['Reviewing'].Visible:=false;
    gettitles(OleContainer1.OleObject.Application);
importfm.ADOTable1.First;
for I:=2 to importfm.ADOTable1.RecordCount do
    begin

         for j:=1 to importfm.ADOTable1.FieldCount do
             begin

                OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,j]:=importfm.ADOTable1.Fields.Fields[j-1].Value;

             end;
        importfm.ADOTable1.Next;
    end;
    end;
    olecontainer1.Visible:=true;
    olecontainer1.Align:=alclient;
   // OleContainer1.OleObject.application.visible:=true;
    //OleContainer1.doverb(0);
 //olecontainer1.InsertObjectDialog;
 //olecontainer1.Visible:=true;
 //dbgrid1.Visible:=false;
 //olecontainer1.Align:=alclient;    

end;    }

procedure Timportfm.SpeedButton7Click(Sender: TObject);
begin
   if olecontainer1.Visible=true then
     begin
      olecontainer1.Visible:=false;
      dbgrid1.Visible:=true;
      panel3.Visible:=true;
         // if adotable1.Active=true then
              //MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

      end
     else
        begin
           olecontainer1.Visible:=true;
          dbgrid1.Visible:=false;
          panel3.Visible:=false;
        end;
end;

procedure Timportfm.EXCEL2Click(Sender: TObject);
begin
if dbgrid1.Visible=true then
   exportdata()
else
   application.MessageBox('没有数据对象可供导出，请打开一个数据表文件!','导出数据错误',mb_ok+MB_ICONSTOP);

end;

procedure Timportfm.SpeedButton3Click(Sender: TObject);
begin
if (dbgrid1.Visible=true)and(adotable1.Active=true) then
begin
//setedit;
//ADOtable1.ReadOnly:=false;
dbgrid1.ReadOnly:=false;
//adotable1.Edit;
end
else
   application.MessageBox('没有数据对象可供操作，请打开一个数据表文件!','编辑数据操作终止',mb_ok+MB_ICONSTOP);

end;

procedure Timportfm.SpeedButton11Click(Sender: TObject);
begin
adotable1.Close;
adotable1.Open;
panel3.Caption:='基本物料编号管理';
MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

snapole(false);
end;

procedure Timportfm.SpeedButton2Click(Sender: TObject);
begin
//adotable1.Active:=true;
//dbgrid1.Align:=alclient;
//dbgrid1.Visible:=true;
//dbgrid1.Font.Style['fsItalic']:=(fsItalic);
if fontdialog1.Execute then
   dbgrid1.Font:=fontdialog1.Font;
end;

procedure Timportfm.SpeedButton5Click(Sender: TObject);
begin
setedit;
if (dbgrid1.Visible=true)and(adotable1.Active=true)then
           adotable1.Post
else
        begin
        application.MessageBox('没有数据对象可供操作，请打开一个数据表文件!','数据保存错误',mb_ok+MB_ICONSTOP);

        end;
end;

procedure Timportfm.SpeedButton4Click(Sender: TObject);
begin
if (dbgrid1.Visible=true)and(adotable1.Active=true)then
begin
  if application.MessageBox('你真的要删除选中的记录吗？','提示？',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
       setedit;
       adotable1.Delete;
       //adotable1.Refresh;
     end;
end
else
application.MessageBox('没有数据对象可供操作，请打开一个数据表文件!','删除数据错误',mb_ok+MB_ICONSTOP);


end;

procedure Timportfm.SpeedButton1Click(Sender: TObject);
begin
//   setedit;
    importfm.dbgrid1.ReadOnly:=false;
   // importfm.ADOTable1.Close;
   // importfm.adotable1.ReadOnly:=false;
   // importfm.ADOTable1.open;
    adotable1.Append;
    
end;

procedure Timportfm.ADOTable1BeforePost(DataSet: TDataSet);
begin
//checkliaohao(adotable1.FieldValues['料号']);
//adotable1.Cancel;
//dataset.Cancel;
if (dbgrid1.Visible=true)and(adotable1.Active=true)then
begin
if   application.MessageBox('你要保存编辑过的记录吗？','提示？',MB_OKCANCEL+MB_iconinformation)<>idok then
      begin
      try
        adotable1.Cancel;
         dataset.Cancel;
      except
      end;

      end;
end;
end;

procedure Timportfm.ADOTable1BeforeInsert(DataSet: TDataSet);
begin
//if   application.MessageBox('你要 INSERT 编辑过的记录吗？','提示？',MB_OKCANCEL+MB_iconinformation)<>idok then
     //  begin
        //  adotable1.Cancel;
     //     dataset.Cancel;

       //end;
end;   

procedure Timportfm.N37Click(Sender: TObject);
begin
if (dbgrid1.Visible=true)and(adotable1.Active=true)then
begin
  if application.MessageBox('你真的要删除选中的记录吗？','提示？',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
       setedit;
       adotable1.Delete;
       adotable1.Refresh;
     end;
end
else
application.MessageBox('没有数据对象可供操作，请打开一个数据表文件!','删除数据错误',mb_ok+MB_ICONSTOP);


end;

procedure Timportfm.N36Click(Sender: TObject);
begin

dbgrid1.Visible:=false;
olecontainer1.Visible:=false;
//panel3.Caption:='';
end;

procedure Timportfm.EXCEL1Click(Sender: TObject);
begin
//createExcel(v);
//olecontainer1.c
 olecontainer1.InsertObjectDialog ;
 //olecontainer1.CreateObject('Excel.Application',true);
 snapole(true);
end;

procedure Timportfm.N45Click(Sender: TObject);
begin
//form3.ShowModal;
end;

procedure Timportfm.N44Click(Sender: TObject);
begin
//form4.showmodal;
end;

procedure Timportfm.N43Click(Sender: TObject);
begin
//form5.showmodal;
end;

procedure Timportfm.N42Click(Sender: TObject);
begin
//form6.showmodal;
end;

procedure Timportfm.BOM1Click(Sender: TObject);
begin
//form7.showmodal;
end;

procedure Timportfm.N30Click(Sender: TObject);
begin
//form9.showmodal;
end;

procedure Timportfm.N47Click(Sender: TObject);
begin

 try
 if opendialog1.Execute then
  begin

  importfm.StatusBar1.Panels.Items[2].Text:='请稍等...     正在打开文件并读取数据！！';
  importfm.StatusBar1.Update;
  createexcelbyfile(opendialog1.FileName) ;
  excelflag:=true;
  snapole(true);


  importfm.StatusBar1.Panels.Items[2].Text:='任务完成！！';

  end;
 except
      importfm.StatusBar1.Panels.Items[2].Text:='打开文件失败，可能另一程序正在使用，请关闭它然后再试！！';
 end;

end;
procedure timportfm.insettodatabase(k,m,l:integer;tablename:string;ds:tadotable);
var i,j:integer;
strs:string;
begin
i:=k;
j:=l;
   ds.Close;
   ds.TableName:=tablename;
   ds.Active:=true;
   form11.ProgressBar1.Position:=0;
   form11.ProgressBar2.Position:=0;
   form11.ProgressBar2.Max:=strtoint(form11.Edit3.Text)-strtoint(form11.Edit1.Text);
   form11.ProgressBar1.Max:=strtoint(form11.Edit2.Text);
 // adotable1.First;
   //ADOTable1.Open;
   for i:=k to m do
    begin
       form11.Edit1.Text:=inttostr(i);
       form11.Update;
        for j:=0 to l-1 do

           begin

                                  //   setedit;
                 ds.Edit;
                 // str:='';
               //  str:=stringreplace(importfm.OleContainer1.OleObject.application.cells[i,j+1].value,' ','',[rfReplaceAll]);

                   strs:=importfm.OleContainer1.OleObject.application.cells[i,j+1].value;//stringreplace(str,'''','',[rfReplaceAll]);
                  if strs<>'' then
                  ds.Fields.Fields[j].Value:=strs;
                  form11.ProgressBar1.StepBy(1);
                                  // importfm.ADOTable1.Post;
                                  //  importfm.adotable1.Append;
           end;
           try
           ds.Append;
           except
           end;
           form11.ProgressBar1.Position:=0;
           form11.ProgressBar2.StepBy(1);
          // ADOTable1.Insert;;
          // adotable1.Last;

          // adotable1.Append;
         //  ADOTable1.
        // ADODataSet1.DataSetField.FieldValues[1]:=OleContainer1.OleObject.application.cells[i,j].value;
    end;
   // ADOTable1.Post;
   form11.ProgressBar1.Position:=strtoint(form11.Edit2.Text);

end;

procedure Timportfm.N48Click(Sender: TObject);
begin
form11.show;
end;

procedure Timportfm.FormActivate(Sender: TObject);
begin
{
 try
dm.inituser(dm.getrole(form15.Edit1.Text));
except
  application.MessageBox('     出现异常!，初始化用户信息失败 请重新登陆!!!  ','验证失败!',mb_ok+MB_ICONerror);
  abort;
end;  }




//conncettodatabase('a\macky');
//setstatebar(form15.Edit1.Text);
//form15.showmodal;
//importfm.Hide;



excelflag:=false;
end;

procedure Timportfm.N18Click(Sender: TObject);
begin
//form13.ShowModal;
end;

procedure Timportfm.BOMLIST1Click(Sender: TObject);
begin
//settable('bomlist');
adotable4.Close;
datasource1.DataSet:=adotable4;
adotable4.Open;
//settitle('BOM 文件清单管理表');
snapole(false);
end;

procedure Timportfm.N41Click(Sender: TObject);
begin
//settable('lingjianliaohao');
//settitle('物料编号管理表');
adotable1.Close;
adotable1.Open;
panel3.Caption:='基本物料编号管理';
MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

snapole(false);
end;

procedure Timportfm.N49Click(Sender: TObject);
begin
//settable('lingjianliaohao');
//settitle('零件编号管理表');
snapole(false);
end;

procedure Timportfm.N50Click(Sender: TObject);
begin
//settable('banchengpinliaohao');
//settitle('半成品料号管理表');
snapole(false);
end;

procedure Timportfm.N51Click(Sender: TObject);
begin
//settable('chengpinliaohao');
//settitle('成品料号管理表');
snapole(false);
end;

procedure Timportfm.N52Click(Sender: TObject);
begin
//settable('surplyer');
//settitle('供应商管理表');
snapole(false);
end;

procedure Timportfm.N53Click(Sender: TObject);
begin
//settable('');
//settitle('原始物料清单管理表');
snapole(false);
end;

procedure Timportfm.ENC1Click(Sender: TObject);
begin
//settable('materialbom');
//settitle('ENC管理表');
snapole(false);
end;

procedure Timportfm.N54Click(Sender: TObject);
begin
//settable('materialbom');
//settitle('成品料号文件清单管理表');
snapole(false);
end;

procedure Timportfm.N19Click(Sender: TObject);
//var
//filename,str:string;
//str1,str2,str3,str4:string;
//f:textfile;
//m,k,i,j:integer;

begin
{
if (importfm.OleContainer1.Visible=true)then
    begin
       if savedialog1.Execute then
          begin
             filename:=savedialog1.FileName;
               AssignFile(F, FileName);
                    Rewrite(F);

             writeln(f,'*PADS-ECO-V3.0-MILS*');
             writeln(f,'*REMARK*');
             writeln(f,'');
             writeln(f,'');


   for k:=1 to 100 do
    begin
    str:=importfm.OleContainer1.OleObject.application.cells[k,1].value;
     if  str='1' then
     begin
        m:=k;
         for i:=m to 1024 do
            begin
                setpannel('',true);
                for j:=3 to 4 do
                    begin
                            str:=importfm.OleContainer1.OleObject.application.cells[i,j].value;
                            if j=3 then
                               begin
                                write(f,'*SET_ATTRIBUTE* PART   ');
                                writeln(f,str);
                                end;
                            if j=4 then
                               begin
                                 write(f,'"value"   ');
                                 writeln(f,str);
                               end;
                    end;
                     writeln(f,'');
                     writeln(f,'');
                     m:=m+1  ;
                     str:=importfm.OleContainer1.OleObject.application.cells[i+1,3].value;
                    // str1:=importfm.OleContainer1.OleObject.application.cells[i+1,2].value;
                    // str2:=importfm.OleContainer1.OleObject.application.cells[i+1,3].value;
                    // str3:=importfm.OleContainer1.OleObject.application.cells[i+1,4].value;
                    // str4:=importfm.OleContainer1.OleObject.application.cells[i+1,5].value;
                     if (trim(str)='') or(str=' ') then
                       begin
                           writeln(f,'');
                           writeln(f,'');
                           writeln(f,'*END*');
                           writeln(f,'*PADS-ECO-V3.0-MILS*') ;
                           writeln(f,'*REMARK* ');
                           writeln(f,'*END*');
                           
                          closefile(f);
                          setpannel('',false);
                          showmessage('  转化完成！！');
                          break;
                       end;
           end;     //end 1024

         
      end
      else
     end;    //end100

      end;  //end savedialog
    end      //end ole

else
        begin
        application.MessageBox('没有数据对象可供操作，请打开一个数据表文件!','数据保存错误',mb_ok+MB_ICONSTOP);

        end;   }

MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

end;

procedure Timportfm.N21Click(Sender: TObject);
begin
//form16.showmodal;
end;

procedure Timportfm.N22Click(Sender: TObject);
begin
dm.ADOConnection1.Connected:=false;
end;

procedure Timportfm.N11Click(Sender: TObject);
begin

importfm.Hide;
//form15.Show;
end;

procedure Timportfm.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
importfm.StatusBar1.Panels[2].Text:='x: '+inttostr(x)+' y: '+inttostr(y);
end;

procedure Timportfm.SpeedButton10Click(Sender: TObject);
var
  // fieldnamelist:tstringlist;
  count:integer;
  tablename :string;
   i:integer;
   str:string;
begin
//setedit;

if tablename='' then
tablename:=adotable1.TableName;
if (dbgrid1.Visible<>true)or(adotable1.Active<>true)then
   application.MessageBox('没有数据对象可供操作，请打开一个数据表文件!','数据核查错误',mb_ok+MB_ICONSTOP)

else
        begin
               stop:=false;
               importfm.ADOTable1.First;

            // dm.getfieldname(tablename);
              for i:=0 to adotable1.RecordCount-1 do
                  begin
                 // adotable1.Fields.f
                      str:='';
                      if varisnull(importfm.ADOTable1.FieldValues['规格说明'])=false then
                       begin
                      str:=stringreplace(importfm.ADOTable1.FieldValues['规格说明'],' ','',[rfReplaceAll]);
                      str:=stringreplace(str,'''','',[rfReplaceAll]);
                      end
                      else
                        str:=' ';
                     // dm.checkrecords(tablename,str,count);
                      importfm.ADOTable1.Next;
                      if count>1 then
                      begin
                          if stop=false then
                            // form17.showmodal
                             else
                               break;
                      end;
                  end;
           application.MessageBox('    数据核查完成!!!','数据核查',mb_ok+MB_ICONinformation);

        end;

         

end;


procedure Timportfm.Button1Click(Sender: TObject);
//var i:integer;
begin
{//setedit();
/*for i:=0 to importfm.ADOTable1.RecordCount-1 do
    begin
    // edit1.Text:=importfm.ADOTable1.FieldValues['规格说明'];
     //importfm.ADOTable1.Next;
    fieldnamelist:=tstringlist.Create;
     fieldnamelist.Clear;
    //fieldnamelist.add(importfm.ADOTable1.fieldbyname('规格说明').Value);//.FieldValues['规格说明']);
    fieldnamelist.add (importfm.ADOTable1.FieldValues['规格说明']);
    edit1.Text:=fieldnamelist.Text;//.ValueFromIndex[0];
    edit2.Text:=importfm.ADOTable1.FieldValues['规格说明'];
     importfm.ADOTable1.Next;
     end;   */}
   //  edit1.Text:=importfm.OleContainer1.OleObject.application.cells[8,1].value;
  // speedbutton4.Visible:=true;
end;

procedure Timportfm.DBGrid1DblClick(Sender: TObject);
//var
//count :integer;
begin

 //form20.Edit1.Text:='';
// form20.Edit1.Text:=adotable1.FieldValues['料号'];
// form20.Edit1.Update;
// form20.Edit1.Text:=adotable1.FieldValues['料号'];
 //form20.Edit1.Update;
 //form20.SpeedButton5.Click;
 // form20.showmodal;
   // edit1.Text:=importfm.ADOTable1.FieldValues['料号']
 //  try
 ///  dm.selects(importfm.ADOTable1.FieldValues['料号'],count);
 //  except
       //showmessage('');
 //  end;
 //  if count>=1 then

  //   form18.ADOTable1.TableName:=importfm.ADOTable1.FieldValues['料号'];
   //  form18.showmodal;
   //  form18.Label7.Caption:='';
   //  form18.Label7.Caption:=importfm.ADOTable1.FieldValues['料号']+'  ';
end;
procedure Timportfm.BitBtn1Click(Sender: TObject);
//var i:integer;
begin
//dm.selectbom('bomlist',i);
//edit1.Text:=inttostr(pos(edit1.text,','));
//dm.createtable('dd');
end;

procedure Timportfm.N60Click(Sender: TObject);
begin
if (dbgrid1.Visible=true)and(adotable1.Active=true) then
    begin
       dbgrid1.ReadOnly:=false;
    end;
end;

procedure Timportfm.BOM6Click(Sender: TObject);
begin
//form18.ShowModal;
end;

procedure Timportfm.SpeedButton8Click(Sender: TObject);
begin
 //form20.showmodal;
end;

procedure Timportfm.N25Click(Sender: TObject);
begin
dbgrid1.Visible:=true;
olecontainer1.Visible:=true;
//panel3.Caption:='';
end;

procedure Timportfm.N6Click(Sender: TObject);
begin
//form21.showmodal;
end;

procedure Timportfm.Button2Click(Sender: TObject);
begin
//speedbutton4.Visible:=false;
end;

procedure Timportfm.Button3Click(Sender: TObject);
begin
//speedbutton4.Enabled:=true;

end;

procedure Timportfm.Button4Click(Sender: TObject);
begin
//speedbutton4.Enabled:=false;
end;

procedure Timportfm.N13Click(Sender: TObject);
begin
form22.showmodal;
end;

procedure Timportfm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
//if key=#13 then
   // locaterecord('料号',edit1.Text);
end;

procedure Timportfm.FormCreate(Sender: TObject);
begin

//try
//dm.inituser(dm.getrole(form15.Edit1.Text));
//except
//  application.MessageBox('     出现异常!，初始化用户信息失败 请重新登陆!!!  ','验证失败!',mb_ok+MB_ICONerror);
 // abort;
//end;




////在Tag属性中设置需要自动调整的列的最小宽度（固定值）
//这里将列宽值设为40px
//adoTable1.FieldByName('品名').Tag := 40;

//这里设置一个变化的值
//该值是做过运算的列标题的宽度值
//adoTable1.FieldByName('承认').Tag := 4 + Canvas.TextWidth( adoTable1.FieldByName('承认').DisplayName);
end;

procedure Timportfm.FormResize(Sender: TObject);
begin
//FixDBGridColumnsWidth(DBGrid1);

end;

procedure Timportfm.SpeedButton12Click(Sender: TObject);
begin

MakeDBGridColumnsAutoFixItsWidth(dbgrid1);





end;

procedure Timportfm.N7Click(Sender: TObject);
begin
adoTable1.FieldByName('品名').Tag := 40;
adoTable1.FieldByName('承认').Tag := 4 + Canvas.TextWidth( adoTable1.FieldByName('承认').DisplayName);
FixDBGridColumnsWidth(DBGrid1);
end;

procedure Timportfm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//if  application.MessageBox('  你真的要退出FALCON ERP系统吗？？        ','FALCON ERP 提示',mb_okCANCEL+MB_ICONinformation)=id_ok then
//application.Terminate;
//else
//if olecontainer1.
 //olecontainer1.Close;

end;

procedure Timportfm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//if  application.MessageBox('  你真的要退出FALCON ERP系统吗？？        ','FALCON ERP 提示',mb_okCANCEL+MB_ICONinformation)=id_ok then
//application.Terminate
//else
//   canclose:=false;
end;
 {
procedure Timportfm.SpeedButton13Click(Sender: TObject);
var
  i,j,k:integer;
  jieceng,PREjieceng:string;
  topliaohao,liaohao,preliaohao,oldliaohao:string;
  towliaohao,thliaohao:string;
  jieliao:array[0..100] of string;
  jie:array[0..10] of string;
begin
j:=100;
     adotable4.Close;
     datasource1.DataSet:=adotable4;
     adotable4.Open;
     adotable4.First;
     adotable3.Open;;
     //adotable1.Open;
    // adotable2.Open;
     //topliaohao:=adotable4.FieldValues['料号'];
    //  towliaohao:=adotable4.FieldValues['料号'];
     liaohao:=adotable4.FieldValues['料号'];
     if liaohao[1]<>'B' then
        liaohao:='B'+liaohao;
        liaohao:=stringreplace(liaohao,'-','',[rfReplaceAll]);
     if dm.isexistrecord('lingjianliaohao',liaohao)=false then
      dm.addlingjian_tablename(adotable4,adotable3,'lingjianliaohao');
     //dm.createtable(liaohao);
     //dm.getbomre(adotagle1,adotable2,liaohao);
     adotable4.Next;
     for i:=1 to adotable4.RecordCount-1 do
       begin
            liaohao:=adotable4.FieldValues['料号'];
            oldliaohao:=liaohao;
            if liaohao[1]<>'B' then
            liaohao:='B'+liaohao;
            liaohao:=stringreplace(liaohao,'-','',[rfReplaceAll]);
            jieceng:=trim(adotable4.FieldValues['阶层']);
            adotable4.Prior;
            preliaohao:=adotable4.FieldValues['料号'];
            if preliaohao[1]<>'B' then
            preliaohao:='B'+preliaohao;
            preliaohao:=stringreplace(preliaohao,'-','',[rfReplaceAll]);
            PREjieceng:=trim(adotable4.FieldValues['阶层']);
            adotable4.Next;
            //if dm.isexistrecord('lingjianliaohao',liaohao)=false then
           // dm.addlingjian(adotable4,adotable3,'lingjianliaohao');
            if length(jieceng)-length(prejieceng)=1 then
              begin
                thliaohao:=preliaohao;
               liaohao:=stringreplace(liaohao,'-','',[rfReplaceAll]);
                if (dm.isexistrecord('lingjianliaohao',liaohao)=false)and(dm.isexistrecord('lingjianliaohao',oldliaohao)=false) then
               dm.addlingjian_tablename(adotable4,adotable3,'lingjianliaohao');
                jieliao[j]:=preliaohao;
                jie[j]:=jieceng;
                j:=j-1;
               if form20.isbom(preliaohao)=false then
               begin
               dm.createtable(preliaohao);

               end;
                towliaohao:=preliaohao;
                if dm.isexistrecord(preliaohao,liaohao)=false then
               dm.getbomre(adotable4,adotable2,preliaohao);
               //dm.getbomre(adotagle1,adotable3,'lingjianliaohao');
               adotable4.Next;
              end;
            if length(jieceng)-length(prejieceng)<0then
              begin
                if (dm.isexistrecord('lingjianliaohao',liaohao)=false)and(dm.isexistrecord('lingjianliaohao',liaohao)=false) then
                        dm.addlingjian(adotable4,adotable3,'lingjianliaohao');
                       // towliaohao:=jieliao[length(jieceng)-1];
                       for   k:=0 to 100   do
                       begin
                           if jie[k]<>'' then
                           begin
                               if jie[k]=jieceng then
                               begin
                               towliaohao:=jieliao[k];
                               break;
                               end;
                           end;
                       end;
                  //towliaohao:=liaohao;
                  //dm.createtable(liaohao);
                  if towliaohao<>''then
                  begin
                     if dm.isexistrecord(towliaohao,liaohao)=false then
                        dm.getbomre(adotable4,adotable2,towliaohao);
                        //dm.getbomre(adotagle1,adotable3,'lingjianliaohao');
                        adotable4.Next;
                  end;
              end;
             if length(prejieceng)-length(jieceng)=0 then
            begin
             if (dm.isexistrecord('lingjianliaohao',liaohao)=false)and(dm.isexistrecord('lingjianliaohao',liaohao)=false) then
             dm.addlingjian(adotable4,adotable3,'lingjianliaohao');
                   // for   k:=0 to 100   do
                    //   begin
                       //    if jieliao[k]<>'' then
                        //   begin

                           //    towliaohao:=jieliao[k];
                           //    break;
                         
                         //  end;
                      // end;

                   //liaohao:=adotable4.FieldValues['料号'];
                   //dm.createtable(preliaohao);
                   if dm.isexistrecord(thliaohao,liaohao)=false then
                   dm.getbomre(adotable4,adotable2,thliaohao);
                  //dm.getbomre(adotagle1,adotable3,'lingjianliaohao');
                   adotable4.Next;
            end;


       end;


end;      }

end.
