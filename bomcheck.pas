unit bomcheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bomedit, ADODB, DB, Grids, DBGrids, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, ToolWin, Menus, ImgList, Mask, DBCtrls;

type
  Tbomcheckfm = class(Tbomeditfm)
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    BOM1: TMenuItem;
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet1Show(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure getbomlist();
    procedure getbomlistCHECKED();
    procedure BOM1Click(Sender: TObject);
    procedure getbomlistbymodal(modal:string);
    procedure getmodel(model:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bomcheckfm: Tbomcheckfm;

implementation
         uses glbut, appliaohao, VERSIONUPDATE, APPROVEBOM;
{$R *.dfm}

procedure Tbomcheckfm.ADOQuery1BeforePost(DataSet: TDataSet);
begin
 //if application.MessageBox('BOM�Ѿ������ͨ�����Ƿ񱣴���˽����','��ʾ��',MB_OKCANCEL+MB_iconinformation)<>idok then
    //  begin
    //    adoquery1.Cancel;
    //  end;

end;

procedure Tbomcheckfm.SpeedButton9Click(Sender: TObject);
var
liaohao:string;
backupliaohao:string;
begin
if ADOQUERY1.Active<> TRUE THEN
begin
   application.MessageBox(' ����Ҫѡ����Ҫ����˵�BOM������   δѡ�֣���������                            ','HME��ʾ δѡ�֣�',mb_Ok+MB_ICONINFORMATION);
    abort;
end;
try

fomatliaohao(trim(adoquery1.FieldValues['�Ϻ�']),liaohao);
except
    application.MessageBox(' ����Ҫѡ��Ҫ��˵�BOM������   δѡ�֣���������                            ','HME��ʾ δѡ�֣�',mb_Ok+MB_ICONINFORMATION);
    abort;
end;
APPROVEBOMFM.DataSource1.DataSet:=adoquery1;
APPROVEBOMFM.showmodal;
if approvebomfm.cancel=true then
   exit;
if existbom(liaohao)=true then
  begin
     adoquery1.Edit;
     
     adoquery1.FieldValues['����']:='�Ѻ�׼';
    // if application.MessageBox('��ǰ��׼֮BOM�Ƿ���������BOM��������������                            ','HME��ʾ��',mb_YESNO+MB_ICONINFORMATION)=ID_YES THEN
     if APPROVEBOMFM.C2.Checked=true then
          begin
           adoquery1.FieldValues['״̬']:=true;
          end
     else  adoquery1.FieldValues['״̬']:=false;
     try
     adoquery1.Post;
    // showmessage('��׼�ɹ���ɣ�����');
     except
          application.MessageBox(' BOM �����쳣 ��׼��BOM�ǳ��ִ��󣡣�������                            ','HME��ʾ��',mb_OK+MB_ICONINFORMATION);
          abort;
     end;

   //  if application.MessageBox('��ǰ��׼֮BOM�Ƿ���м�����׼����������                            ','HME��ʾ��',mb_YESNO+MB_ICONINFORMATION)=ID_YES THEN
     if APPROVEBOMFM.C1.Checked=true then
          begin
          try
            updatestatus(trim(adoquery1.FieldValues['�Ϻ�']));
           // showmessage('������׼�ɹ���ɣ�����');
          except
            showmessage('������׼�쳣��ֹ������');
          end;
          end;
    // application.MessageBox('��׼������ɣ�������                            ','HME��ʾ��',mb_OK+MB_ICONINFORMATION);
  END
  else
    begin
     application.MessageBox(' ��ѡ�ֵ���BOM�е����϶�����Ҫ���ϵ�BOM������   ѡ���ˣ���������                            ','HME��ʾ ѡ���ˣ�',mb_OK+MB_ICONINFORMATION);
     abort;
    END;

//backup bom
//if application.MessageBox('  �Ƿ���Ҫ���ݴ�BOM����������                            ','HME��ʾ��',mb_YESNO+MB_ICONINFORMATION)=id_NO THEN
if APPROVEBOMFM.C3.Checked=false then
BEGIN
  EXIT;
END;
if adoquery1.FieldValues['���°汾']=Null then
begin
    showmessage('�汾��Ϣ��ʧ�����ݱ�ȡ��������');
    exit;
end;
backupliaohao:=trim(trim(adoquery1.FieldValues['�Ϻ�'])+trim(adoquery1.FieldValues['���°汾'])+'_BACKUP');
if (backupliaohao[1]<>'9')or(backupliaohao[2]<>'9') then
exit;

if trim(adoquery1.FieldValues['���°汾'])='' then
begin
    showmessage('�汾��Ϣ��ʧ�����ݱ�ȡ��������');
    exit;
end;
try

backupbom(backupliaohao,trim(adoquery1.FieldValues['�Ϻ�']));
//showmessage('������ɣ�����');
except

end;
if  APPROVEBOMFM.C4.Checked=true then
    begin
         sbutton15.OnClick(self);
    end;
application.MessageBox('������ɣ�������                            ','HME��ʾ��',mb_OK+MB_ICONINFORMATION);
end;
procedure Tbomcheckfm.getbomlistCHECKED();
var
  l1: TTreeNode;
  i:integer;
  liaohao:string;
begin
LIAOHAO:='99';
statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
statusbar1.Update;
///////////////////////////get bom list///////////////////////
    tv.Items.Clear;
     with tq do
       begin
           close;
           tq.SQL.Clear;
           tq.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(liaohao)+'%'+''''+' and Ʒ�� like '+''''+'%��Ʒ%'+''''+' and ����='+''''+'�Ѻ�׼'+'''');
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
procedure Tbomcheckfm.getbomlist();
var
  l1: TTreeNode;
  i:integer;
  liaohao:string;
begin
LIAOHAO:='99';
statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
statusbar1.Update;
///////////////////////////get bom list///////////////////////
    tv.Items.Clear;
     with tq do
       begin
           close;
           tq.SQL.Clear;
           tq.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(liaohao)+'%'+''''+' and Ʒ�� like '+''''+'%��Ʒ%'+''''+' and ����='+''''+'�����'+'''');
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
procedure Tbomcheckfm.SpeedButton1Click(Sender: TObject);
begin
getbomlist();
end;

procedure Tbomcheckfm.DBGrid1DblClick(Sender: TObject);
begin
;

end;

procedure Tbomcheckfm.TVClick(Sender: TObject);
//var
 // sqlstr:string;
 // liaohao:string;
 // bomliaohao:string;
begin
   inherited;
{try
//if tv.Items.Item[0].Selected=false    then
 //  exit;
   tv.Selected.ImageIndex:=0;
   tv.Update;
   tv.Selected.ImageIndex:=1;
   tv.Update;
   liaohao:=tv.Selected.Text;
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
   adotable1.Close;
   MakeDBGridColumnsAutoFixItsWidth(DBGrid2) ;
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
   MakeDBGridColumnsAutoFixItsWidth(DBGrid1);
 end;
except
   adotable1.Close;
end;   }
end;

procedure Tbomcheckfm.getmodel(model:string);
begin

adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where ʹ�û��� like '+''''+'%'+trim(model)+'%'+''''+' and �Ϻ� like '+''''+'99%'+''''+' and ����='+''''+'�����'+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
   showmessage('û�з��ִ˻�����ص�BOM�����ȷʵ���ڣ�����»�����Ϣ������');

end;
procedure Tbomcheckfm.getbomlistbymodal(modal:string);
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
               end;
      end;
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'������';
statusbar1.Panels.Items[3].Text:='ˢ��������ɣ�������' ;

end;
procedure Tbomcheckfm.cbKeyPress(Sender: TObject; var Key: Char);
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
end;



{
 statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
 statusbar1.Update;

 sqlstr:='select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(cb.text)+'%'+''''+' and ����='+''''+'�����'+'''';
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
           end;

           for i1:=0 to adoquery2.RecordCount-1 do        //expent bom
                begin
                fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
                if existbom(liaohao)=true then    //check bom
                   begin
                   l1:=add(nil ,adoquery2.FieldValues['Ʒ��']+'('+trim(adoquery2.FieldValues['�Ϻ�'])+')');
                   end;
                    adoquery2.Next;
                end;
       end;

end;

   end;


  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ���������';  }
end;



procedure Tbomcheckfm.TabSheet1Show(Sender: TObject);
var
i,count:integer;
strsql,tname,liaohao:string;
begin
exit;
bomlist.Close;                            //get all bom
bomlist.Open;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin
               tname:=parseliaohao(bomlist.FieldValues['name']);
               strsql:='select * from lingjianliaohao where �Ϻ�='+''''+tname+''''+' and ����='+''''+'�����'+'''';
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

procedure Tbomcheckfm.Edit10KeyPress(Sender: TObject; var Key: Char);
var
i,count:integer;
strsql,tname,liaohao,bomliao:string;
begin
if key=#13 then
begin                                                                                                               //+' and ���='+''''+'true'+''''
lv.Clear;
bomlist.Close;
bomlist.SQL.Clear;
//('select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and ����='+''''+'�����'+''''+' and ���='+''''+'true'+''''); 
bomlist.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and ����='+''''+'�����'+'''');                           //get all bom
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
                      lv.Items[count-1].SubItems.add(bomlist.FieldValues['Ʒ��']);
                      lv.Items[count-1].SubItems.add(bomlist.FieldValues['���˵��']);
                   end;


               bomlist.Next;
            end;
            bomlist.Close;
   end;
end;
end;

procedure Tbomcheckfm.SpeedButton7Click(Sender: TObject);
begin
  appliaohaofm.show;
end;

procedure Tbomcheckfm.SpeedButton10Click(Sender: TObject);
var
backupliaohao:string;
begin
if adoquery1.FieldValues['���°汾']=Null then
begin
    showmessage('�汾��Ϣ��ʧ�����ݱ�ȡ��������');
    exit;
end;
backupliaohao:=trim(trim(adoquery1.FieldValues['�Ϻ�'])+trim(adoquery1.FieldValues['���°汾'])+'_BACKUP');
  if (backupliaohao[1]<>'9')or(backupliaohao[2]<>'9') then
  begin
  showmessage('���ܶ԰��Ʒ���б��ݣ�������');
  exit;
  end;

if trim(adoquery1.FieldValues['���°汾'])='' then
begin
    showmessage('�汾��Ϣ��ʧ�����ݱ�ȡ��������');
    exit;
end;
try
backupbom(backupliaohao,trim(adoquery1.FieldValues['�Ϻ�']));
showmessage('������ɣ�����');
except
showmessage('����ʱ�����쳣�����ݿ��ܱ��ݲ�����������');
end;


end;

procedure Tbomcheckfm.SpeedButton8Click(Sender: TObject);
var
backupliaohao:string;
begin
if application.MessageBox('  ��Ҫ������ǰBOM�𣡣�������                            ','HME��ʾ��',mb_YESNO+MB_ICONINFORMATION)=id_NO THEN
BEGIN
  EXIT;
END;
 statusbar1.Panels.Items[3].Text:='���Ե�...���ڸ��°汾��Ϣ.................' ;
 statusbar1.Update;
  if adoquery1.FieldValues['���°汾']=Null then
begin
    showmessage('�汾��Ϣ��ʧ���汾Ϊ�գ�����');
    exit;
end;
if trim(adoquery1.FieldValues['���°汾'])='' then
begin
    showmessage('�汾��Ϣ��ʧ���汾Ϊ�գ�����');
    exit;
end;

versionupdatefm.Edit1.Text:=adoquery1.FieldValues['���°汾'];
versionupdatefm.showmodal;
if versionupdatefm.cancel=true then
   exit;
backupliaohao:=trim(trim(adoquery1.FieldValues['�Ϻ�'])+trim(adoquery1.FieldValues['���°汾'])+'_BACKUP');
if (backupliaohao[1]<>'9')or(backupliaohao[2]<>'9') then
begin
      showmessage('�ǳ�ƷBOM�����ܽ��а汾����������');
      exit;
end;
if  trim(versionupdatefm.Edit2.Text)='' then
   begin
       showmessage('��Ч�İ汾��!!!');
       exit;
   end;

//if application.MessageBox('  �Ƿ���Ҫ���ݴ�BOM����������                            ','HME��ʾ��',mb_YESNO+MB_ICONINFORMATION)=id_NO THEN
//BEGIN
//  EXIT;
//END;
try
 statusbar1.Panels.Items[3].Text:='���Ե�...���ڱ���ԭ��BOM.................����������' ;
 statusbar1.Update;
backupbom(backupliaohao,trim(adoquery1.FieldValues['�Ϻ�']));
adoquery1.Edit;
adoquery1.FieldValues['���°汾']:=trim(versionupdatefm.Edit2.Text);
adoquery1.FieldValues['����']:='';
adoquery1.Post;

showmessage('BOM������ɣ�����           ');
//lastliao:='FullExtended' ;
except
    showmessage('�����жϣ����ݵ����ݿ��ܲ�����������');
end;



 statusbar1.Panels.Items[3].Text:='BOM������ɣ�������.................' ;
 statusbar1.Update;
end;

procedure Tbomcheckfm.BOM1Click(Sender: TObject);
begin
 getbomlistCHECKED();

end;

end.
