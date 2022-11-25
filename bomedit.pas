unit bomedit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, ADODB,
  StdCtrls,comobj, ImgList, Menus, Mask, DBCtrls;

type
  Tbomeditfm = class(TForm)
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Splitter1: TSplitter;
    SpeedButton6: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Splitter2: TSplitter;
    DBGrid2: TDBGrid;
    ToolBar2: TToolBar;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    tq: TADOQuery;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1DSDesigner2: TWideStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1DSDesigner4: TStringField;
    ADOQuery1DSDesigner5: TStringField;
    ADOQuery1DSDesigner6: TStringField;
    ADOQuery1DSDesigner10: TStringField;
    ADOQuery1DSDesigner11: TWideStringField;
    ADOQuery1DSDesigner12: TStringField;
    ADOQuery1DSDesigner13: TStringField;
    ADOQuery1DSDesigner14: TWideStringField;
    ADOQuery1DSDesigner15: TStringField;
    ADOQuery1DSDesigner16: TStringField;
    querybom: TADOQuery;
    t2: TADOTable;
    t3: TADOTable;
    t4: TADOTable;
    t5: TADOTable;
    t6: TADOTable;
    ADOQuery2: TADOQuery;
    SpeedButton2: TSpeedButton;
    ToolButton2: TToolButton;
    exportbom: TADOQuery;
    ad: TADOCommand;
    ADOTable1DSDesigner: TStringField;
    ADOTable1DSDesigner2: TStringField;
    ADOTable1DSDesigner3: TStringField;
    ADOTable1DSDesigner4: TStringField;
    ADOTable1DSDesigner5: TStringField;
    ImageList1: TImageList;
    t7: TADOTable;
    PopupMenu4: TPopupMenu;
    BOM2: TMenuItem;
    BOM3: TMenuItem;
    N5: TMenuItem;
    printbutton: TSpeedButton;
    N6: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TV: TTreeView;
    LV: TListView;
    bomlist: TADOQuery;
    aqljlh: TADOQuery;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Panel22: TPanel;
    cb: TComboBox;
    DataSource33: TDataSource;
    Panel21: TPanel;
    Edit10: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit3: TDBEdit;
    Lbom: TLabel;
    SButton15: TSpeedButton;
    DBEdit6: TDBEdit;
    ADOQuery1DSDesigner17: TBooleanField;
    Sp15: TSpeedButton;
    tqprelh: TADOQuery;
    T8: TADOTable;
    T9: TADOTable;
    T10: TADOTable;
    t11: TADOTable;
    AQ1DSDesigner71: TBooleanField;
    AQ1DSDesigner72: TStringField;
    Sp11: TSpeedButton;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    ListView1: TListView;
    problemn1: TMenuItem;
    saveas: TSpeedButton;
    DataSource4: TDataSource;
    PopupMenu3: TPopupMenu;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    lookupbk: TMenuItem;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ADOTable1AfterPost(DataSet: TDataSet);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure exportData();
    procedure createExcel(var v:variant);
    procedure copystring(str:string;bs,es:string;var newstr:string);
    procedure acttable(liaohao:string;ds:Tadotable);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure printbomtoexcel(v:variant;liaohao:string);

    procedure getpg(liaohao:string;var pingming:string;var guige:string;var checked:string;var ver:string);
    procedure BOM2Click(Sender: TObject);
    procedure extendbom(bomliaohao:string;l1:Ttreenode);
    procedure BOM3Click(Sender: TObject);
    procedure madeoutstr(liaohao:string;adotable:Tadotable;var ar:Tstringlist;var flag:boolean);

    procedure gettitles(v:variant);
    procedure printbuttonClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure LVClick(Sender: TObject);
    function  parseliaohao(liaohao:string):string;
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton9Click(Sender: TObject);
    procedure sumno(str:string;var count:double;var strs:string;var dwh:string);
    procedure getbomlists(liaohao:string);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure SButton15Click(Sender: TObject);
    procedure backupbom(backupliaohao:string;liaohao:string);
    procedure createprintbom(tablename:string);
    procedure updatestatus(liaohao:string);
    procedure setstatus(lh:string);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure checkbomrecord(lh:string);
    procedure checkbomrecords(liaohao:string);
    procedure Sp15Click(Sender: TObject);
    procedure madeoutstr_excel(liaohao:string;adotable:Tadotable;var ar:Tstringlist;var flag:boolean);
    procedure DBGrid1Exit(Sender: TObject);
    procedure Sp11Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure getmodel(model:string);
    procedure getbomlistbymodal(modal:string);
    procedure saveasClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBEdit6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBEdit3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure createbomforprint(tablename:string);
    procedure lookupbkClick(Sender: TObject);
    procedure checkwh(f:boolean);
    function checkmodel(model:string;var substrs:array of string):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getbomlist();
    procedure printtoexcel(v:variant;i,j:integer;ar:Tstringlist;size_x,size_y:integer;flag:boolean);
    procedure printbomtotable(v:Tadotable;liaohao:string);
  end;

var
  bomeditfm: Tbomeditfm;
   lastliao:string;
   a:Ttreenode;
   Jie_No,counter:integer;
   cus:boolean;
   quantity:double;
   tabpageshow1:boolean;
   printonelayer:boolean;
implementation
     uses glbut, lingjian,BOM,dmut, bomdelete, liaohaolist, bommaping,bomdetailfm,
  LOOKUPBOM, lookupliao, editbom, printsetup, appliaohao, problemreport,
  saveas, lookupbackup, checklh;
{$R *.dfm}
procedure Tbomeditfm.setstatus(lh:string);
begin
    tq.Close;
    tq.SQL.Clear;
    tq.SQL.Add('select * from lingjianliaohao where 料号='+''''+lh+'''');
    tq.Open;
    if tq.RecordCount>=1 then
       begin
           tq.Edit;
       //  if tq.FieldValues['状态']<>true then         //=true 
            tq.FieldValues['承认']:='已核准' ;
           tq.Post;
       end;
end;
procedure Tbomeditfm.updatestatus(liaohao:string);
var
  i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11:integer;
  tablename:string;
begin
 statusbar1.Panels.Items[3].Text:='请稍等...正在更新BOM状态！！.................' ;
 statusbar1.Update;

                    fomatliaohao(liaohao,tablename);
                         if existbom(tablename)=true then
                            begin
                                 acttable(tablename,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 setstatus(trim(t2.FieldValues['料号']));
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                      fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                           setstatus(trim(t3.FieldValues['料号']));
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin

                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 setstatus(trim(t4.FieldValues['料号']));
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin

                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                       setstatus(trim(t5.FieldValues['料号']));
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin

                                                                            fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                               setstatus(trim(t6.FieldValues['料号']));
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin

                                                                                       fomatliaohao(trim(t7.FieldValues['料号']),liaohao);
                                                                                       if existbom(liaohao)=true then
                                                                                       begin
                                                                                        setstatus(trim(t7.FieldValues['料号']));
                                                                                         acttable(liaohao,t8);
                                                                                          for i8:=0 to t8.recordcount-1 do
                                                                                          begin

                                                                                            fomatliaohao(trim(t8.FieldValues['料号']),liaohao);
                                                                                             if existbom(liaohao)=true then
                                                                                             begin
                                                                                             setstatus(trim(t8.FieldValues['料号']));
                                                                                               acttable(liaohao,t9);
                                                                                                for i9:=0 to t9.recordcount-1 do
                                                                                                begin

                                                                                                  fomatliaohao(trim(t9.FieldValues['料号']),liaohao);
                                                                                                  if existbom(liaohao)=true then
                                                                                                     begin
                                                                                                     setstatus(trim(t9.FieldValues['料号']));
                                                                                                     acttable(liaohao,t10);
                                                                                                       for i10:=0 to t10.recordcount-1 do
                                                                                                           begin

                                                                                                              fomatliaohao(trim(t10.FieldValues['料号']),liaohao);
                                                                                                             if existbom(liaohao)=true then
                                                                                                                begin
                                                                                                                setstatus(trim(t10.FieldValues['料号']));
                                                                                                                   acttable(liaohao,t11);
                                                                                                                   for i11:=0 to t11.recordcount-1 do
                                                                                                                      begin
                                                                                                                          

                                                                                                                           t11.next;
                                                                                                                      end;
                                                                                                                end;
                                                                                                            t10.next;
                                                                                                           end;
                                                                                                     end;
                                                                                                  t9.next;
                                                                                                end;
                                                                                             end;
                                                                                            t8.Next;
                                                                                          end;
                                                                                       end;
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;


  statusbar1.Panels.Items[3].Text:='更新BOM状态完毕！！！！！';
end;
procedure Tbomeditfm.checkbomrecord(lh:string);
var
 counter:integer;
begin
    tq.Close;
    tq.SQL.Clear;
    tq.SQL.Add('select * from lingjianliaohao where 料号='+''''+lh+'''');
    tq.Open;
    if tq.RecordCount<1 then
       begin
            tq.Close;
            tq.SQL.Clear;
            tq.SQL.Add('select * from prelingjianliaohao where 料号='+''''+lh+'''');
            tq.Open;
            if tq.RecordCount<1 then
               begin
               if checklhfm.C2.Checked=true then
                   begin
                   tqprelh.Close;
                   tqprelh.SQL.Clear;
                   tqprelh.SQL.Add('select * from prelingjianliaohao where 申请人='+''''+userrealname+'''');
                   tqprelh.Open;
                   tqprelh.Append;
                   tqprelh.FieldValues['料号']:=lh;
                   tqprelh.FieldValues['规格说明']:='待定';
                   tqprelh.FieldValues['申请人']:=userrealname;
                   tqprelh.Post;
                   dbgrid4.Visible:=true;
                   end
               else
                   begin
                        listview1.Items.Add;
                        counter:=listview1.Items.Count;
                        listview1.Items[counter-1].Caption:=adotable1.FieldValues['料号'];
                        listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
                        listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
                        listview1.Items[counter-1].SubItems.add('非法的料号');
                   end;
               
               end;
       end;
end;
procedure tbomeditfm.checkbomrecords(liaohao:string);
var
  i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11:integer;
  tablename:string;
begin
 statusbar1.Panels.Items[3].Text:='请稍等...正在检查BOM！！.................' ;
 statusbar1.Update;

                    fomatliaohao(liaohao,tablename);
                         if existbom(tablename)=true then
                            begin
                                 acttable(tablename,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         checkbomrecord(trim(t2.FieldValues['料号']));
                                      if checklhfm.R2.Checked=true then
                                         begin
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin

                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                     checkbomrecord(trim(t3.FieldValues['料号']));
                                                      fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin

                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            checkbomrecord(trim(t4.FieldValues['料号']));
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin

                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   checkbomrecord(trim(t5.FieldValues['料号']));
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin

                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            checkbomrecord(trim(t6.FieldValues['料号']));
                                                                            fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin

                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      checkbomrecord(trim(t7.FieldValues['料号']));
                                                                                      fomatliaohao(trim(t7.FieldValues['料号']),liaohao);
                                                                                       if existbom(liaohao)=true then
                                                                                       begin
                                                                                         acttable(liaohao,t8);
                                                                                          for i8:=0 to t8.recordcount-1 do
                                                                                          begin
                                                                                           checkbomrecord(trim(t8.FieldValues['料号']));
                                                                                            fomatliaohao(trim(t8.FieldValues['料号']),liaohao);
                                                                                             if existbom(liaohao)=true then
                                                                                             begin
                                                                                               acttable(liaohao,t9);
                                                                                                for i9:=0 to t9.recordcount-1 do
                                                                                                begin
                                                                                                 checkbomrecord(trim(t9.FieldValues['料号']));
                                                                                                  fomatliaohao(trim(t9.FieldValues['料号']),liaohao);
                                                                                                  if existbom(liaohao)=true then
                                                                                                     begin
                                                                                                     acttable(liaohao,t10);
                                                                                                       for i10:=0 to t10.recordcount-1 do
                                                                                                           begin
                                                                                                            checkbomrecord(trim(t10.FieldValues['料号']));
                                                                                                              fomatliaohao(trim(t10.FieldValues['料号']),liaohao);
                                                                                                             if existbom(liaohao)=true then
                                                                                                                begin
                                                                                                                   acttable(liaohao,t11);
                                                                                                                   for i11:=0 to t11.recordcount-1 do
                                                                                                                      begin
                                                                                                                          checkbomrecord(trim(t11.FieldValues['料号']));
                                                                                                            
                                                                                                                           t11.next;
                                                                                                                      end;
                                                                                                                end;
                                                                                                            t10.next;
                                                                                                           end;
                                                                                                     end;
                                                                                                  t9.next;
                                                                                                end;
                                                                                             end;
                                                                                            t8.Next;
                                                                                          end;
                                                                                       end;
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;
                                           end;//checklhfm.r2.checked=true;


                                         t2.Next;
                                    end;
                            end;

  showmessage('BOM检查完毕！！！');
  statusbar1.Panels.Items[3].Text:='BOM检查完毕！！！！！';
end;
procedure Tbomeditfm.createbomforprint(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[NO_ID] [int]  primary key,                       '+
 '  [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
 '	[料号] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,         '+
 '	[阶层] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL ,    '+
 '	[单位用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[工单用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 ' 	[承认] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,           '+
 ' 	[版本] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,          '+
 '  [单价] [float] NULL default 0.00,                                   '+
 ' 	[合计] [float] NULL default 0.00,                                    '+
 '	[零件位置] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL        '+

') ON [PRIMARY]';


    //IDENTITY (1, 1) NOT NULL 
    //primary key
   //  ' 	[数量] [float] NULL default 0.00,                 '+
  // '	[序号] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

   with bomeditfm.ad do
         begin

             CommandText:='';
             CommandText:=str;
             execute;

         end;

end;
procedure tBOMEDITFM.backupbom(backupliaohao:string;liaohao:string);
var
tname:string;
v:Tadotable;
i:integer;
wenhao:string;
j:integer;
bomliststn:string;
begin
statusbar1.Panels.Items[3].Text:='请稍等...正在备份中.................' ;
statusbar1.Update;
fomatliaohao(backupliaohao,backupliaohao);
lastliao:='FullExtended' ;
bomliststn:=trim(backupliaohao);
if existbom(bomliststn)=true then
  begin
   IF  application.MessageBox('当前BOM的备份已存在,是否覆盖它！！！！','提示！',MB_YESNO+MB_iconinformation)=ID_NO then
       exit;
      with ad do
               begin
                                       CommandText:='';
                                       CommandText:='drop table '+bomliststn;
                                       try
                                       execute;

                                        except
                                        application.MessageBox('无法创建临时文件！         ','提示？',MB_OK+MB_iconinformation) ;
                                        exit;
                                        end;
               end;
  end;

 createprintbom(bomliststn) ;
 v:=Tadotable.Create(application);
 v.Connection:=dm.ADOConnection1;
 v.Close;
 v.TableName:=trim(bomliststn);
if trim(liaohao)<>'' then
       begin
         try
          printbomtotable(v,trim(liaohao));      //get data and insetinto bomlist

          except
           application.MessageBox('备份BOM出错，请手动完成BOM的备份！！','备份错误',mb_ok+MB_ICONSTOP);
           statusbar1.Panels.Items[3].Text:='备份BOM出错！！！！' ;
           statusbar1.Update;
           exit;
          end;
       end
   else
      application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);
 v.Close;
 v.Free;
//statusbar1.Panels.Items[3].Text:='正在升级中！！！！' ;
//statusbar1.Update;
statusbar1.Panels.Items[3].Text:='完成！！！' ;
end;
procedure tBOMEDITFM.createprintbom(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[NO_ID] [int] primary key ,                       '+
 '  [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
 '	[料号] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,         '+
 '	[阶层] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+
 '	[单位用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[工单用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[零件位置] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL ,       '+
 ' 	[版本] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL                '+
') ON [PRIMARY]';


    //IDENTITY (1, 1) NOT NULL 
//' 	[承认] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,           '+
// '  [单价] [float] NULL default 0.00,                                               '+

// ' 	[合计] [float] NULL default 0.00                                              '+
    //primary key
   //  ' 	[数量] [float] NULL default 0.00,                 '+
  // '	[序号] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

   with bomeditfm.ad do
         begin

             CommandText:='';
             CommandText:=str;
             execute;

         end;

end;
procedure printliaototable(v:Tadotable;ar:Tstringlist;flag:boolean);
var
n:integer;
liaohao,bomliao:string;
begin

     v.Append;
     v.FieldValues['NO_ID']:=counter;
     v.FieldValues['品名']:=ar.Strings[0];
     v.FieldValues['料号']:=ar.Strings[1];
     liaohao:=trim(ar.Strings[1]);
     v.FieldValues['阶层']:=ar.Strings[2];
     v.FieldValues['规格说明']:=ar.Strings[3];
     fomatliaohao(liaohao,bomliao);
    // if (existbom(bomliao))and (Ischecked(liaohao)) then
     //begin
     //   v.FieldValues['单位用量']:=''

    // end
    // else
     v.FieldValues['单位用量']:=ar.Strings[4];
     v.FieldValues['零件位置']:=ar.Strings[5];

     if flag=true then
        v.FieldValues['工单用量']:='Proplem'
     else v.FieldValues['工单用量']:='OK';

     if cus =true then
      begin
        v.FieldValues['单价']:=ar.Strings[6];
        v.FieldValues['合计']:=ar.Strings[7];
        v.FieldValues['承认']:=ar.Strings[8];
      end;
        v.FieldValues['版本']:=ar.Strings[9];

     v.Post;
counter:=counter+1;
end;
procedure printbominformationtotable(v:Tadotable;liaohao:string;var ar:Tstringlist);
var
  sqlstr:string;
  tqs:Tadoquery;
  n:integer;
begin

    ar.Add('ok');
    ar.Clear;
   tqs:=Tadoquery.Create(application);
   sqlstr:='select 品名, 料号, 阶层,规格说明,最新版本 from lingjianliaohao where 料号= '+''''+liaohao+'''';
   tqs.Connection:=dm.ADOConnection1;
   try
    with tqs do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);

           open;
                                            // if tqs.FieldValues['品名']<>'' then
           ar.Append(tqs.FieldValues['品名']);
                                         // if tqs.FieldValues['料号']<> '' then
           ar.Append(tqs.FieldValues['料号']) ;

           if tqs.FieldValues['阶层']<>null  then
           ar.Append(tqs.FieldValues['阶层'])
           else ar.Append(' ');
                                           // if tqs.FieldValues['规格说明']<> '' then
           ar.Append(tqs.FieldValues['规格说明']) ;

          if tqs.FieldValues['最新版本']<>null then
           ar.Append(tqs.FieldValues['最新版本'])
           else   ar.Append(' ');
            v.Append;
           
     v.Append;
     v.FieldValues['品名']:=ar.Strings[0];
     v.FieldValues['料号']:=ar.Strings[1];
     v.FieldValues['阶层']:=ar.Strings[2];
     v.FieldValues['规格说明']:=ar.Strings[3];
     v.FieldValues['单位用量']:=ar.Strings[4];        //最新版本
    // v.FieldValues['零件位置']:=ar.Strings[5];
     v.Post;
       end;
    finally
    tqs.Close;
    tqs.Free

    end;
end;
procedure Tbomeditfm.printbomtotable(v:Tadotable;liaohao:string);
var
  i1,i2,i3,i4,i5,i6,i7:integer;
//  j1,j2,j3,j4,j5,j6,j7:integer;
  sqlstr:string;
  tql:Tadotable;
  tname:string;
  ar:Tstringlist;
  //excel_No:integer;
  flag:boolean;
  
begin
 ar:=Tstringlist.Create;
 Jie_No:=1;
 counter:=1;
// excel_No:=5;
 //sqlstr:='select 料号,品名,规格说明 from lingjianliaohao where 料号='+''''+liaohao+'''';
 //tq.Close;
 //tq.SQL.Clear;
 //tq.SQL.Add(sqlstr);
 //tq.Open;
 v.Close;
 v.Open;
 fomatliaohao(liaohao,tname);               //judge that is it a bom
 if existbom(tname)=true then
 begin
   // printbominformationtotable(v,liaohao,ar);   //do not print main document bom liao
    //printtoexcel(v,excel_No,1,ar,0,6);
   // gettitles(v);
 end
 else
 begin
   application.MessageBox('没有发现可以操作的BOM！！         ','提示！',MB_OKCANCEL+MB_iconinformation) ;
   exit;
 end;

 tql:=tadotable.Create(application);          //open the first bom
 tql.Connection:=dm.ADOConnection1;
 fomatliaohao(liaohao,tname);
     with tql do
       begin
           close;
           TableName:=tname;
           Active:=true;
           First;
           for i1:=0 to tql.RecordCount-1 do
                begin
                    Jie_NO:=1;
                    madeoutstr(trim(tql.FieldValues['料号']),tql,ar,flag);
                    printliaototable(v,ar,flag);
                    if printonelayer=false then       //print onelayer bom
                    begin
                    if lastliao<>'' then
                    /////////////////////////////////////has invalid   ///////////////////
                    if trim(tql.FieldValues['料号'])=trim(lastliao) then               //  invalid
                       exit;
                    /////////////////////////////////////////////////////////////////// /
                      //  excel_No:=excel_No+1;
                    fomatliaohao(trim(tql.FieldValues['料号']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                            if not((ischecked(trim(tql.FieldValues['料号'])))and(lastliao='')) then    //核准？？
                               begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         Jie_NO:=2;
                                         madeoutstr(trim(t2.FieldValues['料号']),t2,ar,flag);
                                         printliaototable(v,ar,flag);
                                          if lastliao<>'' then
                                          if trim(t2.FieldValues['料号'])=trim(lastliao) then
                                             exit;
                                           // excel_No:=excel_No+1;
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                               if not((ischecked(trim(t2.FieldValues['料号'])))and(lastliao='')) then
                                                     begin;
                                                   acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                     Jie_NO:=3;
                                                        madeoutstr(trim(t3.FieldValues['料号']),t3,ar,flag);
                                                        printliaototable(v,ar,flag);
                                                         if lastliao<>'' then
                                                            if trim(t3.FieldValues['料号'])=trim(lastliao) then
                                                               exit;
                                                    //    excel_No:=excel_No+1;
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                         if not((ischecked(trim(t3.FieldValues['料号'])))and(lastliao='')) then
                                                           begin;
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                          Jie_NO:=4;
                                                            madeoutstr(trim(t4.FieldValues['料号']),t4,ar,flag);
                                                            printliaototable(v,ar,flag);
                                                             if lastliao<>'' then
                                                                if trim(t4.FieldValues['料号'])=trim(lastliao) then
                                                                   exit;
                                                           // excel_No:=excel_No+1;
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 if not ((ischecked(trim(t4.FieldValues['料号'])))and(lastliao='')) then
                                                                     begin;
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                 Jie_NO:=5;
                                                                   madeoutstr(trim(t5.FieldValues['料号']),t5,ar,flag);
                                                                    printliaototable(v,ar,flag);
                                                                     if lastliao<>'' then
                                                                        if trim(t5.FieldValues['料号'])=trim(lastliao) then
                                                                           exit;
                                                                //    excel_No:=excel_No+1;
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                       if not((ischecked(trim(t5.FieldValues['料号'])))and(lastliao='')) then
                                                                          begin;
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                         Jie_NO:=6;
                                                                           madeoutstr(trim(t6.FieldValues['料号']),t6,ar,flag);
                                                                           printliaototable(v,ar,flag);
                                                                            if lastliao<>'' then
                                                                               if trim(t6.FieldValues['料号'])=trim(lastliao) then
                                                                                  exit;
                                                                          // excel_No:=excel_No+1;
                                                                             fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                              if not((ischecked(trim(t6.FieldValues['料号'])))and(lastliao='')) then
                                                                                     begin;
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                  Jie_NO:=7;
                                                                                      madeoutstr(trim(t7.FieldValues['料号']),t7,ar,flag);
                                                                                      printliaototable(v,ar,flag);
                                                                                       if lastliao<>'' then
                                                                                           if trim(t7.FieldValues['料号'])=trim(lastliao) then
                                                                                              break;
                                                                                      // excel_No:=excel_No+1;
                                                                                      t7.Next;
                                                                                  end;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;
                                                end;


                                         t2.Next;
                                    end;
                            end;
                              end;
                        end;//print one layer bom

                    tql.Next;
                end;




   end;
 tql.Close;
 tql.Free;

end;
procedure Tbomeditfm.getbomlist();
var
  l1: TTreeNode;
  i:integer;
  liaohao:string;
begin
statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
statusbar1.Update;
///////////////////////////get bom list///////////////////////
    tv.Items.Clear;
     with tq do
       begin
           close;
           open;
           First;
       end;
 for i:=0 to tq.RecordCount-1 do
   begin
        l1:=tv.Items.add(nil ,tq.FieldValues['品名']+'('+trim(tq.FieldValues['料号'])+')');
        tq.Next;
   end;
  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='刷新任务完成！！！！' ;
end;
procedure getbominformation(v:variant;liaohao:string;var ar:Tstringlist);
var
  sqlstr:string;
  tqs:Tadoquery;
  n:integer;
begin

    ar.Add('ok');
    ar.Clear;
   tqs:=Tadoquery.Create(application);
   sqlstr:='select 品名, 料号, 阶层,规格说明,最新版本 from lingjianliaohao where 料号= '+''''+liaohao+'''';
   tqs.Connection:=dm.ADOConnection1;
   try
    with tqs do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);

           open;
          // if tqs.FieldValues['品名']<>'' then
           ar.Append(tqs.FieldValues['品名']);
          // if tqs.FieldValues['料号']<> '' then
           ar.Append(tqs.FieldValues['料号']) ;
           if tqs.FieldValues['阶层']<>null  then
           ar.Append(tqs.FieldValues['阶层'])
           else ar.Append(' ');
          // if tqs.FieldValues['规格说明']<> '' then
           ar.Append(tqs.FieldValues['规格说明']) ;
          if tqs.FieldValues['最新版本']<>null then
           ar.Append(tqs.FieldValues['最新版本'])
           else   ar.Append(' ');
           for n:=0 to ar.count-1 do
           begin
            v.workbooks[1].sheets[1].cells[2,n+1]:=ar.Strings[n];
           end;
       end;
    finally
    tqs.Close;
    tqs.Free

    end;
end;
procedure readstr(str:string;flag:string;var substrs:array of string);
var
i:integer;
sumstr:string;
j:integer;
begin
j:=0;
//setlength(substrs,length(str));

     sumstr:='';
     for i:=1 to length(str) do
         begin

              if (str[i]<>flag)and(str[i]<>',') then
                  sumstr:=sumstr+trim(str[i]);
              if (str[i]=flag)or((str[i]=',')) then
                 begin
                    if (str[i+1]<>flag)and(str[i+1]<>',') then
                    begin
                     substrs[j]:=trim(sumstr);
                     sumstr:='';
                     j:=j+1;
                     end;
                 end;

         end;
       substrs[j]:=trim(sumstr);    //the final string

end;

procedure Tbomeditfm.sumno(str:string;var count:double;var strs:string;var dwh:string);
var
 i,j:integer;
 substrs:array of string;

begin
count:=0;
strs:='';
dwh:='';
    if str='' then
    exit;
     setlength(substrs,length(str)+1);
     for i:=0 to high(substrs) do
      begin
       substrs[i]:='';
      end;

     readstr(str,' ',substrs);
     for j:=0 to high(substrs) do
       begin
         if substrs[j]<>'' then
         begin
            count:=count+1;
            if j=high(substrs) then
                strs:=strs+substrs[j]
            else
               strs:=strs+substrs[j]+' ';
         end;
       end;
     for  j:=0 to high(substrs) do
     begin
         if trim(substrs[j])='' then
            break;
        for i:=j+1 to  high(substrs) do
        begin
            if substrs[i]<>'' then
            begin
                 if substrs[j]=substrs[i] then
                    dwh:=dwh+substrs[i]+' ';
            end;
        end;
     end;
end;
procedure Tbomeditfm.madeoutstr_excel(liaohao:string;adotable:Tadotable;var ar:Tstringlist;var flag:boolean);
var
liaoname,descrips,tablename:string;
count:double;
i:integer;
yongliang:string;
yl:string;
weizhi:string;
checked:string;
pwh:string;
bomliao,ver:string;
dw:string;
begin
lastliao:='fullextend';
bomliao:=liaohao;
quantity:=1;
dw:='';
    if  adotable.FieldValues['单位用量']=Null then
        yongliang:=''
    else
        yongliang:= trim(adotable.FieldValues['单位用量']);
    for i:=1 to length(yongliang)  do     //get yongliang
    begin
        try
           if (not (yongliang[i]  in ['A'..'Z','a'..'z']))and ((yongliang[i]  in ['0'..'9','.'])) then
               yl:=yl+yongliang[i]
           else
             dw:=dw+yongliang[i];
        except
        end;
    end;                                                                   //get yongliang    yl
    if trim(yl)='' then
          yl:='1';



    ar.Clear;
    getpg(liaohao,liaoname,descrips,checked,ver);
        /////////////sum lingjian weizhi
    if adotable.FieldValues['零件位置']=Null then
        sumno('',count,weizhi,pwh)
    else
    sumno(trim(adotable.FieldValues['零件位置']),count,weizhi,pwh) ;
    ar.Append(liaoname);
    ar.Append(liaohao) ;
    ar.Append(inttostr(Jie_No));
    ar.Append(descrips) ;
    fomatliaohao(bomliao,bomliao);
    

   if existbom(bomliao)=true then
   begin
       if trim(yl)='' then
          yl:='1';
       quantity:=strtofloat(yl);
     //  showmessage('ok');
   end;

   if (existbom(bomliao)=true)and (not((ischecked(trim(liaohao))=true)and(lastliao=''))) then           //not print part of bom   no subliao
      ar.Append('')
   else if  adotable.FieldValues['单位用量']=null then
      ar.Append('')
   else if (existbom(bomliao)=false) then
      ar.Append(floattostr(quantity*strtofloat(yl))+dw)
   else
      ar.Append(adotable.FieldValues['单位用量']);


      ar.Append(weizhi);
      ar.Append(adotable.FieldValues['单价']);
      ar.Append(adotable.FieldValues['合计']);
      ar.Append(checked);
      ar.Append(ver);







   try                 //yongliang compare with weihao
   if trim(yl)='' then
      begin
       yl:='1';
       count:=0;
       end
   else if count=strtofloat(yl) then
      flag:=false
   else
      flag:=true;
   except
      flag:=false
   end;                 //yongliang compare with weihao
  try
   if (trim(yongliang)='')and(trim(adotable.FieldValues['零件位置'])<>'') then     //deal with special condition
       flag:=true;
   if (trim(yongliang)<>'')and(trim(adotable.FieldValues['零件位置'])='') then
       flag:=true;
  except
  end;
  if pwh<>'' then
     flag:=true;
              // v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['品名'];
              // v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['料号'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['阶层'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['规格说明'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['单位用量'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['零件位置'];
end;
procedure Tbomeditfm.madeoutstr(liaohao:string;adotable:Tadotable;var ar:Tstringlist;var flag:boolean);
var
liaoname,descrips,tablename:string;
count:double;
i:integer;
yongliang:string;
yl:string;
weizhi:string;
checked:string;
pwh:string;
bomliao,ver:string;
dw:string;
begin
dw:='';
bomliao:=liaohao;
quantity:=1;
    if  adotable.FieldValues['单位用量']=Null then
        yongliang:=''
        else
        yongliang:= trim(adotable.FieldValues['单位用量']);

    for i:=1 to length(yongliang)  do     //get yongliang
    begin
        try
           if (not (yongliang[i]  in ['A'..'Z','a'..'z']))and ((yongliang[i]  in ['0'..'9','.'])) then
               yl:=yl+yongliang[i]
           else
             dw:=dw+yongliang[i];
        except
        end;
    end;                                                                   //get yongliang    yl
    if trim(yl)='' then
          yl:='1';



    ar.Clear;
    getpg(liaohao,liaoname,descrips,checked,ver);
        /////////////sum lingjian weizhi
    if adotable.FieldValues['零件位置']=Null then
        sumno('',count,weizhi,pwh)
    else
    sumno(trim(adotable.FieldValues['零件位置']),count,weizhi,pwh) ;
    ar.Append(liaoname);
    ar.Append(liaohao) ;
    ar.Append(inttostr(Jie_No));
    ar.Append(descrips) ;
    fomatliaohao(bomliao,bomliao);
    

   if existbom(bomliao)=true then
   begin
       if trim(yl)='' then
          yl:='1';
       quantity:=strtofloat(yl);
     //  showmessage('ok');
   end;

   if (existbom(bomliao)=true)and (not((ischecked(trim(liaohao))=true)and(lastliao=''))) then           //not print part of bom   no subliao
      ar.Append('')
   else if  adotable.FieldValues['单位用量']=null then
      ar.Append('')
   else if (existbom(bomliao)=false) then
      ar.Append(floattostr(quantity*strtofloat(yl))+dw)
   else
      ar.Append(adotable.FieldValues['单位用量']);


      ar.Append(weizhi);
      ar.Append(adotable.FieldValues['单价']);
      ar.Append(adotable.FieldValues['合计']);
      ar.Append(checked);
      ar.Append(ver);







   try                 //yongliang compare with weihao
   if trim(yl)='' then
      begin
       yl:='1';
       count:=0;
       end
   else if count=strtofloat(yl) then
      flag:=false
   else
      flag:=true;
   except
      flag:=false
   end;                 //yongliang compare with weihao
  try
   if (trim(yongliang)='')and(trim(adotable.FieldValues['零件位置'])<>'') then     //deal with special condition
       flag:=true;
   if (trim(yongliang)<>'')and(trim(adotable.FieldValues['零件位置'])='') then
       flag:=true;
  except
  end;
  if pwh<>'' then
     flag:=true;
              // v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['品名'];
              // v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['料号'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['阶层'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['规格说明'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['单位用量'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['零件位置'];
end;
procedure Tbomeditfm.printbomtoexcel(v:variant;liaohao:string);
var
  i1,i2,i3,i4,i5,i6,i7:integer;
  sqlstr:string;
  tql:Tadotable;
  tname:string;
  ar:Tstringlist;
  excel_No:integer;
  flag:boolean;
begin
 ar:=Tstringlist.Create;
 excel_No:=5;
 //sqlstr:='select 料号,品名,规格说明 from lingjianliaohao where 料号='+''''+liaohao+'''';
 //tq.Close;
 //tq.SQL.Clear;
 //tq.SQL.Add(sqlstr);
 //tq.Open;
 fomatliaohao(liaohao,tname);               //judge that is it a bom
 if existbom(tname)=true then
 begin
    getbominformation(v,liaohao,ar);
    //printtoexcel(v,excel_No,1,ar,0,6);
    gettitles(v);
 end
 else
 begin
   application.MessageBox('没有发现可以操作的BOM！！         ','提示！',MB_OKCANCEL+MB_iconinformation) ;
   exit;
 end;

 tql:=tadotable.Create(application);          //open the first bom
 tql.Connection:=dm.ADOConnection1;
 fomatliaohao(liaohao,tname);
     with tql do
       begin
           close;
           TableName:=tname;
           Active:=true;
           First;
           for i1:=0 to tql.RecordCount-1 do
                begin
                    Jie_NO:=1;
                    madeoutstr_excel(trim(tql.FieldValues['料号']),tql,ar,flag);
                    printtoexcel(v,excel_No,1,ar,0,5,flag);

                    excel_No:=excel_No+1;
                    fomatliaohao(trim(tql.FieldValues['料号']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         Jie_NO:=2;
                                         madeoutstr_excel(trim(t2.FieldValues['料号']),t2,ar,flag);
                                         printtoexcel(v,excel_No,1,ar,0,5,flag);
                                         excel_No:=excel_No+1;
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                     Jie_NO:=3;
                                                        madeoutstr_excel(trim(t3.FieldValues['料号']),t3,ar,flag);
                                                        printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                        excel_No:=excel_No+1;
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                          Jie_NO:=4;
                                                            madeoutstr_excel(trim(t4.FieldValues['料号']),t4,ar,flag);
                                                            printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                            excel_No:=excel_No+1;
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                 Jie_NO:=5;
                                                                   madeoutstr_excel(trim(t5.FieldValues['料号']),t5,ar,flag);
                                                                    printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                                    excel_No:=excel_No+1;
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                         Jie_NO:=6;
                                                                           madeoutstr_excel(trim(t6.FieldValues['料号']),t6,ar,flag);
                                                                           printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                                           excel_No:=excel_No+1;
                                                                             fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                  Jie_NO:=7;
                                                                                      madeoutstr_excel(trim(t7.FieldValues['料号']),t7,ar,flag);
                                                                                      printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                                                       excel_No:=excel_No+1;
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;



                    tql.Next;
                end;



 v.workbooks[1].sheets[1].cells[EXCEL_NO+1,1]:='EXPORT SUCCESSFUL'
   end;
 tql.Close;
 tql.Free;

end;
procedure Tbomeditfm.copystring(str:string;bs,es:string;var newstr:string);
var
  i:integer;
  pass:boolean;
begin
pass:=false;
          for i:=1 to length(str) do
            begin
            if  (str[i]=bs)or (pass=true)  then
                if (str[i+1]<>es) then
                begin
                pass:=true;
                newstr:=newstr+str[i+1];
                end
               else
                  break;
            end;
end;
procedure lookupbom(liaohao:string);
var
  sqlstr:string;
  bomliaohao:string;
begin
try
   sqlstr:='select 品名, 料号,阶层, 规格说明,单位用量,工单用量 零件位置 from lingjianliaohao where 料号= '+''''+liaohao+'''';
    with bomeditfm.exportbom do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);
           open;
       end;
fomatliaohao(liaohao,bomliaohao);
if existbom(bomliaohao)=true then
begin
   bomeditfm.t2.Close;
   bomeditfm.t2.TableName:='bomliaohao';
   bomeditfm.t2.Open;
end
else
bomeditfm.t2.Close;
except
bomeditfm.exportbom.Close;
bomeditfm.t2.Close;
end;


end;
procedure Tbomeditfm.createExcel(var v:variant);
var
sheet:variant;
tname:string;
begin
tname:=adoquery1.FieldValues['品名']+adoquery1.FieldValues['料号'];
v:=createoleobject('Excel.Application');
v.visible:=true;
v.workbooks.add(-4167);
v.workbooks[1].sheets[1].name:=tname;
sheet:=v.workbooks[1].sheets[tname];
end;

procedure Tbomeditfm.gettitles(v:variant);
var h, i:integer ;
s:double;
begin
           // for l:=1 to bomeditfm.exportbom.FieldCount do
             //   begin
                  // v.workbooks[1].sheets[1].cells[1,1]:='导出日期：'+datetimetostr(date());
               // end;
              // showmessage('Hi');
          //  for h:=1 to 7 do
             //   begin
               // for i:=0 to 200000000 do
                 //  begin
                 ////     s:=s+i;
                   //end;

                  // v.workbooks[1].sheets[1].cells[2,h]:='品名';//bomeditfm.exportbom.Fields.Fields[h-1].FieldName;
                   //showmessage(inttostr(h));
                   //showmessage('Hi');
               // end;
               // vv.update;
               v.workbooks[1].sheets[1].cells[3,1]:='品名';
               v.workbooks[1].sheets[1].cells[3,2]:='料号';
               v.workbooks[1].sheets[1].cells[3,3]:='阶层';

               v.workbooks[1].sheets[1].cells[3,4]:='规格说明';
               v.workbooks[1].sheets[1].cells[3,5]:='用量';
               //v.workbooks[1].sheets[1].cells[2,6]:='工单用量';
               v.workbooks[1].sheets[1].cells[3,6]:='零件位置';
end;
procedure Tbomeditfm.getpg(liaohao:string;var pingming:string;var guige:string;var checked:string;var ver:string);
var
  sqlstr:string;
  tqs:Tadoquery;
begin
    tqs:=Tadoquery.Create(application);
    tqs.Connection:=dm.ADOConnection1;
    sqlstr:='select 品名, 料号, 规格说明,承认,最新版本 from lingjianliaohao where 料号= '+''''+liaohao+'''';
   try
    with tqs do
       begin
          close;
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if recordcount>=1 then
          begin
          if  tqs.FieldValues['品名']=null then
          pingming:='' else
          pingming:=tqs.FieldValues['品名'];
          if  tqs.FieldValues['规格说明']=null then
          guige:='' else
          guige:=tqs.FieldValues['规格说明'];
          end;
          if tqs.FieldValues['承认']=Null then
             checked:=''
          else checked:=tqs.FieldValues['承认'];
          if tqs.FieldValues['最新版本']=Null then
             ver:=''
          else ver:=tqs.FieldValues['最新版本'];
       end;
    finally
    tqs.Close;
    tqs.Free
    end;
end;
procedure Tbomeditfm.printtoexcel(v:variant;i,j:integer;ar:Tstringlist;size_x,size_y:integer;flag:boolean);
var
   jj,n:integer;

begin
 jj:=j;

     for n:=0 to ar.Count-1 do
      begin
         v.workbooks[1].sheets[1].cells[i,j]:=ar.Strings[n];
         if flag=true then
          v.workbooks[1].sheets[1].cells[i,j].interior.colorindex:=39;
         j:=j+1;
      end;


end;
procedure Tbomeditfm.exportData();
var
I,j,k,count:integer;
liaohao :string;
 v:variant;
 bomliao:string;
begin
createExcel(v);

//liaohao:=TV.Selected.Text;

//lookupbom(liaohao);
//gettitles(v);
               v.workbooks[1].sheets[1].cells[2,1]:='品名';
               v.workbooks[1].sheets[1].cells[2,3]:='料号';
               v.workbooks[1].sheets[1].cells[2,2]:='阶层';
               v.workbooks[1].sheets[1].cells[2,4]:='规格说明';
               v.workbooks[1].sheets[1].cells[2,5]:='用量';
               v.workbooks[1].sheets[1].cells[2,6]:='零件位置';
count:=1;
for I:=1 to TV.Items.Count do
    begin
    bomliao:=trim(bomeditfm.TV.Items.Item[i-1].Text);
         if not (bomliao[1] in ['0'..'9']) then
           begin
            liaohao:='';
            bomliao:='';
            copystring(bomliao,'(',')',liaohao);
            end;
        //lookupbom(bomliao);
        fomatliaohao(liaohao,bomliao);
        if existbom(bomliao)=true then
           begin

           end;
        if t2.Active=true then         //print bomliao if t2=true indicate exist bom
           begin
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['品名'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['料号'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['阶层'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['规格说明'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['单位用量'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['零件位置'];




           end
        else    //common liao
           begin

           end;





         for j:=1 to bomeditfm.exportbom.FieldCount do
             begin
                 v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['品名'];//.Fields.Fields[j-1].Value;
             end;

        // for k=0 to t2.RecordCount do
             begin
                  v.workbooks[1].sheets[1].cells[I+2,j]:=t2.Fields.Fields[j-1].Value;
             end;
    end;
END;


procedure Tbomeditfm.acttable(liaohao:string;ds:Tadotable);
var
tablename:string;
begin
      tablename:=liaohao;
      ds.Close;
      ds.TableName:=tablename;
      ds.Active:=true;
      ds.First;
end;

function existbom(tablename:string):boolean;
var
str:string;

begin
    str:='select * from sysobjects where id = object_id('+''''+trim(tablename)+''''+')';

     with bomeditfm.querybom do
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



procedure Tbomeditfm.SpeedButton6Click(Sender: TObject);
begin
close;
end;
procedure Tbomeditfm.getmodel(model:string);
begin

adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where 使用机种 like '+''''+'%'+trim(model)+'%'+''''+' and 料号 like '+''''+'99%'+''''+' and 承认<>'+''''+'已核准'+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
   showmessage('没有发现此机种相关的BOM，如果确实存在，请更新机种信息！！！');

end;
procedure Tbomeditfm.getbomlistbymodal(modal:string);
var
  l1, l2: TTreeNode;
  i:integer;
begin
if trim(modal)='' then
exit;
   getmodel(modal);
   if adoquery1.RecordCount>=1 then
      begin
      statusbar1.Panels.Items[2].Text:='';
      statusbar1.Panels.Items[3].Text:='请稍等，正在查询BOM！！！！' ;
          with tv.Items do
               begin
                   tv.Items.Clear;
                   adoquery1.First;
                   l1:=add(nil ,'机种型号'+'('+trim(adoquery1.FieldValues['使用机种'])+')');
                   for i:=0 to adoquery1.RecordCount-1 do
                       begin
                          addchild(l1 ,adoquery1.FieldValues['品名']+'('+trim(adoquery1.FieldValues['料号'])+')');
                          adoquery1.Next;
                       end;
                   adoquery1.Next;
               end;
      end;
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'个物料';
statusbar1.Panels.Items[3].Text:='刷新任务完成！！！！' ;

end;
procedure Tbomeditfm.getbomlists(liaohao:string);
var
  l1, l2,l3,l4,l5,l6: TTreeNode;
  i1,i2,i3,i4,i5,i6:integer;
  bomliao:string;
begin
statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
statusbar1.Update;

with tv.Items do
begin
clear;
     with tq do
       begin
           close;
           sql.Clear;
           sql.Add('select * from lingjianliaohao where 料号 like '+''''+'%'+trim(liaohao)+'%'+''''+' and 承认<>'+''''+'已核准'+'''');
           open;
           tq.First;
           for i1:=0 to tq.RecordCount-1 do
                begin
                    bomliao:=tq.FieldValues['料号'];
                    fomatliaohao(bomliao,bomliao);
                    if existbom(bomliao)=true then
                         add(nil ,tq.FieldValues['品名']+'('+trim(tq.FieldValues['料号'])+')');
                    tq.Next;
                end;
       end;

end;// with tv do
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'个物料';
statusbar1.Panels.Items[3].Text:='刷新任务完成！！！！' ;
end;
procedure Tbomeditfm.SpeedButton1Click(Sender: TObject);
var
  l1, l2,l3,l4,l5,l6: TTreeNode;
  i1,i2,i3,i4,i5,i6:integer;
  liaohao:string;
begin
statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
statusbar1.Update;
///////////////////////////get bom list///////////////////////
with tv.Items do
   begin
     clear;
     with tq do
       begin
           close;
           sql.Clear;
           sql.Add('SELECT * FROM lingjianliaohao WHERE 料号 LIKE '+''''+'99%'+''''+' and 品名 like '+''''+'%成品%'+''''+' and 承认<>'+''''+'已核准'+'''');
           open;
           tq.First;
           for i1:=0 to tq.RecordCount-1 do
                begin
                    l1:=add(nil ,tq.FieldValues['品名']+'('+trim(tq.FieldValues['料号'])+')');
                    tq.Next;
                end;
       end;
   end;
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
statusbar1.Panels.Items[3].Text:='刷新任务完成！！！！' ;
end;

procedure getextendedbom(liaohao:string;tname:string);
var
sqlstr:string;
begin
sqlstr:='SELECT '+tname+'.料号, '+tname+'.阶层, '+tname+'.单位用量, '+
    tname+'.零件位置, lingjianliaohao.规格说明 '+
'FROM '+tname+' CROSS JOIN    '+
      'lingjianliaohao where ('+tname+'.料号='+''''+liaohao+''''+') and ('+tname+'.料号=lingjianliaohao.料号) '

end;
procedure Tbomeditfm.TVClick(Sender: TObject);
var
  sqlstr,estr:string;
  liaohao:string;
  bomliaohao:string;
begin

try
//if tv.Items.Item[0].Selected=false   then
//   exit;

   try
   tv.Selected.ImageIndex:=0;
   tv.Update;
   tv.Selected.ImageIndex:=1;
   tv.Update;
   liaohao:=tv.Selected.Text;
   lbom.Caption:=trim(liaohao);
   except
   end;
   if trim(liaohao)='' then
       exit;
   if not (liaohao[1] in ['0'..'9']) then
   begin
   liaohao:='';
   copystring(tv.Selected.Text,'(',')',liaohao);
   end;
   if NOT (liaohao[1] in ['0'..'9']) then
   begin
      aqljlh.Close;
      adotable1.Close;
      exit;
   end;
   bomliaohao:=liaohao;
   sqlstr:='select * from lingjianliaohao where 料号='+''''+liaohao+'''';
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add(sqlstr);
   adoquery1.Open;
   if adoquery1.RecordCount<1 then
      exit;
   if adoquery1.FieldValues['锁']=true then
     begin
         showmessage('此BOM已进入锁定状态！！');
         exit;
     end;
   if (adoquery1.FieldValues['承认']<>Null) then
   if (trim(adoquery1.FieldValues['承认'])='已核准') then
   begin
       dbedit2.ReadOnly:=true;
       dbedit4.ReadOnly:=true;
       dbedit5.ReadOnly:=true;
       dbgrid1.ReadOnly:=true;
       dbgrid2.ReadOnly:=true;
   end
   else
   begin
       dbedit2.ReadOnly:=false;
       dbedit4.ReadOnly:=false;
       dbedit5.ReadOnly:=false;
       dbgrid1.ReadOnly:=false;
       dbgrid2.ReadOnly:=false;
   end;
except
    adoquery1.Close;
    adotable1.Close;
end;
try
   fomatliaohao(liaohao,liaohao);
   if existbom(liaohao) then
   begin
   adotable1.Close;
   datasource1.DataSet:=adotable1;
   adotable1.TableName:=liaohao;
   adotable1.Open;
   end
   else
   begin
      // aqljlh.Close;
      // adotable1.Close;
      try
        if adotable1.Locate('料号',bomliaohao, [loPartialKey])=false then
           begin
               adotable1.Close;
               aqljlh.Close;
           end;
        if aqljlh.active=true then
        if aqljlh.Locate('料号',bomliaohao, [loPartialKey])=false then
        begin
            aqljlh.Close;
        end;
      except
      end;
        exit;

   end;



   
except
   adotable1.Close;
end;
try
 estr:='SELECT '+liaohao+'.料号 AS 料号, '  +
      'lingjianliaohao.品名 AS 品名, lingjianliaohao.规格说明 AS 规格说明,  '+
       liaohao+'.阶层 AS 阶层, ' +liaohao+'.单位用量 AS 单位用量, '+liaohao+'.零件位置 AS 零件位置, ' +
      'lingjianliaohao.承认 AS 承认 ' +
      'FROM '+liaohao+' cross JOIN lingjianliaohao '+
      'where '+liaohao+'.料号 = lingjianliaohao.料号  order by 料号';
aqljlh.Close;
aqljlh.SQL.Clear;
aqljlh.SQL.Add(estr);
aqljlh.Open ;

except
end;
try
   MakeDBGridColumnsAutoFixItsWidth(DBGrid2) ;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
except
end;

end;
procedure Tbomeditfm.extendbom(bomliaohao:string;l1:Ttreenode);
var
  l2,l3,l4,l5,l6,l7,l8,l9,l10,l11: TTreeNode;
  i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11:integer;
  tablename,liaohao:string;
begin
liaohao:=bomliaohao;
begin
 statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
 statusbar1.Update;

  // sqlstr:='select * from lingjianliaohao where 料号='+''''+liaohao+'''';
with tv.Items do
   begin
     //  with adoquery2 do
       begin
         //  close;
         //  sql.Clear;
          // sql.Add(sqlstr);
         //  open;
          // First;
           //for i1:=0 to adoquery2.RecordCount-1 do
                begin
                    l1:=add(nil ,adoquery1.FieldValues['品名']+'('+trim(adoquery1.FieldValues['料号'])+')');  //change
                    fomatliaohao(liaohao,tablename);
                         if existbom(tablename)=true then
                            begin
                                 acttable(tablename,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['料号']));
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['料号']));
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['料号']));
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['料号']));
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            l6:=AddChild(l5 ,trim(t6.FieldValues['料号']));
                                                                            fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['料号']));
                                                                                      fomatliaohao(trim(t7.FieldValues['料号']),liaohao);
                                                                                       if existbom(liaohao)=true then
                                                                                       begin
                                                                                         acttable(liaohao,t8);
                                                                                          for i8:=0 to t8.recordcount-1 do
                                                                                          begin
                                                                                            l8:=AddChild(l7 ,trim(t8.FieldValues['料号']));
                                                                                            fomatliaohao(trim(t8.FieldValues['料号']),liaohao);
                                                                                             if existbom(liaohao)=true then
                                                                                             begin
                                                                                               acttable(liaohao,t9);
                                                                                                for i9:=0 to t9.recordcount-1 do
                                                                                                begin
                                                                                                  l9:=AddChild(l8 ,trim(t9.FieldValues['料号']));
                                                                                                  fomatliaohao(trim(t9.FieldValues['料号']),liaohao);
                                                                                                  if existbom(liaohao)=true then
                                                                                                     begin
                                                                                                     acttable(liaohao,t10);
                                                                                                       for i10:=0 to t10.recordcount-1 do
                                                                                                           begin
                                                                                                            l10:=AddChild(l9 ,trim(t10.FieldValues['料号']));
                                                                                                              fomatliaohao(trim(t10.FieldValues['料号']),liaohao);
                                                                                                             if existbom(liaohao)=true then
                                                                                                                begin
                                                                                                                   acttable(liaohao,t11);
                                                                                                                   for i11:=0 to t11.recordcount-1 do
                                                                                                                      begin
                                                                                                                           l11:=AddChild(l10 ,trim(t11.FieldValues['料号']));

                                                                                                                           t11.next;
                                                                                                                      end;
                                                                                                                end;
                                                                                                            t10.next;
                                                                                                           end;
                                                                                                     end;
                                                                                                  t9.next;
                                                                                                end;
                                                                                             end;
                                                                                            t8.Next;
                                                                                          end;
                                                                                       end;
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;



                   // adoquery2.Next;
                end;
       end;

end;

   end;
  //statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'个物料';
  statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';
  statusbar1.Panels.Items[0].Text:=inttostr(tv.Items.Count)+'个物料';
end;


procedure Tbomeditfm.cbKeyPress(Sender: TObject; var Key: Char);
var
  l1, l2,l3,l4,l5,l6,l7: TTreeNode;
  i1,i2,i3,i4,i5,i6,i7:integer;
  liaohao:string;
  sqlstr:string;
begin
if key=#13 then
begin
if trim(cb.Text)='' then
     exit;
getbomlistbymodal(trim(cb.Text));
// getbomlists(cb.Text);


end;

end;



 //////////////////////////////////////////////////////////////


 {statusbar1.Panels.Items[3].Text:='请稍等...正在刷新BOM.................' ;
 statusbar1.Update;
        // 'select * from lingjianliaohao where 料号 like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and 承认<>'+''''+'已核准'+''''
sqlstr:='select * from lingjianliaohao where 料号 like '+''''+'%'+trim(cb.text    )+'%'+''''+ ' and 承认<>'+''''+'已核准'+'''';
with tv.Items do
   begin
     clear;

       with adoquery2 do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);
           open;
           First;
           if recordcount<1 then    //select bom
           begin

               application.MessageBox('没有找到匹配的BOM，请输入有效关键字！！！！         ','提示！',MB_OK+MB_iconinformation) ;
               statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
               statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';
               exit;
           end;     }

          { fomatliaohao(trim(adoquery2.FieldValues['料号']),liaohao);
           if existbom(liaohao)=false then    //check bom
              begin
               application.MessageBox('与之匹配的BOM不存在！！！！请确认关键子         ','提示！',MB_OK+MB_iconinformation) ;
               statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
               statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';
               exit;
              end;     }

       {    for i1:=0 to adoquery2.RecordCount-1 do        //expent bom
                begin
                fomatliaohao(trim(adoquery2.FieldValues['料号']),liaohao);
                if existbom(liaohao)=true then    //check bom
                   begin
                   l1:=add(nil ,adoquery2.FieldValues['品名']+'('+trim(adoquery2.FieldValues['料号'])+')');
                   end;   }
                 {   l1:=add(nil ,adoquery2.FieldValues['品名']+'('+trim(adoquery2.FieldValues['料号'])+')');
                    fomatliaohao(trim(adoquery2.FieldValues['料号']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['料号']));
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['料号']));
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['料号']));
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['料号']));
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            l6:=AddChild(l5 ,trim(t6.FieldValues['料号']));
                                                                            fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['料号']));
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;
                                        }


             {       adoquery2.Next;
                end;      //for adoquery2
       end;

end;

end; }       //key=#13

 // with TV.Items do
 // begin
  //  Clear;                                                { remove any existing nodes }
  //  l1 := Add(nil, 'RootTreeNode1');              { Add a root node }
                                                          { Add a child node to the node just added }
  //  AddChild(l1,'ChildNode1');

                                                               {Add another root node}
   // l2 := Add(l1, 'RootTreeNode2');
                                                               {Give MyTreeNode2 to a child }
   // AddChild(l2,'ChildNode2');

                                                             {Change MyTreeNode2 to ChildNode2 }
                                                            { and add a child node to it}
   // l2 := TV.Items[3];
   // AddChild(l2,'ChildNode2a');

                                                                {Add another child to ChildNode2, after ChildNode2a }
   // Add(l2,'ChildNode2b');

                                                               {add another root node}
   // Add(l1, 'RootTreeNode3');
  //end;
{  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='刷新BOM完成！！！！！';
end;    }



procedure Tbomeditfm.SpeedButton4Click(Sender: TObject);
var
mainliao,bomhao:string;
begin
if adotable1.Active=false then
exit;

if tabpageshow1=false then
begin
mainliao:=trim(tv.Items.Item[0].text);
if not (mainliao[1] in ['0'..'9']) then
   begin
   bomhao:='';
   copystring(mainliao,'(',')',bomhao);
   end;
fomatliaohao(bomhao,bomhao);
if (bomhao<>adotable1.TableName) then
   begin
       application.MessageBox('当前BOM非一阶BOM不可在嵌套情况下编辑！！！！！','提示！',MB_OK+MB_iconinformation) ;
       exit;
   end;
end;
if (adoquery1.FieldValues['承认']<>null)or(adoquery1.FieldValues['承认']<>'') then
if (trim(adoquery1.FieldValues['承认'])='已核准') then
   begin
       application.MessageBox('当前BOM已被核准不可再在此编辑！！！！！','提示！',MB_OK+MB_iconinformation) ;
       exit;
   end;

try
lufm2.mn:=adoquery1.FieldValues['料号'];
lufm2.showmodal;
except
application.MessageBox('无效的操作,或无用的BOM！！！！         ','提示！',MB_OK+MB_iconinformation) ;
end;
//lufm2.showmodal;
end;

procedure Tbomeditfm.FormCreate(Sender: TObject);
var
  l1, l2,l3,l4,l5,l6: TTreeNode;
  i1,i2,i3,i4,i5,i6:integer;
  liaohao:string;
begin
//abort;
exit;
with tv.Items do
   begin
     clear;

       with tq do
       begin
           close;
           open;
           tq.First;
           for i1:=0 to tq.RecordCount-1 do
                begin
                    l1:=add(nil ,tq.FieldValues['品名']+'('+trim(tq.FieldValues['料号'])+')');
                    {fomatliaohao(trim(tq.FieldValues['料号']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['料号']));
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['料号']));
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['料号']));
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['料号']));
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                           l6:=AddChild(l5 ,trim(t6.FieldValues['料号']));
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;    }



                    tq.Next;
                end;
       end;



   end;

 // with TV.Items do
 // begin
  //  Clear;                                                { remove any existing nodes }
  //  l1 := Add(nil, 'RootTreeNode1');              { Add a root node }
                                                          { Add a child node to the node just added }
  //  AddChild(l1,'ChildNode1');

                                                               {Add another root node}
   // l2 := Add(l1, 'RootTreeNode2');
                                                               {Give MyTreeNode2 to a child }
   // AddChild(l2,'ChildNode2');

                                                             {Change MyTreeNode2 to ChildNode2 }
                                                            { and add a child node to it}
   // l2 := TV.Items[3];
   // AddChild(l2,'ChildNode2a');

                                                                {Add another child to ChildNode2, after ChildNode2a }
   // Add(l2,'ChildNode2b');

                                                               {add another root node}
   // Add(l1, 'RootTreeNode3');
  //end;

end;

procedure Tbomeditfm.SpeedButton3Click(Sender: TObject);
begin
adotable1.Edit;
adotable1.Post;
adoquery1.Edit;
adoquery1.Post;
end;

procedure Tbomeditfm.SpeedButton5Click(Sender: TObject);
var
liaohao,str,mainliao,bomhao:string;
begin

if adotable1.Active=true then
begin
if tabpageshow1=false then
begin
mainliao:=trim(tv.Items.Item[0].text);          //get one  liao
if not (mainliao[1] in ['0'..'9']) then
   begin
   bomhao:='';
   copystring(mainliao,'(',')',bomhao);
   end;
fomatliaohao(bomhao,bomhao);
if (bomhao<>adotable1.TableName) then
   begin
       application.MessageBox('当前BOM非一阶BOM,不在编辑模式下，不可在嵌套情况下编辑！！！！！','提示！',MB_OK+MB_iconinformation) ;
       exit;
   end;
end;
if (adoquery1.FieldValues['承认']<>null)or(adoquery1.FieldValues['承认']<>'') then
if (trim(adoquery1.FieldValues['承认'])='已核准') then
   begin
       application.MessageBox('当前BOM已被核准不可再在此编辑！！！！！','提示！',MB_OK+MB_iconinformation) ;
       exit;
   end;


bomdeletefm.showmodal;


if bomdeletefm.cancel=true then
    begin
    abort;
    end;

try
    fomatliaohao(trim(adoquery1.FieldValues['料号']),liaohao);
except
    application.MessageBox('操作错误啦！！         ','提示',MB_OK+MB_iconinformation);
    abort;
end;
    str:='drop table '+liaohao;

if bomdeletefm.R2.Checked=true then
    begin
        if existbom(liaohao)=true then
            begin
                             with ad do
                                  begin
                                       CommandText:='';
                                       CommandText:=str;
                                       try
                                     
                                       adoquery1.Delete;
                                       if existbom(liaohao)=true then
                                       execute;
                                       application.MessageBox('删除BOM成功！！         ','提示？',MB_OK+MB_iconinformation) ;
                                        except
                                       application.MessageBox('删除BOM出错！         ','提示？',MB_OK+MB_iconinformation) ;
                                        end;
                                  end;
            end
            else     application.MessageBox('BOM已被删除！！         ','提示？',MB_OK+MB_iconinformation) ;
        exit;
     end;

if bomdeletefm.R1.Checked=true then          //delete from Father layer
      begin
       adotable1.Edit;
       adotable1.Delete;

       application.MessageBox('删除成功！！         ','提示！',MB_OK+MB_iconinformation);
       exit;
     end;
end;
end;
procedure Tbomeditfm.SpeedButton7Click(Sender: TObject);
begin
  appliaohaofm.show;
//bommapingfm.AQ.Close;
//bommapingfm.AQ.SQL.Clear;
//try
//bommapingfm.AQ.SQL.Add('select * from BomMapping where mn ='+''''+adoquery1.FieldValues['料号']+'''');
//bommapingfm.AQ.Open;
//except
//end;
//bommapingfm.show;


//bomfm.showmodal;
end;

procedure Tbomeditfm.SpeedButton2Click(Sender: TObject);
var
liaohao,tname:string;
v:variant;
begin
try

//liaohao:=tv.Selected.Item[tv.Selected.IndexOf(tv.Selected)].Text;
//liaohao:=TV.Selected.Text;

liaohao:=adoquery1.FieldValues['料号'];
fomatliaohao(liaohao,tname);
except
  application.MessageBox('常规错误，无法获取BOM料号！！，请选择BOM料号后重试','导出数据错误',mb_ok+MB_ICONSTOP);
  exit;
end;             //judge that is it a bom
 if existbom(tname)<>true then
 begin
    application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);
    exit;
 end;
    if trim(liaohao)<>'' then
       begin
         //exportdata()
         try
          createExcel(v);
          printbomtoexcel(v,trim(liaohao));
          except
           application.MessageBox('导出失败！！','导出数据错误',mb_ok+MB_ICONSTOP);
           exit;
          end;
       end
   else
      application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);

end;

procedure Tbomeditfm.ADOTable1BeforePost(DataSet: TDataSet);
begin
if application.MessageBox('BOM已经更改是否保存？','提示！',MB_OKCANCEL+MB_iconinformation)<>idok then
      begin
       //datasset.
        adotable1.Cancel;
      end;
end;

procedure Tbomeditfm.ADOQuery1BeforePost(DataSet: TDataSet);
begin
//if application.MessageBox('BOM已经更改是否保存？','提示？',MB_OKCANCEL+MB_iconinformation)<>idok then
 //     begin
       //datasset.
  //      adoquery1.Cancel;
  //    end;
end;

procedure Tbomeditfm.DBGrid1DblClick(Sender: TObject);
var
mainliao:string;
bomhao:string;
begin

exit;





if adotable1.Active=true then
begin

mainliao:=trim(tv.Items.Item[0].text);
if not (mainliao[1] in ['0'..'9']) then
   begin
   bomhao:='';
   copystring(mainliao,'(',')',bomhao);
   end;
fomatliaohao(bomhao,bomhao);
if (bomhao<>adotable1.TableName) then
   begin
       application.MessageBox('当前BOM非一阶BOM不可在嵌套情况下编辑！！！！！','提示！',MB_OK+MB_iconinformation) ;
       exit;
   end;

if (adoquery1.FieldValues['承认']<>null)or(adoquery1.FieldValues['承认']<>'') then
if (trim(adoquery1.FieldValues['承认'])='已核准') then
   begin
       application.MessageBox('当前BOM已被核准不可再在此编辑！！！！！','提示！',MB_OK+MB_iconinformation) ;
       exit;
   end;

    try
    if  adotable1.FieldValues['阶层']<>null then
    editbomffm.jieceng:=adotable1.FieldValues['阶层']
    else   editbomffm.jieceng:='';
    if  adotable1.FieldValues['单位用量']<>null then
    editbomffm.yongliang:=adotable1.FieldValues['单位用量']
    else  editbomffm.yongliang:='';
    if  adotable1.FieldValues['零件位置']<>null then
    editbomffm.weizhi:=adotable1.FieldValues['零件位置']
    else editbomffm.weizhi:='';
   // editbomffm.Edit3.Text:=adotable1.FieldValues['料号'];
   // editbomffm.Edit4.Text:=adotable1.FieldValues['规格说明'];
    except
     application.MessageBox('网络正忙！请重试！！！！','提示！',MB_OK+MB_iconstop);
    end;
    editbomffm.ShowModal;
    if editbomffm.flag=false then
       begin
           try
           adotable1.Edit;
           adotable1.FieldValues['阶层']:=editbomffm.jieceng;
           adotable1.FieldValues['单位用量']:=editbomffm.yongliang;
           adotable1.FieldValues['零件位置']:=editbomffm.weizhi;
           adotable1.Post;
           except
             application.MessageBox('网络正忙！请重试！！！！','提示！！',MB_OK+MB_iconstop) ;
           end;
           
       end;

end;


{if adotable1.Active=true then
begin
  if  adotable1.FieldValues['料号']='' then
      abort;
    liaohaolistfm.liaohao:=adotable1.FieldValues['料号'];
    liaohaolistfm.showmodal;
end
else
abort; }
end;

procedure Tbomeditfm.ADOTable1AfterPost(DataSet: TDataSet);
begin
//application.MessageBox('你编辑的BOM已经至少被一个其它BOM引用，更改将影响全部引用此BOM的BOM！！！','提示',MB_OK+MB_iconinformation);
end;

procedure Tbomeditfm.DBGrid2DblClick(Sender: TObject);
var
mainliao:string;
bomhao:string;
begin
if aqljlh.Active=true then
begin
if tabpageshow1=false then
begin
mainliao:=trim(tv.Items.Item[0].text);
if not (mainliao[1] in ['0'..'9']) then
   begin
   bomhao:='';
   copystring(mainliao,'(',')',bomhao);
   end;
fomatliaohao(bomhao,bomhao);
end;
if (adoquery1.FieldValues['承认']<>null)or(adoquery1.FieldValues['承认']<>'') then
if (trim(adoquery1.FieldValues['承认'])='已核准') then
   begin
       application.MessageBox('当前BOM已被核准不可再在此编辑！！！！！','提示！',MB_OK+MB_iconinformation) ;
       exit;
   end;

    try
    if  aqljlh.FieldValues['阶层']<>null then
    editbomffm.jieceng:=aqljlh.FieldValues['阶层']
    else   editbomffm.jieceng:='';
    if  aqljlh.FieldValues['单位用量']<>null then
    editbomffm.yongliang:=aqljlh.FieldValues['单位用量']
    else  editbomffm.yongliang:='';
    if  aqljlh.FieldValues['零件位置']<>null then
    editbomffm.weizhi:=aqljlh.FieldValues['零件位置']
    else editbomffm.weizhi:='';
     editbomffm.Edit3.Text:=aqljlh.FieldValues['料号'];
     editbomffm.Edit4.Text:=aqljlh.FieldValues['规格说明'];
    except
     application.MessageBox('网络正忙！请重试！！！！','提示！',MB_OK+MB_iconstop);
    end;
    editbomffm.ShowModal;
    if editbomffm.flag=false then
       begin
           try
           aqljlh.Edit;
           aqljlh.FieldValues['阶层']:=editbomffm.jieceng;
           aqljlh.FieldValues['单位用量']:=editbomffm.yongliang;
           aqljlh.FieldValues['零件位置']:=editbomffm.weizhi;
           aqljlh.Post;
           except
             application.MessageBox('网络正忙！请重试！！！！','提示！！',MB_OK+MB_iconstop) ;
           end;
           
       end;

end;
end;

procedure Tbomeditfm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//inherited;
with DBGrid1 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=ClYellow;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource1.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行}
Canvas.brush.Color :=ClWhite {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
end;

end;

procedure Tbomeditfm.BOM2Click(Sender: TObject);
var
liaohao:string;
l1:Ttreenode;
begin
try
liaohao:=trim(adoquery1.FieldValues['料号']);
//l1:=tv.Selected;
if liaohao<>'' then
begin
 tv.items.clear;
 extendbom(liaohao,nil);
end;
except
   showmessage('无法展开你要的BOM');
end;
end;

procedure Tbomeditfm.BOM3Click(Sender: TObject);
begin
tv.Selected.Delete;
adoquery1.Close;
adotable1.Close;
end;

procedure Tbomeditfm.printbuttonClick(Sender: TObject);
var
liaohao,tname:string;
v:Tadotable;
i:integer;
wenhao:string;
j:integer;
bomliststn:string;
begin
printsetupfm.showmodal;
if printsetupfm.cancel=true then
   exit;
if printsetupfm.Allbom.Checked=true then
   lastliao:='fullextend' ;
if printsetupfm.partbom.Checked=true then
   lastliao:='';
if printsetupfm.rdonelayer.Checked=true then
   printonelayer:=true
else printonelayer:=false;

cus:=false;
bomdetail.cus:=false;
statusbar1.Panels.Items[3].Text:='请稍等...正在生成预览.................' ;
statusbar1.Update;
bomliststn:='B'+hardno;
if existbom(bomliststn)=true then
  begin
      with ad do
           begin
               CommandText:='';
               CommandText:='drop table '+bomliststn;
               try
                 execute;
               except
                      application.MessageBox('无法创建临时文件！         ','提示？',MB_OK+MB_iconinformation) ;
                      exit;
                end;
           end;
  end;

 //print extend bom
if (printsetupfm.C1.Checked=true)or(printsetupfm.C2.Checked=true)or(printsetupfm.C3.Checked=true) then
begin
    createbomforprint(bomliststn) ;
    v:=Tadotable.Create(application);
    v.Connection:=dm.ADOConnection1;
    v.Close;
    v.TableName:=trim(bomliststn);
   cus:=true;
   bomdetail.cus:=true;
try
    liaohao:=adoquery1.FieldValues['料号'];
if  adoquery1.FieldValues['客户']=null then
    bomdetail.costomer:=''
else
bomdetail.costomer:=trim(adoquery1.FieldValues['客户']);
if  adoquery1.FieldValues['使用机种']=null then
    bomdetail.model:=''
else
bomdetail.model:=trim(adoquery1.FieldValues['使用机种']);
if  adoquery1.FieldValues['料号']=null then
    bomdetail.liaohao:=''
else
bomdetail.liaohao:=trim(adoquery1.FieldValues['料号']);
if  adoquery1.FieldValues['最新版本']=null then
    bomdetail.versions:=''
else
bomdetail.versions:=trim(adoquery1.FieldValues['最新版本']);
bomdetail.dates:=datetostr(date());
if  adoquery1.FieldValues['规格说明']=null then
    bomdetail.guige:=''
else
bomdetail.guige:=trim(adoquery1.FieldValues['规格说明']);

fomatliaohao(liaohao,tname);
except
  application.MessageBox('常规错误，无法获取BOM料号！！，请选择BOM料号后重试','导出数据错误',mb_ok+MB_ICONSTOP);
  statusbar1.Panels.Items[3].Text:='完成！！！！' ;
  statusbar1.Update;
  exit;
end;             //judge that is it a bom
 if existbom(tname)<>true then
 begin
    application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);
    statusbar1.Panels.Items[3].Text:='完成！！！！' ;
    statusbar1.Update;
    exit;
 end;
    if trim(liaohao)<>'' then
       begin

         try
          printbomtotable(v,trim(liaohao));      //get data and insetinto bomlist
          bomdetail.ADOTable1.Close;
          bomdetail.ADOTable1.TableName:=v.TableName;
          bomdetail.ADOTable1.Open ;

          bomdetail.ShowModal;
                                                 //print to printer;
          except
           application.MessageBox('无法收集展开BOM所需要的数据，可能当前BOM数据信息不完整！！','导出数据错误',mb_ok+MB_ICONSTOP);
           statusbar1.Panels.Items[3].Text:='完成！！！！' ;
           statusbar1.Update;
           exit;
          end;
       end
   else
      application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);

 v.Close;
 v.Free;


    statusbar1.Panels.Items[3].Text:='完成！！！！' ;
    statusbar1.Update;
    exit;
end;     //print extend bom



 // print normal bom
 createprintbom(bomliststn) ;
 v:=Tadotable.Create(application);
 v.Connection:=dm.ADOConnection1;
 v.Close;
 v.TableName:=trim(bomliststn);

try
 liaohao:=adoquery1.FieldValues['料号'];
if  adoquery1.FieldValues['客户']=null then
    bomdetail.costomer:=''
else
bomdetail.costomer:=trim(adoquery1.FieldValues['客户']);
if  adoquery1.FieldValues['使用机种']=null then
    bomdetail.model:=''
else
bomdetail.model:=trim(adoquery1.FieldValues['使用机种']);
if  adoquery1.FieldValues['料号']=null then
    bomdetail.liaohao:=''
else
bomdetail.liaohao:=trim(adoquery1.FieldValues['料号']);
if  adoquery1.FieldValues['最新版本']=null then
    bomdetail.versions:=''
else
bomdetail.versions:=trim(adoquery1.FieldValues['最新版本']);
bomdetail.dates:=datetostr(date());
if  adoquery1.FieldValues['规格说明']=null then
    bomdetail.guige:=''
else
bomdetail.guige:=trim(adoquery1.FieldValues['规格说明']);

fomatliaohao(liaohao,tname);
except
  application.MessageBox('常规错误，无法获取BOM料号！！，请选择BOM料号后重试','导出数据错误',mb_ok+MB_ICONSTOP);
  statusbar1.Panels.Items[3].Text:='完成！！！！' ;
  statusbar1.Update;
  exit;
end;             //judge that is it a bom
 if existbom(tname)<>true then
 begin
    application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);
    statusbar1.Panels.Items[3].Text:='完成！！！！' ;
    statusbar1.Update;
    exit;
 end;
    if trim(liaohao)<>'' then
       begin
         //exportdata()
         try
          printbomtotable(v,trim(liaohao));      //get data and insetinto bomlist
          bomdetail.ADOTable1.Close;
          bomdetail.ADOTable1.TableName:=v.TableName;
          bomdetail.ADOTable1.Open ;

          bomdetail.ShowModal;
                                                 //print to printer;
          except
           application.MessageBox('无法收集展开BOM所需要的数据，可能当前BOM数据信息不完整！！','导出数据错误',mb_ok+MB_ICONSTOP);
           statusbar1.Panels.Items[3].Text:='完成！！！！' ;
           statusbar1.Update;
           exit;
          end;
       end
   else
      application.MessageBox('没有数据对象可供导出，请选择一个BOM档！！','导出数据错误',mb_ok+MB_ICONSTOP);

 v.Close;
 v.Free;
statusbar1.Panels.Items[3].Text:='完成！！！！' ;
statusbar1.Update;
end;


procedure Tbomeditfm.N6Click(Sender: TObject);
var
keys,bomliao,sqlstr,tname,fields,liaohao:string;
i:integer;
 //i1,i2,i3,i4,i5,i6,i7:integer;
begin
lookupliaofm.showmodal;

keys:=lookupliaofm.liaohao;
statusbar1.Panels.Items[3].Text:='请稍等...正在查找..........' ;
statusbar1.Update;
if lookupliaofm.cancel=true then
begin
 statusbar1.Panels.Items[3].Text:='完成！' ;
 exit;
end;
tv.FullCollapse;
if trim(keys)='' then
begin
statusbar1.Panels.Items[3].Text:='完成！！！！' ;
statusbar1.Update;
exit;
end;
if adoquery1.Active<>false then
    if trim(adoquery1.FieldValues['料号'])<>'' then
       bomliao:=adoquery1.FieldValues['料号']
else
begin
exit;
statusbar1.Panels.Items[3].Text:='完成！' ;
end;

if keys[1] in ['0'..'9'] then
fields:='料号'
else fields:='零件位置';
//sqlstr:='select * from '+bomliao+' where '+fields+' like '+ ''''+'%'+keys+'%'+'''';


if tabpageshow1=true then
  begin
      showmessage('请切换到层次视图操作此功能！     ');
      statusbar1.Panels.Items[3].Text:='完成！' ;
      exit;
  end;
 for i:=0 to tv.Items.Count-1 do
 begin
   liaohao:=trim(tv.Items.Item[i].Text);
   if not (liaohao[1] in ['0'..'9']) then
   begin
   bomliao:='';
   copystring(liaohao,'(',')',bomliao);
   liaohao:=bomliao;
   end;

   fomatliaohao(liaohao,bomliao);
  // sqlstr:='select * from '+bomliao+' where '+fields+' like '+ ''''+'%'+keys+'%'+'''';



  if existbom(bomliao)=true then
      begin
         // tq.Close;
         // tq.SQL.Clear;
         //// tq.SQL.Add(sqlstr);
         // tq.Open;
         //if tq.RecordCount>=1 then
          //   datasource1.DataSet:=tq;
         //----------  if adotable1.Locate('零件位置', VarArrayOf([keys]), [loPartialKey])=true then
          adotable1.Close;
          adotable1.TableName:=bomliao;
          adotable1.Open;
         if fields='料号' then
         begin
            if adotable1.Locate('料号',keys, [loPartialKey])=true then
                begin
                    adotable1.Locate('料号',keys, [loPartialKey]);
                    showmessage('找到一条此料号！！！');
                    tv.Items.Item[i].Selected:=true;
                    lookupliaofm.ShowModal;
                    if lookupliaofm.cancel=true then
                       begin
                            statusbar1.Panels.Items[3].Text:='完成！！！！' ;
                            break;
                            exit;
                       end;
                end;
         end;
         if fields='零件位置' then
         begin
            if adotable1.Locate('零件位置',keys, [loPartialKey])=true then
                begin
                adotable1.Locate('零件位置',keys, [loPartialKey]);
                    showmessage('找到一处相关值！！！');
                    tv.Items.Item[i].Selected:=true;
                    lookupliaofm.ShowModal;
                    if lookupliaofm.cancel=true then
                       begin
                       statusbar1.Panels.Items[3].Text:='完成！！！！' ;
                       break;
                       exit;
                       end;
                end;
         end;
      end;
 end;
 for i:=0 to tv.Items.Count-1 do
 begin
   liaohao:=trim(tv.Items.Item[i].Text);
   if not (liaohao[1] in ['0'..'9']) then
   begin
   bomliao:='';
   copystring(liaohao,'(',')',bomliao);
   liaohao:=bomliao;
   end;

      if liaohao=keys then
         begin

            tv.Items.Item[i].Selected:=true;
            tv.OnClick(sender);
        end ;
 end;

    {   with adoquery2 do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);
           open;
           First;
    for i1:=0 to adoquery2.RecordCount-1 do        //expent bom
                begin
                   if  adoquery2.FieldValues['料号']=keys then
                   begin
                        datasouce1.dataset:=adoquery2;
                        exit;
                   end;
                    fomatliaohao(trim(adoquery2.FieldValues['料号']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                          if  t2.FieldValues['料号']=keys then
                                              begin
                                              datasouce1.dataset:=t2;
                                              exit;
                                               end;
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['料号']));
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['料号']));
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['料号']));
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            l6:=AddChild(l5 ,trim(t6.FieldValues['料号']));
                                                                            fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['料号']));
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;



                    adoquery2.Next;
                end;   }
 statusbar1.Panels.Items[3].Text:='完成！！！！' ;
 statusbar1.Update;
end;

function Tbomeditfm.parseliaohao(liaohao:string):string;
var
   i:integer;
   newliaohao:string;
begin
newliaohao:='';
if liaohao[1]='B' then                             //1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
     for i:=0 to length(liaohao)do                 //A A X B B B B B B -  C  C  -  D:
     begin
         if i+2>length(liaohao) then
         break;
         if i+2=11 then
         newliaohao:=newliaohao+'-';

         newliaohao:=newliaohao+liaohao[i+2];

     end;
     result:=newliaohao;
end;
procedure Tbomeditfm.TabSheet1Show(Sender: TObject);
var
i,count:integer;
strsql,tname,liaohao:string;
begin
tabpageshow1:=true;



exit;


bomlist.Close;                            //get all bom
bomlist.Open;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin
               tname:=parseliaohao(bomlist.FieldValues['name']);
               strsql:='select * from lingjianliaohao where 料号='+''''+tname+''''+' and 承认<>'+''''+'已审核'+''''+' and 承认<>'+''''+'已核准'+'''';
               adoquery1.Close;
               adoquery1.SQL.Clear;                              //get checked bom
               adoquery1.SQL.Add(strsql);
               adoquery1.Open;

               if  adoquery1.RecordCount=1 then
                   begin
                    //  liaohao:=adoquery1.FieldValues['料号'];
                    //  adoquery2.Close;                          //get checked bom information
                    //  adoquery2.SQL.Clear;
                    //  adoquery2.SQL.Add('select * from lingjianliaohao where 料号= '+''''+liaohao+'''');
                   //   adoquery2.Open;
                      lv.Items.Add;
                      count:=lv.Items.Count;
                      lv.Items[count-1].Caption:=adoquery1.FieldValues['料号'];          //add to string list
                      if  adoquery1.FieldValues['品名']<>null then
                      lv.Items[count-1].SubItems.add(adoquery1.FieldValues['品名']);
                      lv.Items[count-1].SubItems.add(adoquery1.FieldValues['规格说明']);

                   end;


               bomlist.Next;
            end;
            adoquery1.Close;
   end;
end;


procedure Tbomeditfm.LVClick(Sender: TObject);
var
  sqlstr,estr:string;
  liaohao:string;
  bomliaohao:string;
begin

try
//if tv.Items.Item[0].Selected=false   then
//   exit;
   try

   liaohao:=lv.Selected.Caption;
   lbom.Caption:=trim(liaohao);
   except
   end;
   if trim(liaohao)='' then
       exit;
   if not (liaohao[1] in ['0'..'9']) then
   begin
   liaohao:='';
   copystring(tv.Selected.Text,'(',')',liaohao);
   end;
   bomliaohao:=liaohao;
   sqlstr:='select * from lingjianliaohao where 料号='+''''+liaohao+'''';
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add(sqlstr);
   adoquery1.Open;
  // if adoquery1.FieldValues['锁']=true then
  //   begin
  //     showmessage('此BOM已进入锁定状态！！');
  //     exit;
   //  end;
if (adoquery1.FieldValues['承认']<>null)or(adoquery1.FieldValues['承认']<>'') then
  if (trim(adoquery1.FieldValues['承认'])='已核准') then
   begin
       dbedit2.ReadOnly:=true;
       dbedit4.ReadOnly:=true;
       dbedit5.ReadOnly:=true;
       dbgrid1.ReadOnly:=true;
       dbgrid2.ReadOnly:=true;
   end
   else
   begin
       dbedit2.ReadOnly:=false;
       dbedit4.ReadOnly:=false;
       dbedit5.ReadOnly:=false;
       dbgrid1.ReadOnly:=false;
       dbgrid2.ReadOnly:=false;
   end;
except
    adoquery1.Close;
    adotable1.Close;
end;
try
   fomatliaohao(liaohao,liaohao);
   if existbom(liaohao) then
   begin
   adotable1.Close;
   datasource1.DataSet:=adotable1;
   adotable1.TableName:=liaohao;
   adotable1.Open;


  end;
   adotable1.Locate('料号',bomliaohao, [loPartialKey]);
   
except
   adotable1.Close;
end;
try
 estr:='SELECT '+liaohao+'.料号 AS 料号, '+ liaohao+'.阶层 AS 阶层, ' +liaohao+'.单位用量 AS 单位用量, '+liaohao+'.零件位置 AS 零件位置, '   +
      'lingjianliaohao.品名 AS 品名, lingjianliaohao.规格说明 AS 规格说明,  '+
      'lingjianliaohao.承认 AS 承认 ' +
      'FROM '+liaohao+' cross JOIN lingjianliaohao '+
      'where '+liaohao+'.料号 = lingjianliaohao.料号  order by 料号';
aqljlh.Close;
aqljlh.SQL.Clear;
aqljlh.SQL.Add(estr);
aqljlh.Open ;
aqljlh.Locate('料号',bomliaohao, [loPartialKey]);
except
end;
try
   MakeDBGridColumnsAutoFixItsWidth(DBGrid2) ;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
except
end;

end;
procedure Tbomeditfm.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid2 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=ClYellow;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource2.DataSet.RecNo mod 2<>0 then {判断当前数据是奇数还是偶数行}
Canvas.brush.Color :=ClWhite {如果是奇数行，DBGrid背景以白色显示}
else
Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
end;

end;





procedure Tbomeditfm.DBGrid2CellClick(Column: TColumn);
begin
adotable1.Locate('料号',trim(aqljlh.FieldValues['料号']), [loPartialKey]);
end;

procedure Tbomeditfm.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down)or (key=vk_up) then
adotable1.Locate('料号',trim(aqljlh.FieldValues['料号']), [loPartialKey]);
end;

procedure Tbomeditfm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down)or (key=vk_up) then
aqljlh.Locate('料号',trim(adotable1.FieldValues['料号']), [loPartialKey]);
end;

procedure Tbomeditfm.DBGrid1TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid1.Columns.Count do
  begin
    DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid1.Columns[i-1].Title.Font.Style := [];
  end;

if ADOtable1.Sort<>Column.FieldName+' DESC' then
begin
   ADOtable1.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      ADOtable1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //改变标题行字体为红色，表示当前的排序方式为降序
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tbomeditfm.DBGrid1CellClick(Column: TColumn);
begin
  
aqljlh.Locate('料号',trim(adotable1.FieldValues['料号']), [loPartialKey]);
end;

procedure Tbomeditfm.SpeedButton9Click(Sender: TObject);
begin
if adoquery1.Active=true then
 if  adoquery1.FieldValues['料号']<>'' then
 begin
      adoquery1.Edit;
      adoquery1.FieldValues['承认']:='已审核';
      adoquery1.Post;
   end;
end;

procedure Tbomeditfm.Edit10KeyPress(Sender: TObject; var Key: Char);
var
i,count:integer;
strsql,tname,liaohao,bomliao:string;
begin
if key=#13 then
begin                                                                                                                           //+' and 类别='+''''+'true'+''''
lv.Clear;
bomlist.Close;
bomlist.SQL.Clear;
bomlist.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and 承认<>'+''''+'已核准'+'''');                           //get all bom
bomlist.Open;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin
                      bomliao:=bomlist.FieldValues['料号'];
                      fomatliaohao(bomliao,bomliao);
                      if existbom(bomliao)=true then
                         begin
                         lv.Items.Add;
                         count:=lv.Items.Count;
                         lv.Items[count-1].Caption:=trim(bomlist.FieldValues['料号']);          //add to string list
                         if  bomlist.FieldValues['品名']<>null then
                             lv.Items[count-1].SubItems.add(trim(bomlist.FieldValues['品名']));
                         lv.Items[count-1].SubItems.add(bomlist.FieldValues['规格说明']);
                         end;
               bomlist.Next;
            end;
            bomlist.Close;
   end;
end;
end;
function Tbomeditfm.checkmodel(model:string;var substrs:array of string):boolean;
var

  i:integer;
  count:integer;
begin
    
   count:=0;
    readstr(model,' ',substrs);
    for i:=0 to   high(substrs)    do
       begin
         if trim(substrs[i])<>'' then
             count:=count+1;
       end;
    if count >1 then
        result:=true
    else
        result:=false;
        
end;
procedure updatemodel(liaohao:string;dvdmodel:string);
var
 i,j:integer;
 substrs:array of string;
 fanded:boolean;
 model:string ;
 adoquery:Tadoquery;
begin
try
adoquery:=Tadoquery.Create(application);
adoquery.Connection:=dm.ADOConnection1;
adoquery.Close;
adoquery.SQL.Clear;
adoquery.SQL.Add('select 料号,使用机种 from lingjianliaohao where 料号='+''''+trim(liaohao)+'''');
adoquery.Open;
if adoquery.RecordCount>=1 then
begin
if adoquery.FieldValues['使用机种']=Null then
model:=''
else
model:=trim(adoquery.FieldValues['使用机种']);
    fanded:=false;
     setlength(substrs,length(model)+1);
     for i:=0 to high(substrs) do
      begin
       substrs[i]:='';
      end;

     readstr(model,' ',substrs);
     for j:=0 to high(substrs) do
     begin
         if trim(dvdmodel)=trim(substrs[j]) then
         begin
            fanded:=true;
            break;
         end;

     end;
     if fanded=false then
     begin
         model:='';
        /// for i:=0 to  high(substrs) do
        // begin
             if adoquery.FieldValues['使用机种']=Null then
                model:=dvdmodel
             else if trim(adoquery.FieldValues['使用机种'])='' then
                model:=dvdmodel
             else 
              model:=trim(adoquery.FieldValues['使用机种'])+','+dvdmodel;
              adoquery.Edit;
              adoquery.FieldValues['使用机种']:=model;
              adoquery.Post;
        // end;
     end;

end;//adoquery.recordcount>1
finally
    adoquery.Close;
    adoquery.Free;
end;
end;
procedure Tbomeditfm.SButton15Click(Sender: TObject);
var
  l1,l2,l3,l4,l5,l6,l7: TTreeNode;
  i1,i2,i3,i4,i5,i6,i7:integer;
  tablename,liaohao:string;
  dvdmodel:string;
begin
//liaohao:=bomliaohao;
begin
 statusbar1.Panels.Items[3].Text:='请稍等...正在机种信息.................' ;
 statusbar1.Update;

if trim(adoquery1.FieldValues['料号'])='' then
   begin
       showmessage('没有对象可以操作！你确认要操作的BOM后重试！！');
        statusbar1.Panels.Items[3].Text:='机种更新完成！！！！！';
       exit;
   end;
if adoquery1.FieldValues['使用机种']=Null then
   begin
       showmessage('没有对象可以操作！选种的BOM机种为空！！');
        statusbar1.Panels.Items[3].Text:='机种更新完成！！！！！';
       exit;
   end;
if trim(adoquery1.FieldValues['使用机种'])='' then
   begin
       showmessage('没有对象可以操作！选种的BOM机种为空！！');
        statusbar1.Panels.Items[3].Text:='机种更新完成！！！！！';
       exit;
   end;
dvdmodel:=trim(adoquery1.FieldValues['使用机种']);
with tv.Items do
   begin

       begin
                liaohao:=trim(adoquery1.FieldValues['料号']);
                begin
                   // l1:=add(nil ,adoquery1.FieldValues['品名']+'('+trim(adoquery1.FieldValues['料号'])+')');  //change   成品档
                    fomatliaohao(liaohao,tablename);
                         if existbom(tablename)=true then
                            begin
                                 acttable(tablename,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         //l2:=AddChild(l1 ,trim(t2.FieldValues['料号']));
                                         updatemodel(trim(t2.FieldValues['料号']),dvdmodel);
                                         fomatliaohao(trim(t2.FieldValues['料号']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                       //l3:=AddChild(l2 ,trim(t3.FieldValues['料号']));
                                                        updatemodel(trim(t3.FieldValues['料号']),dvdmodel);
                                                        fomatliaohao(trim(t3.FieldValues['料号']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            //l4:=AddChild(l3 ,trim(t4.FieldValues['料号']));
                                                            updatemodel(trim(t4.FieldValues['料号']),dvdmodel);
                                                            fomatliaohao(trim(t4.FieldValues['料号']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                  // l5:=AddChild(l4 ,trim(t5.FieldValues['料号']));
                                                                   updatemodel(trim(t5.FieldValues['料号']),dvdmodel);
                                                                   fomatliaohao(trim(t5.FieldValues['料号']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            //l6:=AddChild(l5 ,trim(t6.FieldValues['料号']));
                                                                             updatemodel(trim(t6.FieldValues['料号']),dvdmodel);
                                                                            fomatliaohao(trim(t6.FieldValues['料号']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                     // l7:=AddChild(l6 ,trim(t7.FieldValues['料号']));
                                                                                      updatemodel(trim(t7.FieldValues['料号']),dvdmodel);
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;



                   // adoquery2.Next;
                end;
       end;

end;

   end;
  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='机种更新完成！！！！！';
  showmessage('机种信息更新完成！！！！          ');
end;



procedure Tbomeditfm.DBGrid1ColExit(Sender: TObject);
var
weizhi,pwh,yongliang,dw,yl:string;
count:double;
i:integer;
begin

exit;

if adotable1.Active=false then
   exit;
tq.Close;
tq.SQL.Clear;
tq.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(adotable1.FieldValues['料号'])+'''');
tq.Open;
if tq.RecordCount<1 then
   showmessage('此料号在料库之中不存在'+trim(adotable1.FieldValues['料号']));
if adotable1.FieldValues['零件位置']=Null then
   showmessage('请注意位号为空！！！')
else
try
count:=0;
weizhi:='';
pwh:='';
yongliang:='';
dw:='';
yl:='';
sumno(trim(adotable1.FieldValues['零件位置']),count,weizhi,pwh);

    if  adotable1.FieldValues['单位用量']=Null then
        yongliang:=''
    else
        yongliang:= trim(adotable1.FieldValues['单位用量']);
    for i:=1 to length(yongliang)  do     //get yongliang
    begin
        try
           if (not (yongliang[i]  in ['A'..'Z','a'..'z']))and ((yongliang[i]  in ['0'..'9','.'])) then
               yl:=yl+yongliang[i]
           else
             dw:=dw+yongliang[i];
        except
        end;
    end;
    if trim(yl)='' then
    showmessage('当前用量为空！！');
    if count<>strtofloat(yl) then
    showmessage('用量与未号不相符，用量应为：'+floattostr(count));
    if pwh<>'' then
    showmessage('位号重复：'+pwh);
except
end;
end;
procedure Tbomeditfm.checkwh(f:boolean);
var
weizhi,pwh,yongliang,dw,yl,ljwz,whs:string;
count:double;
i,j:integer;
counter:integer;
begin
listview1.Clear;
ljwz:='';
if adotable1.Active=false then
   exit;
   adotable1.First;
for i:=0 to adotable1.RecordCount-1 do
  begin
     ljwz:=ljwz+trim(adotable1.FieldValues['零件位置']);
     adotable1.Next;
  end;
adotable1.First;
for j:=0 to adotable1.RecordCount-1 do
begin
//if trim(adotable1.FieldValues['料号'])='25Z104016-01'  then
  // showmessage('ok');
if adotable1.FieldValues['零件位置']=Null then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['料号'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
    listview1.Items[counter-1].SubItems.add('位号为空');
  end;
try
count:=0;
weizhi:='';
pwh:='';
yongliang:='';
dw:='';
yl:='';
whs:='';
if f=false then
whs:=trim(adotable1.FieldValues['零件位置'])
else
begin
  for i:=0 to adotable1.RecordCount-1 do
      begin
          whs:=whs+trim(adotable1.FieldValues['零件位置'])+' ';
      end;
end;
sumno(whs,count,weizhi,pwh);
if  adotable1.FieldValues['单位用量']=Null then
    yongliang:=''
else
   yongliang:= trim(adotable1.FieldValues['单位用量']);
for i:=1 to length(yongliang)  do     //get yongliang
    begin
        try
           if (not (yongliang[i]  in ['A'..'Z','a'..'z']))and ((yongliang[i]  in ['0'..'9','.'])) then
               yl:=yl+yongliang[i]
           else
             dw:=dw+yongliang[i];
        except
        end;
    end;

if trim(yl)='' then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['料号'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
    listview1.Items[counter-1].SubItems.add('位号为空');
    yl:='0';
  end;
if count<>strtofloat(yl) then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['料号'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
    listview1.Items[counter-1].SubItems.add('位号与用量不相符 数量：'+floattostr(count));
  end;

except
end;    //for
adotable1.Next;
end;
count:=0;
weizhi:='';
pwh:='';
sumno(ljwz,count,weizhi,pwh);
if pwh<>'' then
begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:='';//adotable1.FieldValues['料号'];
    //listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
    //listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
    listview1.Items[counter-1].SubItems.add('位号重复: '+pwh);
end;
pagecontrol2.Visible:=true;
end;

procedure Tbomeditfm.Sp15Click(Sender: TObject);
var
   liaohao:string;
begin
 checklhfm.showmodal;
if  checklhfm.cancel=true then
    exit;
liaohao:=trim(adoquery1.FieldValues['料号']);
if checklhfm.C1.Checked=true then
begin
if adoquery1.Active=true then
   begin
       if liaohao<>'' then
          begin
           checkbomrecords(trim(adoquery1.FieldValues['料号']));
           pagecontrol2.Visible:=true;
           tabsheet1.Show ;
          // pagecontrol2
          end
       else
       begin
        showmessage('未找到要检查的BOM！！！');
        exit;
       end;
   end
   else
   begin
    showmessage('未发现要检查的BOM！！！');
    exit;
   end;
end;
if checklhfm.C3.Checked=true then
   begin
   checkwh(false);
   end;
if checklhfm.C4.Checked=true then
   begin
   checkwh(true);
   end;
end;
procedure Tbomeditfm.DBGrid1Exit(Sender: TObject);
var
weizhi,pwh,yongliang,dw:string;
count:double;
i:integer;
begin
exit;
if adotable1.Active=false then
   exit;
tq.Close;
tq.SQL.Clear;
tq.SQL.Add('select * from lingjianliaohao where 料号='+''''+trim(adotable1.FieldValues['料号'])+'''');
tq.Open;
if tq.RecordCount<1 then
   showmessage('此料号在料库之中不存在'+trim(adotable1.FieldValues['料号']));
if adotable1.FieldValues['零件位置']=Null then
   showmessage('请注意位号为空！！！')
else
try
sumno(trim(adotable1.FieldValues['零件位置']),count,weizhi,pwh);
yongliang:='';
    if  adotable1.FieldValues['单位用量']=Null then
        yongliang:=''
    else
        yongliang:= trim(adotable1.FieldValues['单位用量']);
    for i:=1 to length(yongliang)  do     //get yongliang
    begin
        try
           if (not (yongliang[i]  in ['A'..'Z','a'..'z']))and ((yongliang[i]  in ['0'..'9','.'])) then
               yl:=yl+yongliang[i]
           else
             dw:=dw+yongliang[i];
        except
        end;
    end;
    if trim(yl)='' then
    showmessage('当前用量为空！！');
    if count<>strtofloat(yl) then
    showmessage('用量与未号不相符，用量应为：'+floattostr(count));
    if pwh<>'' then
    showmessage('位号重复：'+pwh);
except
end;
end;


procedure Tbomeditfm.Sp11Click(Sender: TObject);
var
weizhi,pwh,yongliang,dw,yl,ljwz:string;
count:double;
i,j:integer;
counter:integer;
begin
listview1.Clear;
ljwz:='';
if adotable1.Active=false then
   exit;
   adotable1.First;
for i:=0 to adotable1.RecordCount-1 do
  begin
     ljwz:=ljwz+trim(adotable1.FieldValues['零件位置']);
     adotable1.Next;
  end;
adotable1.First;
for j:=0 to adotable1.RecordCount-1 do
begin
//if trim(adotable1.FieldValues['料号'])='25Z104016-01'  then
  // showmessage('ok');
if adotable1.FieldValues['零件位置']=Null then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['料号'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
    listview1.Items[counter-1].SubItems.add('位号为空');
  end;
try
count:=0;
weizhi:='';
pwh:='';
yongliang:='';
dw:='';
yl:='';
sumno(trim(adotable1.FieldValues['零件位置']),count,weizhi,pwh);
if  adotable1.FieldValues['单位用量']=Null then
    yongliang:=''
else
   yongliang:= trim(adotable1.FieldValues['单位用量']);
for i:=1 to length(yongliang)  do     //get yongliang
    begin
        try
           if (not (yongliang[i]  in ['A'..'Z','a'..'z']))and ((yongliang[i]  in ['0'..'9','.'])) then
               yl:=yl+yongliang[i]
           else
             dw:=dw+yongliang[i];
        except
        end;
    end;

if trim(yl)='' then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['料号'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
    listview1.Items[counter-1].SubItems.add('位号为空');
    yl:='0';
  end;
if count<>strtofloat(yl) then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['料号'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
    listview1.Items[counter-1].SubItems.add('位号与用量不相符 数量：'+floattostr(count));
  end;

except
end;    //for
adotable1.Next;
end;
count:=0;
weizhi:='';
pwh:='';
sumno(ljwz,count,weizhi,pwh);
if pwh<>'' then
begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:='';//adotable1.FieldValues['料号'];
    //listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['单位用量']);
    //listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['零件位置']);
    listview1.Items[counter-1].SubItems.add('位号重复: '+pwh);
end;
pagecontrol2.Visible:=true;
end;

procedure Tbomeditfm.N10Click(Sender: TObject);
begin
pagecontrol2.Visible:=true;
end;

procedure Tbomeditfm.ListView1Click(Sender: TObject);
var
liaohao:string;
begin
  liaohao:=trim(listview1.Selected.Caption);
  if liaohao<>'' then
  adotable1.Locate('料号',liaohao, [loPartialKey]);
end;

procedure Tbomeditfm.DBGrid2TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid2.Columns.Count do
  begin
    DBGrid2.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid2.Columns[i-1].Title.Font.Style := [];
  end;

if aqljlh.Sort<>Column.FieldName+' DESC' then
begin
   aqljlh.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      aqljlh.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //改变标题行字体为红色，表示当前的排序方式为降序
      Column.Title.Font.Style := [fsBold];
  end;

end;
procedure createtable(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[B_ID] [int] IDENTITY (1, 1) NOT NULL  ,                       '+
 '	[料号] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL primary key,         '+
 '	[阶层] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[单位用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[工单用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[零件位置] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL,         '+
 '  [单价] [float] NULL default 0.00,                                               '+
 ' 	[合计] [float] NULL default 0.00                                              '+
') ON [PRIMARY]';

//' 	[承认] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,                '+
    //primary key
    // ' 	[数量] [float] NULL default 0.00,             '+
  // '	[序号] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

   with bomeditfm.ad do
         begin

             CommandText:='';
             CommandText:=str;
             execute;

         end;

end;
procedure Tbomeditfm.saveasClick(Sender: TObject);
var
  liaohao,bomliao,sqlstr,oldtable:string;
begin
if adoquery1.Active=false then
   begin
       showmessage('没有发现要另存为之BOM 请选择一个有效BOM');
       EXIT;
   end;
oldtable:=trim(adoquery1.FieldValues['料号']);
saveasfm.ComboBox1.Text:=adoquery1.FieldValues['料号'];

//saveasfm.ComboBox1.OnKeyPress(self,'13');
saveasfm.Edit1.Text:=adoquery1.FieldValues['料号'];
saveasfm.Caption:='ＢＯＭ另存为';
saveasfm.showmodal;
saveasfm.Edit1.Update;
if saveasfm.cancel=true then
   exit;

liaohao:=trim(saveasfm.Edit1.Text);

if oldtable='' then
   begin
       showmessage('无效的BOM 料号，料号为空！请选择一个有效的BOM！！！');
       exit;
   end;
if oldtable='' then
   begin
       showmessage('要另存的BOM 料号无效！！！');
       exit;
   end;
fomatliaohao(oldtable,oldtable);
if existbom(oldtable)=false then
   begin
       showmessage('要另存的BOM 不存在！！！！');
       exit;
   end;

 tqprelh.Close;
 tqprelh.SQL.Clear;
 tqprelh.SQL.Add('select * from prelingjianliaohao where 料号='+''''+liaohao+'''');
 tqprelh.Open;
 if tqprelh.RecordCount>=1 then
    begin
        showmessage('此料号已被申请！！！！');
        exit;
    end;
 try
 tqprelh.Append;
 tqprelh.FieldValues['料号']:=liaohao;
 tqprelh.FieldValues['规格说明']:=adoquery1.FieldValues['规格说明'];
 tqprelh.FieldValues['品名']:=adoquery1.FieldValues['品名'];
 tqprelh.FieldValues['版本']:=adoquery1.FieldValues['最新版本'];
 tqprelh.FieldValues['使用机种']:=adoquery1.FieldValues['使用机种'];
 tqprelh.FieldValues['承认']:=adoquery1.FieldValues['承认'];
 tqprelh.FieldValues['申请人']:=userrealname;
 tqprelh.Post;
 except
 showmessage('申请新料号失败！！     ');
 exit;
 end;

fomatliaohao(liaohao,bomliao);
sqlstr:='insert into '+bomliao +' select 料号, 阶层, 单位用量, 工单用量, 零件位置,单价,合计  from '+oldtable;

try
createtable(bomliao);
ad.CommandText:='';
ad.CommandText:=sqlstr;
ad.Execute;
except
application.MessageBox('出现异常！，复制数据表失败 请寻求技术支持解决此问题！！！  ','复制失败!',mb_ok+MB_ICONerror);
abort;
end;
application.MessageBox('另存为BOM成功！！！               ','HBS提示!',mb_ok+MB_ICONinformation);

end;

procedure Tbomeditfm.TabSheet2Show(Sender: TObject);
begin
tabpageshow1:=false;
end;

procedure Tbomeditfm.DBEdit6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
dbedit6.Hint:=dbedit6.Text;
end;

procedure Tbomeditfm.DBEdit3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
dbedit3.Hint:=dbedit3.Text;
end;

procedure Tbomeditfm.N20Click(Sender: TObject);
begin
pagecontrol2.Visible:=false;
end;

procedure Tbomeditfm.N21Click(Sender: TObject);
begin
pagecontrol2.Visible:=true;
end;

procedure Tbomeditfm.N22Click(Sender: TObject);
begin
tqprelh.Delete;
end;

procedure Tbomeditfm.lookupbkClick(Sender: TObject);
begin
lookupbackupfm.show;
end;

end.
