unit ECR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, OleCtnrs, ToolWin, Buttons, DB, ADODB, ExtCtrls,
  StdCtrls, Grids, DBGrids;

type
  TECRFM = class(TForm)
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton6: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ADOTable1: TADOTable;
    ADOTable1Main_No: TStringField;
    ADOTable1App_person: TStringField;
    ADOTable1Creat_date: TDateTimeField;
    ADOTable1checked: TStringField;
    SpeedButton5: TSpeedButton;
    Panel1: TPanel;
    Panel4: TPanel;
    cmd: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    Edit2: TEdit;
    Label3: TLabel;
    SpeedButton7: TSpeedButton;
    Panel5: TPanel;
    OleContainer1: TOleContainer;
    SpeedButton8: TSpeedButton;
    AQ: TADOQuery;
    update: TADOQuery;
    bm: TADOTable;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    liaohao:string;
  end;

var
  ECRFM: TECRFM;
  i,j:integer;
  m:integer;
  strs:string;
implementation
        uses saveecr,dmut,glbut, bomlist, lookupliaohao, LOOKUPBOM,
  getbomliao;
{$R *.dfm}

procedure TECRFM.SpeedButton6Click(Sender: TObject);
begin
//OLEcontainer1.Close;
i:=14;
close;
end;
procedure createExcelbyfile(excelfilename:string);
begin

 ecrfm.OleContainer1.createObjectFromFile(excelfilename,false);

 ecrfm.OleContainer1.doverb(0);
 ecrfm.OleContainer1.OleObject.application.CommandBars['Standard'].Visible:=false;
 ecrfm.OleContainer1.OleObject.application.CommandBars['Formatting'].Visible:=false;
 ecrfm.OleContainer1.OleObject.application.CommandBars['Reviewing'].Visible:=false;
 ecrfm.OleContainer1.doverb(0);



end;
procedure TECRFM.SpeedButton1Click(Sender: TObject);
begin
  StatusBar1.Panels.Items[3].Text:='���Ե�...     ���ڴ���ECR�ļ�����';
  statusbar1.Update;
  try
  olecontainer1.LoadFromFile('ECR\BOM_ECR.ECR');
  m:=1;
  i:=14;
  except
      try
          olecontainer1.LoadFromFile('BackUp\BOM_ECR.ECR');
      except
           application.MessageBox('����ECR�ļ�ʧ�ܣ�����          ','ʧ�ܣ�',mb_ok+MB_ICONerror);
           StatusBar1.Panels.Items[3].Text:='����ECR�ļ�ʧ�ܣ����� ����';
      end;

  end;

  olecontainer1.DoVerb(0);
  ecrfm.OleContainer1.OleObject.application.CommandBars['Standard'].Visible:=false;
  ecrfm.OleContainer1.OleObject.application.CommandBars['Formatting'].Visible:=false;
  ecrfm.OleContainer1.OleObject.application.CommandBars['Reviewing'].Visible:=false;
  //ecrfm.OleContainer1.OleObject.application.CommandBars['editor'].Visible:=false;
  StatusBar1.Panels.Items[3].Text:='������ɣ���';


 {try
 if opendialog1.Execute then
  begin


  StatusBar1.Panels.Items[3].Text:='���Ե�...     ���ڴ��ļ�����ȡ���ݣ���';
  StatusBar1.Update;
  createexcelbyfile(opendialog1.FileName) ;
  StatusBar1.Panels.Items[3].Text:='������ɣ���';

  end;
 except
      StatusBar1.Panels.Items[3].Text:='���ļ�ʧ�ܣ�������һ��������ʹ�ã���ر���Ȼ�����ԣ���';
 end;
      }
end;

procedure TECRFM.FormCreate(Sender: TObject);
begin
//try
// olecontainer1.LoadFromFile('ECR\ECR.xls');
 //createexcelbyfile('ECR\ECR.xls') ;
//except
// olecontainer1.LoadFromFile('BackUp\ECR.xls');
 //createexcelbyfile('BackUp\ECR.xls') ;
//end;
end;

procedure TECRFM.SpeedButton2Click(Sender: TObject);
var
   filename:string;
begin
saveecrfm.ShowModal;
 if saveecrfm.liaohao='' then
 abort;  
 filename:='ECR\'+saveecrfm.liaohao+'.ECR';
 olecontainer1.SaveToFile(filename);
 adotable1.Close;
 adotable1.Open;
 adotable1.Edit;
 adotable1.Append;
 adotable1.FieldByName('Main_No').Value:=saveecrfm.liaohao;
 adotable1.FieldByName('app_person').Value:=user;
 adotable1.FieldByName('create_date').Value:=date();
 adotable1.Append;

end;

procedure TECRFM.SpeedButton3Click(Sender: TObject);
begin
// olecontainer1.LoadFromFile('ECR\aa.hme');
if panel1.Visible=true then
begin
   panel1.Visible:=false;
   olecontainer1.Visible:=true;
   end
   else
     begin
         panel1.Visible:=true;
         olecontainer1.Visible:=false;
     end;
end;

procedure TECRFM.SpeedButton5Click(Sender: TObject);
var
check:string;
i,j:integer;
nstr,cmd,bomliao,liaohao,yongliang,lingjianweizhi:string;
bom:string;
begin
if liaohao='' then
begin
    application.MessageBox('û��ѡ��ECR����              ','����',mb_ok+MB_ICONerror);
      abort;
end;
adotable1.Close;
adotable1.Open;
check:=adotable1.FieldValues['checked'];
if trim(check)<>'�����' then
begin
    application.MessageBox('��ECR��û�о�����ˣ��������������£�����              ','����',mb_ok+MB_ICONerror);
    abort;
end;

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
end;

StatusBar1.Panels.Items[3].Text:='���Ե�...���ĵȴ�����ϵͳ���ڸ������BOM����������ʱ��ȡ���ڱ����ٶȣ�����';
while true   do
      begin
           nstr:=OleContainer1.OleObject.application.cells[i,1].value;
           cmd:=OleContainer1.OleObject.application.cells[i,2].value;
           bomliao:=OleContainer1.OleObject.application.cells[i,3].value;
           liaohao:=OleContainer1.OleObject.application.cells[i,4].value;
           yongliang:=OleContainer1.OleObject.application.cells[i,6].value;
           lingjianweizhi:=OleContainer1.OleObject.application.cells[i,1].value;
           fomatliaohao(bomliao,bom);
           i:=+1;
           if cmd='End' then
              begin
                StatusBar1.Panels.Items[3].Text:='����������񣡣���';
                application.MessageBox('������ɣ���������              ','��ʾ��',mb_ok+MB_ICONinformation);
                abort;
              end;

           if cmd='ADD' then
              begin
                 update.Close;
                 update.SQL.Clear;
                 update.SQL.Add('select * from bom ');
                 update.Open;
                 update.Append;
                 update.FieldValues['�Ϻ�']:=liaohao;
                 update.FieldValues['��λ����']:=yongliang;
                 update.FieldValues['���λ��']:=lingjianweizhi;
                 update.Post;

                 bm.Close;
                 bm.TableName:='bomMapping';
                 bm.Open;
                 bm.Append;
                 bm.FieldValues['cn']:=liaohao;
                 bm.FieldValues['mn']:=bom;
                 try
                 bm.Post;
                 bm.Close;
                 except
                 end;

              end;
           if cmd='DELETE' THEN
              BEGIN
                 update.Close;
                 update.SQL.Clear;
                 update.SQL.Add('delete * from bom ');
                 update.Open;
                 if update.RecordCount>=1 then
                 update.Delete
                 else
                 begin
                      application.MessageBox('����һ�����󣡣������Ϻſɹ�ɾ��              ','����',mb_ok+MB_ICONerror);
                 end;
              END;
           IF CMD='CHANGE' THEN
              BEGIN
                 update.Close;
                 update.SQL.Clear;
                 update.SQL.Add('select * from bom ');
                 update.Open;
                 if update.RecordCount=1 then
                 begin
                 update.Edit;
                 //update.FieldValues['�Ϻ�']:=liaohao;
                 update.FieldValues['��λ����']:=yongliang;
                 update.FieldValues['���λ��']:=lingjianweizhi;
                 update.Post;
                 end
                 else
                 begin
                     application.MessageBox('����һ�����󣡣������Ϻſɹ����£�����              ','����',mb_ok+MB_ICONerror);
                 end;
              END;
           if cmd='' then
              begin
                  
              end;
      end;

end;

procedure TECRFM.SpeedButton4Click(Sender: TObject);
begin
LOOKUPBOMFM2.cb.Text:=EDIT1.Text;
lookupbomfm2.cb.Update;
LOOKUPBOMFM2.SHOWmodal;
edit1.Text:=lookupbomfm2.liaohao;
end;

procedure TECRFM.SpeedButton7Click(Sender: TObject);
begin
lookupliaohaofm.showmodal;
edit2.Text:=lookupliaohaofm.liaohao;
strs:=lookupliaohaofm.guigeshuoming;
end;

procedure TECRFM.SpeedButton8Click(Sender: TObject);
var
   liaohao :string;

begin
 if  cmd.Text='ADD' then
           begin
              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,1]:=inttostr(m);

              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,2]:=trim(cmd.Text);
              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,3]:=trim(edit1.Text);
              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,4]:=trim(edit2.Text);
              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,5]:=trim(strs);
              i:=i+1;
              //j:=2;
              strs:='';
           end;
 if  cmd.Text='DELETE' then
           begin
              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,1]:=inttostr(m);

              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,2]:=cmd.Text;
              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,3]:=edit1.Text;
              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,4]:=edit2.Text;
              OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,5]:=strs;
              i:=i+1;
             // j:=2;
              strs:='';
           end;
 if  cmd.Text='CHANGE'  then
          begin
          fomatliaohao(edit1.Text,liaohao);
              aq.Close;
              aq.SQL.Clear;
              aq.SQL.Add('select * from '+liaohao+'where �Ϻ�='+''''+edit2.Text+'''');
              try
              aq.Open;
              except
                    application.MessageBox('�����쳣��������д�룡����              ','����',mb_ok+MB_ICONerror);
                   abort;
              end;
              if aq.RecordCount<=1 then
              begin
                   application.MessageBox('�޴��Ϻţ��������������£�����              ','����',mb_ok+MB_ICONerror);
                   abort;
              end
              else
                 begin
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,1]:=inttostr(m);

                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,2]:='BC';
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,3]:=edit1.Text;
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,4]:=edit2.Text;
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,5]:=strs;
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,6]:=aq.FieldValues['��λ����'];
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,7]:=aq.FieldValues['���λ��'];

                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,2]:=cmd.Text;
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,3]:=edit1.Text;
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,4]:=edit2.Text;
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,5]:=strs;
                     //OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,6]:=aq.FieldValues['��λ����'];
                     //OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,7]:=aq.FieldValues['���λ��'];


                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,2]:='AC';
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,3]:=edit1.Text;
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,4]:=edit2.Text;
                     OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,5]:=strs;
                     //OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,6]:=aq.FieldValues['��λ����'];
                     //OleContainer1.OleObject.Application.workbooks[1].sheets[1].cells[I,7]:=aq.FieldValues['���λ��'];

                      i:=i+1;
                      strs:='';
                 end;

          end;

end;

procedure TECRFM.FormActivate(Sender: TObject);
begin
m:=1;
i:=14;
end;

procedure TECRFM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
i:=14;
end;

end.
