unit createbomut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TCREATEBOMFM = class(TForm)
    Label6: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    Edit3: TEdit;
    Label8: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit7: TEdit;
    Memo1: TMemo;
    Label4: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    Button1: TButton;
    ADOTable1: TADOTable;
    ADOCommand1: TADOCommand;
    SpeedButton3: TSpeedButton;
    ADOQuery1: TADOQuery;
    SpeedButton4: TSpeedButton;
    Edit6: TEdit;
    Edit8: TEdit;
    DBGrid1: TDBGrid;
    ADOQuery2: TADOQuery;
    ADOQuery2DSDesigner: TStringField;
    ADOQuery2DSDesigner2: TWideStringField;
    ADOQuery2DSDesigner3: TStringField;
    ADOQuery2DSDesigner4: TStringField;
    ADOQuery2DSDesigner5: TStringField;
    ADOQuery2DSDesigner6: TStringField;
    ADOQuery2DSDesigner7: TStringField;
    ADOQuery2DSDesigner8: TStringField;
    ADOQuery2DSDesigner9: TStringField;
    ADOQuery2DSDesigner10: TStringField;
    ADOQuery2DSDesigner11: TWideStringField;
    ADOQuery2DSDesigner12: TStringField;
    ADOQuery2DSDesigner13: TStringField;
    ADOQuery2DSDesigner14: TWideStringField;
    ADOQuery2DSDesigner15: TStringField;
    ADOQuery2DSDesigner16: TStringField;
    ADOQuery2DSDesigner17: TBCDField;
    ADOQuery2DSDesigner18: TStringField;
    ADOQuery2DSDesigner19: TStringField;
    ADOQuery2DSDesigner20: TStringField;
    ADOQuery2DSDesigner21: TBooleanField;
    ADOQuery2DSDesigner22: TBooleanField;
    ADOQuery2DSDesigner23: TStringField;
    DataSource1: TDataSource;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CREATEBOMFM: TCREATEBOMFM;

implementation
     uses glbut,dmut, copybom, LOOKUPBOM, lookupliaohao;
{$R *.dfm}

procedure createtable(tablename:string);
var
  str:string;
begin

str:=
'CREATE TABLE [dbo].['+tablename+'] (                           '+
 '	[xuhao_ID] [int] IDENTITY (1, 1) NOT NULL  ,                       '+
 '	[料号] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL primary key,         '+
 '	[阶层] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[单位用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[工单用量] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[零件位置] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL,         '+
 ' 	[承认] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,           '+
 '  [单价] [float] NULL default 0.00,                                               '+

 ' 	[合计] [float] NULL default 0.00                                              '+
') ON [PRIMARY]';

    //primary key
   //  ' 	[数量] [float] NULL default 0.00,                 '+
  // '	[序号] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [品名] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[规格说明] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

   with createbomfm.ADOCommand1 do
         begin

             CommandText:='';
             CommandText:=str;
             execute;

         end;

end;
procedure TCREATEBOMFM.SpeedButton2Click(Sender: TObject);
begin
close;
end;

procedure TCREATEBOMFM.Button1Click(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit7.Clear;
memo1.Clear;
end;

procedure TCREATEBOMFM.SpeedButton1Click(Sender: TObject);
var
memostr:string;
i:integer;
liaohao,sqlstr:string;
str:string;
begin
if(edit1.Text='')or(trim(edit5.Text)='')or(trim(edit3.Text)='')or(trim(edit7.Text)='')or (trim(edit4.Text)='')then
      begin
           application.MessageBox('至少有一项为空，BOM信息不完整！！！请重型输入         ','输入错误',mb_ok+MB_ICONERROR);
           exit;
      end;
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where 料号= '+''''+trim(edit1.Text)+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
begin
  application.MessageBox('非法料号，料号库库中没有该料号！无法创建BOM，请尽快申请该料号！！！        ','输入错误',mb_ok+MB_ICONERROR);
  exit;
end;
str:=edit2.Text;
if str[1] in ['0'..'9'] then
begin
    application.MessageBox('无效品名非法输出！！        ','输入错误啦！！！',mb_ok+MB_ICONERROR);
    exit;
end;
fomatliaohao(edit1.Text,liaohao);
if existbom(liaohao)=true then
  begin
     if application.MessageBox(' 你要创建的BOM已经存在！是否要覆盖现有的BOM！！！！  ','HME提示！',mb_YESNO+MB_ICONINFORMATION)=ID_NO then
       begin
      panel1.Visible:=false;
      abort;
      end
      else
        begin
        showmessage('拒绝覆盖！！！');
        exit;
            sqlstr:='drop table '+trim(liaohao);
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute;

          {  sqlstr:='delete from lingjianliaohao where 料号= '+''''+trim(liaohao)+'''';
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute; }
        end;
  end
  else
     begin

     end;



fomatliaohao(edit1.Text,liaohao);
if(edit1.Text='')or (liaohao[2] in ['a'..'z','A'..'Z'])then
      begin
           application.MessageBox('无效记录或"料号"不能为空,或非法料号!!         ','输入错误',mb_ok+MB_ICONERROR);
           exit;
      end;

               try
                 
              //   adotable1.Active:=true;
              //   adotable1.append;
                // ADOTable1.Edit;
               //  adotable1.FieldByName('料号').Value:=edit1.Text;
               //  adotable1.FieldByName('品名').Value:=edit2.Text;
               //  adotable1.FieldByName('最新版本').Value:=edit3.Text;
                // adotable1.FieldByName('客户').Value:=edit4.Text;
                // adotable1.FieldByName('客户机种号').Value:=edit5.Text;
                // adotable1.FieldByName('机种').Value:=edit7.Text;
                // for i:=0 to  memo1.Lines.Count do
                //      memostr:=memostr+memo1.Lines.Strings[i];
                // adotable1.FieldByName('规格说明').Value:=memostr;

                // adotable1.Post;
                 createtable(liaohao);
                // adotable1.Close;

                 application.MessageBox('BOM创建成功完成！！                 ','FALCON ERP提示',mb_ok+MB_ICONINFORMATION);



               except
                    application.MessageBox('创建BOM失败！请确认BOM相关信息是否满足现有规则                 ','创建BOM错误',mb_ok+MB_ICONERROR);
                    //showmessage('');
                    adotable1.Close;

               end;

 end;



procedure TCREATEBOMFM.SpeedButton3Click(Sender: TObject);
begin
copybomfm.showmodal;
end;

procedure TCREATEBOMFM.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9','a'..'z','A'..'Z',#8,'-']) then
   key:=#0;
end;

procedure TCREATEBOMFM.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if  key in ['0'..'9'] then
   key:=#0;
end;

procedure TCREATEBOMFM.SpeedButton4Click(Sender: TObject);
begin
 edit1.Text:=adoquery2.FieldValues['料号'];
 if   adoquery2.FieldValues['品名']<>Null then
 edit2.Text:=adoquery2.FieldValues['品名'];
 if adoquery2.FieldValues['客户']<>Null then
 edit4.Text:=adoquery2.FieldValues['客户'];
 if adoquery2.FieldValues['客户机种号']<>Null then
 edit5.Text:=adoquery2.FieldValues['客户机种号'];
 if adoquery2.FieldValues['最新版本']<>Null then
 edit3.Text:=adoquery2.FieldValues['最新版本'];
 if adoquery2.FieldValues['使用机种']<>Null then
 edit7.Text:=adoquery2.FieldValues['使用机种'];
 if adoquery2.FieldValues['规格说明']<>Null then
 memo1.Text:=adoquery2.FieldValues['规格说明'];

{lookupliaohaofm.showmodal;
edit1.Text:=lookupliaohaofm.liaohao;
edit2.Text:=lookupliaohaofm.pinming;
//edit4.Text:=lookupliaohaofm.customer;
//edit5.Text:=lookupliaohaofm.cusno;
//edit3.Text:=lookupliaohaofm.versions;
//edit7.Text:=lookupliaohaofm.model;
memo1.Text:=lookupliaohaofm.guigeshuoming;  }
end;

procedure TCREATEBOMFM.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
      adoquery2.Close;
      adoquery2.SQL.Clear;
      adoquery2.SQL.Add('select * from lingjianliaohao where 料号 like '+''''+trim(edit6.Text)+'%'+'''');
      adoquery2.Open;
  end;
end;

procedure TCREATEBOMFM.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
      adoquery2.Close;
      adoquery2.SQL.Clear;
      adoquery2.SQL.Add('select * from lingjianliaohao where 规格说明 like '+''''+trim(edit8.Text)+'%'+'''');
      adoquery2.Open;
  end;
end;

end.
