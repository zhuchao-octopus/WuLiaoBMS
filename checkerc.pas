unit checkerc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ToolWin, DB, Grids, DBGrids, ADODB, StdCtrls,
  ExtCtrls, DBCtrls;

type
  Tcheckercfm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton6: TSpeedButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    ADOQuery1: TADOQuery;
    ToolBar2: TToolBar;
    cb: TComboBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ADOCommand1: TADOCommand;
    DBNavigator1: TDBNavigator;
    update: TADOQuery;
    bm: TADOTable;
    ECN: TADOTable;
    ADOQuery1Main_No: TStringField;
    ADOQuery1liaohao: TWideStringField;
    ADOQuery1wenhao: TStringField;
    ADOQuery1App_person: TStringField;
    ADOQuery1Create_date: TDateTimeField;
    ADOQuery1checked: TStringField;
    ADOQuery1state: TStringField;
    SpButton7: TSpeedButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpButton7Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  
    useredit:boolean;
    ecrname:string;

  end;

var
  checkercfm: Tcheckercfm;

implementation
       uses dmut, ECR,glbut, getbomliao, CHECKECN;
{$R *.dfm}

procedure Tcheckercfm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tcheckercfm.FormActivate(Sender: TObject);
begin
adoquery1.Close;
adoquery1.Open;
end;

procedure Tcheckercfm.cbKeyPress(Sender: TObject; var Key: Char);
var
   sqlstr:string;
begin
if key=#13 then
begin
    sqlstr:='select * from ecr where Main_No like '+''''+'%'+trim(cb.Text)+'%'+'''';
    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add(sqlstr);
    adoquery1.Open;
end;
end;

procedure Tcheckercfm.SpeedButton3Click(Sender: TObject);
begin

    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add('select * from ecr ');
    adoquery1.Open;
    
end;

procedure Tcheckercfm.SpeedButton2Click(Sender: TObject);
begin
if adoquery1.Active=false then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;
  //  adoquery1.Close;
   
  //  adoquery1.Open;
if trim(adoquery1.FieldValues['Main_No'])='' then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;


CHECKECNFM.ADOQuery1.Close;
CHECKECNFM.ADOQuery1.SQL.Clear;
CHECKECNFM.ADOQuery1.SQL.Add('select * from lingjianliaohao where �Ϻ�='+''''+trim(adoquery1.FieldValues['liaohao'])+'''');
CHECKECNFM.ADOQuery1.Open;

CHECKECNFM.ADOTable1.Close;
CHECKECNFM.ADOTable1.TableName:=trim(adoquery1.FieldValues['Main_No']);
CHECKECNFM.ADOTable1.Open;
MakeDBGridColumnsAutoFixItsWidth(CHECKECNFM.DBGrid1);
CHECKECNFM.showmodal;
if CHECKECNFM.cancel=true then
    exit;
if (CHECKECNFM.C1.Checked=true)and(CHECKECNFM.C2.Checked=true) then
    begin
         try
         adoquery1.Edit;
         adoquery1.FieldValues['checked']:='�Ѻ�׼';
         adoquery1.Post;
         application.MessageBox('��׼ͨ������              ','��ʾ��',mb_ok+MB_ICONinformation);
         except
         application.MessageBox('��׼ECR ʧ�ܣ���              ','����',mb_ok+MB_ICONerror);
         exit;
         end;
         speedbutton5.OnClick(self);
    end
else if CHECKECNFM.C1.Checked=true then
  begin
   try
    adoquery1.Edit;
    adoquery1.FieldValues['checked']:='�Ѻ�׼';
    adoquery1.Post;
    application.MessageBox('��׼ͨ������              ','��ʾ��',mb_ok+MB_ICONinformation);
   except
    application.MessageBox('��׼ECR ʧ�ܣ���              ','����',mb_ok+MB_ICONerror);
   end;
  end
else  exit;
end;

procedure Tcheckercfm.SpeedButton1Click(Sender: TObject);
var
liaohao:string;
//filename:string;
begin
liaohao:=trim(adoquery1.FieldValues['liaohao']);
if liaohao='' then
begin
    showmessage('��Ч�Ĳ�����������');
    exit;
end;
lookupbomfm2.getecn(liaohao);
LOOKUPBOMFM2.Caption:='��׼�ţã�';
LOOKUPBOMFM2.show;




{if adoquery1.Active=false then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;
   if adoquery1.FieldValues['Main_No']='' then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;

 if useredit=true then
begin
 if adoquery1.FieldValues['app_person']<>user then
 begin

ecrfm.Caption:='�༭ECR' ;
ecrfm.StatusBar1.Panels.Items[3].Text:='�༭ECR';
//ecrfm.Update;
ecrfm.SpeedButton1.Enabled:=false;
ecrfm.SpeedButton2.Enabled:=false;
 end
 else
 begin
     ecrfm.Caption:='�༭ECR' ;
ecrfm.StatusBar1.Panels.Items[3].Text:='�༭ECR';
//ecrfm.update;
ecrfm.SpeedButton1.Enabled:=false;
ecrfm.SpeedButton2.Enabled:=true;
 end;
end
else
    begin
ecrfm.Caption:='�鿴ECR' ;
ecrfm.StatusBar1.Panels.Items[3].Text:='�鿴ECR';
ecrfm.SpeedButton1.Enabled:=false;
ecrfm.SpeedButton2.Enabled:=true;
    end;


liaohao:=adoquery1.FieldValues['Main_No'];
filename:='ECR\'+liaohao+'.ECR';
 if FileExists(filename)=false then
begin
    application.MessageBox('ECR�ļ���ʧ����û���ҵ����ļ���              ','��ʾ��',mb_ok+MB_ICONinformation);
    abort;
end;
try
ecrfm.OleContainer1.LoadFromFile(filename);
ecrfm.OleContainer1.DoVerb(0);
ecrfm.liaohao:=liaohao;
ecrfm.show;
except
 application.MessageBox('ECR�ļ���ʧ�����޷�װ��ECR��              ','��ʾ��',mb_ok+MB_ICONinformation);
    abort;
end;  }
end;

procedure Tcheckercfm.SpeedButton4Click(Sender: TObject);
var
//F:file;
filename:string;
liaohao:string;

begin
if adoquery1.Active=false then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;
  if useredit=true then
begin
 //if adoquery1.FieldValues['app_person']<>user then
// begin
  //    application.MessageBox('��û�б༭��ECR��Ȩ�ޣ���              ','����',mb_ok+MB_ICONerror);
   //   abort;
 //end
// else
 //   begin
       // ecrfm.SpeedButton2.Enabled:=true;
  //  end;
end;

   if adoquery1.FieldValues['Main_No']='' then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;
if    application.MessageBox('��ȷʵҪɾ����ECR�ļ��𣿣�              ','��ʾ��',mb_okcancel+MB_ICONinformation)=Id_cancel then
      abort;

liaohao:=adoquery1.FieldValues['Main_No'];
//filename:='ECR\'+liaohao+'.ECR';
//if FileExists(filename)=false then
//begin
   // application.MessageBox('ECR�ļ���ʧ����û���ҵ����ļ���              ','��ʾ��',mb_ok+MB_ICONinformation);
//end;
//if DeleteFile(filename)=true then

   begin
      if existbom(liaohao) then
         begin
          adocommand1.CommandText:='';
          adocommand1.CommandText:='drop table '+liaohao;
          adocommand1.Execute;
          end;

      adoquery1.Delete;
   end
  // else
    // application.MessageBox('ECR�ļ��ܾ�ɾ��������              ','��ʾ��',mb_ok+MB_ICONerror);

//AssignFile(F, FileName);
                   // Reset(F);


end;

procedure Tcheckercfm.SpeedButton5Click(Sender: TObject);
var
check:string;
i,j:integer;
cmd,bomliao,liaohao:string;
ecrname:string;
begin
if adoquery1.Active=false then
   abort;
ecrname:=adoquery1.FieldValues['main_no'];
if ecrname='' then
begin
    application.MessageBox('��ЧECN �ļ��� ����û����ȷѡ��ECR����              ','����',mb_ok+MB_ICONerror);
    abort;
end;

check:=adoquery1.FieldValues['checked'];
if trim(check)<>'�Ѻ�׼' then
begin
    application.MessageBox('��ECR��û�о�����׼���������������£�����              ','����',mb_ok+MB_ICONerror);
    abort;
end;
{
i:=1;
if  OleContainer1.OleObject.application.cells[13,1].value<>'1' then
    begin
        application.MessageBox('�����ECR�ļ���ʽ���������������£�����              ','����',mb_ok+MB_ICONerror);
        abort;
    end;

for j:=0 to 1024 do
begin
    cmd:=OleContainer1.OleObject.application.cells[j,2].value;
    if cmd='End' then
    begin
        break;
    end;
end;
if j=1024 then
begin
   application.MessageBox('�����ECR�ļ���ʽ���������������£�����              ','����',mb_ok+MB_ICONerror);
   abort;
end;     }

StatusBar1.Panels.Items[2].Text:='���Ե�...���ĵȴ�����ϵͳ����Ӧ�ô�ECN�������BOM����������ʱ��ȡ���ڱ����ٶȣ�����';
ECN.Close;
ecn.TableName:=ecrname;
ecn.Open;
ecn.First;
//while true   do
for i:=0 to ecn.RecordCount-1 do
      begin

           cmd:=trim(ecn.FieldValues['����']);
           bomliao:=trim(ecn.FieldValues['���Ϻ�']);

           //liaohao:=OleContainer1.OleObject.application.cells[i,4].value;
           //yongliang:=OleContainer1.OleObject.application.cells[i,6].value;
           //lingjianweizhi:=OleContainer1.OleObject.application.cells[i,1].value;
           //fomatliaohao(bomliao,bom);
           //if cmd='End' then
             // begin
               // StatusBar1.Panels.Items[3].Text:='����������񣡣���';
               // application.MessageBox('������ɣ���������              ','��ʾ��',mb_ok+MB_ICONinformation);
               // abort;
              //end;
            fomatliaohao(bomliao,bomliao);

           if cmd='����' then
              begin
                 liaohao:=trim(ecn.FieldValues['������Ϻ�']);
                 update.Close;
                 update.SQL.Clear;
                 update.SQL.Add('select * from '+bomliao+' where �Ϻ�='+''''+liaohao+'''');
                 update.Open;
                 if update.RecordCount<1 then begin
                 update.Append;
                 update.FieldValues['�Ϻ�']:=ecn.FieldValues['������Ϻ�'];
                 update.FieldValues['��λ����']:=ecn.FieldValues['���������'];
                 update.FieldValues['���λ��']:=ecn.FieldValues['�����λ��'];
                 update.Post;
                 end;
                 {if existbom(liaohao) then
                 begin
                 bm.Close;
                 bm.TableName:='bomMapping';
                 bm.Open;
                 bm.Append;
                 bm.FieldValues['cn']:=liaohao;
                 bm.FieldValues['mn']:=bomliao;
                 try
                 bm.Post;
                 bm.Close;
                 except
                 end;
                 end;  }
              end;
           if cmd='ɾ��' THEN
              BEGIN
                 liaohao:=trim(ecn.FieldValues['���ǰ�Ϻ�']);
                 update.Close;
                 update.SQL.Clear;
                 update.SQL.Add('delete from '+bomliao+' where �Ϻ�='+''''+liaohao+'''');
                 try
                 update.ExecSQL;
                 except
                 end;
                 //if update.RecordCount>=1 then
                 //update.Delete
                 //else
                 //begin
                 //     application.MessageBox('����һ�����󣡣������Ϻſɹ�ɾ��              ','����',mb_ok+MB_ICONerror);
                 //end;
              END;
           IF CMD='�޸�' THEN
              BEGIN
                 liaohao:=trim(ecn.FieldValues['���ǰ�Ϻ�']);
                 update.Close;
                 update.SQL.Clear;
                 update.SQL.Add('select * from '+bomliao+' where �Ϻ�='+''''+liaohao+'''');
                 update.Open;
                 if update.RecordCount=1 then
                 begin
                 update.Edit;
                 update.FieldValues['�Ϻ�']:=ecn.FieldValues['������Ϻ�'];
                 update.FieldValues['��λ����']:=ecn.FieldValues['���������'];
                 update.FieldValues['���λ��']:=ecn.FieldValues['�����λ��'];
                 update.Post;
                 end;
                 //else
                // begin
                //     application.MessageBox('����һ�����󣡣������Ϻſɹ����£�����              ','����',mb_ok+MB_ICONerror);
                // end;
              END;
           if cmd='' then
              begin
                  
              end;


          ecn.Next;    
      end;
        statusBar1.Panels.Items[2].Text:='����������ɣ�����';
        adoquery1.edit;
        adoquery1.FieldValues['state']:='��Ӧ��';
        adoquery1.Post;
        application.MessageBox('Ӧ��ECR��ɣ���������              ','��ʾ��',mb_ok+MB_ICONinformation);
end;

procedure Tcheckercfm.SpButton7Click(Sender: TObject);
begin
if adoquery1.Active=false then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;
   
   if trim(adoquery1.FieldValues['Main_No'])='' then
begin
      application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;
try
    adoquery1.Edit;
    adoquery1.FieldValues['checked']:='�ܾ�';
    adoquery1.Post;
    application.MessageBox('�Ѿܾ���ENC����              ','��ʾ��',mb_ok+MB_ICONinformation);
except
  application.MessageBox('����ECN ʧ�ܣ���              ','����',mb_ok+MB_ICONerror);
end;
end;

procedure Tcheckercfm.ToolButton3Click(Sender: TObject);
var
sqlstr:string;
begin
 sqlstr:='select * from ecr where checked= '+''''+'�Ѻ�׼'+'''';
    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add(sqlstr);
    adoquery1.Open;
    statusbar1.Panels.Items[1].Text:=inttostr(adoquery1.RecordCount);
end;

procedure Tcheckercfm.ToolButton4Click(Sender: TObject);
var
sqlstr:string;
begin
 sqlstr:='select * from ecr where checked= '+''''+'�����'+'''';
    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add(sqlstr);
    adoquery1.Open;
    statusbar1.Panels.Items[1].Text:=inttostr(adoquery1.RecordCount);
end;

procedure Tcheckercfm.ToolButton5Click(Sender: TObject);
var
sqlstr:string;
begin
 sqlstr:='select * from ecr where state= '+''''+'��Ӧ��'+'''';
    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add(sqlstr);
    adoquery1.Open;
    statusbar1.Panels.Items[1].Text:=inttostr(adoquery1.RecordCount);
end;

procedure Tcheckercfm.ToolButton6Click(Sender: TObject);
var
sqlstr:string;
begin
 sqlstr:='select * from ecr' ;
    adoquery1.Close;
    adoquery1.SQL.Clear;
    adoquery1.SQL.Add(sqlstr);
    adoquery1.Open;
    statusbar1.Panels.Items[1].Text:=inttostr(adoquery1.RecordCount);
end;

procedure Tcheckercfm.DBGrid1TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid1.Columns.Count do
  begin
    DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid1.Columns[i-1].Title.Font.Style := [];
  end;

if ADOquery1.Sort<>Column.FieldName+' DESC' then
begin
   ADOquery1.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      ADOquery1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tcheckercfm.FormShow(Sender: TObject);
begin
ToolButton4.OnClick(self);
end;

end.
