unit surplyer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB;

type
  Tsurplyerfm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Button3: TButton;
    Button4: TButton;
    Panel1: TPanel;
    AD: TADOTable;
    AQ: TADOQuery;
    Label7: TLabel;
    Edit7: TEdit;
    Memo1: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  surplyerfm: Tsurplyerfm;

implementation
     uses dmut;
{$R *.dfm}

procedure Tsurplyerfm.Button4Click(Sender: TObject);
begin
close;
end;

procedure Tsurplyerfm.Button3Click(Sender: TObject);
begin
  if edit1.Text='' then
      begin
          application.MessageBox('你至少要为供应商指定一个简称！！！','提示！',mb_ok+Mb_iconinformation);
          abort;
      end;
      aq.Close;
      aq.SQL.Clear;
      aq.SQL.Add('select * from surplyer where 简称='+''''+edit1.Text+'''');
      aq.Open;
  if aq.RecordCount>=1 then
      begin
          application.MessageBox('此供应商已存在！！！','提示！',mb_ok+Mb_iconinformation);
          abort;
      end;
      try
   ad.Close;
   ad.Open;
   ad.Append;
   ad.FieldValues['简称']:=edit1.Text;
   ad.FieldValues['联络人']:=edit2.Text;
   ad.FieldValues['全名']:=edit3.Text;
   ad.FieldValues['办公电话']:=edit4.Text;
   ad.FieldValues['传真']:=edit5.Text;
   ad.FieldValues['地址']:=edit6.Text;
   ad.FieldValues['性质']:=edit7.Text;
   ad.FieldValues['备注']:=memo1.Lines.Text;
   ad.Post;
   application.MessageBox('申请供应商成功！！！','提示！',mb_ok+Mb_iconinformation);
   ad.Close;
   edit1.Clear;
   edit2.Clear;
   edit3.Clear;
   edit4.Clear;
   edit5.Clear;
   edit6.Clear;
   edit7.Clear;
   memo1.Clear;
   except
       application.MessageBox('申请失败！！！','提示！',mb_ok+Mb_iconinformation);
       ad.Close;
       edit1.Clear;
   edit2.Clear;
   edit3.Clear;
   edit4.Clear;
   edit5.Clear;
   edit6.Clear;
   edit7.Clear;
   memo1.Clear;
   end;
end;

end.
