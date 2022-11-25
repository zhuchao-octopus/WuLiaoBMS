unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs, ExtCtrls, StdCtrls, ComCtrls, Buttons,ADODB;

type
  TForm11 = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    Edit3: TEdit;
    Label9: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  //  procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
//  comstr:string;
  excelflag:boolean;
implementation
     
uses  importut;

{$R *.dfm}
procedure snapole(ole:boolean);
begin
    if ole=false then
     begin
      importfm.OleContainer1.Visible:=false;
      importfm.DBGrid1.Visible:=true;
      importfm.Panel3.Visible:=true;
      end
     else
        begin
           importfm.OleContainer1.Visible:=true;
           importfm.DBGrid1.Visible:=false;
           importfm.Panel3.Visible:=false;
           importfm.OleContainer1.Align:=alclient;
        end;
end;
procedure TForm11.SpeedButton1Click(Sender: TObject);
var
i:integer;
ds :tadotable;
begin
//form11.Cursor:=crhourglass;
speedbutton2.Enabled:=false;

{if combobox1.Text='bomlist' then
   begin
      // settable('bomlist');
      // settitle('BOM �ļ��嵥�����');
         comstr:='bomlist';
        ds:=importfm.adotable4;
         importfm.DataSource1.DataSet:=ds;
         ds.TableName:='bomlist';
        ds.Open;
      /// snapole(false);

       importfm.ADOTable4.First;
       importfm.Refresh;
       for  i:=0 to importfm.ADOTable4.RecordCount-1 do
          begin
              // importfm.setedit();
               importfm.ADOTable4.Edit;
               importfm.ADOTable4.Delete;
          end;
   end

   else          }

   ds:=importfm.adotable1;





if (edit1.Text='')or(edit2.Text='') then
    begin
     application.MessageBox('������һ������Ϊ��ֵ!','�����������',mb_ok+MB_ICONSTOP);
     abort;
     end;
//if (excelflag=true) then
begin
     try
     importfm.insettodatabase(strtoint(edit1.Text),strtoint(edit3.Text),strtoint(edit2.Text),'lingjianliaohao',ds);
     form11.Cursor:=crdefault;
     application.MessageBox('�����ѳɹ��������ݿ⣡����                         ','����ɹ�',mb_ok+MB_ICONinformation);
     speedbutton2.Enabled:=true;
     // close;
     except
       application.MessageBox('�������ݱ�ʱ���ִ���������������Ƿ���ȷ,EXCEL�Ƿ��ڼ���״̬,�Ƿ����������ͻ��','�������ݴ���',mb_ok+MB_ICONSTOP);
       speedbutton2.Enabled:=true;
     end;
 end;
 // else
   //   application.MessageBox('û�����ݶ���ɹ����룬���һ��EXCEL�ļ���','�������ݴ���',mb_ok+MB_ICONSTOP);


    speedbutton2.Enabled:=true;

     end;






procedure TForm11.SpeedButton2Click(Sender: TObject);
begin
close;
   form11.ProgressBar1.Position:=0;
   form11.ProgressBar2.Position:=0;
//progressbar1.Stepby(1);
end;

{procedure TForm11.ComboBox1Change(Sender: TObject);
begin
        if combobox1.Text='��������Ϻű�' then
        comstr:='lingjianliaohao'
        else if combobox1.Text='���Ʒ�Ϻű�'then
        comstr:='banchengpinliaohao'
        else if combobox1.Text='��Ʒ�Ϻű�' then
        comstr:='chengpinliaohao' 
        else 
        comstr:='bomlist';
end;  }

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form11.ProgressBar1.Position:=0;
   form11.ProgressBar2.Position:=0;
end;

procedure TForm11.Edit3Change(Sender: TObject);
begin
form11.ProgressBar1.Position:=0;
   form11.ProgressBar2.Position:=0;
end;

procedure TForm11.Edit1Change(Sender: TObject);
begin
form11.ProgressBar1.Position:=0;
 //  form11.ProgressBar2.Position:=0;
end;

procedure TForm11.Edit2Change(Sender: TObject);
begin
form11.ProgressBar1.Position:=0;
   form11.ProgressBar2.Position:=0;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
SetWindowPos(handle, HWND_TOPMOST,
Left, Top, Width, Height,0);
end;

procedure TForm11.FormActivate(Sender: TObject);
begin
SetWindowPos(handle, HWND_TOPMOST,
Left, Top, Width, Height,0);
end;

end.
