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
          application.MessageBox('������ҪΪ��Ӧ��ָ��һ����ƣ�����','��ʾ��',mb_ok+Mb_iconinformation);
          abort;
      end;
      aq.Close;
      aq.SQL.Clear;
      aq.SQL.Add('select * from surplyer where ���='+''''+edit1.Text+'''');
      aq.Open;
  if aq.RecordCount>=1 then
      begin
          application.MessageBox('�˹�Ӧ���Ѵ��ڣ�����','��ʾ��',mb_ok+Mb_iconinformation);
          abort;
      end;
      try
   ad.Close;
   ad.Open;
   ad.Append;
   ad.FieldValues['���']:=edit1.Text;
   ad.FieldValues['������']:=edit2.Text;
   ad.FieldValues['ȫ��']:=edit3.Text;
   ad.FieldValues['�칫�绰']:=edit4.Text;
   ad.FieldValues['����']:=edit5.Text;
   ad.FieldValues['��ַ']:=edit6.Text;
   ad.FieldValues['����']:=edit7.Text;
   ad.FieldValues['��ע']:=memo1.Lines.Text;
   ad.Post;
   application.MessageBox('���빩Ӧ�̳ɹ�������','��ʾ��',mb_ok+Mb_iconinformation);
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
       application.MessageBox('����ʧ�ܣ�����','��ʾ��',mb_ok+Mb_iconinformation);
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
