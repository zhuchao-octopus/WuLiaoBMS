unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, jpeg, Menus, ImgList, ComCtrls, DB,
  ADODB, ScktComp, OleCtrls, SHDocVw, ActnMan, ActnColorMaps,
  XPStyleActnCtrls, ActnList, ToolWin, ActnCtrls, ActnMenus, CustomizeDlg,
  XPMan;

  const 
  ICON_ID=1; 
  //ICON的ID标志 
  MI_ICONEVENT=WM_USER+1; 
  //自定义ICON事件消息
type
  Tmainfm = class(TForm)
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    Panel4: TPanel;
    Panel3: TPanel;
    checkclient: TADOTable;
    client: TADOQuery;
    PopupMenu1: TPopupMenu;
    N9: TMenuItem;
    N12: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    Timer1: TTimer;
    ColorDialog1: TColorDialog;
    Image1: TImage;
    Image5: TImage;
    ActionManager1: TActionManager;
    CustomizeDlg1: TCustomizeDlg;
    XPColorMap1: TXPColorMap;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    XPManifest1: TXPManifest;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Image13: TImage;
    bianmaguize: TSpeedButton;
    querenguize: TSpeedButton;
    shengqingguize: TSpeedButton;
    checkliaohao: TSpeedButton;
    Image3: TImage;
    liaohaoshencha: TSpeedButton;
    Image2: TImage;
    getliaohao: TSpeedButton;
    lookupliaohao: TSpeedButton;
    bjdj: TSpeedButton;
    liaohaochenren: TSpeedButton;
    zzbom: TSpeedButton;
    checkbom: TSpeedButton;
    editbom: TSpeedButton;
    lookupbom: TSpeedButton;
    cbtj: TSpeedButton;
    SpeedButton8: TSpeedButton;
    CHECKECR: TSpeedButton;
    EDITECR: TSpeedButton;
    ECR: TSpeedButton;
    createbom: TSpeedButton;
    addsurplyer: TSpeedButton;
    checksurplyer: TSpeedButton;
    lookupsurplyer: TSpeedButton;
    editsurplyer: TSpeedButton;
    bomwh: TSpeedButton;
    backupsystem: TSpeedButton;
    editliaohao: TSpeedButton;
    importliaohao: TSpeedButton;
    importbom: TSpeedButton;
    manageruser: TSpeedButton;
    Image4: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    procedure SpeedButton5Click(Sender: TObject);
    procedure lookupliaohaoClick(Sender: TObject);
    procedure getliaohaoClick(Sender: TObject);
    procedure editbomClick(Sender: TObject);
    procedure checkliaohaoClick(Sender: TObject);
    procedure editliaohaoClick(Sender: TObject);
    procedure createbomClick(Sender: TObject);
    procedure lookupbomClick(Sender: TObject);
    procedure importliaohaoClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure liaohaoshenchaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure manageruserClick(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BOM5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure liaohaochenrenClick(Sender: TObject);
    procedure bianmaguizeClick(Sender: TObject);
    procedure shengqingguizeClick(Sender: TObject);
    procedure querenguizeClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure checkbomClick(Sender: TObject);
    procedure ECRClick(Sender: TObject);
    procedure EDITECRClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure setcolor(cb: TCustomControlBar);
    procedure importbomClick(Sender: TObject);
    procedure CHECKECRClick(Sender: TObject);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure addsurplyerClick(Sender: TObject);
    procedure editsurplyerClick(Sender: TObject);
    procedure lookupsurplyerClick(Sender: TObject);
    procedure checksurplyerClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure backupsystemClick(Sender: TObject);
    procedure initiclient_logooff(host,ip,version,state:string);
    procedure N18Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N14Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure cbtjClick(Sender: TObject);
    procedure bjdjClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure inituser(usergp:string);
    procedure SpeedButton8Click(Sender: TObject);
    procedure initiclient_logoin(host,ip,version,state:string);
    procedure zzbomClick(Sender: TObject);
    procedure bomwhClick(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure getliaohaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }

     NormalIcon,DisabledIcon:TIcon;
    //正常和失效两种情况下的图标 
    Status:Boolean; 
    //标志"允许使用"还是"禁止使用" 
    procedure InstallIcon;
    procedure ChangeIcon(s:Boolean);
    procedure UnInstallIcon;
    procedure IconOnClick(var message:TMessage); message MI_ICONEVENT;
    procedure initigui();
    procedure FindAddress(s:string);
  //捕捉自定义消息MI_ICONEVENT的过程IconOnClick的声明

  public
    { Public declarations }
  end;
 
  
var
  mainfm: Tmainfm;
  x1,x2,y1,y2,xx,yy:integer;
  scrox,scroy:integer;
implementation

uses luut, lbut, lheut, appendliaohao, createbomut, editbomut,
  checkliaohaout,glut, dengluut, Unit22, userut, changeps, checkappliaout,
  liaohaoshencha, noruleut, importut, bomedit, LOOKUPBOM, bomcheck,
  BOMIMPORT, ECR, checkerc, surplyer, editsurplyer, lookup, checksurplyer,
  setclient,dmut,glbut, getbomliao,shellapi, sta, editprice,
  chengrenliaohao, lookupbomecn, shenchaliaohao, makebom, bomwh;

{$R *.dfm}
procedure TMainFm.FindAddress(s:string);
var
  Flags: OLEVariant;

begin
  Flags := 0;
 // UpdateCombo := True;
 // WebBrowser1.Navigate(WideString(s), Flags, Flags, Flags, Flags);
end;

procedure paintimage(ig:Timage);
var
  i,b:word;
  dy,y:real;
begin
  dy:=ig.Height/256;
  y:=0;
  b:=255;
  for i:=0 to 255 do

  begin
     ig.Canvas.Brush.Color:=rgb(0,0,i);
     ig.Canvas.FillRect(rect(0,Round(y),ig.Width,Round(y+dy)));
     y:=y+dy;
     b:=b-1;
  end;

end;
{ procedure paintimage(ig:Tpanel);
var
  i,b:word;
  dy,y:real;
begin
  dy:=ig.Height/256;
  y:=0;
  b:=255;
  for i:=0 to 255 do

  begin
     ig.Canvas.Brush.Color:=rgb(0,0,i);
     ig.Canvas.FillRect(rect(0,Round(y),ig.Width,Round(y+dy)));
     y:=y+dy;
     b:=b-1;
  end;

end;          }
procedure TMainfm.initigui();
begin
   // getinigp();
    getliaohao.enabled:=ugp.createliaohao;
    lookupliaohao.enabled:=ugp.liaohaolook;
    editliaohao.enabled:=ugp.editliaohao;
    checkliaohao.enabled:=ugp.checkliaohao;
    createbom.enabled:=ugp.createbom;
    lookupbom.enabled:=ugp.bomlook;
    editbom.enabled:=ugp.editbom;
    checkbom.enabled:=ugp.checkbom;
    importliaohao.enabled:=ugp.importliaohao;
    importbom.enabled:=ugp.importbom;
    manageruser.enabled:=ugp.usermanager;
    liaohaoshencha.Enabled:=ugp.liaohaoshencha;
    liaohaochenren.Enabled:=ugp.liaohaochenren;
    bianmaguize.Enabled:=ugp.bianmaguize;
    ECR.Enabled:=ugp.ecr;
    EDITECR.Enabled:=ugp.editecr;
    CHECKECR.Enabled:=ugp.checkecr;
    addsurplyer.Enabled:=ugp.addsurplyer;
    checksurplyer.Enabled:=ugp.checksurplyer;
    lookupsurplyer.Enabled:=ugp.lookupsurplyer;
    editsurplyer.Enabled:=ugp.editsurplyer;
    bjdj.Enabled:=ugp.bjdj;
    cbtj.Enabled:=ugp.cbtj;
    bomwh.Enabled:=ugp.bomwh;
    zzbom.Enabled:=ugp.zzbom;
end;
procedure Tmainfm.inituser(usergp:string);

begin
if debug=true then
   exit;
    denglufm.getinigp(usergp);
    initigui();
   // denglufm.gethost(ip,host);
    
    StatusBar1.Panels.Items[1].Text:= 'USER: '+userrealname;
    StatusBar1.Panels.Items[2].Text:= 'HOST NAME: '+host;
    StatusBar1.Panels.Items[3].Text:= 'LOCAL IP: '+ip;
    StatusBar1.Panels.Items[4].Text:= 'DATE: '+datetimetostr(DATE());
    //Caption:='HME 物料管理系统 当前套帐 '+taozhang;
  //  label1.Caption:='';
   // label1.Caption:='套帐：'+taozhang+'  ';
    StatusBar1.Update;


end;
procedure Tmainfm.ChangeIcon(s:Boolean);
//自定义过程ChangeIcon，改变本程序在指示状态栏的图标 
var 
  IconData:TNotifyIconData;
begin 
  IconData.cbSize:=SizeOf(IconData); 
  IconData.Wnd:=Handle; 
  IconData.uID:=ICON_ID; 
  if s=False then //禁止使用 
  begin 
    IconData.hIcon:=DisabledIcon.Handle; 
    Status:=False; 

  end 
  else //允许使用 
  begin 
    IconData.hIcon:=Normalicon.Handle; 
    Status:=True;

  end; 
  IconData.uFlags:=NIF_ICON; 
  Shell_NotifyIcon(NIM_MODIFY,@IconData); 
end;
procedure Tmainfm.InstallIcon;
//安装图标 
var 
  IconData:TNotifyIconData; 
begin
  NormalIcon:=TIcon.Create;
 
  NormalIcon.LoadFromFile('normal.ico');

  IconData.cbSize:=SizeOf(IconData);
  IconData.Wnd:=Handle;
  IconData.uID:=ICON_ID;
  IconData.uFlags:=NIF_ICON or NIF_MESSAGE or NIF_TIP;
  IconData.uCallBackMessage:=MI_ICONEVENT;
  IconData.hIcon:=NormalIcon.Handle;
  IconData.szTip:='金隼物料管理系统';
  //鼠标悬在状态指示栏对应的图标上时的提示信息 
  Shell_NotifyIcon(NIM_ADD,@IconData);
end;
procedure Tmainfm.IconOnClick(var message:TMessage); 
//处理鼠标在指示状态栏对应的图标上的单击事件 
var 
  p:TPoint; 
begin 
  //如果按下的是鼠标左键，并且允许显示，则显示Form2 
 // if((message.lParam=WM_LBUTTONDOWN) and (Status=True)) then
   //   mainfm.Show;
  //如果按下的是鼠标右键，则显示弹出菜单 
  if(message.lParam=WM_RBUTTONDOWN)then 
  begin 
    GetCursorPos(p);
    PopupMenu1.Popup(p.x,p.y); 
  end; 
end;
procedure Tmainfm.UnInstallIcon;
//卸载图标 
var 
  IconData:TNotifyIconData; 
begin 
  IconData.cbSize:=SizeOf(IconData); 
  IconData.Wnd:=Handle;
  IconData.uID:=ICON_ID;
  Shell_NotifyIcon(NIM_DELETE,@IconData);
end;
procedure tmainfm.initiclient_logooff(host,ip,version,state:string);
begin
if debug=true then
   exit;

     client.close;
     client.sql.clear;
     client.sql.add('select * from client where UN='+''''+trim(user)+'''');
     try
     client.open;
     except
     exit;
     end;
     if client.recordcount>=1 then
     begin
          client.edit;
          //client.fieldvalues['host']:=host;
          //client.fieldvalues['ip']:=ip;
         // client.fieldvalues['version']:=setclientfm.edit9.text;
          client.fieldvalues['state']:='OffLine';
          client.post;
          client.Close;
     end;
     //else
     //begin
          //client.append;
          //client.fieldvalues['host']:=host;
          //client.fieldvalues['ip']:=ip;
          //client.fieldvalues['version']:=setclientfm.edit9.text;
          //client.fieldvalues['state']:='Offling';
          //client.post;
     //end;
end;

procedure Tmainfm.setcolor(cb:TCustomControlBar);
var
  i:word;
  dy,y:real;
begin
  dy:=cb.Height/256;
  y:=0;
  for i:=255 downto 0 do
  begin
    //cb.Canvas.Brush.Color:=$00000000+i;
    //cb.Canvas.FillRect(rect(0,Round(y),cb.Width,Round(y+dy)));
    y:=y+dy;
    cb.Update;

  end;
end;
procedure Tmainfm.SpeedButton5Click(Sender: TObject);
begin
if  application.MessageBox('你确实要退出FALCON ERP系统吗？        ','FALCON ERP 提示',mb_okCANCEL+MB_ICONinformation)=id_ok then
    begin
    try
    //if clientID<>'' then
    //initiclient_logooff('','','','');
    //application.ProcessMessages;
    finally
     close;
    end;
    end;
end;

procedure Tmainfm.lookupliaohaoClick(Sender: TObject);
begin
lufm.show;
lufm.WindowState:=wsmaximized;
end;

procedure Tmainfm.getliaohaoClick(Sender: TObject);
begin

appliaofm.show;
appliaofm.WindowState:=wsmaximized;
end;

procedure Tmainfm.editbomClick(Sender: TObject);
begin
//editbomfm.showmodal;
try
bomeditfm.show;
bomeditfm.WindowState:=wsmaximized;
except
;
end;
end;

procedure Tmainfm.checkliaohaoClick(Sender: TObject);
begin
checkliaohaofm.show;
checkliaohaofm.WindowState:=wsmaximized;
end;

procedure Tmainfm.editliaohaoClick(Sender: TObject);
begin
lhefm.Show;
end;

procedure Tmainfm.createbomClick(Sender: TObject);
begin
   createbomfm.Show;
end;

procedure Tmainfm.lookupbomClick(Sender: TObject);
begin
//lbfm.Show;
lookupbomfm.show;
lookupbomfm.WindowState:=wsmaximized;
end;

procedure Tmainfm.importliaohaoClick(Sender: TObject);
begin
// runapplication(handle,'importdata.exe');
importfm.show;
end;

procedure Tmainfm.N5Click(Sender: TObject);
begin
if  application.MessageBox('你确实要退出FALCON ERP系统吗？？        ','FALCON ERP 提示',mb_okCANCEL+MB_ICONinformation)=id_ok then
    begin
    try
    //initiclient_logooff('','','','');
    finally
    close;
    end;
    end;
end;
procedure Tmainfm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//if  application.MessageBox('你确实要退出FALCON ERP系统吗？？        ','FALCON ERP 提示',mb_okCANCEL+MB_ICONinformation)=id_ok then
  //  begin
    //try
    //if clientID<>'' then
    //initiclient_logooff('','','','');
    //finally
    //application.Terminate;
    //end;
   // end
// else
  //  canclose:=false;
end;

procedure Tmainfm.N11Click(Sender: TObject);
begin
 application.Terminate;
 runapplication(handle,'FALCON.exe');
end;

procedure Tmainfm.N13Click(Sender: TObject);
begin
FORM22.SHOWMODAL;
end;

procedure Tmainfm.liaohaoshenchaClick(Sender: TObject);
begin
//checkliaofm.show;
//form22.Showmodal;
//checkappliaofm2.show;
shenchaliaohaofm.show;
checkappliaofm2.WindowState:=wsmaximized;
//checkappliaofm.show;
end;
procedure Tmainfm.initiclient_logoin(host,ip,version,state:string);
begin
if debug=true then
   exit;
if tag=101010 then
        exit;
     client.close;
     client.sql.clear;
     client.sql.add('select * from client where UN='+''''+trim(USER)+'''');
     client.Open;
     if client.recordcount>=1 then
     begin
          client.edit;
          client.fieldvalues['host']:=host;
          client.fieldvalues['ip']:=ip;
          client.fieldvalues['MAC']:=MAC;
          client.fieldvalues['version']:=setclientfm.edit9.text;
          client.fieldvalues['state']:='Online';
          client.post;
     end
     else
     begin
          client.append;
          client.fieldvalues['UN']:=user;
          client.fieldvalues['host']:=host;
          client.fieldvalues['ip']:=ip;
          client.fieldvalues['MAC']:=MAC;
          client.fieldvalues['version']:=setclientfm.edit9.text;
          client.fieldvalues['state']:='Online';
          client.post;
          client.close;
          client.sql.clear;
          client.sql.add('select * from client where UN='+''''+user+'''');
          client.Open;
          if client.recordcount>=1 then
          begin
          clientid:=client.FieldValues['CLIENT_ID'];

          end;
          registerFALCON(sqlserver,appname,clientversion,ftpserver,
                        ftpuser,ftppassword,updatedfile,clientID,commondir);
     end;
     CLIENT.CLOSE;
end;
procedure Tmainfm.FormActivate(Sender: TObject);
begin
if tag=101010 then
begin
    close;
    exit;
end;

//panel10.Align:=alclient;
try
   inituser(usergp);

except
   application.MessageBox('FALCON ERP 出现异常！，初始化用户信息失败,系统被迫终止 请重新尝试登陆！！！  ','登陆失败！',mb_ok+MB_ICONerror);
   close;
end;


if manageruser.Enabled=true then
   backupsystem.Enabled:=true
   else backupsystem.Enabled:=false;

//paintimage(image3);
  X1 := 0;
  Y1 := 0;
  X2 := ClientWidth ;
  Y2 := ClientHeight ;
end;

procedure Tmainfm.Panel6Click(Sender: TObject);
begin
//IF animate1.Active=true then
 //  animate1.Active:=false
  // else
  //  animate1.Active:=true;
end;

procedure Tmainfm.manageruserClick(Sender: TObject);
begin
userfm.ShowModal;
end;

procedure Tmainfm.N16Click(Sender: TObject);
begin
changepsfm.showmodal;
end;

procedure Tmainfm.N3Click(Sender: TObject);
begin
//panel7.Visible:=true;
//panel8.Visible:=false;
//panel9.Visible:=false;
//panel10.Visible:=false;


//panel8.Visible:=false;
end;

procedure Tmainfm.BOM5Click(Sender: TObject);
begin
//panel8.Visible:=true;
//panel7.Visible:=false;
//panel9.Visible:=false;
end;

procedure Tmainfm.N2Click(Sender: TObject);
begin
if  application.MessageBox('你确实要退出FALCON ERP系统吗？        ','FALCON ERP 提示',mb_okCANCEL+MB_ICONinformation)=id_ok then
    begin
    try
    //initiclient_logooff('','','','');
    finally
    close;
    end;
    end;
end;

procedure Tmainfm.N15Click(Sender: TObject);
begin
//panel9.Visible:=true;
//panel7.Visible:=false;
//panel8.Visible:=false;


end;

procedure Tmainfm.liaohaochenrenClick(Sender: TObject);
begin
//checkappliaofm2.show;
chengrenliaohaofm.show;
chengrenliaohaofm.WindowState:=wsmaximized;
end;

procedure Tmainfm.bianmaguizeClick(Sender: TObject);
begin
norulefm.SpeedButton5.Enabled:=false;
norulefm.SpeedButton3.Enabled:=true;
norulefm.SpeedButton11.Enabled:=true;
norulefm.SpeedButton6.Enabled:=true;

norulefm.SpeedButton2.Enabled:=true;
norulefm.SpeedButton4.Enabled:=true;
norulefm.SpeedButton1.Enabled:=true;
norulefm.SpeedButton7.Enabled:=true;
norulefm.showmodal;
end;

procedure Tmainfm.shengqingguizeClick(Sender: TObject);
begin
norulefm.SpeedButton5.Enabled:=true;
norulefm.SpeedButton3.Enabled:=true;
norulefm.SpeedButton11.Enabled:=true;
norulefm.SpeedButton6.Enabled:=true;

norulefm.SpeedButton2.Enabled:=false;
norulefm.SpeedButton4.Enabled:=false;
norulefm.SpeedButton1.Enabled:=false;
norulefm.SpeedButton7.Enabled:=false;

norulefm.showmodal;
end;

procedure Tmainfm.querenguizeClick(Sender: TObject);
begin

norulefm.SpeedButton5.Enabled:=false;
norulefm.SpeedButton3.Enabled:=true;
norulefm.SpeedButton11.Enabled:=true;
norulefm.SpeedButton6.Enabled:=true;

norulefm.SpeedButton2.Enabled:=true;
norulefm.SpeedButton4.Enabled:=true;
norulefm.SpeedButton1.Enabled:=true;
norulefm.SpeedButton7.Enabled:=true;


norulefm.showmodal;
end;

procedure Tmainfm.N17Click(Sender: TObject);
begin

//panel10.Visible:=true;
//panel7.Visible:=true;;
//panel8.Visible:=false;
//panel9.Visible:=false;

end;

procedure Tmainfm.checkbomClick(Sender: TObject);
begin
bomcheckfm.show;
bomcheckfm.WindowState:=wsmaximized;
end;

procedure Tmainfm.ECRClick(Sender: TObject);
begin
//ecrfm.SpeedButton1.Enabled:=true;
//ecrfm.SpeedButton2.Enabled:=true;
//ecrfm.Caption:='创建ECR';
//ecrfm.Update;//
lookupbomfm2.Caption:='创建ＥＣＮ';
LOOKUPBOMFM2.show;
lookupbomfm2.WindowState:=wsmaximized;

//panel7.Visible:=true;
//panel8.Visible:=false;
//panel9.Visible:=false;

end;

procedure Tmainfm.EDITECRClick(Sender: TObject);
begin
// CHECKERCFM.Caption:='编辑ECR';
// CHECKERCFM.StatusBar1.Panels.Items[2].Text:='编辑ECR';
// CHECKERCFM.Update;
// checkercfm.useredit:=true;
// checkercfm.showmodal;
// checkercfm.useredit:=false;
  lookupbomfm2.Caption:='审核ＥＣＮ';
  LOOKUPBOMFM2.show;
  lookupbomfm2.WindowState:=wsmaximized;


//panel8.Visible:=true;
//panel7.Visible:=false;
//panel9.Visible:=false;
end;

procedure Tmainfm.SpeedButton3Click(Sender: TObject);
begin

//speedbutton1.Font.Color:=fcolor;
//speedbutton2.Font.Color:=fcolor;
//speedbutton3.Font.Color:=bcolor;
//speedbutton4.Font.Color:=fcolor;
//speedbutton5.Font.Color:=fcolor;

//panel10.Visible:=true;
//panel7.Visible:=true;;
//panel8.Visible:=false;
//panel9.Visible:=false;
end;

procedure Tmainfm.SpeedButton4Click(Sender: TObject);
begin

//speedbutton1.Font.Color:=fcolor;
//speedbutton2.Font.Color:=fcolor;
//speedbutton3.Font.Color:=fcolor;
//speedbutton4.Font.Color:=bcolor;
//speedbutton5.Font.Color:=fcolor;

//panel9.Visible:=true;
//panel7.Visible:=false;
//panel8.Visible:=false;


end;

procedure Tmainfm.importbomClick(Sender: TObject);
begin
runapplication(handle,'importbom.exe');
//bomimportfm.showmodal;
end;

procedure Tmainfm.CHECKECRClick(Sender: TObject);
begin
checkercfm.Caption:='核准ＥＣＮ';
CHECKERCFM.StatusBar1.Panels.Items[2].Text:='核准ＥＣＮ';
checkercfm.show;
checkercfm.WindowState:=wsmaximized;
end;

procedure Tmainfm.SpeedButton1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//speedbutton1.Font.Color:=bcolor;

//speedbutton5.Font.Color:=fcolor;
//speedbutton2.Font.Color:=fcolor;
//speedbutton3.Font.Color:=fcolor;
//speedbutton4.Font.Color:=fcolor;

end;

procedure Tmainfm.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//speedbutton1.Font.Color:=fcolor;
//speedbutton2.Font.Color:=fcolor;
//speedbutton3.Font.Color:=fcolor;
//speedbutton4.Font.Color:=fcolor;
//speedbutton5.Font.Color:=fcolor;
end;

procedure Tmainfm.SpeedButton2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//speedbutton2.Font.Color:=bcolor;

//speedbutton5.Font.Color:=fcolor;
//speedbutton1.Font.Color:=fcolor;
//speedbutton3.Font.Color:=fcolor;
//speedbutton4.Font.Color:=fcolor;
end;

procedure Tmainfm.SpeedButton3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//speedbutton3.Font.Color:=bcolor;

//speedbutton5.Font.Color:=fcolor;
//speedbutton1.Font.Color:=fcolor;
//speedbutton2.Font.Color:=fcolor;
//speedbutton4.Font.Color:=fcolor;
end;

procedure Tmainfm.SpeedButton4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//speedbutton4.Font.Color:=bcolor;

//speedbutton5.Font.Color:=fcolor;
//speedbutton1.Font.Color:=fcolor;
//speedbutton2.Font.Color:=fcolor;
//speedbutton3.Font.Color:=fcolor;

end;

procedure Tmainfm.SpeedButton5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//speedbutton5.Font.Color:=bcolor;

//speedbutton1.Font.Color:=fcolor;
///speedbutton2.Font.Color:=fcolor;
//speedbutton3.Font.Color:=fcolor;
//speedbutton4.Font.Color:=fcolor;
end;

procedure Tmainfm.SpeedButton1Click(Sender: TObject);
begin


//speedbutton1.Font.Color:=bcolor;

//speedbutton2.Font.Color:=fcolor;
//speedbutton3.Font.Color:=fcolor;
///speedbutton4.Font.Color:=fcolor;
//speedbutton5.Font.Color:=fcolor;


//panel7.Visible:=true;
//panel8.Visible:=false;
//panel9.Visible:=false;
//panel10.Visible:=false;

end;

procedure Tmainfm.SpeedButton2Click(Sender: TObject);
begin
//speedbutton2.Font.Color:=bcolor;

//speedbutton1.Font.Color:=fcolor;
//speedbutton3.Font.Color:=fcolor;
//speedbutton4.Font.Color:=fcolor;
//speedbutton5.Font.Color:=fcolor;

//panel8.Visible:=true;
//panel7.Visible:=false;
//panel9.Visible:=false;
end;

procedure Tmainfm.addsurplyerClick(Sender: TObject);
begin
surplyerfm.showmodal;
end;

procedure Tmainfm.editsurplyerClick(Sender: TObject);
begin
editsurplyerfm.showmodal;
end;

procedure Tmainfm.lookupsurplyerClick(Sender: TObject);
begin
lookupsurplyerfm.DBGrid1.ReadOnly:=true;
lookupsurplyerfm.show;
end;

procedure Tmainfm.checksurplyerClick(Sender: TObject);
begin
checksurplyerfm.showmodal;
end;

procedure Tmainfm.N6Click(Sender: TObject);
begin
runapplication(handle,'upgrade.exe');
//upgradefm.showmodal;
end;

procedure Tmainfm.N7Click(Sender: TObject);
begin
setclientfm.showmodal;
//if setclientfm.c2.Checked=true then
 //  panel2.Visible:=false
 //  else panel2.Visible:=true;


 bcolor:=setclientfm.Panel5.Color;
// panel2.Color:=setclientfm.Panel3.Color;
// panel1.Color:=setclientfm.Panel6.Color;
 
//speedbutton1.Font.Color:=setclientfm.Panel4.Color;
//speedbutton2.Font.Color:=setclientfm.Panel4.Color;
//speedbutton3.Font.Color:=setclientfm.Panel4.Color;
//speedbutton4.Font.Color:=setclientfm.Panel4.Color;
//speedbutton5.Font.Color:=setclientfm.Panel4.Color;

end;

procedure Tmainfm.FormCreate(Sender: TObject);
begin


  //Application.CreateForm(Tbomeditfm, bomeditfm);
 // Application.CreateForm(Tlookupbomfm, lookupbomfm);
  //Application.CreateForm(Tbomcheckfm, bomcheckfm);


//try
//ssk.Active:=true;
//except

//end;
end;

procedure Tmainfm.backupsystemClick(Sender: TObject);
begin
runapplication(handle,'SQLManager.exe');
end;

procedure Tmainfm.N18Click(Sender: TObject);
begin
//Status:=True;
  InstallIcon;
  hide;
  //安装图标
  //ChangeIcon(True);
 //改变图标为normal状态
  //ShowWindow(Application.Handle,SW_HIDE);


//隐藏主窗体
 // SetWindowLong(Application.Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);
 //在切换状态栏上不显示程序图标
end;

procedure Tmainfm.N9Click(Sender: TObject);
begin
Show;
end;

procedure Tmainfm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if tag=101010 then
        exit;
 UnInstallIcon;
  //卸载图标
  NormalIcon.Free;

  //释放两个图标资源
  try

    initiclient_logooff('','','','');
  except
  end;
end;

procedure Tmainfm.N14Click(Sender: TObject);
begin
runapplication(handle,'BackUp\FALCON_help.doc');
end;

procedure Tmainfm.N12Click(Sender: TObject);
begin
form22.ShowModal;
end;

procedure Tmainfm.cbtjClick(Sender: TObject);
begin
stafm.show;
end;

procedure Tmainfm.bjdjClick(Sender: TObject);
begin
lufm3.showmodal;
end;

procedure Tmainfm.Button1Click(Sender: TObject);
begin
hide;
end;

procedure Tmainfm.SpeedButton8Click(Sender: TObject);
begin
LOOKUPBOMECNFM.SHOW;
end;

procedure Tmainfm.zzbomClick(Sender: TObject);
begin
makebomfm.show;
makebomfm.WindowState:=wsmaximized;
end;

procedure Tmainfm.bomwhClick(Sender: TObject);
begin
bomwhfm.show;
end;

procedure Tmainfm.N20Click(Sender: TObject);
begin
close;
end;

procedure Tmainfm.Timer1Timer(Sender: TObject);

begin
exit;
xx:=10;
yy:=4;
if X1<X2 THEN
  begin
  X1 := X1 + xx;
  X2 := X2 - xx;
  end;
if Y1<Y2 THEN
  begin
    Y1 := Y1 + yy;
    Y2 := Y2 - yy;
  end;

  
if X1>=X2 THEN
  begin
  X1 := 0;
  X2 := ClientWidth;
  Y1 := 0;
  Y2 := ClientHeight;
  end;
//if Y1>=Y2 THEN
//  begin
//  Y1 := 0;
//  Y2 := ClientHeight;
//  end;
 // image2.canvas.Pen.Color:=clblue;
//  image2.Canvas.MoveTo (X1, Y1);
  
//  image2.Canvas.LineTo (X2, Y1);
//  image2.Canvas.LineTo (X2, Y2);
//  image2.Canvas.LineTo (X1, Y2);
 // image2.Canvas.LineTo (X1, Y1);
end;

procedure Tmainfm.FormShow(Sender: TObject);
//var
//fi:string;
begin
try
initiclient_logoin(host,ip,'','Online');
except
end;
//fi:=ExtractFilePath(Application.Exename);
//FindAddress(fi+'show.htm');
bcolor:=clblue;
fcolor:=clnavy;
end;

procedure Tmainfm.N21Click(Sender: TObject);
begin
//if colordialog1.Execute then
//  panel2.Color:=colordialog1.Color;
end;

procedure Tmainfm.Panel1Click(Sender: TObject);
begin
//if colordialog1.Execute then
//panel1.Color:=colordialog1.Color;
end;

procedure Tmainfm.BitBtn1Click(Sender: TObject);
var
fi:string;
begin
fi:=ExtractFilePath(Application.Exename);
FindAddress(fi+'show.htm');
end;

procedure Tmainfm.Action1Execute(Sender: TObject);
begin
    application.Terminate;
 runapplication(handle,'FALCON.exe');
end;

procedure Tmainfm.Action2Execute(Sender: TObject);
begin
changepsfm.showmodal;
end;

procedure Tmainfm.Action3Execute(Sender: TObject);
begin
setclientfm.showmodal;
end;

procedure Tmainfm.Action4Execute(Sender: TObject);
begin
if  application.MessageBox('你确实要退出FALCON ERP系统吗？？        ','FALCON ERP 提示',mb_okCANCEL+MB_ICONinformation)=id_ok then
    begin
    try
    //initiclient_logooff('','','','');
    finally
    close;
    end;
    end;
end;

procedure Tmainfm.Action5Execute(Sender: TObject);
begin
//Status:=True;
  InstallIcon;
  hide;
  //安装图标
  //ChangeIcon(True);
 //改变图标为normal状态
  //ShowWindow(Application.Handle,SW_HIDE);


//隐藏主窗体
 // SetWindowLong(Application.Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);
 //在切换状态栏上不显示程序图标
end;

procedure Tmainfm.Action6Execute(Sender: TObject);
begin
FORM22.SHOWMODAL;
end;

procedure Tmainfm.Action7Execute(Sender: TObject);
begin
runapplication(handle,'upgrade.exe');
end;

procedure Tmainfm.Action8Execute(Sender: TObject);
begin
runapplication(handle,'BackUp\FALCON_help.doc');
end;

procedure Tmainfm.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin

//if panel1.Left< ScrollBar1.Position then
 //  panel1.Left:=panel1.Left+scrollpos;
 //panel1.Left:= ScrollBar1.Position;
end;

procedure Tmainfm.getliaohaoMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   //getliaohao.Font.Style:=[fsunderline];//:=true;
end;

end.
