unit opendialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, ShellCtrls, ExtCtrls, Buttons;

type
  Topendialogfm = class(TForm)
    ShellComboBox1: TShellComboBox;
    ShellListView1: TShellListView;
    ShellTreeView1: TShellTreeView;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ShellListView1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel:boolean;
  end;

var
  opendialogfm: Topendialogfm;

implementation

{$R *.dfm}

procedure Topendialogfm.Button1Click(Sender: TObject);
begin
cancel:=false;
close;
end;

procedure Topendialogfm.SpeedButton1Click(Sender: TObject);
begin
shelllistview1.Back;
end;

procedure Topendialogfm.Button2Click(Sender: TObject);
begin
cancel:=true;
close;
end;

procedure Topendialogfm.FormActivate(Sender: TObject);
begin
cancel:=true;
end;

procedure Topendialogfm.ShellListView1Click(Sender: TObject);
begin
try
combobox1.text:=shelllistview1.RootFolder.PathName+'\'+shelllistview1.SelectedFolder.DisplayName;
except
end;
end;

end.
