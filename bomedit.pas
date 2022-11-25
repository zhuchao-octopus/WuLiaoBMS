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
    tq.SQL.Add('select * from lingjianliaohao where �Ϻ�='+''''+lh+'''');
    tq.Open;
    if tq.RecordCount>=1 then
       begin
           tq.Edit;
       //  if tq.FieldValues['״̬']<>true then         //=true 
            tq.FieldValues['����']:='�Ѻ�׼' ;
           tq.Post;
       end;
end;
procedure Tbomeditfm.updatestatus(liaohao:string);
var
  i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11:integer;
  tablename:string;
begin
 statusbar1.Panels.Items[3].Text:='���Ե�...���ڸ���BOM״̬����.................' ;
 statusbar1.Update;

                    fomatliaohao(liaohao,tablename);
                         if existbom(tablename)=true then
                            begin
                                 acttable(tablename,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 setstatus(trim(t2.FieldValues['�Ϻ�']));
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                      fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                           setstatus(trim(t3.FieldValues['�Ϻ�']));
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin

                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 setstatus(trim(t4.FieldValues['�Ϻ�']));
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin

                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                       setstatus(trim(t5.FieldValues['�Ϻ�']));
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin

                                                                            fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                               setstatus(trim(t6.FieldValues['�Ϻ�']));
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin

                                                                                       fomatliaohao(trim(t7.FieldValues['�Ϻ�']),liaohao);
                                                                                       if existbom(liaohao)=true then
                                                                                       begin
                                                                                        setstatus(trim(t7.FieldValues['�Ϻ�']));
                                                                                         acttable(liaohao,t8);
                                                                                          for i8:=0 to t8.recordcount-1 do
                                                                                          begin

                                                                                            fomatliaohao(trim(t8.FieldValues['�Ϻ�']),liaohao);
                                                                                             if existbom(liaohao)=true then
                                                                                             begin
                                                                                             setstatus(trim(t8.FieldValues['�Ϻ�']));
                                                                                               acttable(liaohao,t9);
                                                                                                for i9:=0 to t9.recordcount-1 do
                                                                                                begin

                                                                                                  fomatliaohao(trim(t9.FieldValues['�Ϻ�']),liaohao);
                                                                                                  if existbom(liaohao)=true then
                                                                                                     begin
                                                                                                     setstatus(trim(t9.FieldValues['�Ϻ�']));
                                                                                                     acttable(liaohao,t10);
                                                                                                       for i10:=0 to t10.recordcount-1 do
                                                                                                           begin

                                                                                                              fomatliaohao(trim(t10.FieldValues['�Ϻ�']),liaohao);
                                                                                                             if existbom(liaohao)=true then
                                                                                                                begin
                                                                                                                setstatus(trim(t10.FieldValues['�Ϻ�']));
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


  statusbar1.Panels.Items[3].Text:='����BOM״̬��ϣ���������';
end;
procedure Tbomeditfm.checkbomrecord(lh:string);
var
 counter:integer;
begin
    tq.Close;
    tq.SQL.Clear;
    tq.SQL.Add('select * from lingjianliaohao where �Ϻ�='+''''+lh+'''');
    tq.Open;
    if tq.RecordCount<1 then
       begin
            tq.Close;
            tq.SQL.Clear;
            tq.SQL.Add('select * from prelingjianliaohao where �Ϻ�='+''''+lh+'''');
            tq.Open;
            if tq.RecordCount<1 then
               begin
               if checklhfm.C2.Checked=true then
                   begin
                   tqprelh.Close;
                   tqprelh.SQL.Clear;
                   tqprelh.SQL.Add('select * from prelingjianliaohao where ������='+''''+userrealname+'''');
                   tqprelh.Open;
                   tqprelh.Append;
                   tqprelh.FieldValues['�Ϻ�']:=lh;
                   tqprelh.FieldValues['���˵��']:='����';
                   tqprelh.FieldValues['������']:=userrealname;
                   tqprelh.Post;
                   dbgrid4.Visible:=true;
                   end
               else
                   begin
                        listview1.Items.Add;
                        counter:=listview1.Items.Count;
                        listview1.Items[counter-1].Caption:=adotable1.FieldValues['�Ϻ�'];
                        listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
                        listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
                        listview1.Items[counter-1].SubItems.add('�Ƿ����Ϻ�');
                   end;
               
               end;
       end;
end;
procedure tbomeditfm.checkbomrecords(liaohao:string);
var
  i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11:integer;
  tablename:string;
begin
 statusbar1.Panels.Items[3].Text:='���Ե�...���ڼ��BOM����.................' ;
 statusbar1.Update;

                    fomatliaohao(liaohao,tablename);
                         if existbom(tablename)=true then
                            begin
                                 acttable(tablename,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         checkbomrecord(trim(t2.FieldValues['�Ϻ�']));
                                      if checklhfm.R2.Checked=true then
                                         begin
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin

                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                     checkbomrecord(trim(t3.FieldValues['�Ϻ�']));
                                                      fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin

                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            checkbomrecord(trim(t4.FieldValues['�Ϻ�']));
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin

                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   checkbomrecord(trim(t5.FieldValues['�Ϻ�']));
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin

                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            checkbomrecord(trim(t6.FieldValues['�Ϻ�']));
                                                                            fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin

                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      checkbomrecord(trim(t7.FieldValues['�Ϻ�']));
                                                                                      fomatliaohao(trim(t7.FieldValues['�Ϻ�']),liaohao);
                                                                                       if existbom(liaohao)=true then
                                                                                       begin
                                                                                         acttable(liaohao,t8);
                                                                                          for i8:=0 to t8.recordcount-1 do
                                                                                          begin
                                                                                           checkbomrecord(trim(t8.FieldValues['�Ϻ�']));
                                                                                            fomatliaohao(trim(t8.FieldValues['�Ϻ�']),liaohao);
                                                                                             if existbom(liaohao)=true then
                                                                                             begin
                                                                                               acttable(liaohao,t9);
                                                                                                for i9:=0 to t9.recordcount-1 do
                                                                                                begin
                                                                                                 checkbomrecord(trim(t9.FieldValues['�Ϻ�']));
                                                                                                  fomatliaohao(trim(t9.FieldValues['�Ϻ�']),liaohao);
                                                                                                  if existbom(liaohao)=true then
                                                                                                     begin
                                                                                                     acttable(liaohao,t10);
                                                                                                       for i10:=0 to t10.recordcount-1 do
                                                                                                           begin
                                                                                                            checkbomrecord(trim(t10.FieldValues['�Ϻ�']));
                                                                                                              fomatliaohao(trim(t10.FieldValues['�Ϻ�']),liaohao);
                                                                                                             if existbom(liaohao)=true then
                                                                                                                begin
                                                                                                                   acttable(liaohao,t11);
                                                                                                                   for i11:=0 to t11.recordcount-1 do
                                                                                                                      begin
                                                                                                                          checkbomrecord(trim(t11.FieldValues['�Ϻ�']));
                                                                                                            
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

  showmessage('BOM�����ϣ�����');
  statusbar1.Panels.Items[3].Text:='BOM�����ϣ���������';
end;
procedure Tbomeditfm.createbomforprint(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[NO_ID] [int]  primary key,                       '+
 '  [Ʒ��] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
 '	[�Ϻ�] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,         '+
 '	[�ײ�] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[���˵��] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL ,    '+
 '	[��λ����] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[��������] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 ' 	[����] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,           '+
 ' 	[�汾] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,          '+
 '  [����] [float] NULL default 0.00,                                   '+
 ' 	[�ϼ�] [float] NULL default 0.00,                                    '+
 '	[���λ��] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL        '+

') ON [PRIMARY]';


    //IDENTITY (1, 1) NOT NULL 
    //primary key
   //  ' 	[����] [float] NULL default 0.00,                 '+
  // '	[���] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [Ʒ��] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[���˵��] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

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
statusbar1.Panels.Items[3].Text:='���Ե�...���ڱ�����.................' ;
statusbar1.Update;
fomatliaohao(backupliaohao,backupliaohao);
lastliao:='FullExtended' ;
bomliststn:=trim(backupliaohao);
if existbom(bomliststn)=true then
  begin
   IF  application.MessageBox('��ǰBOM�ı����Ѵ���,�Ƿ񸲸�����������','��ʾ��',MB_YESNO+MB_iconinformation)=ID_NO then
       exit;
      with ad do
               begin
                                       CommandText:='';
                                       CommandText:='drop table '+bomliststn;
                                       try
                                       execute;

                                        except
                                        application.MessageBox('�޷�������ʱ�ļ���         ','��ʾ��',MB_OK+MB_iconinformation) ;
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
           application.MessageBox('����BOM�������ֶ����BOM�ı��ݣ���','���ݴ���',mb_ok+MB_ICONSTOP);
           statusbar1.Panels.Items[3].Text:='����BOM����������' ;
           statusbar1.Update;
           exit;
          end;
       end
   else
      application.MessageBox('û�����ݶ���ɹ���������ѡ��һ��BOM������','�������ݴ���',mb_ok+MB_ICONSTOP);
 v.Close;
 v.Free;
//statusbar1.Panels.Items[3].Text:='���������У�������' ;
//statusbar1.Update;
statusbar1.Panels.Items[3].Text:='��ɣ�����' ;
end;
procedure tBOMEDITFM.createprintbom(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[NO_ID] [int] primary key ,                       '+
 '  [Ʒ��] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
 '	[�Ϻ�] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,         '+
 '	[�ײ�] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[���˵��] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+
 '	[��λ����] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[��������] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[���λ��] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL ,       '+
 ' 	[�汾] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL                '+
') ON [PRIMARY]';


    //IDENTITY (1, 1) NOT NULL 
//' 	[����] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,           '+
// '  [����] [float] NULL default 0.00,                                               '+

// ' 	[�ϼ�] [float] NULL default 0.00                                              '+
    //primary key
   //  ' 	[����] [float] NULL default 0.00,                 '+
  // '	[���] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [Ʒ��] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[���˵��] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

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
     v.FieldValues['Ʒ��']:=ar.Strings[0];
     v.FieldValues['�Ϻ�']:=ar.Strings[1];
     liaohao:=trim(ar.Strings[1]);
     v.FieldValues['�ײ�']:=ar.Strings[2];
     v.FieldValues['���˵��']:=ar.Strings[3];
     fomatliaohao(liaohao,bomliao);
    // if (existbom(bomliao))and (Ischecked(liaohao)) then
     //begin
     //   v.FieldValues['��λ����']:=''

    // end
    // else
     v.FieldValues['��λ����']:=ar.Strings[4];
     v.FieldValues['���λ��']:=ar.Strings[5];

     if flag=true then
        v.FieldValues['��������']:='Proplem'
     else v.FieldValues['��������']:='OK';

     if cus =true then
      begin
        v.FieldValues['����']:=ar.Strings[6];
        v.FieldValues['�ϼ�']:=ar.Strings[7];
        v.FieldValues['����']:=ar.Strings[8];
      end;
        v.FieldValues['�汾']:=ar.Strings[9];

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
   sqlstr:='select Ʒ��, �Ϻ�, �ײ�,���˵��,���°汾 from lingjianliaohao where �Ϻ�= '+''''+liaohao+'''';
   tqs.Connection:=dm.ADOConnection1;
   try
    with tqs do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);

           open;
                                            // if tqs.FieldValues['Ʒ��']<>'' then
           ar.Append(tqs.FieldValues['Ʒ��']);
                                         // if tqs.FieldValues['�Ϻ�']<> '' then
           ar.Append(tqs.FieldValues['�Ϻ�']) ;

           if tqs.FieldValues['�ײ�']<>null  then
           ar.Append(tqs.FieldValues['�ײ�'])
           else ar.Append(' ');
                                           // if tqs.FieldValues['���˵��']<> '' then
           ar.Append(tqs.FieldValues['���˵��']) ;

          if tqs.FieldValues['���°汾']<>null then
           ar.Append(tqs.FieldValues['���°汾'])
           else   ar.Append(' ');
            v.Append;
           
     v.Append;
     v.FieldValues['Ʒ��']:=ar.Strings[0];
     v.FieldValues['�Ϻ�']:=ar.Strings[1];
     v.FieldValues['�ײ�']:=ar.Strings[2];
     v.FieldValues['���˵��']:=ar.Strings[3];
     v.FieldValues['��λ����']:=ar.Strings[4];        //���°汾
    // v.FieldValues['���λ��']:=ar.Strings[5];
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
 //sqlstr:='select �Ϻ�,Ʒ��,���˵�� from lingjianliaohao where �Ϻ�='+''''+liaohao+'''';
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
   application.MessageBox('û�з��ֿ��Բ�����BOM����         ','��ʾ��',MB_OKCANCEL+MB_iconinformation) ;
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
                    madeoutstr(trim(tql.FieldValues['�Ϻ�']),tql,ar,flag);
                    printliaototable(v,ar,flag);
                    if printonelayer=false then       //print onelayer bom
                    begin
                    if lastliao<>'' then
                    /////////////////////////////////////has invalid   ///////////////////
                    if trim(tql.FieldValues['�Ϻ�'])=trim(lastliao) then               //  invalid
                       exit;
                    /////////////////////////////////////////////////////////////////// /
                      //  excel_No:=excel_No+1;
                    fomatliaohao(trim(tql.FieldValues['�Ϻ�']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                            if not((ischecked(trim(tql.FieldValues['�Ϻ�'])))and(lastliao='')) then    //��׼����
                               begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         Jie_NO:=2;
                                         madeoutstr(trim(t2.FieldValues['�Ϻ�']),t2,ar,flag);
                                         printliaototable(v,ar,flag);
                                          if lastliao<>'' then
                                          if trim(t2.FieldValues['�Ϻ�'])=trim(lastliao) then
                                             exit;
                                           // excel_No:=excel_No+1;
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                               if not((ischecked(trim(t2.FieldValues['�Ϻ�'])))and(lastliao='')) then
                                                     begin;
                                                   acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                     Jie_NO:=3;
                                                        madeoutstr(trim(t3.FieldValues['�Ϻ�']),t3,ar,flag);
                                                        printliaototable(v,ar,flag);
                                                         if lastliao<>'' then
                                                            if trim(t3.FieldValues['�Ϻ�'])=trim(lastliao) then
                                                               exit;
                                                    //    excel_No:=excel_No+1;
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                         if not((ischecked(trim(t3.FieldValues['�Ϻ�'])))and(lastliao='')) then
                                                           begin;
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                          Jie_NO:=4;
                                                            madeoutstr(trim(t4.FieldValues['�Ϻ�']),t4,ar,flag);
                                                            printliaototable(v,ar,flag);
                                                             if lastliao<>'' then
                                                                if trim(t4.FieldValues['�Ϻ�'])=trim(lastliao) then
                                                                   exit;
                                                           // excel_No:=excel_No+1;
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 if not ((ischecked(trim(t4.FieldValues['�Ϻ�'])))and(lastliao='')) then
                                                                     begin;
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                 Jie_NO:=5;
                                                                   madeoutstr(trim(t5.FieldValues['�Ϻ�']),t5,ar,flag);
                                                                    printliaototable(v,ar,flag);
                                                                     if lastliao<>'' then
                                                                        if trim(t5.FieldValues['�Ϻ�'])=trim(lastliao) then
                                                                           exit;
                                                                //    excel_No:=excel_No+1;
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                       if not((ischecked(trim(t5.FieldValues['�Ϻ�'])))and(lastliao='')) then
                                                                          begin;
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                         Jie_NO:=6;
                                                                           madeoutstr(trim(t6.FieldValues['�Ϻ�']),t6,ar,flag);
                                                                           printliaototable(v,ar,flag);
                                                                            if lastliao<>'' then
                                                                               if trim(t6.FieldValues['�Ϻ�'])=trim(lastliao) then
                                                                                  exit;
                                                                          // excel_No:=excel_No+1;
                                                                             fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                              if not((ischecked(trim(t6.FieldValues['�Ϻ�'])))and(lastliao='')) then
                                                                                     begin;
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                  Jie_NO:=7;
                                                                                      madeoutstr(trim(t7.FieldValues['�Ϻ�']),t7,ar,flag);
                                                                                      printliaototable(v,ar,flag);
                                                                                       if lastliao<>'' then
                                                                                           if trim(t7.FieldValues['�Ϻ�'])=trim(lastliao) then
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
statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
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
        l1:=tv.Items.add(nil ,tq.FieldValues['Ʒ��']+'('+trim(tq.FieldValues['�Ϻ�'])+')');
        tq.Next;
   end;
  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='ˢ��������ɣ�������' ;
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
   sqlstr:='select Ʒ��, �Ϻ�, �ײ�,���˵��,���°汾 from lingjianliaohao where �Ϻ�= '+''''+liaohao+'''';
   tqs.Connection:=dm.ADOConnection1;
   try
    with tqs do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);

           open;
          // if tqs.FieldValues['Ʒ��']<>'' then
           ar.Append(tqs.FieldValues['Ʒ��']);
          // if tqs.FieldValues['�Ϻ�']<> '' then
           ar.Append(tqs.FieldValues['�Ϻ�']) ;
           if tqs.FieldValues['�ײ�']<>null  then
           ar.Append(tqs.FieldValues['�ײ�'])
           else ar.Append(' ');
          // if tqs.FieldValues['���˵��']<> '' then
           ar.Append(tqs.FieldValues['���˵��']) ;
          if tqs.FieldValues['���°汾']<>null then
           ar.Append(tqs.FieldValues['���°汾'])
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
    if  adotable.FieldValues['��λ����']=Null then
        yongliang:=''
    else
        yongliang:= trim(adotable.FieldValues['��λ����']);
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
    if adotable.FieldValues['���λ��']=Null then
        sumno('',count,weizhi,pwh)
    else
    sumno(trim(adotable.FieldValues['���λ��']),count,weizhi,pwh) ;
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
   else if  adotable.FieldValues['��λ����']=null then
      ar.Append('')
   else if (existbom(bomliao)=false) then
      ar.Append(floattostr(quantity*strtofloat(yl))+dw)
   else
      ar.Append(adotable.FieldValues['��λ����']);


      ar.Append(weizhi);
      ar.Append(adotable.FieldValues['����']);
      ar.Append(adotable.FieldValues['�ϼ�']);
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
   if (trim(yongliang)='')and(trim(adotable.FieldValues['���λ��'])<>'') then     //deal with special condition
       flag:=true;
   if (trim(yongliang)<>'')and(trim(adotable.FieldValues['���λ��'])='') then
       flag:=true;
  except
  end;
  if pwh<>'' then
     flag:=true;
              // v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['Ʒ��'];
              // v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['�Ϻ�'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['�ײ�'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['���˵��'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['��λ����'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['���λ��'];
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
    if  adotable.FieldValues['��λ����']=Null then
        yongliang:=''
        else
        yongliang:= trim(adotable.FieldValues['��λ����']);

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
    if adotable.FieldValues['���λ��']=Null then
        sumno('',count,weizhi,pwh)
    else
    sumno(trim(adotable.FieldValues['���λ��']),count,weizhi,pwh) ;
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
   else if  adotable.FieldValues['��λ����']=null then
      ar.Append('')
   else if (existbom(bomliao)=false) then
      ar.Append(floattostr(quantity*strtofloat(yl))+dw)
   else
      ar.Append(adotable.FieldValues['��λ����']);


      ar.Append(weizhi);
      ar.Append(adotable.FieldValues['����']);
      ar.Append(adotable.FieldValues['�ϼ�']);
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
   if (trim(yongliang)='')and(trim(adotable.FieldValues['���λ��'])<>'') then     //deal with special condition
       flag:=true;
   if (trim(yongliang)<>'')and(trim(adotable.FieldValues['���λ��'])='') then
       flag:=true;
  except
  end;
  if pwh<>'' then
     flag:=true;
              // v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['Ʒ��'];
              // v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['�Ϻ�'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['�ײ�'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['���˵��'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['��λ����'];
               //v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['���λ��'];
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
 //sqlstr:='select �Ϻ�,Ʒ��,���˵�� from lingjianliaohao where �Ϻ�='+''''+liaohao+'''';
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
   application.MessageBox('û�з��ֿ��Բ�����BOM����         ','��ʾ��',MB_OKCANCEL+MB_iconinformation) ;
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
                    madeoutstr_excel(trim(tql.FieldValues['�Ϻ�']),tql,ar,flag);
                    printtoexcel(v,excel_No,1,ar,0,5,flag);

                    excel_No:=excel_No+1;
                    fomatliaohao(trim(tql.FieldValues['�Ϻ�']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         Jie_NO:=2;
                                         madeoutstr_excel(trim(t2.FieldValues['�Ϻ�']),t2,ar,flag);
                                         printtoexcel(v,excel_No,1,ar,0,5,flag);
                                         excel_No:=excel_No+1;
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                     Jie_NO:=3;
                                                        madeoutstr_excel(trim(t3.FieldValues['�Ϻ�']),t3,ar,flag);
                                                        printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                        excel_No:=excel_No+1;
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                          Jie_NO:=4;
                                                            madeoutstr_excel(trim(t4.FieldValues['�Ϻ�']),t4,ar,flag);
                                                            printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                            excel_No:=excel_No+1;
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                 Jie_NO:=5;
                                                                   madeoutstr_excel(trim(t5.FieldValues['�Ϻ�']),t5,ar,flag);
                                                                    printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                                    excel_No:=excel_No+1;
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                         Jie_NO:=6;
                                                                           madeoutstr_excel(trim(t6.FieldValues['�Ϻ�']),t6,ar,flag);
                                                                           printtoexcel(v,excel_No,1,ar,0,5,flag);
                                                                           excel_No:=excel_No+1;
                                                                             fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                  Jie_NO:=7;
                                                                                      madeoutstr_excel(trim(t7.FieldValues['�Ϻ�']),t7,ar,flag);
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
   sqlstr:='select Ʒ��, �Ϻ�,�ײ�, ���˵��,��λ����,�������� ���λ�� from lingjianliaohao where �Ϻ�= '+''''+liaohao+'''';
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
tname:=adoquery1.FieldValues['Ʒ��']+adoquery1.FieldValues['�Ϻ�'];
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
                  // v.workbooks[1].sheets[1].cells[1,1]:='�������ڣ�'+datetimetostr(date());
               // end;
              // showmessage('Hi');
          //  for h:=1 to 7 do
             //   begin
               // for i:=0 to 200000000 do
                 //  begin
                 ////     s:=s+i;
                   //end;

                  // v.workbooks[1].sheets[1].cells[2,h]:='Ʒ��';//bomeditfm.exportbom.Fields.Fields[h-1].FieldName;
                   //showmessage(inttostr(h));
                   //showmessage('Hi');
               // end;
               // vv.update;
               v.workbooks[1].sheets[1].cells[3,1]:='Ʒ��';
               v.workbooks[1].sheets[1].cells[3,2]:='�Ϻ�';
               v.workbooks[1].sheets[1].cells[3,3]:='�ײ�';

               v.workbooks[1].sheets[1].cells[3,4]:='���˵��';
               v.workbooks[1].sheets[1].cells[3,5]:='����';
               //v.workbooks[1].sheets[1].cells[2,6]:='��������';
               v.workbooks[1].sheets[1].cells[3,6]:='���λ��';
end;
procedure Tbomeditfm.getpg(liaohao:string;var pingming:string;var guige:string;var checked:string;var ver:string);
var
  sqlstr:string;
  tqs:Tadoquery;
begin
    tqs:=Tadoquery.Create(application);
    tqs.Connection:=dm.ADOConnection1;
    sqlstr:='select Ʒ��, �Ϻ�, ���˵��,����,���°汾 from lingjianliaohao where �Ϻ�= '+''''+liaohao+'''';
   try
    with tqs do
       begin
          close;
          sql.Clear;
          sql.Add(sqlstr);
          open;
          if recordcount>=1 then
          begin
          if  tqs.FieldValues['Ʒ��']=null then
          pingming:='' else
          pingming:=tqs.FieldValues['Ʒ��'];
          if  tqs.FieldValues['���˵��']=null then
          guige:='' else
          guige:=tqs.FieldValues['���˵��'];
          end;
          if tqs.FieldValues['����']=Null then
             checked:=''
          else checked:=tqs.FieldValues['����'];
          if tqs.FieldValues['���°汾']=Null then
             ver:=''
          else ver:=tqs.FieldValues['���°汾'];
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
               v.workbooks[1].sheets[1].cells[2,1]:='Ʒ��';
               v.workbooks[1].sheets[1].cells[2,3]:='�Ϻ�';
               v.workbooks[1].sheets[1].cells[2,2]:='�ײ�';
               v.workbooks[1].sheets[1].cells[2,4]:='���˵��';
               v.workbooks[1].sheets[1].cells[2,5]:='����';
               v.workbooks[1].sheets[1].cells[2,6]:='���λ��';
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
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['Ʒ��'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['�Ϻ�'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['�ײ�'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['���˵��'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['��λ����'];
               v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['���λ��'];




           end
        else    //common liao
           begin

           end;





         for j:=1 to bomeditfm.exportbom.FieldCount do
             begin
                 v.workbooks[1].sheets[1].cells[count+2,j]:=exportbom.FieldValues['Ʒ��'];//.Fields.Fields[j-1].Value;
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
adoquery1.SQL.Add('select * from lingjianliaohao where ʹ�û��� like '+''''+'%'+trim(model)+'%'+''''+' and �Ϻ� like '+''''+'99%'+''''+' and ����<>'+''''+'�Ѻ�׼'+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
   showmessage('û�з��ִ˻�����ص�BOM�����ȷʵ���ڣ�����»�����Ϣ������');

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
      statusbar1.Panels.Items[3].Text:='���Եȣ����ڲ�ѯBOM��������' ;
          with tv.Items do
               begin
                   tv.Items.Clear;
                   adoquery1.First;
                   l1:=add(nil ,'�����ͺ�'+'('+trim(adoquery1.FieldValues['ʹ�û���'])+')');
                   for i:=0 to adoquery1.RecordCount-1 do
                       begin
                          addchild(l1 ,adoquery1.FieldValues['Ʒ��']+'('+trim(adoquery1.FieldValues['�Ϻ�'])+')');
                          adoquery1.Next;
                       end;
                   adoquery1.Next;
               end;
      end;
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'������';
statusbar1.Panels.Items[3].Text:='ˢ��������ɣ�������' ;

end;
procedure Tbomeditfm.getbomlists(liaohao:string);
var
  l1, l2,l3,l4,l5,l6: TTreeNode;
  i1,i2,i3,i4,i5,i6:integer;
  bomliao:string;
begin
statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
statusbar1.Update;

with tv.Items do
begin
clear;
     with tq do
       begin
           close;
           sql.Clear;
           sql.Add('select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(liaohao)+'%'+''''+' and ����<>'+''''+'�Ѻ�׼'+'''');
           open;
           tq.First;
           for i1:=0 to tq.RecordCount-1 do
                begin
                    bomliao:=tq.FieldValues['�Ϻ�'];
                    fomatliaohao(bomliao,bomliao);
                    if existbom(bomliao)=true then
                         add(nil ,tq.FieldValues['Ʒ��']+'('+trim(tq.FieldValues['�Ϻ�'])+')');
                    tq.Next;
                end;
       end;

end;// with tv do
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'������';
statusbar1.Panels.Items[3].Text:='ˢ��������ɣ�������' ;
end;
procedure Tbomeditfm.SpeedButton1Click(Sender: TObject);
var
  l1, l2,l3,l4,l5,l6: TTreeNode;
  i1,i2,i3,i4,i5,i6:integer;
  liaohao:string;
begin
statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
statusbar1.Update;
///////////////////////////get bom list///////////////////////
with tv.Items do
   begin
     clear;
     with tq do
       begin
           close;
           sql.Clear;
           sql.Add('SELECT * FROM lingjianliaohao WHERE �Ϻ� LIKE '+''''+'99%'+''''+' and Ʒ�� like '+''''+'%��Ʒ%'+''''+' and ����<>'+''''+'�Ѻ�׼'+'''');
           open;
           tq.First;
           for i1:=0 to tq.RecordCount-1 do
                begin
                    l1:=add(nil ,tq.FieldValues['Ʒ��']+'('+trim(tq.FieldValues['�Ϻ�'])+')');
                    tq.Next;
                end;
       end;
   end;
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
statusbar1.Panels.Items[3].Text:='ˢ��������ɣ�������' ;
end;

procedure getextendedbom(liaohao:string;tname:string);
var
sqlstr:string;
begin
sqlstr:='SELECT '+tname+'.�Ϻ�, '+tname+'.�ײ�, '+tname+'.��λ����, '+
    tname+'.���λ��, lingjianliaohao.���˵�� '+
'FROM '+tname+' CROSS JOIN    '+
      'lingjianliaohao where ('+tname+'.�Ϻ�='+''''+liaohao+''''+') and ('+tname+'.�Ϻ�=lingjianliaohao.�Ϻ�) '

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
   sqlstr:='select * from lingjianliaohao where �Ϻ�='+''''+liaohao+'''';
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add(sqlstr);
   adoquery1.Open;
   if adoquery1.RecordCount<1 then
      exit;
   if adoquery1.FieldValues['��']=true then
     begin
         showmessage('��BOM�ѽ�������״̬����');
         exit;
     end;
   if (adoquery1.FieldValues['����']<>Null) then
   if (trim(adoquery1.FieldValues['����'])='�Ѻ�׼') then
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
        if adotable1.Locate('�Ϻ�',bomliaohao, [loPartialKey])=false then
           begin
               adotable1.Close;
               aqljlh.Close;
           end;
        if aqljlh.active=true then
        if aqljlh.Locate('�Ϻ�',bomliaohao, [loPartialKey])=false then
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
 estr:='SELECT '+liaohao+'.�Ϻ� AS �Ϻ�, '  +
      'lingjianliaohao.Ʒ�� AS Ʒ��, lingjianliaohao.���˵�� AS ���˵��,  '+
       liaohao+'.�ײ� AS �ײ�, ' +liaohao+'.��λ���� AS ��λ����, '+liaohao+'.���λ�� AS ���λ��, ' +
      'lingjianliaohao.���� AS ���� ' +
      'FROM '+liaohao+' cross JOIN lingjianliaohao '+
      'where '+liaohao+'.�Ϻ� = lingjianliaohao.�Ϻ�  order by �Ϻ�';
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
 statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
 statusbar1.Update;

  // sqlstr:='select * from lingjianliaohao where �Ϻ�='+''''+liaohao+'''';
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
                    l1:=add(nil ,adoquery1.FieldValues['Ʒ��']+'('+trim(adoquery1.FieldValues['�Ϻ�'])+')');  //change
                    fomatliaohao(liaohao,tablename);
                         if existbom(tablename)=true then
                            begin
                                 acttable(tablename,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['�Ϻ�']));
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['�Ϻ�']));
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['�Ϻ�']));
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['�Ϻ�']));
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            l6:=AddChild(l5 ,trim(t6.FieldValues['�Ϻ�']));
                                                                            fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['�Ϻ�']));
                                                                                      fomatliaohao(trim(t7.FieldValues['�Ϻ�']),liaohao);
                                                                                       if existbom(liaohao)=true then
                                                                                       begin
                                                                                         acttable(liaohao,t8);
                                                                                          for i8:=0 to t8.recordcount-1 do
                                                                                          begin
                                                                                            l8:=AddChild(l7 ,trim(t8.FieldValues['�Ϻ�']));
                                                                                            fomatliaohao(trim(t8.FieldValues['�Ϻ�']),liaohao);
                                                                                             if existbom(liaohao)=true then
                                                                                             begin
                                                                                               acttable(liaohao,t9);
                                                                                                for i9:=0 to t9.recordcount-1 do
                                                                                                begin
                                                                                                  l9:=AddChild(l8 ,trim(t9.FieldValues['�Ϻ�']));
                                                                                                  fomatliaohao(trim(t9.FieldValues['�Ϻ�']),liaohao);
                                                                                                  if existbom(liaohao)=true then
                                                                                                     begin
                                                                                                     acttable(liaohao,t10);
                                                                                                       for i10:=0 to t10.recordcount-1 do
                                                                                                           begin
                                                                                                            l10:=AddChild(l9 ,trim(t10.FieldValues['�Ϻ�']));
                                                                                                              fomatliaohao(trim(t10.FieldValues['�Ϻ�']),liaohao);
                                                                                                             if existbom(liaohao)=true then
                                                                                                                begin
                                                                                                                   acttable(liaohao,t11);
                                                                                                                   for i11:=0 to t11.recordcount-1 do
                                                                                                                      begin
                                                                                                                           l11:=AddChild(l10 ,trim(t11.FieldValues['�Ϻ�']));

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
  //statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'������';
  statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ���������';
  statusbar1.Panels.Items[0].Text:=inttostr(tv.Items.Count)+'������';
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


 {statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
 statusbar1.Update;
        // 'select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and ����<>'+''''+'�Ѻ�׼'+''''
sqlstr:='select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(cb.text    )+'%'+''''+ ' and ����<>'+''''+'�Ѻ�׼'+'''';
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

               application.MessageBox('û���ҵ�ƥ���BOM����������Ч�ؼ��֣�������         ','��ʾ��',MB_OK+MB_iconinformation) ;
               statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
               statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ���������';
               exit;
           end;     }

          { fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
           if existbom(liaohao)=false then    //check bom
              begin
               application.MessageBox('��֮ƥ���BOM�����ڣ���������ȷ�Ϲؼ���         ','��ʾ��',MB_OK+MB_iconinformation) ;
               statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
               statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ���������';
               exit;
              end;     }

       {    for i1:=0 to adoquery2.RecordCount-1 do        //expent bom
                begin
                fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
                if existbom(liaohao)=true then    //check bom
                   begin
                   l1:=add(nil ,adoquery2.FieldValues['Ʒ��']+'('+trim(adoquery2.FieldValues['�Ϻ�'])+')');
                   end;   }
                 {   l1:=add(nil ,adoquery2.FieldValues['Ʒ��']+'('+trim(adoquery2.FieldValues['�Ϻ�'])+')');
                    fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['�Ϻ�']));
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['�Ϻ�']));
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['�Ϻ�']));
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['�Ϻ�']));
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            l6:=AddChild(l5 ,trim(t6.FieldValues['�Ϻ�']));
                                                                            fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['�Ϻ�']));
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
  statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ���������';
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
       application.MessageBox('��ǰBOM��һ��BOM������Ƕ������±༭����������','��ʾ��',MB_OK+MB_iconinformation) ;
       exit;
   end;
end;
if (adoquery1.FieldValues['����']<>null)or(adoquery1.FieldValues['����']<>'') then
if (trim(adoquery1.FieldValues['����'])='�Ѻ�׼') then
   begin
       application.MessageBox('��ǰBOM�ѱ���׼�������ڴ˱༭����������','��ʾ��',MB_OK+MB_iconinformation) ;
       exit;
   end;

try
lufm2.mn:=adoquery1.FieldValues['�Ϻ�'];
lufm2.showmodal;
except
application.MessageBox('��Ч�Ĳ���,�����õ�BOM��������         ','��ʾ��',MB_OK+MB_iconinformation) ;
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
                    l1:=add(nil ,tq.FieldValues['Ʒ��']+'('+trim(tq.FieldValues['�Ϻ�'])+')');
                    {fomatliaohao(trim(tq.FieldValues['�Ϻ�']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['�Ϻ�']));
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['�Ϻ�']));
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['�Ϻ�']));
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['�Ϻ�']));
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                           l6:=AddChild(l5 ,trim(t6.FieldValues['�Ϻ�']));
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
       application.MessageBox('��ǰBOM��һ��BOM,���ڱ༭ģʽ�£�������Ƕ������±༭����������','��ʾ��',MB_OK+MB_iconinformation) ;
       exit;
   end;
end;
if (adoquery1.FieldValues['����']<>null)or(adoquery1.FieldValues['����']<>'') then
if (trim(adoquery1.FieldValues['����'])='�Ѻ�׼') then
   begin
       application.MessageBox('��ǰBOM�ѱ���׼�������ڴ˱༭����������','��ʾ��',MB_OK+MB_iconinformation) ;
       exit;
   end;


bomdeletefm.showmodal;


if bomdeletefm.cancel=true then
    begin
    abort;
    end;

try
    fomatliaohao(trim(adoquery1.FieldValues['�Ϻ�']),liaohao);
except
    application.MessageBox('��������������         ','��ʾ',MB_OK+MB_iconinformation);
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
                                       application.MessageBox('ɾ��BOM�ɹ�����         ','��ʾ��',MB_OK+MB_iconinformation) ;
                                        except
                                       application.MessageBox('ɾ��BOM����         ','��ʾ��',MB_OK+MB_iconinformation) ;
                                        end;
                                  end;
            end
            else     application.MessageBox('BOM�ѱ�ɾ������         ','��ʾ��',MB_OK+MB_iconinformation) ;
        exit;
     end;

if bomdeletefm.R1.Checked=true then          //delete from Father layer
      begin
       adotable1.Edit;
       adotable1.Delete;

       application.MessageBox('ɾ���ɹ�����         ','��ʾ��',MB_OK+MB_iconinformation);
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
//bommapingfm.AQ.SQL.Add('select * from BomMapping where mn ='+''''+adoquery1.FieldValues['�Ϻ�']+'''');
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

liaohao:=adoquery1.FieldValues['�Ϻ�'];
fomatliaohao(liaohao,tname);
except
  application.MessageBox('��������޷���ȡBOM�Ϻţ�������ѡ��BOM�Ϻź�����','�������ݴ���',mb_ok+MB_ICONSTOP);
  exit;
end;             //judge that is it a bom
 if existbom(tname)<>true then
 begin
    application.MessageBox('û�����ݶ���ɹ���������ѡ��һ��BOM������','�������ݴ���',mb_ok+MB_ICONSTOP);
    exit;
 end;
    if trim(liaohao)<>'' then
       begin
         //exportdata()
         try
          createExcel(v);
          printbomtoexcel(v,trim(liaohao));
          except
           application.MessageBox('����ʧ�ܣ���','�������ݴ���',mb_ok+MB_ICONSTOP);
           exit;
          end;
       end
   else
      application.MessageBox('û�����ݶ���ɹ���������ѡ��һ��BOM������','�������ݴ���',mb_ok+MB_ICONSTOP);

end;

procedure Tbomeditfm.ADOTable1BeforePost(DataSet: TDataSet);
begin
if application.MessageBox('BOM�Ѿ������Ƿ񱣴棿','��ʾ��',MB_OKCANCEL+MB_iconinformation)<>idok then
      begin
       //datasset.
        adotable1.Cancel;
      end;
end;

procedure Tbomeditfm.ADOQuery1BeforePost(DataSet: TDataSet);
begin
//if application.MessageBox('BOM�Ѿ������Ƿ񱣴棿','��ʾ��',MB_OKCANCEL+MB_iconinformation)<>idok then
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
       application.MessageBox('��ǰBOM��һ��BOM������Ƕ������±༭����������','��ʾ��',MB_OK+MB_iconinformation) ;
       exit;
   end;

if (adoquery1.FieldValues['����']<>null)or(adoquery1.FieldValues['����']<>'') then
if (trim(adoquery1.FieldValues['����'])='�Ѻ�׼') then
   begin
       application.MessageBox('��ǰBOM�ѱ���׼�������ڴ˱༭����������','��ʾ��',MB_OK+MB_iconinformation) ;
       exit;
   end;

    try
    if  adotable1.FieldValues['�ײ�']<>null then
    editbomffm.jieceng:=adotable1.FieldValues['�ײ�']
    else   editbomffm.jieceng:='';
    if  adotable1.FieldValues['��λ����']<>null then
    editbomffm.yongliang:=adotable1.FieldValues['��λ����']
    else  editbomffm.yongliang:='';
    if  adotable1.FieldValues['���λ��']<>null then
    editbomffm.weizhi:=adotable1.FieldValues['���λ��']
    else editbomffm.weizhi:='';
   // editbomffm.Edit3.Text:=adotable1.FieldValues['�Ϻ�'];
   // editbomffm.Edit4.Text:=adotable1.FieldValues['���˵��'];
    except
     application.MessageBox('������æ�������ԣ�������','��ʾ��',MB_OK+MB_iconstop);
    end;
    editbomffm.ShowModal;
    if editbomffm.flag=false then
       begin
           try
           adotable1.Edit;
           adotable1.FieldValues['�ײ�']:=editbomffm.jieceng;
           adotable1.FieldValues['��λ����']:=editbomffm.yongliang;
           adotable1.FieldValues['���λ��']:=editbomffm.weizhi;
           adotable1.Post;
           except
             application.MessageBox('������æ�������ԣ�������','��ʾ����',MB_OK+MB_iconstop) ;
           end;
           
       end;

end;


{if adotable1.Active=true then
begin
  if  adotable1.FieldValues['�Ϻ�']='' then
      abort;
    liaohaolistfm.liaohao:=adotable1.FieldValues['�Ϻ�'];
    liaohaolistfm.showmodal;
end
else
abort; }
end;

procedure Tbomeditfm.ADOTable1AfterPost(DataSet: TDataSet);
begin
//application.MessageBox('��༭��BOM�Ѿ����ٱ�һ������BOM���ã����Ľ�Ӱ��ȫ�����ô�BOM��BOM������','��ʾ',MB_OK+MB_iconinformation);
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
if (adoquery1.FieldValues['����']<>null)or(adoquery1.FieldValues['����']<>'') then
if (trim(adoquery1.FieldValues['����'])='�Ѻ�׼') then
   begin
       application.MessageBox('��ǰBOM�ѱ���׼�������ڴ˱༭����������','��ʾ��',MB_OK+MB_iconinformation) ;
       exit;
   end;

    try
    if  aqljlh.FieldValues['�ײ�']<>null then
    editbomffm.jieceng:=aqljlh.FieldValues['�ײ�']
    else   editbomffm.jieceng:='';
    if  aqljlh.FieldValues['��λ����']<>null then
    editbomffm.yongliang:=aqljlh.FieldValues['��λ����']
    else  editbomffm.yongliang:='';
    if  aqljlh.FieldValues['���λ��']<>null then
    editbomffm.weizhi:=aqljlh.FieldValues['���λ��']
    else editbomffm.weizhi:='';
     editbomffm.Edit3.Text:=aqljlh.FieldValues['�Ϻ�'];
     editbomffm.Edit4.Text:=aqljlh.FieldValues['���˵��'];
    except
     application.MessageBox('������æ�������ԣ�������','��ʾ��',MB_OK+MB_iconstop);
    end;
    editbomffm.ShowModal;
    if editbomffm.flag=false then
       begin
           try
           aqljlh.Edit;
           aqljlh.FieldValues['�ײ�']:=editbomffm.jieceng;
           aqljlh.FieldValues['��λ����']:=editbomffm.yongliang;
           aqljlh.FieldValues['���λ��']:=editbomffm.weizhi;
           aqljlh.Post;
           except
             application.MessageBox('������æ�������ԣ�������','��ʾ����',MB_OK+MB_iconstop) ;
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
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=ClWhite {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
end;

end;

procedure Tbomeditfm.BOM2Click(Sender: TObject);
var
liaohao:string;
l1:Ttreenode;
begin
try
liaohao:=trim(adoquery1.FieldValues['�Ϻ�']);
//l1:=tv.Selected;
if liaohao<>'' then
begin
 tv.items.clear;
 extendbom(liaohao,nil);
end;
except
   showmessage('�޷�չ����Ҫ��BOM');
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
statusbar1.Panels.Items[3].Text:='���Ե�...��������Ԥ��.................' ;
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
                      application.MessageBox('�޷�������ʱ�ļ���         ','��ʾ��',MB_OK+MB_iconinformation) ;
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
    liaohao:=adoquery1.FieldValues['�Ϻ�'];
if  adoquery1.FieldValues['�ͻ�']=null then
    bomdetail.costomer:=''
else
bomdetail.costomer:=trim(adoquery1.FieldValues['�ͻ�']);
if  adoquery1.FieldValues['ʹ�û���']=null then
    bomdetail.model:=''
else
bomdetail.model:=trim(adoquery1.FieldValues['ʹ�û���']);
if  adoquery1.FieldValues['�Ϻ�']=null then
    bomdetail.liaohao:=''
else
bomdetail.liaohao:=trim(adoquery1.FieldValues['�Ϻ�']);
if  adoquery1.FieldValues['���°汾']=null then
    bomdetail.versions:=''
else
bomdetail.versions:=trim(adoquery1.FieldValues['���°汾']);
bomdetail.dates:=datetostr(date());
if  adoquery1.FieldValues['���˵��']=null then
    bomdetail.guige:=''
else
bomdetail.guige:=trim(adoquery1.FieldValues['���˵��']);

fomatliaohao(liaohao,tname);
except
  application.MessageBox('��������޷���ȡBOM�Ϻţ�������ѡ��BOM�Ϻź�����','�������ݴ���',mb_ok+MB_ICONSTOP);
  statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
  statusbar1.Update;
  exit;
end;             //judge that is it a bom
 if existbom(tname)<>true then
 begin
    application.MessageBox('û�����ݶ���ɹ���������ѡ��һ��BOM������','�������ݴ���',mb_ok+MB_ICONSTOP);
    statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
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
           application.MessageBox('�޷��ռ�չ��BOM����Ҫ�����ݣ����ܵ�ǰBOM������Ϣ����������','�������ݴ���',mb_ok+MB_ICONSTOP);
           statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
           statusbar1.Update;
           exit;
          end;
       end
   else
      application.MessageBox('û�����ݶ���ɹ���������ѡ��һ��BOM������','�������ݴ���',mb_ok+MB_ICONSTOP);

 v.Close;
 v.Free;


    statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
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
 liaohao:=adoquery1.FieldValues['�Ϻ�'];
if  adoquery1.FieldValues['�ͻ�']=null then
    bomdetail.costomer:=''
else
bomdetail.costomer:=trim(adoquery1.FieldValues['�ͻ�']);
if  adoquery1.FieldValues['ʹ�û���']=null then
    bomdetail.model:=''
else
bomdetail.model:=trim(adoquery1.FieldValues['ʹ�û���']);
if  adoquery1.FieldValues['�Ϻ�']=null then
    bomdetail.liaohao:=''
else
bomdetail.liaohao:=trim(adoquery1.FieldValues['�Ϻ�']);
if  adoquery1.FieldValues['���°汾']=null then
    bomdetail.versions:=''
else
bomdetail.versions:=trim(adoquery1.FieldValues['���°汾']);
bomdetail.dates:=datetostr(date());
if  adoquery1.FieldValues['���˵��']=null then
    bomdetail.guige:=''
else
bomdetail.guige:=trim(adoquery1.FieldValues['���˵��']);

fomatliaohao(liaohao,tname);
except
  application.MessageBox('��������޷���ȡBOM�Ϻţ�������ѡ��BOM�Ϻź�����','�������ݴ���',mb_ok+MB_ICONSTOP);
  statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
  statusbar1.Update;
  exit;
end;             //judge that is it a bom
 if existbom(tname)<>true then
 begin
    application.MessageBox('û�����ݶ���ɹ���������ѡ��һ��BOM������','�������ݴ���',mb_ok+MB_ICONSTOP);
    statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
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
           application.MessageBox('�޷��ռ�չ��BOM����Ҫ�����ݣ����ܵ�ǰBOM������Ϣ����������','�������ݴ���',mb_ok+MB_ICONSTOP);
           statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
           statusbar1.Update;
           exit;
          end;
       end
   else
      application.MessageBox('û�����ݶ���ɹ���������ѡ��һ��BOM������','�������ݴ���',mb_ok+MB_ICONSTOP);

 v.Close;
 v.Free;
statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
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
statusbar1.Panels.Items[3].Text:='���Ե�...���ڲ���..........' ;
statusbar1.Update;
if lookupliaofm.cancel=true then
begin
 statusbar1.Panels.Items[3].Text:='��ɣ�' ;
 exit;
end;
tv.FullCollapse;
if trim(keys)='' then
begin
statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
statusbar1.Update;
exit;
end;
if adoquery1.Active<>false then
    if trim(adoquery1.FieldValues['�Ϻ�'])<>'' then
       bomliao:=adoquery1.FieldValues['�Ϻ�']
else
begin
exit;
statusbar1.Panels.Items[3].Text:='��ɣ�' ;
end;

if keys[1] in ['0'..'9'] then
fields:='�Ϻ�'
else fields:='���λ��';
//sqlstr:='select * from '+bomliao+' where '+fields+' like '+ ''''+'%'+keys+'%'+'''';


if tabpageshow1=true then
  begin
      showmessage('���л��������ͼ�����˹��ܣ�     ');
      statusbar1.Panels.Items[3].Text:='��ɣ�' ;
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
         //----------  if adotable1.Locate('���λ��', VarArrayOf([keys]), [loPartialKey])=true then
          adotable1.Close;
          adotable1.TableName:=bomliao;
          adotable1.Open;
         if fields='�Ϻ�' then
         begin
            if adotable1.Locate('�Ϻ�',keys, [loPartialKey])=true then
                begin
                    adotable1.Locate('�Ϻ�',keys, [loPartialKey]);
                    showmessage('�ҵ�һ�����Ϻţ�����');
                    tv.Items.Item[i].Selected:=true;
                    lookupliaofm.ShowModal;
                    if lookupliaofm.cancel=true then
                       begin
                            statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
                            break;
                            exit;
                       end;
                end;
         end;
         if fields='���λ��' then
         begin
            if adotable1.Locate('���λ��',keys, [loPartialKey])=true then
                begin
                adotable1.Locate('���λ��',keys, [loPartialKey]);
                    showmessage('�ҵ�һ�����ֵ������');
                    tv.Items.Item[i].Selected:=true;
                    lookupliaofm.ShowModal;
                    if lookupliaofm.cancel=true then
                       begin
                       statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
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
                   if  adoquery2.FieldValues['�Ϻ�']=keys then
                   begin
                        datasouce1.dataset:=adoquery2;
                        exit;
                   end;
                    fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                          if  t2.FieldValues['�Ϻ�']=keys then
                                              begin
                                              datasouce1.dataset:=t2;
                                              exit;
                                               end;
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['�Ϻ�']));
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['�Ϻ�']));
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['�Ϻ�']));
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            l6:=AddChild(l5 ,trim(t6.FieldValues['�Ϻ�']));
                                                                            fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['�Ϻ�']));
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
 statusbar1.Panels.Items[3].Text:='��ɣ�������' ;
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
               strsql:='select * from lingjianliaohao where �Ϻ�='+''''+tname+''''+' and ����<>'+''''+'�����'+''''+' and ����<>'+''''+'�Ѻ�׼'+'''';
               adoquery1.Close;
               adoquery1.SQL.Clear;                              //get checked bom
               adoquery1.SQL.Add(strsql);
               adoquery1.Open;

               if  adoquery1.RecordCount=1 then
                   begin
                    //  liaohao:=adoquery1.FieldValues['�Ϻ�'];
                    //  adoquery2.Close;                          //get checked bom information
                    //  adoquery2.SQL.Clear;
                    //  adoquery2.SQL.Add('select * from lingjianliaohao where �Ϻ�= '+''''+liaohao+'''');
                   //   adoquery2.Open;
                      lv.Items.Add;
                      count:=lv.Items.Count;
                      lv.Items[count-1].Caption:=adoquery1.FieldValues['�Ϻ�'];          //add to string list
                      if  adoquery1.FieldValues['Ʒ��']<>null then
                      lv.Items[count-1].SubItems.add(adoquery1.FieldValues['Ʒ��']);
                      lv.Items[count-1].SubItems.add(adoquery1.FieldValues['���˵��']);

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
   sqlstr:='select * from lingjianliaohao where �Ϻ�='+''''+liaohao+'''';
   adoquery1.Close;
   adoquery1.SQL.Clear;
   adoquery1.SQL.Add(sqlstr);
   adoquery1.Open;
  // if adoquery1.FieldValues['��']=true then
  //   begin
  //     showmessage('��BOM�ѽ�������״̬����');
  //     exit;
   //  end;
if (adoquery1.FieldValues['����']<>null)or(adoquery1.FieldValues['����']<>'') then
  if (trim(adoquery1.FieldValues['����'])='�Ѻ�׼') then
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
   adotable1.Locate('�Ϻ�',bomliaohao, [loPartialKey]);
   
except
   adotable1.Close;
end;
try
 estr:='SELECT '+liaohao+'.�Ϻ� AS �Ϻ�, '+ liaohao+'.�ײ� AS �ײ�, ' +liaohao+'.��λ���� AS ��λ����, '+liaohao+'.���λ�� AS ���λ��, '   +
      'lingjianliaohao.Ʒ�� AS Ʒ��, lingjianliaohao.���˵�� AS ���˵��,  '+
      'lingjianliaohao.���� AS ���� ' +
      'FROM '+liaohao+' cross JOIN lingjianliaohao '+
      'where '+liaohao+'.�Ϻ� = lingjianliaohao.�Ϻ�  order by �Ϻ�';
aqljlh.Close;
aqljlh.SQL.Clear;
aqljlh.SQL.Add(estr);
aqljlh.Open ;
aqljlh.Locate('�Ϻ�',bomliaohao, [loPartialKey]);
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
if DataSource2.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=ClWhite {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
end;

end;





procedure Tbomeditfm.DBGrid2CellClick(Column: TColumn);
begin
adotable1.Locate('�Ϻ�',trim(aqljlh.FieldValues['�Ϻ�']), [loPartialKey]);
end;

procedure Tbomeditfm.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down)or (key=vk_up) then
adotable1.Locate('�Ϻ�',trim(aqljlh.FieldValues['�Ϻ�']), [loPartialKey]);
end;

procedure Tbomeditfm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_down)or (key=vk_up) then
aqljlh.Locate('�Ϻ�',trim(adotable1.FieldValues['�Ϻ�']), [loPartialKey]);
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
   Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      ADOtable1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tbomeditfm.DBGrid1CellClick(Column: TColumn);
begin
  
aqljlh.Locate('�Ϻ�',trim(adotable1.FieldValues['�Ϻ�']), [loPartialKey]);
end;

procedure Tbomeditfm.SpeedButton9Click(Sender: TObject);
begin
if adoquery1.Active=true then
 if  adoquery1.FieldValues['�Ϻ�']<>'' then
 begin
      adoquery1.Edit;
      adoquery1.FieldValues['����']:='�����';
      adoquery1.Post;
   end;
end;

procedure Tbomeditfm.Edit10KeyPress(Sender: TObject; var Key: Char);
var
i,count:integer;
strsql,tname,liaohao,bomliao:string;
begin
if key=#13 then
begin                                                                                                                           //+' and ���='+''''+'true'+''''
lv.Clear;
bomlist.Close;
bomlist.SQL.Clear;
bomlist.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and ����<>'+''''+'�Ѻ�׼'+'''');                           //get all bom
bomlist.Open;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin
                      bomliao:=bomlist.FieldValues['�Ϻ�'];
                      fomatliaohao(bomliao,bomliao);
                      if existbom(bomliao)=true then
                         begin
                         lv.Items.Add;
                         count:=lv.Items.Count;
                         lv.Items[count-1].Caption:=trim(bomlist.FieldValues['�Ϻ�']);          //add to string list
                         if  bomlist.FieldValues['Ʒ��']<>null then
                             lv.Items[count-1].SubItems.add(trim(bomlist.FieldValues['Ʒ��']));
                         lv.Items[count-1].SubItems.add(bomlist.FieldValues['���˵��']);
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
adoquery.SQL.Add('select �Ϻ�,ʹ�û��� from lingjianliaohao where �Ϻ�='+''''+trim(liaohao)+'''');
adoquery.Open;
if adoquery.RecordCount>=1 then
begin
if adoquery.FieldValues['ʹ�û���']=Null then
model:=''
else
model:=trim(adoquery.FieldValues['ʹ�û���']);
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
             if adoquery.FieldValues['ʹ�û���']=Null then
                model:=dvdmodel
             else if trim(adoquery.FieldValues['ʹ�û���'])='' then
                model:=dvdmodel
             else 
              model:=trim(adoquery.FieldValues['ʹ�û���'])+','+dvdmodel;
              adoquery.Edit;
              adoquery.FieldValues['ʹ�û���']:=model;
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
 statusbar1.Panels.Items[3].Text:='���Ե�...���ڻ�����Ϣ.................' ;
 statusbar1.Update;

if trim(adoquery1.FieldValues['�Ϻ�'])='' then
   begin
       showmessage('û�ж�����Բ�������ȷ��Ҫ������BOM�����ԣ���');
        statusbar1.Panels.Items[3].Text:='���ָ�����ɣ���������';
       exit;
   end;
if adoquery1.FieldValues['ʹ�û���']=Null then
   begin
       showmessage('û�ж�����Բ�����ѡ�ֵ�BOM����Ϊ�գ���');
        statusbar1.Panels.Items[3].Text:='���ָ�����ɣ���������';
       exit;
   end;
if trim(adoquery1.FieldValues['ʹ�û���'])='' then
   begin
       showmessage('û�ж�����Բ�����ѡ�ֵ�BOM����Ϊ�գ���');
        statusbar1.Panels.Items[3].Text:='���ָ�����ɣ���������';
       exit;
   end;
dvdmodel:=trim(adoquery1.FieldValues['ʹ�û���']);
with tv.Items do
   begin

       begin
                liaohao:=trim(adoquery1.FieldValues['�Ϻ�']);
                begin
                   // l1:=add(nil ,adoquery1.FieldValues['Ʒ��']+'('+trim(adoquery1.FieldValues['�Ϻ�'])+')');  //change   ��Ʒ��
                    fomatliaohao(liaohao,tablename);
                         if existbom(tablename)=true then
                            begin
                                 acttable(tablename,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         //l2:=AddChild(l1 ,trim(t2.FieldValues['�Ϻ�']));
                                         updatemodel(trim(t2.FieldValues['�Ϻ�']),dvdmodel);
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                       //l3:=AddChild(l2 ,trim(t3.FieldValues['�Ϻ�']));
                                                        updatemodel(trim(t3.FieldValues['�Ϻ�']),dvdmodel);
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            //l4:=AddChild(l3 ,trim(t4.FieldValues['�Ϻ�']));
                                                            updatemodel(trim(t4.FieldValues['�Ϻ�']),dvdmodel);
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                  // l5:=AddChild(l4 ,trim(t5.FieldValues['�Ϻ�']));
                                                                   updatemodel(trim(t5.FieldValues['�Ϻ�']),dvdmodel);
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            //l6:=AddChild(l5 ,trim(t6.FieldValues['�Ϻ�']));
                                                                             updatemodel(trim(t6.FieldValues['�Ϻ�']),dvdmodel);
                                                                            fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                     // l7:=AddChild(l6 ,trim(t7.FieldValues['�Ϻ�']));
                                                                                      updatemodel(trim(t7.FieldValues['�Ϻ�']),dvdmodel);
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
  statusbar1.Panels.Items[3].Text:='���ָ�����ɣ���������';
  showmessage('������Ϣ������ɣ�������          ');
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
tq.SQL.Add('select * from lingjianliaohao where �Ϻ�='+''''+trim(adotable1.FieldValues['�Ϻ�'])+'''');
tq.Open;
if tq.RecordCount<1 then
   showmessage('���Ϻ����Ͽ�֮�в�����'+trim(adotable1.FieldValues['�Ϻ�']));
if adotable1.FieldValues['���λ��']=Null then
   showmessage('��ע��λ��Ϊ�գ�����')
else
try
count:=0;
weizhi:='';
pwh:='';
yongliang:='';
dw:='';
yl:='';
sumno(trim(adotable1.FieldValues['���λ��']),count,weizhi,pwh);

    if  adotable1.FieldValues['��λ����']=Null then
        yongliang:=''
    else
        yongliang:= trim(adotable1.FieldValues['��λ����']);
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
    showmessage('��ǰ����Ϊ�գ���');
    if count<>strtofloat(yl) then
    showmessage('������δ�Ų����������ӦΪ��'+floattostr(count));
    if pwh<>'' then
    showmessage('λ���ظ���'+pwh);
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
     ljwz:=ljwz+trim(adotable1.FieldValues['���λ��']);
     adotable1.Next;
  end;
adotable1.First;
for j:=0 to adotable1.RecordCount-1 do
begin
//if trim(adotable1.FieldValues['�Ϻ�'])='25Z104016-01'  then
  // showmessage('ok');
if adotable1.FieldValues['���λ��']=Null then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['�Ϻ�'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
    listview1.Items[counter-1].SubItems.add('λ��Ϊ��');
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
whs:=trim(adotable1.FieldValues['���λ��'])
else
begin
  for i:=0 to adotable1.RecordCount-1 do
      begin
          whs:=whs+trim(adotable1.FieldValues['���λ��'])+' ';
      end;
end;
sumno(whs,count,weizhi,pwh);
if  adotable1.FieldValues['��λ����']=Null then
    yongliang:=''
else
   yongliang:= trim(adotable1.FieldValues['��λ����']);
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
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['�Ϻ�'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
    listview1.Items[counter-1].SubItems.add('λ��Ϊ��');
    yl:='0';
  end;
if count<>strtofloat(yl) then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['�Ϻ�'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
    listview1.Items[counter-1].SubItems.add('λ������������� ������'+floattostr(count));
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
    listview1.Items[counter-1].Caption:='';//adotable1.FieldValues['�Ϻ�'];
    //listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
    //listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
    listview1.Items[counter-1].SubItems.add('λ���ظ�: '+pwh);
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
liaohao:=trim(adoquery1.FieldValues['�Ϻ�']);
if checklhfm.C1.Checked=true then
begin
if adoquery1.Active=true then
   begin
       if liaohao<>'' then
          begin
           checkbomrecords(trim(adoquery1.FieldValues['�Ϻ�']));
           pagecontrol2.Visible:=true;
           tabsheet1.Show ;
          // pagecontrol2
          end
       else
       begin
        showmessage('δ�ҵ�Ҫ����BOM������');
        exit;
       end;
   end
   else
   begin
    showmessage('δ����Ҫ����BOM������');
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
tq.SQL.Add('select * from lingjianliaohao where �Ϻ�='+''''+trim(adotable1.FieldValues['�Ϻ�'])+'''');
tq.Open;
if tq.RecordCount<1 then
   showmessage('���Ϻ����Ͽ�֮�в�����'+trim(adotable1.FieldValues['�Ϻ�']));
if adotable1.FieldValues['���λ��']=Null then
   showmessage('��ע��λ��Ϊ�գ�����')
else
try
sumno(trim(adotable1.FieldValues['���λ��']),count,weizhi,pwh);
yongliang:='';
    if  adotable1.FieldValues['��λ����']=Null then
        yongliang:=''
    else
        yongliang:= trim(adotable1.FieldValues['��λ����']);
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
    showmessage('��ǰ����Ϊ�գ���');
    if count<>strtofloat(yl) then
    showmessage('������δ�Ų����������ӦΪ��'+floattostr(count));
    if pwh<>'' then
    showmessage('λ���ظ���'+pwh);
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
     ljwz:=ljwz+trim(adotable1.FieldValues['���λ��']);
     adotable1.Next;
  end;
adotable1.First;
for j:=0 to adotable1.RecordCount-1 do
begin
//if trim(adotable1.FieldValues['�Ϻ�'])='25Z104016-01'  then
  // showmessage('ok');
if adotable1.FieldValues['���λ��']=Null then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['�Ϻ�'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
    listview1.Items[counter-1].SubItems.add('λ��Ϊ��');
  end;
try
count:=0;
weizhi:='';
pwh:='';
yongliang:='';
dw:='';
yl:='';
sumno(trim(adotable1.FieldValues['���λ��']),count,weizhi,pwh);
if  adotable1.FieldValues['��λ����']=Null then
    yongliang:=''
else
   yongliang:= trim(adotable1.FieldValues['��λ����']);
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
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['�Ϻ�'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
    listview1.Items[counter-1].SubItems.add('λ��Ϊ��');
    yl:='0';
  end;
if count<>strtofloat(yl) then
  begin
    listview1.Items.Add;
    counter:=listview1.Items.Count;
    listview1.Items[counter-1].Caption:=adotable1.FieldValues['�Ϻ�'];
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
    listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
    listview1.Items[counter-1].SubItems.add('λ������������� ������'+floattostr(count));
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
    listview1.Items[counter-1].Caption:='';//adotable1.FieldValues['�Ϻ�'];
    //listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['��λ����']);
    //listview1.Items[counter-1].SubItems.add(adotable1.FieldValues['���λ��']);
    listview1.Items[counter-1].SubItems.add('λ���ظ�: '+pwh);
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
  adotable1.Locate('�Ϻ�',liaohao, [loPartialKey]);
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
   Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      aqljlh.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
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
 '	[�Ϻ�] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL primary key,         '+
 '	[�ײ�] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[��λ����] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[��������] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[���λ��] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL,         '+
 '  [����] [float] NULL default 0.00,                                               '+
 ' 	[�ϼ�] [float] NULL default 0.00                                              '+
') ON [PRIMARY]';

//' 	[����] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,                '+
    //primary key
    // ' 	[����] [float] NULL default 0.00,             '+
  // '	[���] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [Ʒ��] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[���˵��] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

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
       showmessage('û�з���Ҫ���Ϊ֮BOM ��ѡ��һ����ЧBOM');
       EXIT;
   end;
oldtable:=trim(adoquery1.FieldValues['�Ϻ�']);
saveasfm.ComboBox1.Text:=adoquery1.FieldValues['�Ϻ�'];

//saveasfm.ComboBox1.OnKeyPress(self,'13');
saveasfm.Edit1.Text:=adoquery1.FieldValues['�Ϻ�'];
saveasfm.Caption:='�£ϣ����Ϊ';
saveasfm.showmodal;
saveasfm.Edit1.Update;
if saveasfm.cancel=true then
   exit;

liaohao:=trim(saveasfm.Edit1.Text);

if oldtable='' then
   begin
       showmessage('��Ч��BOM �Ϻţ��Ϻ�Ϊ�գ���ѡ��һ����Ч��BOM������');
       exit;
   end;
if oldtable='' then
   begin
       showmessage('Ҫ����BOM �Ϻ���Ч������');
       exit;
   end;
fomatliaohao(oldtable,oldtable);
if existbom(oldtable)=false then
   begin
       showmessage('Ҫ����BOM �����ڣ�������');
       exit;
   end;

 tqprelh.Close;
 tqprelh.SQL.Clear;
 tqprelh.SQL.Add('select * from prelingjianliaohao where �Ϻ�='+''''+liaohao+'''');
 tqprelh.Open;
 if tqprelh.RecordCount>=1 then
    begin
        showmessage('���Ϻ��ѱ����룡������');
        exit;
    end;
 try
 tqprelh.Append;
 tqprelh.FieldValues['�Ϻ�']:=liaohao;
 tqprelh.FieldValues['���˵��']:=adoquery1.FieldValues['���˵��'];
 tqprelh.FieldValues['Ʒ��']:=adoquery1.FieldValues['Ʒ��'];
 tqprelh.FieldValues['�汾']:=adoquery1.FieldValues['���°汾'];
 tqprelh.FieldValues['ʹ�û���']:=adoquery1.FieldValues['ʹ�û���'];
 tqprelh.FieldValues['����']:=adoquery1.FieldValues['����'];
 tqprelh.FieldValues['������']:=userrealname;
 tqprelh.Post;
 except
 showmessage('�������Ϻ�ʧ�ܣ���     ');
 exit;
 end;

fomatliaohao(liaohao,bomliao);
sqlstr:='insert into '+bomliao +' select �Ϻ�, �ײ�, ��λ����, ��������, ���λ��,����,�ϼ�  from '+oldtable;

try
createtable(bomliao);
ad.CommandText:='';
ad.CommandText:=sqlstr;
ad.Execute;
except
application.MessageBox('�����쳣�����������ݱ�ʧ�� ��Ѱ����֧�ֽ�������⣡����  ','����ʧ��!',mb_ok+MB_ICONerror);
abort;
end;
application.MessageBox('���ΪBOM�ɹ�������               ','HBS��ʾ!',mb_ok+MB_ICONinformation);

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
