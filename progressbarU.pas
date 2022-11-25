unit progressbarU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;
const
  WM_DATA = WM_USER + 1024;
type
  TProgressBarFm = class(TForm)
    Panel1: TPanel;
    image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    CanExit:boolean;
  public
    { Public declarations }
    procedure getMsgInfo(var Msg: TMessage); message WM_DATA; {处理WM_DATA}
    procedure countertimer(ii:integer);
     procedure getprogress();
  end;

var
  ProgressBarFm: TProgressBarFm;
  flag:boolean;
  count:dword;
implementation

{$R *.dfm}
 
procedure TProgressBarFm.getMsgInfo(var Msg: TMessage); {处理WM_DATA}
begin
  if msg.LParam=1 then {是我们设定的消息参数}
  begin
     count:=0;
     CanExit:=true;
     close;
  end;
  if msg.LParam=2 then
     begin
     //   self.show;
     if label1.Visible<>true then
         begin
         label1.Visible:=true;
         panel2.Visible:=true;
         panel1.Visible:=true;
         count:=100;
         flag:=false;
         self.Show;
         getprogress();
        end;
     end;
  if msg.LParam=3 then
  begin
     label1.Visible:=false;
     
     CanExit:=false; 
     flag:=true;
    // hide;
  end
  else
    flag:=false;
end;

procedure TProgressBarFm.BitBtn1Click(Sender: TObject);
begin
//  PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 1, 1);
SetWindowPos(ProgressBarFm.handle, HWND_TOPMOST,
ProgressBarFm.Left,ProgressBarFm.Top, ProgressBarFm.Width, ProgressBarFm.Height,0);

end;

procedure TProgressBarFm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if CanExit=true then
   Canclose:=true
else
   canclose:=false;
end;
  procedure wait(ticks:dword);
var
   t:dword;
begin
   t:=gettickcount;
   while gettickcount-t<ticks do
   begin
   application.ProcessMessages;
        
   end;
end;
 procedure TProgressBarFm.getprogress();
var
 i,b:word;
 x,y,dx,dy:real;
 ig:Timage;
begin
  ig:=image1;
  dx:=ig.Width/256;
  dy:=ig.Height;
  y:=0;
  x:=0;

  b:=255;
     ig.Canvas.Brush.Color:=rgb(255,255,255);
     ig.Canvas.FillRect(rect(0,0,ig.Width,ig.Height));
     ig.Update;
  for i:=0 to 255 do
  begin
     if flag=true then
      begin
          exit;
          break;
      end;
     // Form1.Canvas.Brush.Color:=$00000000+i*$100;
     ig.Canvas.Brush.Color:=rgb(i,0,b);
     ig.Canvas.FillRect(rect(round(x),round(y),round(x+dx),round(dy)));
     x:=x+dx;
     b:=b-1;
     wait(count);
  end;
  count:=100;
   wait(count);
 // Canexit:=true;
  close;
end;
procedure TProgressBarFm.countertimer(ii:integer);
var
 i,b:word;
 x,y,dx,dy:real;
 ig:Timage;

begin
  ig:=image1;
  count:=100;
  dx:=ig.Width/256;
  dy:=ig.Height;
  y:=0;
  x:=0;

  b:=255;
  for i:=0 to 255 do
  begin
     ig.Canvas.Brush.Color:=rgb(i,0,b);
     ig.Canvas.FillRect(rect(round(x),round(y),round(x+dx),round(dy)));
     x:=x+dx;
     b:=b-1;
  end;
   dx:=ig.Width/256;
   dy:=ig.Height;
   x:=ig.Width;
   y:=ig.Height;
   for i:=0 to 255 do
  begin
     ig.Canvas.Brush.Color:=rgb(255,255,255);
     ig.Canvas.FillRect(rect(round(x-dx),0,round(x),round(y)));
     x:=x-dx;
      wait(count);
  end;


end;
procedure TProgressBarFm.BitBtn2Click(Sender: TObject);
begin
 PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA,2, 2);
end;

procedure TProgressBarFm.BitBtn3Click(Sender: TObject);
begin
 PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA,1, 1);
end;

procedure TProgressBarFm.FormShow(Sender: TObject);
begin
SetWindowPos(ProgressBarFm.handle, HWND_TOPMOST,
ProgressBarFm.Left,ProgressBarFm.Top, ProgressBarFm.Width, ProgressBarFm.Height,0);

canexit:=false;

end;

procedure TProgressBarFm.Button1Click(Sender: TObject);
begin
SetWindowPos(ProgressBarFm.handle, HWND_TOPMOST,
ProgressBarFm.Left,ProgressBarFm.Top, ProgressBarFm.Width, ProgressBarFm.Height,0);
end;

procedure TProgressBarFm.BitBtn4Click(Sender: TObject);
begin
 PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA,3, 3);
end;

procedure TProgressBarFm.Timer1Timer(Sender: TObject);
begin
self.Hide;
timer1.Enabled:=false;
end;

end.
