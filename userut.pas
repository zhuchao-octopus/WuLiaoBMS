unit userut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ImgList, ExtCtrls,
  DBCtrls, DB, ADODB, CheckLst;

type
  Tuserfm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label13: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit13: TEdit;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    ComboBox1: TComboBox;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    ADOQuery2: TADOQuery;
    TabSheet2: TTabSheet;
    Edit3: TEdit;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    ch: TCheckListBox;
    Label5: TLabel;
    Label6: TLabel;
    cb: TComboBox;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    AD: TADOQuery;
    ATg: TADOTable;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure cbChange(Sender: TObject);
    procedure getuserp();
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure updatecb();
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure updatecombobox();
    procedure ADOQuery1BeforePost(DataSet: TDataSet);
    procedure updatelist();
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  userfm: Tuserfm;
  juese:integer;
implementation
        uses dmut,glbut, gpnameut;
{$R *.dfm}

procedure Tuserfm.updatelist();
var
 i:integer;
begin
      atg.Close;
      atg.Open;
      atg.First;
     // dbgrid1.Columns.Items[2].PickList
      dbgrid1.Columns.Items[2].PickList.clear;
      for  i:=0 to atg.RecordCount-1 do
         begin
            dbgrid1.Columns.Items[2].PickList.Add(atg.FieldValues['??????']);
             atg.Next;
         end;
end;
procedure Tuserfm.updatecombobox();
var
 i:integer;
begin
      atg.Close;
      atg.Open;
      atg.First;
      combobox1.Clear;
      for  i:=0 to atg.RecordCount-1 do
         begin
             combobox1.Items.Add(atg.FieldValues['??????']);
             atg.Next;
         end;
end;

procedure Tuserfm.updatecb();
var
 i:integer;
begin
      atg.Close;
      atg.Open;
      atg.First;
      cb.Clear;
      for  i:=0 to atg.RecordCount-1 do
         begin
             cb.Items.Add(atg.FieldValues['??????']);
             atg.Next;
         end;
end;

procedure Tuserfm.getuserp();
begin
   if  ad.FieldValues['????????']=true then
        ch.Checked[0]:=true
        else ch.Checked[0]:=false;
   if  ad.FieldValues['????BOM']=true then
        ch.Checked[1]:=true
        else ch.Checked[1]:=false;
   if  ad.FieldValues['????????']=true then
        ch.Checked[2]:=true
        else ch.Checked[2]:=false;
   if  ad.FieldValues['????BOM']=true then
        ch.Checked[3]:=true
        else ch.Checked[3]:=false;
   if  ad.FieldValues['????????']=true then
        ch.Checked[4]:=true
        else ch.Checked[4]:=false;
   if  ad.FieldValues['????BOM']=true then
        ch.Checked[5]:=true
        else ch.Checked[5]:=false;
   if  ad.FieldValues['????????']=true then
        ch.Checked[6]:=true
        else ch.Checked[6]:=false;
   if  ad.FieldValues['????BOM']=true then
        ch.Checked[7]:=true
        else ch.Checked[7]:=false;
   if  ad.FieldValues['????????']=true then
        ch.Checked[8]:=true
        else ch.Checked[8]:=false;
   if  ad.FieldValues['????BOM']=true then
        ch.Checked[9]:=true
        else ch.Checked[9]:=false;
   if  ad.FieldValues['????????']=true then
        ch.Checked[10]:=true
        else ch.Checked[10]:=false;
   if  ad.FieldValues['????????']=true then
        ch.Checked[11]:=true
        else ch.Checked[11]:=false;
   if  ad.FieldValues['????????']=true then
        ch.Checked[12]:=true
        else ch.Checked[12]:=false;
   if  ad.FieldValues['????????']=true then
        ch.Checked[13]:=true
        else ch.Checked[13]:=false;
   if  ad.FieldValues['????ECR']=true then
        ch.Checked[14]:=true
        else ch.Checked[14]:=false;
   if  ad.FieldValues['????ECR']=true then
        ch.Checked[15]:=true
        else ch.Checked[15]:=false;
   if  ad.FieldValues['????ECR']=true then
        ch.Checked[16]:=true
        else ch.Checked[16]:=false;

   if  ad.FieldValues['??????????']=true then
        ch.Checked[17]:=true
        else ch.Checked[17]:=false;
   if  ad.FieldValues['??????????']=true then
        ch.Checked[18]:=true
        else ch.Checked[18]:=false;
   if  ad.FieldValues['??????????']=true then
        ch.Checked[19]:=true
        else ch.Checked[19]:=false;
   if  ad.FieldValues['??????????']=true then
        ch.Checked[20]:=true
        else ch.Checked[20]:=false;

  if  ad.FieldValues['????????']=true then
        ch.Checked[21]:=true
        else ch.Checked[21]:=false;
  if  ad.FieldValues['????????']=true then
        ch.Checked[22]:=true
        else ch.Checked[22]:=false;
  if  ad.FieldValues['BOM????']=true then
        ch.Checked[23]:=true
        else ch.Checked[23]:=false;
  if  ad.FieldValues['????BOM']=true then
        ch.Checked[24]:=true
        else ch.Checked[24]:=false;
end;
///????????
//????BOM
//????????
//????BOM
//????????
//????BOM
//????????
//????BOM
//????????
//????BOM
//????????
//????ECR
//????ECR
//????ECR
//??????????
//??????????
//??????????
//??????????
//????????
//????????
//BOM????
//????BOM
procedure Tuserfm.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tuserfm.FormActivate(Sender: TObject);
begin
adoquery1.Active:=true;
 MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
end;

procedure Tuserfm.SpeedButton2Click(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
edit13.Clear;
end;

procedure Tuserfm.SpeedButton1Click(Sender: TObject);
var
count:integer;
sqlstr:string;
begin
sqlstr:='select * from users where ??????='+''''+trim(edit1.Text)+'''' ;
with adoquery2 do
    begin
         close;
         sql.Clear;
         sql.Add(sqlstr);
         open;
         count:=recordcount;
     end;
     if count>=1 then
     begin
           application.MessageBox('  ??????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
           abort;
     end;
     if (edit1.Text='')or(edit13.Text='')or(edit2.Text='') then
       begin
           application.MessageBox('  ????????????????????????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
           abort;
       end;


    try
    adotable1.Close;
    adotable1.Open;
    adotable1.Append;
    adotable1.FieldValues['??????']:=edit1.Text;
    adotable1.FieldValues['????']:=edit2.Text;
    adotable1.FieldValues['????']:=juese;
    adotable1.FieldValues['??????']:=combobox1.Text;
    adotable1.FieldValues['????']:=edit13.Text;

     adotable1.Post;
                  application.MessageBox('  ??????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
     except
           application.MessageBox('  ??????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
     end;


end;

procedure Tuserfm.ComboBox1Change(Sender: TObject);
begin
{if combobox1.Text='????????'  then
begin
   juese:=1;
    abort;
end;
if combobox1.Text='??????' then
begin
     juese:=2;
     abort;
end;
if combobox1.Text='????' then
   begin
       juese:=3;
       abort;
   end;
if combobox1.Text='????' then
   begin
       juese:=4;
       abort;
   end;
if combobox1.Text='??????????' then
   begin
       juese:=0;
       abort;
   end
   else
      juese:=1;     }
end;

procedure Tuserfm.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  sqlstr:string;
begin
sqlstr:='select  ????,??????,????,??????,???? from users where ?????? like '+''''+'%'+trim(edit1.Text)+'%'+'''';

if key=#13 then
   begin
       with adoquery1 do
    begin
         close;
         sql.Clear;
         sql.Add(sqlstr);
         open;
        // count:=recordcount;
     end;
    // if count>=1 then
    // begin
     //      application.MessageBox('  ??????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
    // end;
   end;
end;

procedure Tuserfm.SpeedButton3Click(Sender: TObject);
begin
 if (trim(edit3.Text)='') then
       begin
           application.MessageBox('  ????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
           abort;
       end;
 try
 atg.Close;
 atg.Open;
 atg.Append;
 atg.FieldValues['??????']:=trim(edit3.Text);
 atg.Post;
 application.MessageBox('  ??????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
 updatecb();
 except
     application.MessageBox('  ??????????????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);

 end;
  //  cb.Items.Append(trim(edit1.Text));   //.AddObject(edit1.Text,tobject(edit1.Text));//
   // cb.Update;
 //  cb.Items.Add('sss') ;



end;

procedure Tuserfm.SpeedButton5Click(Sender: TObject);
var
sqlstr:string;
begin
 if (cb.Text='') then
      begin
           application.MessageBox('  ????????????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
           abort;
       end;
  if (trim(cb.Text)='????????') then
      begin
           application.MessageBox('  ??????????????????????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
           abort;
       end;
 if application.MessageBox('  ??????????????????????????????????????????????????????????                 ','FALCON ERP ????',mb_okcancel+MB_ICONinformation)<>ID_OK  then
           abort;


      sqlstr:='delete  from userp where ??????= '+'''' + trim(cb.Text)+'''';
      ad.Close;
      ad.SQL.Clear;
      ad.SQL.Add(sqlstr);
      ad.ExecSQL;
      updatecb();
     // cb.DeleteSelected;//dexOf(cb.Text)
     // cb.Update;
       
end;

procedure Tuserfm.cbChange(Sender: TObject);
var
  sqlstr:string;
begin
sqlstr:='select  * from userp where ??????='+''''+trim(cb.Text)+'''';


       with ad do
    begin
         close;
         sql.Clear;
         sql.Add(sqlstr);
         open;
        // count:=recordcount;
     end;
     getuserp();
    // if count>=1 then
    // begin
     //      application.MessageBox('  ??????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
    // end;

end;

procedure Tuserfm.Button1Click(Sender: TObject);
begin
ch.Checked[2]:=true;
//ch.Update;
end;

procedure Tuserfm.SpeedButton4Click(Sender: TObject);
var
sqlstr:string;
begin
    //sqlstr:='update userp set ????='   +ps+   ' where ??????='+'''' + trim(cb.Text)+'''';
      sqlstr:='select * from userp where ??????= '+'''' + trim(cb.Text)+'''';
      ad.Close;
      ad.SQL.Clear;
      ad.SQL.Add(sqlstr);
      try
      ad.Open;
      ad.Edit;
      if ch.Checked[0]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
      if ch.Checked[1]=true then
         ad.FieldValues['????BOM']:=true
         else
            ad.FieldValues['????BOM']:=false;
      if ch.Checked[2]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
      if ch.Checked[3]=true then
         ad.FieldValues['????BOM']:=true
         else
            ad.FieldValues['????BOM']:=false;
      if ch.Checked[4]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
      if ch.Checked[5]=true then
         ad.FieldValues['????BOM']:=true
         else
            ad.FieldValues['????BOM']:=false;
      if ch.Checked[6]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
      if ch.Checked[7]=true then
         ad.FieldValues['????BOM']:=true
         else
            ad.FieldValues['????BOM']:=false;
      if ch.Checked[8]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
      if ch.Checked[9]=true then
         ad.FieldValues['????BOM']:=true
         else
            ad.FieldValues['????BOM']:=false;
      if ch.Checked[10]=true then
         ad.FieldValues['????????']:=true
         else
           begin
             if cb.Text='????????' then
               ad.FieldValues['????????']:=true
               else ad.FieldValues['????????']:=false;
           end;
      if ch.Checked[11]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;

      if ch.Checked[12]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
      if ch.Checked[13]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
       if ch.Checked[14]=true then
         ad.FieldValues['????ECR']:=true
         else
            ad.FieldValues['????ECR']:=false;
        if ch.Checked[15]=true then
         ad.FieldValues['????ECR']:=true
         else
            ad.FieldValues['????ECR']:=false;
        if ch.Checked[16]=true then
         ad.FieldValues['????ECR']:=true
         else
            ad.FieldValues['????ECR']:=false;
            
        if ch.Checked[17]=true then
         ad.FieldValues['??????????']:=true
         else
            ad.FieldValues['??????????']:=false;
        if ch.Checked[18]=true then
         ad.FieldValues['??????????']:=true
         else
            ad.FieldValues['??????????']:=false;
        if ch.Checked[19]=true then
         ad.FieldValues['??????????']:=true
         else
            ad.FieldValues['??????????']:=false;
        if ch.Checked[20]=true then
         ad.FieldValues['??????????']:=true
         else
            ad.FieldValues['??????????']:=false;

         if ch.Checked[21]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
          if ch.Checked[22]=true then
         ad.FieldValues['????????']:=true
         else
            ad.FieldValues['????????']:=false;
        if ch.Checked[23]=true then
         ad.FieldValues['BOM????']:=true
         else
            ad.FieldValues['BOM????']:=false;
        if ch.Checked[24]=true then
         ad.FieldValues['????BOM']:=true
         else
            ad.FieldValues['????BOM']:=false;

     ad.Post;
     application.MessageBox('??????????????????????????????????????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);

      except
           application.MessageBox('  ??????????????????????????????????????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);

      end;
end;
 //????????
//????BOM
//????????
//????BOM
//????????
//????BOM
//????????
//????BOM
//????????
//????BOM
//????????
//????ECR
//????ECR
//????ECR
//??????????
//??????????
//??????????
//??????????
//????????
//????????
//BOM????
//????BOM
procedure Tuserfm.TabSheet2Show(Sender: TObject);
begin
updatecb();
end;

procedure Tuserfm.TabSheet1Show(Sender: TObject);
begin
updatecombobox();
updatelist();
end;

procedure Tuserfm.ADOQuery1BeforePost(DataSet: TDataSet);
var
yo:string;
sqlstr:string;
begin
yo:=adoquery1.FieldValues['??????'];
sqlstr:='select * from userp where ??????='+''''+yo+'''';

adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add(sqlstr);
adoquery2.Open;
if adoquery2.RecordCount<1 then
begin
    application.MessageBox('  ????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
     adoquery1.Cancel;
end;
end;
procedure Tuserfm.SpeedButton6Click(Sender: TObject);
begin

if (trim(cb.Text)='') then
       begin
           application.MessageBox('  ??????????,??????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
           abort;
       end;

     if (trim(cb.Text)='????????') then
      begin
           application.MessageBox('  ????????????????????????????????????                 ','FALCON ERP ????',mb_ok+MB_ICONinformation);
           abort;
       end;

gpfm.showmodal;
end;

procedure Tuserfm.SpeedButton7Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select ????,??????,??????,???? from users');
adoquery1.Open;
end;

end.
// ????????
//??????
//????
//????
//??????????


