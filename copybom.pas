unit copybom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls, ExtCtrls, Buttons, DB;

type
  Tcopybomfm = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    AD: TADOCommand;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    SpeedButton2: TSpeedButton;
    R1: TRadioButton;
    R2: TRadioButton;
    R3: TRadioButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  copybomfm: Tcopybomfm;

implementation
      uses dmut,glbut, bomlist, getbomliao, makebom,
  openbom;
{$R *.dfm}
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

   with copybomfm.AD do
         begin

             CommandText:='';
             CommandText:=str;
             execute;

         end;

end;
procedure Tcopybomfm.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tcopybomfm.Button1Click(Sender: TObject);
var
  sqlstr,oldtable,newtable,liaohao:string;
  appendto:boolean;
begin
appendto:=false;
if edit2.Text='' then
   begin
      application.MessageBox('��ѡ��ҪԴBOM  ','û�и��ƶ���',mb_ok+MB_ICONerror);
      panel1.Visible:=false;
      abort;
   end;
if edit1.Text='' then
   begin
      application.MessageBox('�������BOM�����Ƽ�BOM�Ϻ�  ','û��BOM�Ϻ�',mb_ok+MB_ICONerror);
      panel1.Visible:=false;
      abort;
   end;
if trim(edit1.Text)=trim(edit2.Text)  then
   begin
       showmessage('Ŀ��£ϣͺ�Դ�£ϣ��Ϻ���ͬ��������');
       exit;
   end;
liaohao:=trim(edit1.Text);
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where �Ϻ�= '+''''+trim(edit1.Text)+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
begin
  application.MessageBox('�Ƿ��Ϻţ��Ϻſ����û�и��Ϻţ��޷�����BOM���뾡��������Ϻţ�����        ','�������',mb_ok+MB_ICONERROR);
  exit;
end;   

fomatliaohao(edit2.Text,oldtable);
if existbom(oldtable)<>true then
  begin
      application.MessageBox('     ��ѡ���ԴBOM�����ڣ�  ','û�д�BOM�Ϻ�',mb_ok+MB_ICONerror);
      panel1.Visible:=false;
      abort;
  end;

fomatliaohao(edit1.Text,newtable);
if existbom(newtable)=true then
  begin
     if r3.Checked=true then
        begin
            showmessage('BOM�Ѵ��ڲ�����ȡ��������   ');
            exit;
        end;
     if application.MessageBox('��Ҫ������BOM�Ѿ����ڣ��Ƿ�Ҫִ�����õĲ���BOM��������  ','HME��ʾ��',mb_YESNO+MB_ICONINFORMATION)=ID_NO then
        begin

         panel1.Visible:=false;
         abort;
        end
      else
        begin
        if (makebomfm.isowner(liaohao)=true)and(makebomfm.ischecked(liaohao)=false) then
           begin
           if r1.Checked=true then
              begin
              sqlstr:='update lingjianliaohao set �Ϻ�='   +''''+trim(edit1.Text) +''''+   ' where �Ϻ�='+'''' + trim(edit1.Text)+'''';
              ad.CommandText:='';
              ad.CommandText:=sqlstr;
              ad.Execute;

              sqlstr:='drop table '+newtable;
              ad.CommandText:='';
              ad.CommandText:=sqlstr;
              ad.Execute;
              end
           else  if r2.Checked=true then
              begin
                 appendto:=true;       // BOM EXSTS AND APPEND NEW LIAO TO IT
              end
           else
              begin
                  showmessage('δ��Ȩ����������       ');
                  exit;
              end;
       end
       else
       begin
                 showmessage('�ܾ����ǣ�����,BOM Ϊֻ������       ');
                 exit;
        end;
      end;


  end     //if existbom(newtable)=true then
  else
  begin
           {  try
                 sqlstr:='select * from lingjianliaohao where �Ϻ�= '+''''+trim(edit2.Text)+'''';
                 adoquery1.Close;
                 adoquery1.SQL.Clear;
                 adoquery1.SQL.Add(sqlstr);
                 adoquery1.Open;

                 adotable1.Close;
                 adotable1.Active:=true;
                 adotable1.append;
                 adotable1.FieldByName('�Ϻ�').Value:=edit1.Text;
                 adotable1.FieldByName('Ʒ��').Value:=adoquery1.FieldValues['Ʒ��'];
                 adotable1.FieldByName('���°汾').Value:=adoquery1.FieldValues['���°汾'];
                 adotable1.FieldByName('�ͻ�').Value:=adoquery1.FieldValues['�ͻ�'];
                 adotable1.FieldByName('�ͻ����ֺ�').Value:=adoquery1.FieldValues['�ͻ����ֺ�'];
                 adotable1.FieldByName('����').Value:=adoquery1.FieldValues['����'];
                 adotable1.FieldByName('���˵��').Value:=adoquery1.FieldValues['���˵��'];

                 adotable1.Post;
                 adotable1.Close;
               except
                    application.MessageBox('  ����BOMʧ�ܣ�                 ','����BOM����',mb_ok+MB_ICONERROR);
                    abort;
                    adotable1.Close;

               end;     }

  end;

fomatliaohao(trim(edit1.Text),newtable);
sqlstr:='insert into '+newtable +' select �Ϻ�, �ײ�, ��λ����, ��������, ���λ��,����,�ϼ�  from '+oldtable;
panel1.Visible:=true;
panel1.Update;




try
if appendto=false then       //bom   DO not exist   CREATE A NEW BOM
begin
  createtable(newtable);
end;
ad.CommandText:='';
ad.CommandText:=sqlstr;
ad.Execute;
except
application.MessageBox('�����쳣�����������ݱ�ʧ�� ��Ѱ����֧�ֽ�������⣡����  ','����ʧ��!',mb_ok+MB_ICONerror);
panel1.Visible:=false;
abort;
end;

application.MessageBox('  �����ѳɹ���ɣ�����               ','HBS��ʾ!',mb_ok+MB_ICONinformation);

panel1.Visible:=false;

end;

procedure Tcopybomfm.SpeedButton1Click(Sender: TObject);
begin
openbomfm.showmodal;
edit2.Text:=openbomfm.Edit1.Text;

//LOOKUPBOMFM.SHOWmodal;
//edit2.Text:=lookupbomfm.bomliaohao;
//bomlistfm.showmodal;
//edit2.Text:=bomlistfm.liaohao;
end;

procedure Tcopybomfm.SpeedButton2Click(Sender: TObject);
begin
openbomfm.showmodal;
edit1.Text:=openbomfm.Edit1.Text;

//lookupliaohaofm.showmodal;
//edit1.Text:=lookupliaohaofm.liaohao;
end;

procedure Tcopybomfm.FormActivate(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
end;

end.
