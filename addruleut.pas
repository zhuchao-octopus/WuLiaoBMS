unit addruleut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls;

type
  Taddrulefm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    ADOTable1: TADOTable;
    ad: TADOQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  addrulefm: Taddrulefm;
  filename:string;
implementation
        uses dmut;
{$R *.dfm}

procedure Taddrulefm.Button2Click(Sender: TObject);
begin
close;
end;

procedure Taddrulefm.Button1Click(Sender: TObject);
//var
//i:integer;
//memostr:string;
begin
if (trim(edit2.Text)='')or(edit1.Text='') then
begin
      application.MessageBox('  至少有一项不应该为空的为空值！！！！！！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
      abort;
end;
ad.Close;
ad.SQL.Clear;
ad.SQL.Add('select * from numberrule where 大类='+''''+edit1.Text+'''');
ad.Open;
if ad.RecordCount>=1 then
begin
    application.MessageBox('  此规则已存在，请查询是否被确认！！！！！！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);
      abort;
end;

with adotable1 do
     begin
         close;
         open;
         append;
         adotable1.FieldValues['大类']:=edit1.Text;
         adotable1.FieldValues['品名']:=edit2.Text;
         adotable1.FieldValues['规则定义']:=memo1.Text;
         // for i:=0 to  memo1.Lines.Count do
        //  begin
              //        memostr:=memostr+memo1.Lines.Strings[i];
               //       adotable1.FieldValues['规则定义']:=memostr;


         // end;
          adotable1.Post;
        //  memo1.Lines.SaveToFile('material\'+filename+'.txt');
           application.MessageBox('  规则创建成功！！！！！！                 ','FALCON ERP 提示',mb_ok+MB_ICONinformation);

     end;





end;

procedure Taddrulefm.Edit1Change(Sender: TObject);
begin
if length(edit1.Text)=2 then
   filename:=edit1.Text;
end;

end.
