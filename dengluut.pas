unit dengluut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB,Sockets, jpeg,registry, NB30,zlib,
  ComCtrls;

type
//以下读硬盘号用
TSrbIoControl = packed record
    HeaderLength : ULONG;
    Signature    : Array[0..7] of Char;
    Timeout      : ULONG;
    ControlCode  : ULONG;
    ReturnCode   : ULONG;
    Length       : ULONG;
  end;
  SRB_IO_CONTROL = TSrbIoControl;
  PSrbIoControl = ^TSrbIoControl; 

  TIDERegs = packed record 
    bFeaturesReg     : Byte; // Used for specifying SMART "commands". 
    bSectorCountReg  : Byte; // IDE sector count register
    bSectorNumberReg : Byte; // IDE sector number register 
    bCylLowReg       : Byte; // IDE low order cylinder value
    bCylHighReg      : Byte; // IDE high order cylinder value 
    bDriveHeadReg    : Byte; // IDE drive/head register 
    bCommandReg      : Byte; // Actual IDE command. 
    bReserved        : Byte; // reserved.  Must be zero. 
  end;
  IDEREGS   = TIDERegs;
  PIDERegs  = ^TIDERegs; 

  TSendCmdInParams = packed record 
    cBufferSize  : DWORD; 
    irDriveRegs  : TIDERegs; 
    bDriveNumber : Byte; 
    bReserved    : Array[0..2] of Byte; 
    dwReserved   : Array[0..3] of DWORD;
    bBuffer      : Array[0..0] of Byte;
  end;
  SENDCMDINPARAMS   = TSendCmdInParams;
  PSendCmdInParams  = ^TSendCmdInParams; 

  TIdSector = packed record 
    wGenConfig                 : Word; 
    wNumCyls                   : Word;
    wReserved                  : Word; 
    wNumHeads                  : Word; 
    wBytesPerTrack             : Word; 
    wBytesPerSector            : Word; 
    wSectorsPerTrack           : Word; 
    wVendorUnique              : Array[0..2] of Word;
    sSerialNumber              : Array[0..19] of Char; 
    wBufferType                : Word; 
    wBufferSize                : Word; 
    wECCSize                   : Word;
    sFirmwareRev               : Array[0..7] of Char; 
    sModelNumber               : Array[0..39] of Char;
    wMoreVendorUnique          : Word; 
    wDoubleWordIO              : Word; 
    wCapabilities              : Word; 
    wReserved1                 : Word; 
    wPIOTiming                 : Word; 
    wDMATiming                 : Word;
    wBS                        : Word; 
    wNumCurrentCyls            : Word; 
    wNumCurrentHeads           : Word; 
    wNumCurrentSectorsPerTrack : Word; 
    ulCurrentSectorCapacity    : ULONG; 
    wMultSectorStuff           : Word;
    ulTotalAddressableSectors  : ULONG; 
    wSingleWordDMA             : Word;
    wMultiWordDMA              : Word; 
    bReserved                  : Array[0..127] of Byte; 
  end;
  PIdSector = ^TIdSector; 

const
  IDE_ID_FUNCTION = $EC; 
  IDENTIFY_BUFFER_SIZE       = 512;
  DFP_RECEIVE_DRIVE_DATA        = $0007c088;
  IOCTL_SCSI_MINIPORT           = $0004d008;
  IOCTL_SCSI_MINIPORT_IDENTIFY  = $001b0501;
  DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
  BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
  W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;

//以上读硬盘号用
type
  Tdenglufm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    BitBtn2: TBitBtn;
    ADOQuery1: TADOQuery;
    ADOQuery4: TADOQuery;
    Label4: TLabel;
    ComboBox1: TComboBox;
    inigp: TADOQuery;
    client: TADOQuery;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    ComboBox3: TComboBox;
    Image1: TImage;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure conncettodatabase(sever:string;database:string);
    procedure inituser(usergp:string);
    function getrole(user:string):string;
    procedure checkuser(user,passwd:string;var count:integer);
    procedure Button1Click(Sender: TObject);
   // procedure setcharge();
   // procedure setclerk();
   // procedure setengineer();
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure getinigp(usergp:string);
    PROCEDURE initigui();
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  //  procedure initiclient_logoin(host,ip,version,state:string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure initiclient_logooff(host,ip,version,state:string);
    procedure BitBtn3Click(Sender: TObject);
    procedure gethost(var ip,host:string);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  type
    Tgp=record
     liaohaolook:boolean;
     bomlook:boolean;
     createliaohao:boolean;
     createbom:boolean;
     editliaohao:boolean;
     editbom:boolean;
     checkliaohao:boolean;
     checkbom:boolean;
     importliaohao:boolean;
     importbom:boolean;
     usermanager:boolean;
     liaohaoshencha:boolean;
     liaohaochenren:boolean;
     bianmaguize:boolean;
     ECR:BOOLean;
     editecr:boolean;
     checkecr:boolean;
     addsurplyer:boolean;
     checksurplyer:boolean;
     lookupsurplyer:boolean;
     editsurplyer:boolean;
     bjdj:boolean;
     cbtj:boolean;
     zzbom:boolean;
     bomwh:boolean;
  end;

var
  denglufm: Tdenglufm;
   ugp:Tgp;
  // ip,host:string;

implementation

uses dmut, Unit1,glbut, sysinf,setclient,glut;

{$R *.dfm}
type
 TNBLanaResources = (lrAlloc, lrFree);

type
 PMACAddress = ^TMACAddress;
 TMACAddress = array[0..5] of Byte;
function checknet(sever:string;database:string):boolean;
begin
      try
       result:=false;
       dm.ADOConnection1.Close;
       dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=sqlhme;Persist Security Info=True;User ID=sa;Initial Catalog='+database+';Data Source='+sever;
       dm.ADOConnection1.Connected:=true;
      except
          result:=false;
          exit;
      end;

       if dm.ADOConnection1.Connected=true then
       begin
          result:=true;
          dm.ADOConnection1.Close;
       end
       else
          result:=false;
end;
procedure getautoupdate(var a,b,autorun:integer);
var
reg:tregistry;
autoupdate:string;
autoupdated:string;
begin
     reg:=Tregistry.Create;
     try
         reg.RootKey:=HKEY_CURRENT_USER;
         if (reg.OpenKey('Software\FALCON',true)) then
            begin
              autoupdate:=Reg.ReadString('autocheckupdatefile');
              autoupdated:=Reg.ReadString('autoupdate');
              reg.RootKey := HKEY_LOCAL_MACHINE;
             if reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\run',True) then
               begin
               if reg.ReadString('FALCON.EXE')=ExtractFilePath(Application.Exename)+'FALCON.EXE' then
               autorun:=1;
               end;
              reg.CloseKey;
            end;
     finally
        reg.CloseKey;
        reg.Free;
        if autoupdate='true' then
        a:=1
        else   a:=0;
        if autoupdated='true' then
           b:=1
           else b:=0;
     end;
end;
procedure Tdenglufm.initigui();
begin
   // getinigp();
    mainfm.getliaohao.enabled:=ugp.createliaohao;
    mainfm.lookupliaohao.enabled:=ugp.liaohaolook;
    mainfm.editliaohao.enabled:=ugp.editliaohao;
    mainfm.checkliaohao.enabled:=ugp.checkliaohao;
    mainfm.createbom.enabled:=ugp.createbom;
    mainfm.lookupbom.enabled:=ugp.bomlook;
    mainfm.editbom.enabled:=ugp.editbom;
    mainfm.checkbom.enabled:=ugp.checkbom;
    mainfm.importliaohao.enabled:=ugp.importliaohao;
    mainfm.importbom.enabled:=ugp.importbom;
    mainfm.manageruser.enabled:=ugp.usermanager;
    mainfm.liaohaoshencha.Enabled:=ugp.liaohaoshencha;
    mainfm.liaohaochenren.Enabled:=ugp.liaohaochenren;
    mainfm.bianmaguize.Enabled:=ugp.bianmaguize;
    mainfm.ECR.Enabled:=ugp.ecr;
    mainfm.EDITECR.Enabled:=ugp.editecr;
    mainfm.CHECKECR.Enabled:=ugp.checkecr;
    mainfm.addsurplyer.Enabled:=ugp.addsurplyer;
    mainfm.checksurplyer.Enabled:=ugp.checksurplyer;
    mainfm.lookupsurplyer.Enabled:=ugp.lookupsurplyer;
    mainfm.editsurplyer.Enabled:=ugp.editsurplyer;
end;

procedure Tdenglufm.getinigp(usergp:string);
var
sqlstr:string;
begin
sqlstr:='select * from userp where 用户组='+''''+usergp+'''';
   inigp.Close;
   inigp.SQL.Clear;
   inigp.SQL.Add(sqlstr);
   inigp.Open;
   if inigp.FieldValues['查询料号']=true then
      ugp.liaohaolook:=true
      else ugp.liaohaolook:=false;
   if inigp.FieldValues['查询BOM']=true then
      ugp.bomlook:=true
      else ugp.bomlook:=false;
   if inigp.FieldValues['申请料号']=true then
      ugp.createliaohao:=true
      else ugp.createliaohao:=false;
   if inigp.FieldValues['新建BOM']=true then
      ugp.createbom:=true
      else ugp.createbom:=false;
   if inigp.FieldValues['编辑料号']=true then
       ugp.editliaohao:=true
       else ugp.editbom:=false;
   if inigp.FieldValues['审核BOM']=true then
       ugp.editbom:=true
       else ugp.editbom:=false;
   if inigp.FieldValues['核准料号']=true then
      ugp.checkliaohao:=true
      else ugp.checkbom:=false;
   if inigp.FieldValues['核准BOM']=true then
      ugp.checkbom:=true
      else ugp.checkbom:=false;
   if inigp.FieldValues['导入料号']=true then
      ugp.importliaohao:=true
      else ugp.importliaohao:=false;
   if inigp.FieldValues['导入BOM']=true then
      ugp.importbom:=true
      else ugp.importbom:=false;
   if inigp.FieldValues['用户管理']=true then
       ugp.usermanager:=true
       else ugp.usermanager:=false;
   if inigp.FieldValues['审核料号']=true then
       ugp.liaohaoshencha:=true
       else ugp.liaohaoshencha:=false;
   if inigp.FieldValues['料号承认']=true then
       ugp.liaohaochenren:=true
       else ugp.liaohaochenren:=false;
   if inigp.FieldValues['编码规则']=true then
       ugp.bianmaguize:=true
       else ugp.bianmaguize:=false;
   if inigp.FieldValues['兴建ECR']=true then
       ugp.ECR:=true
       else ugp.ECR:=false;
   if inigp.FieldValues['审核ECR']=true then
       ugp.editecr:=true
       else ugp.editecr:=false;
   if inigp.FieldValues['核准ECR']=true then
       ugp.checkecr:=true
       else ugp.checkecr:=false;

    if inigp.FieldValues['兴建供应商']=true then
       ugp.addsurplyer:=true
       else ugp.addsurplyer:=false;
   if inigp.FieldValues['审核供应商']=true then
       ugp.checksurplyer:=true
       else ugp.checksurplyer:=false;
   if inigp.FieldValues['查询供应商']=true then
       ugp.lookupsurplyer:=true
       else ugp.lookupsurplyer:=false;
   if inigp.FieldValues['编辑供应商']=true then
       ugp.editsurplyer:=true
       else ugp.editsurplyer:=false;

   if inigp.FieldValues['编辑单价']=true then
       ugp.bjdj:=true
       else ugp.bjdj:=false;
   if inigp.FieldValues['成本统计']=true then
       ugp.cbtj:=true
       else ugp.cbtj:=false;
   if inigp.FieldValues['BOM维护']=true then
       ugp.bomwh:=true
       else ugp.bomwh:=false;
   if inigp.FieldValues['制作BOM']=true then
       ugp.zzbom:=true
       else ugp.zzbom:=false;

   inigp.Close;
   
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
end;


//function GetCPUSerialNumber: pchar;stdcall; external 'ComputerId.dll';
//function GetMacAddress: pchar;stdcall; external 'ComputerId.dll';

{procedure getmachostnamecpu(var ip,mac,cpu:string ;var ComputerName: PChar);
var

        size: DWord;
        tp:ttcpclient;

begin
        tp:=ttcpclient.create(application);
        GetMem(ComputerName, 255);
        size := 255;
        if GetComputerName(ComputerName,size)=False then
        begin
               // MessageBox(Handle, '无法获取系统信息。' , '错误' , MB_OK+MB_ICONERROR);

                FreeMem( ComputerName );
                Exit ;
        end;

        FreeMem(ComputerName);
        mac:=getmacaddress();
        cpu:=getcpuserialnumber();
        ip:=tp.LocalHostAddr;

end;                           }
function GetMACAddress(LanaNum: Byte; MACAddress: PMACAddress): Byte;
var
  AdapterStatus: PAdapterStatus;
  StatNCB: PNCB;
begin
  New(StatNCB);
  ZeroMemory(StatNCB, SizeOf(TNCB));
  StatNCB.ncb_length := SizeOf(TAdapterStatus) +  255 * SizeOf(TNameBuffer);
  GetMem(AdapterStatus, StatNCB.ncb_length);
  try
    with StatNCB^ do
    begin
      ZeroMemory(MACAddress, SizeOf(TMACAddress));
      ncb_buffer := PChar(AdapterStatus);
      ncb_callname := '*              ' + #0;
      ncb_lana_num := Char(LanaNum);
      ncb_command  := Char(NCBASTAT);
      NetBios(StatNCB);
      Result := Byte(ncb_cmd_cplt);
      if Result = NRC_GOODRET then
        MoveMemory(MACAddress, AdapterStatus, SizeOf(TMACAddress));
    end;
  finally
    FreeMem(AdapterStatus);
    Dispose(StatNCB);
  end;
end;
procedure ChangeByteOrder( var Data; Size : Integer );
  var ptr : PChar;
      i : Integer;
      c : Char;
  begin
    ptr := @Data;
    for i := 0 to (Size shr 1)-1 do
    begin
      c := ptr^;
      ptr^ := (ptr+1)^;
      (ptr+1)^ := c;
      Inc(ptr,2);
    end;
  end;

function GetIdeDiskSerialNumber : String;

var 
  hDevice : THandle; 
  cbBytesReturned : DWORD; 
  pInData : PSendCmdInParams; 
  pOutData : Pointer; // PSendCmdOutParams 
  Buffer : Array[0..BufferSize-1] of Byte;
  srbControl : TSrbIoControl absolute Buffer;
begin
  Result := '';
  FillChar(Buffer,BufferSize,#0);
  if Win32Platform=VER_PLATFORM_WIN32_NT then
    begin // Windows NT, Windows 2000
      // Get SCSI port handle
      hDevice := CreateFile( '\\.\Scsi0:',
        GENERIC_READ or GENERIC_WRITE,
        FILE_SHARE_READ or FILE_SHARE_WRITE,
        nil, OPEN_EXISTING, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
        System.Move('SCSIDISK',srbControl.Signature,8);
        srbControl.Timeout      := 2;
        srbControl.Length       := DataSize;
        srbControl.ControlCode  := IOCTL_SCSI_MINIPORT_IDENTIFY;
        pInData := PSendCmdInParams(PChar(@Buffer)
                   +SizeOf(SRB_IO_CONTROL));
        pOutData := pInData;
        with pInData^ do
        begin
          cBufferSize  := IDENTIFY_BUFFER_SIZE;
          bDriveNumber := 0;
          with irDriveRegs do
          begin
            bFeaturesReg     := 0;
            bSectorCountReg  := 1;
            bSectorNumberReg := 1;
            bCylLowReg       := 0;
            bCylHighReg      := 0;
            bDriveHeadReg    := $A0;
            bCommandReg      := IDE_ID_FUNCTION;
          end;
        end;
        if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT,
          @Buffer, BufferSize, @Buffer, BufferSize,
          cbBytesReturned, nil ) then Exit;
      finally
        CloseHandle(hDevice);
      end;
    end
  else
    begin // Windows 95 OSR2, Windows 98
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil,
        CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        pInData := PSendCmdInParams(@Buffer);
        pOutData := @pInData^.bBuffer;
        with pInData^ do
        begin
          cBufferSize  := IDENTIFY_BUFFER_SIZE;
          bDriveNumber := 0;
          with irDriveRegs do
          begin
            bFeaturesReg     := 0;
            bSectorCountReg  := 1;
            bSectorNumberReg := 1;
            bCylLowReg       := 0;
            bCylHighReg      := 0;
            bDriveHeadReg    := $A0;
            bCommandReg      := IDE_ID_FUNCTION;
          end;
        end;
        if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA,
          pInData, SizeOf(TSendCmdInParams)-1, pOutData,
          W9xBufferSize, cbBytesReturned, nil ) then Exit;
      finally
        CloseHandle(hDevice);
      end;
    end;
    with PIdSector(PChar(pOutData)+16)^ do
    begin
      ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
      SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
    end;
end;

function GetLanaEnum(LanaEnum: PLanaEnum): Byte;
var
  LanaEnumNCB: PNCB;
begin
  New(LanaEnumNCB);
  ZeroMemory(LanaEnumNCB, SizeOf(TNCB));
  try
    with LanaEnumNCB^ do
    begin
      ncb_buffer := PChar(LanaEnum);
      ncb_length := SizeOf(TLanaEnum);
      ncb_command  := Char(NCBENUM);
      NetBios(LanaEnumNCB);
      Result := Byte(ncb_cmd_cplt);
    end;
  finally
    Dispose(LanaEnumNCB);
  end;
end;

procedure getmachardno(var mac,hardno:string);
var
  LanaNum: Byte;
  MACAddress: PMACAddress;
  RetCode: Byte;
begin
  LanaNum :=0;              // StrToInt(ComboBox1.Text);
  New(MACAddress);
  try
    RetCode := GetMACAddress(LanaNum, MACAddress);
    if RetCode = NRC_GOODRET then
    begin
        mac:= Format('%2.2x-%2.2x-%2.2x-%2.2x-%2.2x-%2.2x',
                     [MACAddress[0], MACAddress[1], MACAddress[2],
                      MACAddress[3], MACAddress[4], MACAddress[5]]);
    end
    else
    begin
      Beep;
    //  Edit1.Text := 'Error';
     // ShowMessage('GetMACAddress Error! RetCode = $' + IntToHex(RetCode, 2));
    end;

  hardno:=TRIM(GetIdeDiskSerialNumber);
  finally
    Dispose(MACAddress);
  end;
end;
procedure Tdenglufm.gethost(var ip,host:string);
var
tp:ttcpclient;
//strname,straddr:string;
begin
tp:=ttcpclient.create(application);
tp.close;
tp.open;
host:=tp.LocalHostName;
ip:=tp.LocalHostAddr;
//label1.caption:=strname+' IP: '+straddr;
tp.close;

end;

{procedure setadministrator();
begin
      mainfm.SpeedButton9.Enabled:=false;
      mainfm.SpeedButton7.Enabled:=false;
end;
procedure setcommonuser();
begin
   mainfm.SpeedButton7.Enabled:=false;
   mainfm.SpeedButton9.Enabled:=false;
   mainfm.SpeedButton11.Enabled:=false;
   mainfm.SpeedButton3.Enabled:=false;
end;


procedure tdenglufm.setcharge();
begin
      mainfm.SpeedButton11.Enabled:=false;
      mainfm.SpeedButton3.Enabled:=false;
end;
procedure tdenglufm.setclerk();
begin
  // mainfm.SpeedButton11.Enabled:=false;
   mainfm.SpeedButton3.Enabled:=false;
end;
procedure tdenglufm.setengineer();
begin
      mainfm.SpeedButton9.Enabled:=false;
      mainfm.SpeedButton11.Enabled:=false;
      mainfm.SpeedButton3.Enabled:=false;
end;        }
procedure tdenglufm.checkuser(user,passwd:string;var count:integer);
VAR
   sqlstr:string;

begin

   sqlstr:='select * from users where (用户名= '+''''+user+''''+') and '+'(密码='+''''+passwd+''''+')';
     try

             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;
            count:=adoquery1.RecordCount;
            if count=1 then
               userrealname:=adoquery1.FieldValues['姓名'];
     except

     end;
end;

function tdenglufm.getrole(user:string):string;
begin
   adoquery4.Close;
   adoquery4.SQL.Clear;
   adoquery4.SQL.Add('select 用户组 from users where 用户名= '+''''+user+'''');
   adoquery4.Open;
   getrole:=adoquery4.FieldValues['用户组'];
   adoquery4.Close; 
end;

procedure tdenglufm.inituser(usergp:string);

begin
    getinigp(usergp);
    initigui();
    getmachardno(mac,hardno);
    gethost(ip,host);
    mainfm.StatusBar1.Panels.Items[1].Text:= 'USER:'+user;
    mainfm.StatusBar1.Panels.Items[2].Text:= 'HOST NAME:'+host;
    mainfm.StatusBar1.Panels.Items[3].Text:= 'LOCAL IP'+ip;
    mainfm.StatusBar1.Panels.Items[4].Text:= 'DATE:'+datetimetostr(DATE());
    mainfm.StatusBar1.Update;


end;
{
procedure Tdenglufm.initiclient_logoin(host,ip,version,state:string);
begin
     client.close;
     client.sql.clear;
     client.sql.add('select * from client where client_id='+''''+trim(clientid)+'''');
     try
     client.Open;
     except
        exit;
     end;
     if client.recordcount>=1 then
     begin
          client.edit;
          client.fieldvalues['host']:=host;
          client.fieldvalues['ip']:=ip;
          client.fieldvalues['version']:=setclientfm.edit9.text;
          client.fieldvalues['state']:='Online';
          client.post;
     end
     else
     begin
          client.append;
          client.fieldvalues['host']:=host;
          client.fieldvalues['ip']:=ip;
          client.fieldvalues['version']:=setclientfm.edit9.text;
          client.fieldvalues['state']:='Online';
          client.post;
     end;
end;              }
procedure Tdenglufm.initiclient_logooff(host,ip,version,state:string);
begin
     client.close;
     client.sql.clear;
     client.sql.add('select * from client where client_id='+''''+trim(clientid)+'''');
     client.open;
     if client.recordcount=1 then
     begin
          client.edit;
          //client.fieldvalues['host']:=host;
          //client.fieldvalues['ip']:=ip;
         // client.fieldvalues['version']:=setclientfm.edit9.text;
          client.fieldvalues['state']:='Offline';
          client.post;
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
procedure tdenglufm.conncettodatabase(sever:string;database:string);
var
constr_sql:string;
constr_Win:string;
db:string;
begin
if database='量产用套帐' then
  begin
   db:='FAlCON' ;
    taozhang:='量产用套帐';
  end
ELSE IF database='试产用套帐' then
  begin
   db:='PREBOM';
   taozhang:='试产用套帐';
  end;
 
//Provider=SQLOLEDB.1;Persist Security Info=False;User ID=administrator;Data Source=A\macky;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=A;Use Encryption for Data=False;Tag with column collation when possible=False

dm.ADOConnection1.Close;
dm.ADOConnection1.Connected:=false;
 constr_Win:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog='+db+';Data Source='+sever;
 constr_sql:='Provider=SQLOLEDB.1;Password=sqlhme;Persist Security Info=True;User ID=sa;Initial Catalog='+db+';Data Source='+sever;

 if combobox1.Text='Macky' then
   dm.ADOConnection1.ConnectionString:=constr_Win
else
dm.ADOConnection1.ConnectionString:=constr_sql;

dm.ADOConnection1.Connected:=true;

end;

procedure Tdenglufm.BitBtn2Click(Sender: TObject);
begin
//mainfm.Close;
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA,1, 1);
mainfm.Tag:=101010;
application.Terminate;
end;

procedure Tdenglufm.BitBtn1Click(Sender: TObject);
var
count:integer;
a,b:integer;
autorun:integer;
updateversion:string;

filename,s:string;
f:textfile;
begin

 try
filename:='.\userini.ini';
AssignFile(F, FileName);
////if   fileexists('.\userini.ini') then
//    begin
//        reset(f);
//    end
//else
 begin
    Rewrite(F);
 end;
 writeln(F,trim(edit1.Text));
 writeln(f,trim(combobox1.Text));
 closefile(f);
 except
 end;


panel4.Caption:='请稍等！！正在连接 '+combobox1.Text+'...';
panel4.Visible:=true;
panel4.Visible:=true;
panel4.Update;
panel4.Update;
self.Cursor:=crsqlwait;
groupbox2.Cursor:=crHourGlass;
//runapplication(handle,'progressbarDP.exe');
//BitBtn3.Click;
//runapplication(handle,'progressbarDP.exe');
//timer1.Enabled:=true;
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 2, 2);
//PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 2, 2);


//////////////////////////////////////////////////////////////  connect to database
try
if   trim(combobox1.Text)='测试服务器' then
     sqlserver:='MackyLee'
else if  trim(combobox1.Text)='一号服务器' then
     sqlserver:='falconserver'
else
     sqlserver:=trim(combobox1.Text);

//sqlserver:='192.168.4.145';


setclientfm.Edit1.Text:=combobox1.Text;
try

     conncettodatabase(sqlserver,trim(combobox2.Text));
     panel4.Visible:=false;
except
// on E: Exception do
       PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 3, 3);
       application.MessageBox('无法连接到服务器！，无法发送验证登陆信息！！！  ','连接失败！',mb_ok+MB_ICONerror);
       panel4.Visible:=false;

     abort;
end;
//////////////////////////////////////////////////////////////


panel4.Caption:='请稍等！！正在验证用户信息...';
panel4.Visible:=true;
panel4.Visible:=true;
panel4.Update;
panel4.Update;
try
denglufm.checkuser(edit1.Text,edit2.Text,count);
except
   PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 3, 3);
   application.MessageBox('无法获取用户信息！！！  ','验证失败！',mb_ok+MB_ICONerror);
    panel4.Visible:=false;
   abort;
end;
if count=1 then
begin
panel4.Visible:=true;

panel4.Caption:='请稍等！！正在初始化用户信息....';
panel4.Update;
try
////////////////////////////////////////////////////
//inituser(getrole(edit1.Text));
USER:=edit1.text;
usergp:=getrole(edit1.Text);
sqlserver:=trim(combobox1.Text);
gethost(ip,host);
getmachardno(mac,hardno);
except
   PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 3, 3);
   application.MessageBox(' FALCON ERP 出现异常！！，初始化用户信息失败 请重新登陆！！！  ','验证失败！',mb_ok+MB_ICONerror);
   panel4.Visible:=false;
  abort;
end;
panel4.Visible:=false;

try
getreginf();
except
end;
setclientfm.Edit11.Text:=commondir;
setclientfm.Edit10.Text:=trim(clientid);
setclientfm.Edit9.Text:=trim(versions);
setclientfm.Edit11.Text:=trim(commondir);
if clientid=''then
begin
sysinffm.Memo1.Lines.Append('软件没有注册！！！');
          sysinffm.Memo1.Lines.Append('建议及时注册！！！');
end;

//=================================
//mainfm.Show;
//denglufm.Close;
//denglufm.Free;
//Application.Run;

//denglufm.Hide;
//mainfm.Visible:=true;
//=================================
 try
  getautoupdate(a,b,autorun);
 except
 end;
  if autorun=1 then
  setclientfm.C5.Checked:=true
  else
  setclientfm.C5.Checked:=false;

  if a=1 then
   begin
      setclientfm.c1.Checked:=true;
      mainfm.checkclient.Close;
      try
      mainfm.checkclient.Open;
      updateversion:=mainfm.checkclient.FieldValues['version'];
      except
      end;
      if (mainfm.checkclient.RecordCount=1)and(strtodate(trim(updateversion))>strtodate(trim(setclientfm.Edit9.Text))) then
      begin
          if strtodate(mainfm.checkclient.FieldValues['version'])>strtodate(setclientfm.Edit9.Text) then
          sysinffm.show;
          sysinffm.Memo1.Lines.Append('发现有更新版本的软件啦！！！');
          sysinffm.Memo1.Lines.Append('建议你升级本系统！！！');
          if b=1 then
                begin
                    setclientfm.C4.Checked:=true;
                    runapplication(handle,'upgrade.exe');
                    PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 1, 1);
                    close;
                 end
          else setclientfm.C4.Checked:=false;

      end;
  end
      else   setclientfm.c1.Checked:=false;   //if a=1

//  login successful
//timer1.Enabled:=false;
//progressbar1.Position:=progressbar1.Max;
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 1, 1);
mainfm.Tag:=10000;
denglufm.Close;

end
else
begin
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 3, 3);
application.MessageBox(' 用户名或密码错误啦！！！                        ','登陆失败！',mb_ok+MB_ICONerror);
end;

finally
self.Cursor:= crDefault ;
groupbox2.Cursor:= crDefault ;
end;

panel4.Caption:='';
end;


procedure Tdenglufm.Button1Click(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
end;

procedure Tdenglufm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
    //bitbtn1.SetFocus;
  //  combobox1.SetFocus;
  bitbtn1.SetFocus;
end;

procedure Tdenglufm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   bitbtn1.SetFocus;
end;

procedure Tdenglufm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   edit2.SetFocus;
end;

procedure Tdenglufm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//initiclient_logooff('','','','');
end;

procedure Tdenglufm.BitBtn3Click(Sender: TObject);

begin
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA,1, 1);

end;

procedure Tdenglufm.Timer1Timer(Sender: TObject);
begin

//PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 2, 2);
//timer1.Enabled:=false;
end;

procedure Tdenglufm.FormShow(Sender: TObject);
var
filename,s:string;
  f:textfile;
begin
  filename:='.\userini.ini';
 AssignFile(F, FileName);
if  fileexists('.\userini.ini') then
    begin
        reset(f);
    // while not eof(f) do
        begin
            readln(F,s);
           // sl.Add(trim(s));
           edit1.Text:=s;

           readln(F,s);
           combobox1.Text:=s;
        end;
     closefile(f);
    end

else
 begin
    //  Rewrite(F);
 end;

PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 1, 1);
runapplication(handle,'progressbarDP.exe');
end;

procedure Tdenglufm.BitBtn4Click(Sender: TObject);
begin
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 2, 2);
end;

procedure Tdenglufm.BitBtn5Click(Sender: TObject);
begin
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 3, 3);
end;

end.
