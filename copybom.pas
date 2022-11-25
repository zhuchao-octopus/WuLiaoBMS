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
      application.MessageBox('请选择要源BOM  ','没有复制对象',mb_ok+MB_ICONerror);
      panel1.Visible:=false;
      abort;
   end;
if edit1.Text='' then
   begin
      application.MessageBox('请给出新BOM的名称即BOM料号  ','没有BOM料号',mb_ok+MB_ICONerror);
      panel1.Visible:=false;
      abort;
   end;
if trim(edit1.Text)=trim(edit2.Text)  then
   begin
       showmessage('目标ＢＯＭ和源ＢＯＭ料号相同！！！！');
       exit;
   end;
liaohao:=trim(edit1.Text);
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where 料号= '+''''+trim(edit1.Text)+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
begin
  application.MessageBox('非法料号，料号库库中没有该料号！无法创建BOM，请尽快申请该料号！！！        ','输入错误',mb_ok+MB_ICONERROR);
  exit;
end;   

fomatliaohao(edit2.Text,oldtable);
if existbom(oldtable)<>true then
  begin
      application.MessageBox('     你选择的源BOM不存在！  ','没有此BOM料号',mb_ok+MB_ICONerror);
      panel1.Visible:=false;
      abort;
  end;

fomatliaohao(edit1.Text,newtable);
if existbom(newtable)=true then
  begin
     if r3.Checked=true then
        begin
            showmessage('BOM已存在操作被取消！！！   ');
            exit;
        end;
     if application.MessageBox('你要创建的BOM已经存在！是否要执行设置的操作BOM！！！！  ','HME提示！',mb_YESNO+MB_ICONINFORMATION)=ID_NO then
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
              sqlstr:='update lingjianliaohao set 料号='   +''''+trim(edit1.Text) +''''+   ' where 料号='+'''' + trim(edit1.Text)+'''';
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
                  showmessage('未授权操作！！！       ');
                  exit;
              end;
       end
       else
       begin
                 showmessage('拒绝覆盖！！！,BOM 为只读！！       ');
                 exit;
        end;
      end;


  end     //if existbom(newtable)=true then
  else
  begin
           {  try
                 sqlstr:='select * from lingjianliaohao where 料号= '+''''+trim(edit2.Text)+'''';
                 adoquery1.Close;
                 adoquery1.SQL.Clear;
                 adoquery1.SQL.Add(sqlstr);
                 adoquery1.Open;

                 adotable1.Close;
                 adotable1.Active:=true;
                 adotable1.append;
                 adotable1.FieldByName('料号').Value:=edit1.Text;
                 adotable1.FieldByName('品名').Value:=adoquery1.FieldValues['品名'];
                 adotable1.FieldByName('最新版本').Value:=adoquery1.FieldValues['最新版本'];
                 adotable1.FieldByName('客户').Value:=adoquery1.FieldValues['客户'];
                 adotable1.FieldByName('客户机种号').Value:=adoquery1.FieldValues['客户机种号'];
                 adotable1.FieldByName('机种').Value:=adoquery1.FieldValues['机种'];
                 adotable1.FieldByName('规格说明').Value:=adoquery1.FieldValues['规格说明'];

                 adotable1.Post;
                 adotable1.Close;
               except
                    application.MessageBox('  创建BOM失败！                 ','创建BOM错误',mb_ok+MB_ICONERROR);
                    abort;
                    adotable1.Close;

               end;     }

  end;

fomatliaohao(trim(edit1.Text),newtable);
sqlstr:='insert into '+newtable +' select 料号, 阶层, 单位用量, 工单用量, 零件位置,单价,合计  from '+oldtable;
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
application.MessageBox('出现异常！，复制数据表失败 请寻求技术支持解决此问题！！！  ','复制失败!',mb_ok+MB_ICONerror);
panel1.Visible:=false;
abort;
end;

application.MessageBox('  任务已成功完成！！！               ','HBS提示!',mb_ok+MB_ICONinformation);

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
