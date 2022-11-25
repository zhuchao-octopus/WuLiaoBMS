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
            dbgrid1.Columns.Items[2].PickList.Add(atg.FieldValues['用户组']);
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
             combobox1.Items.Add(atg.FieldValues['用户组']);
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
             cb.Items.Add(atg.FieldValues['用户组']);
             atg.Next;
         end;
end;

procedure Tuserfm.getuserp();
begin
   if  ad.FieldValues['查询料号']=true then
        ch.Checked[0]:=true
        else ch.Checked[0]:=false;
   if  ad.FieldValues['查询BOM']=true then
        ch.Checked[1]:=true
        else ch.Checked[1]:=false;
   if  ad.FieldValues['申请料号']=true then
        ch.Checked[2]:=true
        else ch.Checked[2]:=false;
   if  ad.FieldValues['新建BOM']=true then
        ch.Checked[3]:=true
        else ch.Checked[3]:=false;
   if  ad.FieldValues['编辑料号']=true then
        ch.Checked[4]:=true
        else ch.Checked[4]:=false;
   if  ad.FieldValues['审核BOM']=true then
        ch.Checked[5]:=true
        else ch.Checked[5]:=false;
   if  ad.FieldValues['核准料号']=true then
        ch.Checked[6]:=true
        else ch.Checked[6]:=false;
   if  ad.FieldValues['核准BOM']=true then
        ch.Checked[7]:=true
        else ch.Checked[7]:=false;
   if  ad.FieldValues['导入料号']=true then
        ch.Checked[8]:=true
        else ch.Checked[8]:=false;
   if  ad.FieldValues['导入BOM']=true then
        ch.Checked[9]:=true
        else ch.Checked[9]:=false;
   if  ad.FieldValues['用户管理']=true then
        ch.Checked[10]:=true
        else ch.Checked[10]:=false;
   if  ad.FieldValues['审核料号']=true then
        ch.Checked[11]:=true
        else ch.Checked[11]:=false;
   if  ad.FieldValues['料号承认']=true then
        ch.Checked[12]:=true
        else ch.Checked[12]:=false;
   if  ad.FieldValues['编码规则']=true then
        ch.Checked[13]:=true
        else ch.Checked[13]:=false;
   if  ad.FieldValues['兴建ECR']=true then
        ch.Checked[14]:=true
        else ch.Checked[14]:=false;
   if  ad.FieldValues['审核ECR']=true then
        ch.Checked[15]:=true
        else ch.Checked[15]:=false;
   if  ad.FieldValues['核准ECR']=true then
        ch.Checked[16]:=true
        else ch.Checked[16]:=false;

   if  ad.FieldValues['兴建供应商']=true then
        ch.Checked[17]:=true
        else ch.Checked[17]:=false;
   if  ad.FieldValues['审核供应商']=true then
        ch.Checked[18]:=true
        else ch.Checked[18]:=false;
   if  ad.FieldValues['查询供应商']=true then
        ch.Checked[19]:=true
        else ch.Checked[19]:=false;
   if  ad.FieldValues['编辑供应商']=true then
        ch.Checked[20]:=true
        else ch.Checked[20]:=false;

  if  ad.FieldValues['编辑单价']=true then
        ch.Checked[21]:=true
        else ch.Checked[21]:=false;
  if  ad.FieldValues['成本统计']=true then
        ch.Checked[22]:=true
        else ch.Checked[22]:=false;
  if  ad.FieldValues['BOM维护']=true then
        ch.Checked[23]:=true
        else ch.Checked[23]:=false;
  if  ad.FieldValues['制作BOM']=true then
        ch.Checked[24]:=true
        else ch.Checked[24]:=false;
end;
///查询料号
//查询BOM
//申请料号
//新建BOM
//编辑料号
//编辑BOM
//审核料号
//审核BOM
//导入料号
//导入BOM
//用户管理
//兴建ECR
//编辑ECR
//审核ECR
//兴建供应商
//审核供应商
//查询供应商
//编辑供应商
//编辑单价
//成本统计
//BOM维护
//制作BOM
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
sqlstr:='select * from users where 用户名='+''''+trim(edit1.Text)+'''' ;
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
           application.MessageBox('  此用户已存在！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
           abort;
     end;
     if (edit1.Text='')or(edit13.Text='')or(edit2.Text='') then
       begin
           application.MessageBox('  至少有一个项目为空，用户信息不完整！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
           abort;
       end;


    try
    adotable1.Close;
    adotable1.Open;
    adotable1.Append;
    adotable1.FieldValues['用户名']:=edit1.Text;
    adotable1.FieldValues['密码']:=edit2.Text;
    adotable1.FieldValues['角色']:=juese;
    adotable1.FieldValues['用户组']:=combobox1.Text;
    adotable1.FieldValues['姓名']:=edit13.Text;

     adotable1.Post;
                  application.MessageBox('  成功创建一用户！！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
     except
           application.MessageBox('  创建用户失败！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
     end;


end;

procedure Tuserfm.ComboBox1Change(Sender: TObject);
begin
{if combobox1.Text='普通用户'  then
begin
   juese:=1;
    abort;
end;
if combobox1.Text='工程师' then
begin
     juese:=2;
     abort;
end;
if combobox1.Text='文员' then
   begin
       juese:=3;
       abort;
   end;
if combobox1.Text='主管' then
   begin
       juese:=4;
       abort;
   end;
if combobox1.Text='系统管理员' then
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
sqlstr:='select  姓名,用户名,密码,用户组,描述 from users where 用户名 like '+''''+'%'+trim(edit1.Text)+'%'+'''';

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
     //      application.MessageBox('  此用户已存在！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
    // end;
   end;
end;

procedure Tuserfm.SpeedButton3Click(Sender: TObject);
begin
 if (trim(edit3.Text)='') then
       begin
           application.MessageBox('  无效的组名！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
           abort;
       end;
 try
 atg.Close;
 atg.Open;
 atg.Append;
 atg.FieldValues['用户组']:=trim(edit3.Text);
 atg.Post;
 application.MessageBox('  用户创建成功！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
 updatecb();
 except
     application.MessageBox('  服务异常终止，任务失败！！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

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
           application.MessageBox('  请选中一个你要删除的组！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
           abort;
       end;
  if (trim(cb.Text)='系统管理') then
      begin
           application.MessageBox('  你不能删除此组，否则系统无法启动！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
           abort;
       end;
 if application.MessageBox('  删除组将导致该组中的用户权限信息丢失！！，你还要继续吗？？                 ','FALCON ERP 提示',mb_okcancel+MB_ICONinformation)<>ID_OK  then
           abort;


      sqlstr:='delete  from userp where 用户组= '+'''' + trim(cb.Text)+'''';
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
sqlstr:='select  * from userp where 用户组='+''''+trim(cb.Text)+'''';


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
     //      application.MessageBox('  此用户已存在！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
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
    //sqlstr:='update userp set 密码='   +ps+   ' where 用户名='+'''' + trim(cb.Text)+'''';
      sqlstr:='select * from userp where 用户组= '+'''' + trim(cb.Text)+'''';
      ad.Close;
      ad.SQL.Clear;
      ad.SQL.Add(sqlstr);
      try
      ad.Open;
      ad.Edit;
      if ch.Checked[0]=true then
         ad.FieldValues['查询料号']:=true
         else
            ad.FieldValues['查询料号']:=false;
      if ch.Checked[1]=true then
         ad.FieldValues['查询BOM']:=true
         else
            ad.FieldValues['查询BOM']:=false;
      if ch.Checked[2]=true then
         ad.FieldValues['申请料号']:=true
         else
            ad.FieldValues['申请料号']:=false;
      if ch.Checked[3]=true then
         ad.FieldValues['新建BOM']:=true
         else
            ad.FieldValues['新建BOM']:=false;
      if ch.Checked[4]=true then
         ad.FieldValues['编辑料号']:=true
         else
            ad.FieldValues['编辑料号']:=false;
      if ch.Checked[5]=true then
         ad.FieldValues['审核BOM']:=true
         else
            ad.FieldValues['审核BOM']:=false;
      if ch.Checked[6]=true then
         ad.FieldValues['核准料号']:=true
         else
            ad.FieldValues['核准料号']:=false;
      if ch.Checked[7]=true then
         ad.FieldValues['核准BOM']:=true
         else
            ad.FieldValues['核准BOM']:=false;
      if ch.Checked[8]=true then
         ad.FieldValues['导入料号']:=true
         else
            ad.FieldValues['导入料号']:=false;
      if ch.Checked[9]=true then
         ad.FieldValues['导入BOM']:=true
         else
            ad.FieldValues['导入BOM']:=false;
      if ch.Checked[10]=true then
         ad.FieldValues['用户管理']:=true
         else
           begin
             if cb.Text='系统管理' then
               ad.FieldValues['用户管理']:=true
               else ad.FieldValues['用户管理']:=false;
           end;
      if ch.Checked[11]=true then
         ad.FieldValues['审核料号']:=true
         else
            ad.FieldValues['审核料号']:=false;

      if ch.Checked[12]=true then
         ad.FieldValues['料号承认']:=true
         else
            ad.FieldValues['料号承认']:=false;
      if ch.Checked[13]=true then
         ad.FieldValues['编码规则']:=true
         else
            ad.FieldValues['编码规则']:=false;
       if ch.Checked[14]=true then
         ad.FieldValues['兴建ECR']:=true
         else
            ad.FieldValues['兴建ECR']:=false;
        if ch.Checked[15]=true then
         ad.FieldValues['审核ECR']:=true
         else
            ad.FieldValues['审核ECR']:=false;
        if ch.Checked[16]=true then
         ad.FieldValues['核准ECR']:=true
         else
            ad.FieldValues['核准ECR']:=false;
            
        if ch.Checked[17]=true then
         ad.FieldValues['兴建供应商']:=true
         else
            ad.FieldValues['兴建供应商']:=false;
        if ch.Checked[18]=true then
         ad.FieldValues['审核供应商']:=true
         else
            ad.FieldValues['审核供应商']:=false;
        if ch.Checked[19]=true then
         ad.FieldValues['查询供应商']:=true
         else
            ad.FieldValues['查询供应商']:=false;
        if ch.Checked[20]=true then
         ad.FieldValues['编辑供应商']:=true
         else
            ad.FieldValues['编辑供应商']:=false;

         if ch.Checked[21]=true then
         ad.FieldValues['编辑单价']:=true
         else
            ad.FieldValues['编辑单价']:=false;
          if ch.Checked[22]=true then
         ad.FieldValues['成本统计']:=true
         else
            ad.FieldValues['成本统计']:=false;
        if ch.Checked[23]=true then
         ad.FieldValues['BOM维护']:=true
         else
            ad.FieldValues['BOM维护']:=false;
        if ch.Checked[24]=true then
         ad.FieldValues['制作BOM']:=true
         else
            ad.FieldValues['制作BOM']:=false;

     ad.Post;
     application.MessageBox('设置成功完成！！！，重新启动客户系统后设置生效！！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

      except
           application.MessageBox('  服务异常终止或你没有选择要修改用户组，设置失败！！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

      end;
end;
 //查询料号
//查询BOM
//申请料号
//新建BOM
//编辑料号
//编辑BOM
//审核料号
//审核BOM
//导入料号
//导入BOM
//用户管理
//兴建ECR
//编辑ECR
//审核ECR
//兴建供应商
//审核供应商
//查询供应商
//编辑供应商
//编辑单价
//成本统计
//BOM维护
//制作BOM
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
yo:=adoquery1.FieldValues['用户组'];
sqlstr:='select * from userp where 用户组='+''''+yo+'''';

adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add(sqlstr);
adoquery2.Open;
if adoquery2.RecordCount<1 then
begin
    application.MessageBox('  无效的用户组！！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
     adoquery1.Cancel;
end;
end;
procedure Tuserfm.SpeedButton6Click(Sender: TObject);
begin

if (trim(cb.Text)='') then
       begin
           application.MessageBox('  无效的组名,选择一个有效组名！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
           abort;
       end;

     if (trim(cb.Text)='系统管理') then
      begin
           application.MessageBox('  你不能重命名此组，否则系统无法启动！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
           abort;
       end;

gpfm.showmodal;
end;

procedure Tuserfm.SpeedButton7Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select 姓名,用户名,用户组,描述 from users');
adoquery1.Open;
end;

end.
// 普通用户
//工程师
//文员
//主管
//系统管理员


