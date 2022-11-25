unit checkoptionut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  Tcheckoptionfm = class(TForm)
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    liaohao: TRadioButton;
    shuoming: TRadioButton;
    Button2: TButton;
    c1: TCheckBox;
    c2: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure c2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checkoptionfm: Tcheckoptionfm;

implementation

uses checkut,glbut, lheut;

{$R *.dfm}

procedure Tcheckoptionfm.Button1Click(Sender: TObject);
var
  // fieldnamelist:tstringlist;
  count:integer;
  fieldname :string;
   i,k:integer;
   str:string;

begin
liaock:=false;
desck:=false;
if liaohao.Checked=true then
   liaock:=true
   else
   liaock:=false;
if shuoming.Checked=true then
   desck:=true
   else
   desck:=false;
   //close;
//setedit;

//if tablename='' then
//tablename:=adotable1.TableName;
//if (dbgrid1.Visible<>true)or(adotable1.Active<>true)then
 //  application.MessageBox('没有数据对象可供操作，请打开一个数据表文件!','数据核查错误',mb_ok+MB_ICONSTOP)

//else

   if liaock=true then
      fieldname:='料号';
   if desck=true then
      fieldname:='规格说明';





        begin
               stop:=false;
               lhefm.adoquery1.First;

            // dm.getfieldname(tablename);
              for i:=0 to lhefm.adoquery1.RecordCount-1 do
                  begin
                       if stop=true then
                          begin
                              break;
                          end;                     // adoquery1.Fields.f
                      str:='';
                     // if varisnull(lhefm.adoquery1.FieldValues['规格说明'])=false then
                     if desck=true then
                       begin
                               // str:=stringreplace(lhefm.adoquery1.FieldValues['规格说明'],' ','',[rfReplaceAll]);
                                str:=lhefm.adoquery1.FieldValues['规格说明'];
                                str:=stringreplace(str,'''','',[rfReplaceAll]);
                      end
                      else if liaock=true then
                      begin
                           str:=lhefm.adoquery1.FieldValues['料号'];
                           //lhefm.checkrecord(fieldname,str,count);
                      end;
                      count:=0;
                      if str=NUll then
                      begin
                         str:='';
                          checkfm.ADOQuery1.Edit;
                          checkfm.ADOQuery1.Delete;
                      end;
                      if (str='')or(liaock=true) then
                      lhefm.checkrecord(fieldname,str,count)
                      else
                      lhefm.checkrecords(fieldname,str,count);
                      lhefm.adoquery1.Next;
                      if count>1 then
                      begin
                           if c1.Checked=true then
                            for k:=0 to count-2 do
                               begin
                                   checkfm.ADOQuery1.Edit;
                                   checkfm.ADOQuery1.Delete;
                                  // count:=count-1;
                               end
                            else
                             checkfm.showmodal;

                      end;
                  end;
            close;
           application.MessageBox('任务完成！！！                          ','核查料号',mb_ok+MB_ICONinformation);

        end;








end;

procedure Tcheckoptionfm.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tcheckoptionfm.c1Click(Sender: TObject);
begin
c2.Checked:=false;
//c1.Checked:=true;
if shuoming.Checked=true then
begin
  if application.MessageBox(' 检测规格说明不推荐使用此功能！！！       ','严肃警告',mb_okcancel+MB_ICONinformation)=ID_Cancel then
    begin
     c1.Checked:=false;
     c2.Checked:=true;
    end;
end;
end;

procedure Tcheckoptionfm.c2Click(Sender: TObject);
begin
c1.Checked:=false;
//c2.Checked:=true;
end;

end.
