unit chengrenliaohao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, luut, Menus, DB, ADODB, ComCtrls, Grids, DBGrids, ExtCtrls,
  StdCtrls, Buttons, ToolWin;

type
  Tchengrenliaohaofm = class(Tlufm)
    SpeedButton1: TSpeedButton;
    N4: TMenuItem;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure printClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure updatesurplyer(liaohao:string;surplyer:string);
    procedure SpeedButton7Click(Sender: TObject);
    procedure updateproductor(liaohao:string;productor:string);
  private
    { Private declarations }
  public
    { Public declarations }
  
  end;

var
  chengrenliaohaofm: Tchengrenliaohaofm;

implementation

uses lookup, outexcel, upload, plcrqr,glbut, printcrsoption;

{$R *.dfm}
procedure readstr(str:string;flag:string;var substrs:array of string);
var
i:integer;
sumstr:string;
j:integer;
begin
j:=0;
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
procedure  Tchengrenliaohaofm.updateproductor(liaohao:string;productor:string);
var
 i,j:integer;
 substrs:array of string;
 fanded:boolean;
 surplies:string ;
begin
if adoquery1.FieldValues['������']=Null then
surplies:=''
else
surplies:=trim(adoquery1.FieldValues['������']);
    fanded:=false;
     setlength(substrs,length(surplies)+1);
     for i:=0 to high(substrs) do
      begin
       substrs[i]:='';
      end;

     readstr(surplies,' ',substrs);
     for j:=0 to high(substrs) do
     begin
         if (trim(productor)=trim(substrs[j]))and(trim(productor)<>'') then
         begin
            fanded:=true;
            break;
         end;

     end;
     if fanded=false then
     begin
         surplies:='';
             if adoquery1.FieldValues['������']=Null then
                surplies:=productor
             else  if trim(adoquery1.FieldValues['������'])='' then
                surplies:=productor
             else
               surplies:=trim(adoquery1.FieldValues['������'])+','+productor;

              adoquery1.Edit;
              adoquery1.FieldValues['������']:=surplies;
              adoquery1.Post;
     end
     else
     showmessage('����������ѱ����ϣ���������');



end;
procedure  Tchengrenliaohaofm.updatesurplyer(liaohao:string;surplyer:string);
var
 i,j:integer;
 substrs:array of string;
 fanded:boolean;
 surplies:string ;
begin
if adoquery1.FieldValues['��Ӧ��']=Null then
surplies:=''
else
surplies:=trim(adoquery1.FieldValues['��Ӧ��']);
    fanded:=false;
     setlength(substrs,length(surplies)+1);
     for i:=0 to high(substrs) do
      begin
       substrs[i]:='';
      end;

     readstr(surplies,' ',substrs);
     for j:=0 to high(substrs) do
     begin
         if (trim(surplyer)=trim(substrs[j]))and(trim(surplyer)<>'') then
         begin
            fanded:=true;
            break;
         end;

     end;
     if fanded=false then
     begin
         surplies:='';
             if adoquery1.FieldValues['��Ӧ��']=Null then
                surplies:=surplyer
             else  if trim(adoquery1.FieldValues['��Ӧ��'])='' then
                surplies:=surplyer
             else
               surplies:=trim(adoquery1.FieldValues['��Ӧ��'])+','+surplyer;
              adoquery1.Edit;
              adoquery1.FieldValues['��Ӧ��']:=surplies;
              adoquery1.Post;
     end
     else
     showmessage('��ҹ�Ӧ���ѱ����ϣ���������');



end;
procedure Tchengrenliaohaofm.SpeedButton1Click(Sender: TObject);
var
surplyer:string;
productor:string;
begin
//lookupsurplyerfm.cancel:=true;
if  adoquery1.Active=true then
begin
//lookupsurplyerfm.showmodal;
if  adoquery1.FieldValues['����']<>Null then
 if (trim(adoquery1.FieldValues['����'])='�Ѻ�׼')or(trim(adoquery1.FieldValues['����'])='�����') then
 begin
     showmessage('��ǰ�Ϻ��ѱ���׼����˲����ڱ༭����');
     exit;
 end;
surplyer:='';
productor:='';
printcrsoptionfm.C1.Checked:=true;
printcrsoptionfm.C2.Checked:=true;
printcrsoptionfm.showmodal;
if printcrsoptionfm.cancel=true then
  exit;
surplyer:=trim(printcrsoptionfm.ADOQuery1.FieldValues['���']);
if printcrsoptionfm.C2.Checked=true then
   if printcrsoptionfm.ADOQuery2.Active=true then
      productor:=trim(printcrsoptionfm.ADOQuery2.FieldValues['���']);
if surplyer='' then
   begin
       showmessage('������Ҫѡ��һ�ҹ�Ӧ�̣���           ');
       exit;
   end;
if productor='' then
  begin
     if  application.MessageBox('��������ѡ�����ϵ���������        ','FALCON ERP ��ʾ',mb_YESNO+MB_ICONinformation)=id_NO then
         exit;
  end;
try
if surplyer<>'' then
updatesurplyer(adoquery1.FieldValues['�Ϻ�'],surplyer);
if productor<>'' then
updateproductor(adoquery1.FieldValues['�Ϻ�'],productor);
adoquery1.Edit;

   adoquery1.FieldValues['����']:='�ѳ���';
adoquery1.Post;
except
    showmessage('�����Ϻſ�ʱ���ֹ��ϣ��������������Ƿ�����������');
end;
end;
end;

procedure getliaohaogg(liaohao,gg:string;var lh,g:string);
var
i:integer;

begin
    lh:='';
    g:='';
     for i:=1 to 12 do
       begin
          if i=10 then
          begin
            lh:=lh+'-';
            continue;
          end;
          if liaohao[i] in ['0'..'9','A'..'Z','a'..'z'] then
             lh:=lh+liaohao[i]
          else lh:=lh+'*';
       end;
     for i:=1 to 20 do
     begin
         if (gg[i]=' ') then
             break;
         if (gg[i]='  ') then
             break;
         g:=g+gg[i];
     end;
end;
procedure Tchengrenliaohaofm.printClick(Sender: TObject);
var
excelfilename:string;
surplyer,tel,conp,productor,gg,lh,llhh:string;

begin
if  adoquery1.Active=true then
begin
//lookupsurplyerfm.showmodal;
//surplyer:=lookupsurplyerfm.surplyer;

printcrsoptionfm.showmodal;
if printcrsoptionfm.cancel=true then
   exit;
if printcrsoptionfm.C1.Checked=true then
begin
if printcrsoptionfm.ADOQuery1.FieldValues['�칫�绰']<>Null then
tel:=printcrsoptionfm.ADOQuery1.FieldValues['�칫�绰']
else
   tel:='';
if printcrsoptionfm.ADOQuery1.FieldValues['������']<>Null then
conp:=printcrsoptionfm.ADOQuery1.FieldValues['������']
else
   conp:='';
surplyer:=printcrsoptionfm.ADOQuery1.FieldValues['���'];
end;

if printcrsoptionfm.C2.Checked=true then
begin
productor:=printcrsoptionfm.ADOQuery2.FieldValues['���'];
end;

if printcrsoptionfm.R1.Checked=true then
begin
if adoquery1.FieldValues['�Ϻ�']<>'' then
begin
 excelfilename:=ExtractFilePath(Application.Exename)+'ECR\judagebook.xls';
 if not fileexists(excelfilename) then
    begin
       application.MessageBox('ECN���嶪ʧ����                  ','����',mb_ok+MB_ICONinformation);
       exit;
    end;
 try
 outexcelfm.createExcelbyfile(excelfilename);
 except
 exit;
 end;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,2]:=adoquery1.FieldValues['�Ϻ�'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,2]:=adoquery1.FieldValues['���˵��'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,5]:=adoquery1.FieldValues['ʹ�û���'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,5]:=productor;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[7,2]:=surplyer;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[7,5]:=tel;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[8,5]:=conp;

 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[8,2]:=adoquery1.FieldValues['�����Ϻ�'];
 outexcelfm.ShowModal;
 end;
 end;       //r1
if printcrsoptionfm.R2.Checked=true then
begin
if adoquery1.FieldValues['�Ϻ�']<>'' then
begin
 excelfilename:=ExtractFilePath(Application.Exename)+'ECR\judagebook.xls';
 if not fileexists(excelfilename) then
    begin
       application.MessageBox('ECN���嶪ʧ����                  ','����',mb_ok+MB_ICONinformation);
       exit;
    end;
 try
 outexcelfm.createExcelbyfile(excelfilename);
 except
 exit;
 end;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[5,2]:=adoquery1.FieldValues['�Ϻ�'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[6,2]:=adoquery1.FieldValues['���˵��'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[5,5]:=adoquery1.FieldValues['ʹ�û���'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[6,5]:=productor;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[7,2]:=surplyer;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[7,5]:=tel;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[8,5]:=conp;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[8,2]:=adoquery1.FieldValues['�����Ϻ�'];
 outexcelfm.ShowModal;
 end;
    end;  //r2
if printcrsoptionfm.R3.Checked=true then
begin
      if adoquery1.FieldValues['�Ϻ�']<>'' then
begin
 excelfilename:=ExtractFilePath(Application.Exename)+'ECR\judagebook.xls';
 if not fileexists(excelfilename) then
    begin
       application.MessageBox('ECN���嶪ʧ����                  ','����',mb_ok+MB_ICONinformation);
       exit;
    end;
 try
 outexcelfm.createExcelbyfile(excelfilename);
 except
 exit;
 end;
 llhh:=trim(edit1.Text);
 getliaohaogg(llhh,trim(adoquery1.FieldValues['���˵��']),lh,gg);
  outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,2]:='';
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,2]:=lh;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,2]:=gg;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,5]:=adoquery1.FieldValues['ʹ�û���'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[6,5]:=productor;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[7,2]:=surplyer;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[7,5]:=tel;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[8,5]:=conp;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[8,2]:=adoquery1.FieldValues['�����Ϻ�'];
 outexcelfm.ShowModal;
 end;
end;  //r3
 end;  //adoquery1 true
end;

procedure Tchengrenliaohaofm.N4Click(Sender: TObject);
var
excelfilename:string;
surplyer:string;
begin
if  adoquery1.Active=true then
begin
lookupsurplyerfm.showmodal;
surplyer:=lookupsurplyerfm.surplyer;

if adoquery1.FieldValues['�Ϻ�']<>'' then
begin
 excelfilename:=ExtractFilePath(Application.Exename)+'ECR\judagebook.xls';
 if not fileexists(excelfilename) then
    begin
       application.MessageBox('ECN���嶪ʧ����                  ','����',mb_ok+MB_ICONinformation);
       exit;
    end;
 try
 outexcelfm.createExcelbyfile(excelfilename);
 except
 exit;
 end;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[5,2]:=adoquery1.FieldValues['�Ϻ�'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[6,2]:=adoquery1.FieldValues['���˵��'];
 //outexcelfm.OleC.OleObject.application.workbooks[1].sheets[1].cells[5,5]:=adoquery1.FieldValues['ʹ�û���'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[6,5]:=adoquery1.FieldValues['������'];
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[7,2]:=surplyer;
 outexcelfm.OleC.OleObject.application.workbooks[1].sheets[2].cells[8,2]:=adoquery1.FieldValues['�����Ϻ�'];
 outexcelfm.ShowModal;
 end;
 end;
end;

procedure Tchengrenliaohaofm.SpeedButton5Click(Sender: TObject);
begin
QuickReport2.QRDBText1.DataSet:=adoquery1;
QuickReport2.QRDBText2.DataSet:=adoquery1;
QuickReport2.QRDBText3.DataSet:=adoquery1;
QuickReport2.QRDBText4.DataSet:=adoquery1;
QuickReport2.QRDBText5.DataSet:=adoquery1;
QuickReport2.QRDBText6.DataSet:=adoquery1;
QuickReport2.DataSet:=adoquery1;
QuickReport2.user.Caption:=userrealname;

QuickReport2.Preview;

end;

procedure Tchengrenliaohaofm.Edit1KeyPress(Sender: TObject; var Key: Char);
var
str:string;
i:integer;
begin
str:=edit1.Text;
for i:=1 to length(str) do
begin
    if str[i]='*' then
       str[i]:='%' ;
end;
    if key =#13 then
       begin
          adoquery1.Close;
          adoquery1.SQL.Clear;
          adoquery1.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+trim(str)+'%'+'''');
          adoquery1.Open;
          MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
       end;
end;

procedure Tchengrenliaohaofm.Edit3KeyPress(Sender: TObject; var Key: Char);
var
str:string;
i:integer;
begin
str:=edit1.Text;
for i:=1 to length(str) do
begin
    if str[i]='*' then
       str[i]:='%' ;
end;
    if key =#13 then
       begin
       if trim(edit1.Text)<>'' then
       begin
          adoquery1.Close;
          adoquery1.SQL.Clear;
          adoquery1.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+trim(edit1.Text)+'%'+''''+' and ���˵�� like '+''''+'%'+trim(edit3.Text)+'%'+'''');
          adoquery1.Open;
          MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
       end
       else
       begin
          adoquery1.Close;
          adoquery1.SQL.Clear;
          adoquery1.SQL.Add('select * from lingjianliaohao where ���˵�� like '+''''+'%'+trim(edit3.Text)+'%'+'''');
          adoquery1.Open;
          MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
       end;
       end;
end;

procedure Tchengrenliaohaofm.SpeedButton4Click(Sender: TObject);
begin

if adoquery1.Active=true then
begin
if adoquery1.FieldValues['�Ϻ�']<>'' then
begin
     // uploadfm.Edit2.Text:=adoquery1.FieldValues['�Ϻ�']+'_'+ExtractFileName(edit1.Text);
      uploadfm.liaohao:=adoquery1.FieldValues['�Ϻ�'];
      uploadfm.showmodal;
      if uploadfm.cancel=false then
         begin
             adoquery1.Edit;
             adoquery1.FieldValues['�����']:=uploadfm.filename;
             adoquery1.Post;
         end;
end;
end;

end;

procedure Tchengrenliaohaofm.SpeedButton7Click(Sender: TObject);
var
surplyer:string;
productor:string;
i:integer;
begin
//lookupsurplyerfm.cancel:=true;
if  adoquery1.Active=true then
begin
//lookupsurplyerfm.showmodal;
surplyer:='';
productor:='';
printcrsoptionfm.C1.Checked:=true;
printcrsoptionfm.C2.Checked:=true;
printcrsoptionfm.showmodal;
if printcrsoptionfm.cancel=true then
  exit;
surplyer:=trim(printcrsoptionfm.ADOQuery1.FieldValues['���']);
if printcrsoptionfm.C2.Checked=true then
   if printcrsoptionfm.ADOQuery2.Active=true then
      productor:=trim(printcrsoptionfm.ADOQuery2.FieldValues['���']);
if surplyer='' then
   begin
       showmessage('������Ҫѡ��һ�ҹ�Ӧ�̣���           ');
       exit;
   end;
if productor='' then
  begin
     if  application.MessageBox('��������ѡ�����ϵ���������        ','FALCON ERP ��ʾ',mb_YESNO+MB_ICONinformation)=id_NO then
         exit;
  end;
try
adoquery1.First;
if surplyer<>'' then
for i:=0 to adoquery1.RecordCount-1 do
begin
updatesurplyer(adoquery1.FieldValues['�Ϻ�'],surplyer);
adoquery1.Next;
end;
adoquery1.First;
if productor<>'' then
for i:=0 to adoquery1.RecordCount-1 do
begin
updateproductor(adoquery1.FieldValues['�Ϻ�'],productor);
adoquery1.Next;
end;
adoquery1.First;
for i:=0 to adoquery1.RecordCount-1 do
begin
adoquery1.Edit;
if  adoquery1.FieldValues['����']<>Null then
 if (trim(adoquery1.FieldValues['����'])='�Ѻ�׼')or(trim(adoquery1.FieldValues['����'])='�����') then
 begin
   adoquery1.Next;
   continue;
 end;
adoquery1.FieldValues['����']:='�ѳ���';
adoquery1.Post;
adoquery1.Next;
end;
except
    showmessage('�����Ϻſ�ʱ���ֹ��ϣ��������������Ƿ�����������');
end;
end;
end;

end.
