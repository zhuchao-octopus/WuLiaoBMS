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
 '	[�Ϻ�] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL primary key,         '+
 '	[�ײ�] [char] (2) COLLATE Chinese_PRC_CI_AS NULL ,                 '+
 '	[��λ����] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[��������] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,         '+
 '	[���λ��] [varchar] (800) COLLATE Chinese_PRC_CI_AS NULL,         '+
 ' 	[����] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL      ,           '+
 '  [����] [float] NULL default 0.00,                                               '+

 ' 	[�ϼ�] [float] NULL default 0.00                                              '+
') ON [PRIMARY]';

    //primary key
   //  ' 	[����] [float] NULL default 0.00,                 '+
  // '	[���] [nchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,  '+
  // 	' [Ʒ��] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL , '+
  //'	[���˵��] [varchar] (200) COLLATE Chinese_PRC_CI_AS NOT NULL , '+

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
           application.MessageBox('������һ��Ϊ�գ�BOM��Ϣ����������������������         ','�������',mb_ok+MB_ICONERROR);
           exit;
      end;
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where �Ϻ�= '+''''+trim(edit1.Text)+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
begin
  application.MessageBox('�Ƿ��Ϻţ��Ϻſ����û�и��Ϻţ��޷�����BOM���뾡��������Ϻţ�����        ','�������',mb_ok+MB_ICONERROR);
  exit;
end;
str:=edit2.Text;
if str[1] in ['0'..'9'] then
begin
    application.MessageBox('��ЧƷ���Ƿ��������        ','���������������',mb_ok+MB_ICONERROR);
    exit;
end;
fomatliaohao(edit1.Text,liaohao);
if existbom(liaohao)=true then
  begin
     if application.MessageBox(' ��Ҫ������BOM�Ѿ����ڣ��Ƿ�Ҫ�������е�BOM��������  ','HME��ʾ��',mb_YESNO+MB_ICONINFORMATION)=ID_NO then
       begin
      panel1.Visible:=false;
      abort;
      end
      else
        begin
        showmessage('�ܾ����ǣ�����');
        exit;
            sqlstr:='drop table '+trim(liaohao);
            adocommand1.CommandText:='';
            adocommand1.CommandText:=sqlstr;
            adocommand1.Execute;

          {  sqlstr:='delete from lingjianliaohao where �Ϻ�= '+''''+trim(liaohao)+'''';
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
           application.MessageBox('��Ч��¼��"�Ϻ�"����Ϊ��,��Ƿ��Ϻ�!!         ','�������',mb_ok+MB_ICONERROR);
           exit;
      end;

               try
                 
              //   adotable1.Active:=true;
              //   adotable1.append;
                // ADOTable1.Edit;
               //  adotable1.FieldByName('�Ϻ�').Value:=edit1.Text;
               //  adotable1.FieldByName('Ʒ��').Value:=edit2.Text;
               //  adotable1.FieldByName('���°汾').Value:=edit3.Text;
                // adotable1.FieldByName('�ͻ�').Value:=edit4.Text;
                // adotable1.FieldByName('�ͻ����ֺ�').Value:=edit5.Text;
                // adotable1.FieldByName('����').Value:=edit7.Text;
                // for i:=0 to  memo1.Lines.Count do
                //      memostr:=memostr+memo1.Lines.Strings[i];
                // adotable1.FieldByName('���˵��').Value:=memostr;

                // adotable1.Post;
                 createtable(liaohao);
                // adotable1.Close;

                 application.MessageBox('BOM�����ɹ���ɣ���                 ','FALCON ERP��ʾ',mb_ok+MB_ICONINFORMATION);



               except
                    application.MessageBox('����BOMʧ�ܣ���ȷ��BOM�����Ϣ�Ƿ��������й���                 ','����BOM����',mb_ok+MB_ICONERROR);
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
 edit1.Text:=adoquery2.FieldValues['�Ϻ�'];
 if   adoquery2.FieldValues['Ʒ��']<>Null then
 edit2.Text:=adoquery2.FieldValues['Ʒ��'];
 if adoquery2.FieldValues['�ͻ�']<>Null then
 edit4.Text:=adoquery2.FieldValues['�ͻ�'];
 if adoquery2.FieldValues['�ͻ����ֺ�']<>Null then
 edit5.Text:=adoquery2.FieldValues['�ͻ����ֺ�'];
 if adoquery2.FieldValues['���°汾']<>Null then
 edit3.Text:=adoquery2.FieldValues['���°汾'];
 if adoquery2.FieldValues['ʹ�û���']<>Null then
 edit7.Text:=adoquery2.FieldValues['ʹ�û���'];
 if adoquery2.FieldValues['���˵��']<>Null then
 memo1.Text:=adoquery2.FieldValues['���˵��'];

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
      adoquery2.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+trim(edit6.Text)+'%'+'''');
      adoquery2.Open;
  end;
end;

procedure TCREATEBOMFM.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
      adoquery2.Close;
      adoquery2.SQL.Clear;
      adoquery2.SQL.Add('select * from lingjianliaohao where ���˵�� like '+''''+trim(edit8.Text)+'%'+'''');
      adoquery2.Open;
  end;
end;

end.
