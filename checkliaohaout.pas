unit checkliaohaout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls,
  Buttons, ToolWin, Menus, Mask, DBCtrls;

type
  Tcheckliaohaofm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton11: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton6: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    FontDialog1: TFontDialog;
    SpeedButton9: TSpeedButton;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SpeedButton8: TSpeedButton;
    ToolButton4: TToolButton;
    N5: TMenuItem;
    N6: TMenuItem;
    ADOTable1: TADOTable;
    N7: TMenuItem;
    Panel2: TPanel;
    SpeedButton10: TSpeedButton;
    N8: TMenuItem;
    SpeedButton12: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Splitter1: TSplitter;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery2DSDesigner: TStringField;
    ADOQuery2DSDesigner2: TStringField;
    ADOQuery2DSDesigner3: TStringField;
    ADOQuery3DSDesigner: TStringField;
    ADOQuery3DSDesigner2: TStringField;
    ADOQuery3DSDesigner3: TStringField;
    ADOQuery4: TADOQuery;
    aqindexliao: TADOQuery;
    N9: TMenuItem;
    N10: TMenuItem;
    SpeedButton13: TSpeedButton;
    N11: TMenuItem;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure lookupdata(keystr,fieldname:string);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure browsedata();
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    function isexistslingjianliaohao(liaohao:string):boolean;
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  checkliaohaofm: Tcheckliaohaofm;

implementation

uses editbomut, luut,glbut,dmut, shenqingprintut,glut;

{$R *.dfm}

procedure Tcheckliaohaofm.browsedata();
VAR
   sqlstr:string;
begin

   sqlstr:='select Ʒ��, �Ϻ�, ���˵��,�汾, ��Ӧ��,������,ʹ�û���,ѡ��, �����Ϻ�, �����, ����,������,״̬,������Ϣ ,P_ID from  prelingjianliaohao';

     with adoquery1 do
         begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
end;


procedure tcheckliaohaofm.lookupdata(keystr,fieldname:string);
VAR
   sqlstr:string;
begin

   sqlstr:='select Ʒ��, �Ϻ�, ���˵��, ��Ӧ��, �����Ϻ�,������,ѡ��,������, �����,ʹ�û���, ����,״̬ from  prelingjianliaohao where '+ fieldname +' like '+ ''''+'%'+keystr+'%'+'''';

     with adoquery1 do
         begin
             ADOQuery1.Close;
             ADOQuery1.SQL.Clear;
             ADOQuery1.SQL.Add(sqlstr);
             ADOQuery1.Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);
         end;
end;

procedure Tcheckliaohaofm.SpeedButton2Click(Sender: TObject);
begin
if fontdialog1.Execute then
   editbomfm.Font:=fontdialog1.Font;
end;

procedure Tcheckliaohaofm.SpeedButton9Click(Sender: TObject);
begin
lufm.show;
end;

procedure Tcheckliaohaofm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit2.Text,'Ʒ��');
   end;
end;

procedure Tcheckliaohaofm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit1.Text,'�Ϻ�');
   end;
end;

procedure Tcheckliaohaofm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
       lookupdata(edit3.Text,'���˵��');
   end;
end;

procedure Tcheckliaohaofm.SpeedButton11Click(Sender: TObject);
begin
if   edit1.Text<>'' then
    lookupdata(edit1.Text,'�Ϻ�')
else if edit2.Text<>'' then
    lookupdata(edit2.Text,'Ʒ��')
else if edit3.Text<>'' then
    lookupdata(edit3.Text,'���˵��');
end;

procedure Tcheckliaohaofm.SpeedButton3Click(Sender: TObject);
begin
browsedata();
end;

procedure Tcheckliaohaofm.SpeedButton5Click(Sender: TObject);
begin
if   application.MessageBox('�����Ҫɾ����ǰ��¼�𣿣�','HME��ʾ��          ',MB_OKCANCEL+MB_iconinformation)=idok then
      begin
      try
         adoquery1.Delete;
      except

           showmessage('ɾ��ʧ�ܣ�����    ') ;
      end;

      end;

end;

procedure Tcheckliaohaofm.SpeedButton6Click(Sender: TObject);
begin
close;
end;

procedure Tcheckliaohaofm.SpeedButton8Click(Sender: TObject);
begin
try
    if (adoquery1.Active=true)and(trim(adoquery1.FieldValues['�Ϻ�'])<>'') then
    try
       adoquery1.Edit;
       adoquery1.FieldValues['״̬']:='OK';
       adoquery1.Post;
    except
    application.MessageBox('  û�п��Բ�������Ч�Ϻţ���ѡ��һ����Ч�Ϻ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

    end
       else
         application.MessageBox('  û�п��Բ������Ϻţ���ѡ��һ���Ϻ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
  except
      showmessage('��Ч������     ');
  end;
end;

procedure Tcheckliaohaofm.N5Click(Sender: TObject);
begin
      if adoquery1.Active=true then
    try
       adoquery1.Edit;
       adoquery1.FieldValues['״̬']:='No';
       adoquery1.Post;
    except
    application.MessageBox('  û�п��Բ�������Ч�Ϻţ���ѡ��һ����Ч�Ϻ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

    end
       else
         application.MessageBox('  û�п��Բ������Ϻţ���ѡ��һ���Ϻ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

end;

procedure Tcheckliaohaofm.N1Click(Sender: TObject);
begin
try
 if (adoquery1.Active=true)and(trim(adoquery1.FieldValues['�Ϻ�'])<>'') then
    try
       adoquery1.Edit;
       adoquery1.FieldValues['״̬']:='OK';
       adoquery1.Post;
    except
        application.MessageBox('  û�п��Բ�������Ч�Ϻţ���ѡ��һ����Ч�Ϻ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

    end
       else
         application.MessageBox('  û�п��Բ������Ϻţ���ѡ��һ���Ϻ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
 except
     showmessage('��Ч������   ');
 end;
end;

procedure Tcheckliaohaofm.N3Click(Sender: TObject);
var
i:integer;
begin
  adoquery1.Edit;
  adoquery1.First;
    for i:=0 to adoquery1.RecordCount-1 do
      begin
         if adoquery1.Active=true then
    try
           adoquery1.Edit;
           adoquery1.FieldValues['״̬']:='OK';
           adoquery1.Post;
           adoquery1.Next;
    except
    application.MessageBox('  û�п��Բ�������Ч�Ϻţ���ѡ��һ����Ч�Ϻţ���׼����ȫ!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

    end
       else
       begin
         application.MessageBox('  û�п��Բ������Ϻţ���ѡ��һ���Ϻ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
         abort;
         end;

      end;
     application.MessageBox('  ������ȫ����׼��ϣ���!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

end;

procedure Tcheckliaohaofm.N4Click(Sender: TObject);
var
i:integer;
begin
  adoquery1.Edit;
  adoquery1.First;
    for i:=0 to adoquery1.RecordCount-1 do
      begin
         if adoquery1.Active=true then
    try
           adoquery1.Edit;
           adoquery1.FieldValues['״̬']:='No';
           adoquery1.Post;
           adoquery1.Next;
    except
    application.MessageBox('  û�п��Բ�������Ч�Ϻţ���ѡ��һ����Ч�Ϻţ�ȡ����׼����ȫ!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

    end
       else
       begin
         application.MessageBox('  û�п��Բ������Ϻţ���ѡ��һ���Ϻ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);
         abort;
         end;

      end;
     application.MessageBox('  ������ȫ��ȡ����׼����!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

end;
function Tcheckliaohaofm.isexistslingjianliaohao(liaohao:string):boolean;
begin
  adoquery4.Close;
  adoquery4.SQL.Clear;
  adoquery4.SQL.Add('select * from lingjianliaohao where  �Ϻ�='+''''+liaohao+'''');
  adoquery4.Open;
  if adoquery4.RecordCount>=1 then
     begin
         result:=true;
     end
  else  result:=false;

end;
procedure Tcheckliaohaofm.SpeedButton7Click(Sender: TObject);
var
  i:integer;
begin
       if adoquery1.Active=true then
          begin
          adotable1.Active:=true;
          adotable1.Edit;
          adoquery1.first;
              for i:=0 to adoquery1.RecordCount-1 do
                  begin
                   if trim(adoquery1.FieldValues['״̬'])='OK' then
                      begin
                      try
                        if isexistslingjianliaohao(adoquery1.FieldValues['�Ϻ�'])=false then
                        begin
                        adotable1.Append;
                        adotable1.FieldValues['Ʒ��']:=adoquery1.FieldValues['Ʒ��'];

                        adotable1.FieldValues['�Ϻ�']:=adoquery1.FieldValues['�Ϻ�'];

                        adotable1.FieldValues['���˵��']:=adoquery1.FieldValues['���˵��'];

                        adotable1.FieldValues['��Ӧ��']:=adoquery1.FieldValues['��Ӧ��'];
                        adotable1.FieldValues['������']:=adoquery1.FieldValues['������'];
                        adotable1.FieldValues['ʹ�û���']:=adoquery1.FieldValues['ʹ�û���'];

                        adotable1.FieldValues['�����Ϻ�']:=adoquery1.FieldValues['�����Ϻ�'];

                        adotable1.FieldValues['�����']:=adoquery1.FieldValues['�����'];
                        adotable1.FieldValues['������']:=adoquery1.FieldValues['������'];      //trim(userrealname);
                        adotable1.FieldValues['���°汾']:=adoquery1.FieldValues['�汾'];
                       // adotable1.FieldValues['����']:='�ѳ���';
                       ////////////////////////////////////////////////  set mapping liao
                         aqindexliao.Close;
                         aqindexliao.SQL.Clear;
                         aqindexliao.SQL.Add('select * from indexliao where predex='+''''+inttostr(adoquery1.FieldValues['P_ID'])+'''');
                         aqindexliao.Open;
                         if aqindexliao.RecordCount=1 then
                            begin
                                aqindexliao.Edit;
                                aqindexliao.FieldValues['newliao']:=trim(adoquery1.FieldValues['�Ϻ�']);
                                aqindexliao.Post;
                            end;
                         if aqindexliao.RecordCount>1 then
                             showmessage('���Ϻ��б��д����Զ�������Ϻţ�����Ӱ�������ʧ�ܣ����¼����λ�ã�'+inttostr(adoquery1.FieldValues['P_ID'])+',Ѱ����֧�֣�');
                        ///////////////////////////////////////////
                        adotable1.Post;
                        adoquery1.Delete;
                       end
                       else
                        showmessage('����һ�����Ͽ����Ѵ��ڵ��Ϻţ��ύ���������Ϻţ�'+adoquery1.FieldValues['�Ϻ�']);
                        adoquery1.Next;
                      except
                         application.MessageBox('  �ύ���ϱ�����ֹ�����ֹ���û����ɣ���ȷ�ϣ���!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

                      end;
                       

                     end
                   else
                     adoquery1.Next;

                  end;

                  application.MessageBox('  �ύ������ɣ���                ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);




          
          end
          else
            begin
                application.MessageBox('  û�п��Բ�������Ч�Ϻţ�!                 ','FALCON ERP ��ʾ',mb_ok+MB_ICONinformation);

            end;
end;

procedure Tcheckliaohaofm.N7Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from prelingjianliaohao where ѡ��='+''''+'��ӡ'+'''');
adoquery1.Open;

   shenqingprint.ADOTable1.Close;
   shenqingprint.qp.DataSet:=adoquery1;
   shenqingprint.QRDBText2.DataSet:=adoquery1;
   shenqingprint.QRDBText3.DataSet:=adoquery1;
   shenqingprint.QRDBText4.DataSet:=adoquery1;
   shenqingprint.QRDBText5.DataSet:=adoquery1;
   shenqingprint.QRDBText6.DataSet:=adoquery1;
   shenqingprint.username.Caption:=userrealname;
   try
   shenqingprint.qp.Preview;
   except
       application.MessageBox('    δ֪���󣡣� ','HME��ʾ��',mb_ok+MB_ICONerror);

   end;

end;

procedure Tcheckliaohaofm.Button2Click(Sender: TObject);
begin

panel2.Visible:=false;
end;

procedure Tcheckliaohaofm.Button1Click(Sender: TObject);
begin
adoquery1.Post;
//panel2.Visible:=false;
end;

procedure Tcheckliaohaofm.DBGrid1DblClick(Sender: TObject);
begin
{if adoquery1.Active<>true then
exit;
if adoquery1.FieldValues['ѡ��']<>'��ӡ' then
   checkbox1.Checked:=false
else if adoquery1.FieldValues['ѡ��']='��ӡ' then
   checkbox1.Checked:=true;        }

end;

procedure Tcheckliaohaofm.SpeedButton10Click(Sender: TObject);
begin
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from prelingjianliaohao where ѡ��='+''''+'��ӡ'+'''');
adoquery1.Open;

   shenqingprint.ADOTable1.Close;
   shenqingprint.qp.DataSet:=adoquery1;
   shenqingprint.QRDBText1.DataSet:=adoquery1;
   shenqingprint.QRDBText2.DataSet:=adoquery1;
   shenqingprint.QRDBText3.DataSet:=adoquery1;
   shenqingprint.QRDBText4.DataSet:=adoquery1;
   shenqingprint.QRDBText5.DataSet:=adoquery1;
   shenqingprint.QRDBText6.DataSet:=adoquery1;
   shenqingprint.QRDBText7.DataSet:=adoquery1;
   shenqingprint.QRDBText8.DataSet:=adoquery1;
   shenqingprint.username.Caption:=userrealname;
   try
   shenqingprint.qp.Preview;
   except
       application.MessageBox('    δ֪���󣡣� ','HME��ʾ��',mb_ok+MB_ICONerror);

   end;

end;

procedure Tcheckliaohaofm.N8Click(Sender: TObject);
var
filename:string;
begin
try
if adoquery1.Active=true then
filename:=adoquery1.FieldValues['�����'];
except

end;
runapplication(handle,commondir+'\'+filename);
end;

procedure Tcheckliaohaofm.SpeedButton1Click(Sender: TObject);
begin
adoquery1.Post;
end;

procedure Tcheckliaohaofm.CheckBox1Click(Sender: TObject);
begin
if adoquery1.Active=false then
exit;
if adoquery1.FieldValues['�Ϻ�']='' then
exit;
if checkbox1.Checked=true then
  begin
  adoquery1.Edit;
   adoquery1.FieldValues['ѡ��']:='��ӡ'   ;
   end
   else adoquery1.FieldValues['ѡ��']:='����ӡ'  ;

adoquery1.Post;
end;

procedure Tcheckliaohaofm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid1 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource1.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=Clcream {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
end;
end;

procedure Tcheckliaohaofm.SpeedButton12Click(Sender: TObject);
begin
adoquery1.Edit;
adoquery1.FieldValues['������Ϣ']:='�Ϻ�δͨ����� ���ܾ�';
adoquery1.FieldValues['״̬']:='�ܾ�';
adoquery1.Post;
end;

procedure Tcheckliaohaofm.DBGrid1CellClick(Column: TColumn);
var
 liaohao,partliao,partgg,gg:string;
 i:integer;
 count:integer;
begin
if adoquery1.Active=true then
   begin
    if trim(adoquery1.FieldValues['�Ϻ�'])='' then
     exit;
    partliao:='';
    partgg:='';
   liaohao:=trim(adoquery1.FieldValues['�Ϻ�']);
   gg:=trim(adoquery1.FieldValues['���˵��']);
   count:=length(trim(adoquery1.FieldValues['�Ϻ�']))div 2;
   count:=count+count div 2;
   if count>6 then
      count:=6
   else count:=5;
       for i:=0 to count do
       begin
          partliao:=partliao+trim(liaohao[i+1]);
       end;
       count:=length(trim(adoquery1.FieldValues['���˵��']))div 2   ;
       //count:=count+count div 2;
        for i:=0 to count do
       begin
          partgg:=partgg+trim(gg[i+1]);
       end;

       adoquery2.Close;
       adoquery2.SQL.Clear;
       adoquery2.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+trim(partliao)+'%'+'''');
        try
       adoquery2.Open;
       except
       end;
       MakeDBGridColumnsAutoFixItsWidth(dbgrid2);
       adoquery3.Close;
       adoquery3.SQL.Clear;
       adoquery3.SQL.Add('select * from lingjianliaohao where ���˵�� like '+''''+'%'+trim(partgg)+'%'+'''');
       try
       adoquery3.Open;
       except
       end;
       MakeDBGridColumnsAutoFixItsWidth(dbgrid3);
   end;
end;

procedure Tcheckliaohaofm.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid3 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource3.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=Clcream {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
end;
end;

procedure Tcheckliaohaofm.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DBGrid2 do
begin
if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
begin
Canvas.Font.Color :=Clwhite;
Canvas.Brush.Color :=ClNavy;
end
else
begin
if DataSource2.DataSet.RecNo mod 2<>0 then {�жϵ�ǰ��������������ż����}
Canvas.brush.Color :=Clcream {����������У�DBGrid�����԰�ɫ��ʾ}
else
Canvas.brush.Color :=$00EAEAEA; {�����ż���У�DBGrid������ǳ��ɫ��ʾ}
end;
DefaultDrawColumnCell(Rect, DataCol, Column, State); {���кܹؼ��ģ�һ����Ҫ��©��}
end;
end;

procedure Tcheckliaohaofm.DBGrid1TitleClick(Column: TColumn);
var
i:integer;
begin
for i:= 1 to DBGrid1.Columns.Count do
  begin
    DBGrid1.Columns[i-1].Title.Font.Color := clWindowText;
    DBGrid1.Columns[i-1].Title.Font.Style := [];
  end;

if ADOQuery1.Sort<>Column.FieldName+' DESC' then
begin
   ADOQuery1.Sort := Column.FieldName+' DESC';
   Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
   Column.Title.Font.Style := [fsBold];
end
else
  begin
      ADOQuery1.Sort := Column.FieldName+' ASC';
      Column.Title.Font.Color := clred;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
      Column.Title.Font.Style := [fsBold];
  end;

end;

procedure Tcheckliaohaofm.N9Click(Sender: TObject);
begin
if adoquery1.Active=true then
begin                      //VK_SPACE
       adoquery1.Edit;
       adoquery1.FieldValues['ѡ��']:='��ӡ' ;

       adoquery1.Post;
end;
end;

procedure Tcheckliaohaofm.N10Click(Sender: TObject);
begin
     if adoquery1.Active=true then
begin                      //VK_SPACE
       adoquery1.Edit;
       adoquery1.FieldValues['ѡ��']:='����ӡ' ;
       adoquery1.Post;
end;
end;

procedure Tcheckliaohaofm.SpeedButton13Click(Sender: TObject);
VAR
   sqlstr:string;
begin

   sqlstr:='select * from  prelingjianliaohao where ������='+''''+userrealname+'''';

with adoquery1 do
   begin
             Close;
             SQL.Clear;
             SQL.Add(sqlstr);
             Open;
             MakeDBGridColumnsAutoFixItsWidth(dbgrid1);

   end;

end;

procedure Tcheckliaohaofm.N11Click(Sender: TObject);
begin
try
panel2.Visible:=true;
adoquery1.Edit;
except
end;
end;

end.
