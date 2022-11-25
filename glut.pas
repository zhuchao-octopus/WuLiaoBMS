unit glut;

interface
  uses
     shellapi,windows,comobj,OleCtnrs,adodb,db,SysUtils,classes,variants,DBGrids,forms, Messages;


    const   WM_DATA = WM_USER + 1024;
     procedure runapplication(h:hwnd; filename:string);
 //type


// procedure createExcelbyfile(excelfilename:string);
// procedure settitle(titlename:string);
// procedure settable(tablename:string);
// procedure snapole(ole:boolean);
// procedure setdataset(dataset:tadotable);
// procedure locaterecord(fieldname,key:string);
 //procedure conncettodatabase(sever:string);
 //procedure setstatebar(username:string);
////// procedure setpannel(str:string;flag:boolean);
// procedure getextdatas(ds:tadotable;liaohao:string);
// procedure getextdataswithquery(ds:tadoquery);
// procedure MakeDBGridColumnsAutoFixItsWidth(objDBGrid:TDBGrid);
 //const  excelfilename:string='';
 //Procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
// procedure checkliaohao(liaohao:string);
 type

     Tbomrecord=record
     xuhao:string;
     pinming:string;
     jieceng:string;
     liaogao:string;
     guigeshuoming:string;
     danweiyongliang:string;
     gongdanyongliang:string;
     linjianweizhi:string;
 end;
type
 Tbomarry=array[0..1024] of Tbomrecord;

var
   m,n:integer;
  // excelfilename:string;
  excelflag:boolean;
  fieldnamelist:tstringlist;
  stop:boolean;
  liaohao:string;
  bomarry:Tbomrecord;
   xuhao :integer;
 //  oldtable:string;
  //ind:integer;
implementation
  uses controls;


procedure fomatliaohao(oldliaohao:string;var newliaohao:string);
var
i:integer;
begin
  if oldliaohao[1]<>'B' then
     newliaohao:='B'+oldliaohao;
     stringreplace(newliaohao,'-','',[rfReplaceAll]);
end;

procedure checkliaohao(liaohao:string);
var
i:integer;
begin
   for i:=0 to 1 do
   begin
       if liaohao[i] in ['a'..'z','A'..'Z'] then
       application.MessageBox('��Ч���Ϻţ����������룡','HME��ʾ',mb_ok+MB_ICONSTOP);

   end;
end;

Procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
var
i : integer;
TotWidth : integer;//�����������
VarWidth : integer;//����仯�Ŀ��
ResizableColumnCount : integer;//����仯����е�����
AColumn : TColumn;
begin
//�����µ���ǰ�����еĿ��
TotWidth := 0;
VarWidth := 0;
//�ж�������Ҫ�Զ�����
ResizableColumnCount := 0;

for i := 0 to -1 + DBGrid.Columns.Count do
begin
TotWidth := TotWidth + DBGrid.Columns[i].Width;
if DBGrid.Columns[i].Field.Tag <> 0 then
Inc(ResizableColumnCount);
end;

//Ϊÿ���зָ�������1PX
if dgColLines in DBGrid.Options then
TotWidth := TotWidth + DBGrid.Columns.Count;

if dgIndicator in DBGrid.Options then
TotWidth := TotWidth + IndicatorWidth;

VarWidth := DBGrid.ClientWidth - TotWidth;

//ƽ������仯��ȵ�ֵ
//��������Ҫ�Զ���������
if ResizableColumnCount > 0 then
VarWidth := varWidth div ResizableColumnCount;

for i := 0 to -1 + DBGrid.Columns.Count do
begin
AColumn := DBGrid.Columns[i];
if AColumn.Field.Tag <> 0 then
begin
AColumn.Width := AColumn.Width + VarWidth;
if AColumn.Width < AColumn.Field.Tag then
AColumn.Width := AColumn.Field.Tag;
end;
end;
end; 

procedure MakeDBGridColumnsAutoFixItsWidth(objDBGrid:TDBGrid);
var  cc:integer;
i,tmpLength:integer;
 objDataSet:TDataSet;
 aDgCLength:array of integer;
 begin  cc:=objDbGrid.Columns.Count-1;
  objDataSet:=objDbGrid.DataSource.DataSet;
   setlength(aDgCLength,cc+1);  //file://ȡ/�����ֶεĳ���
   for i:=0 to  cc do
    begin    aDgCLength[i]:= length(objDbGrid.Columns[i].Title.Caption);  end;

  objDataSet.First;
  while not objDataSet.Eof do
   begin  //  file://ȡ/����ÿ���ֶεĳ���
    for i:=0 to  cc do
      begin
      tmpLength:=length(objDataSet.Fields.Fields[i].AsString);
          if tmpLength>aDgCLength[i]      then
          aDgCLength[i]:=tmpLength;
            end;
            objDataSet.Next;
             end;

  for i:=0 to  cc do  begin    objDbGrid.Columns[i].Width:=aDgCLength[i]*7;  end;end;


{procedure getextdataswithquery(ds:tadoquery);
//var// pl: array[0..1] of string;
//i:integer;
//str:string;
begin
     // setlength(str,100);
     //while (true)  do
    //  begin
          //dm.getpl(ds.FieldValues['�Ϻ�'],pl);

          if varisnull(ds.FieldValues['Ʒ��']) then
              bomarry.pinming:=''
          else
          bomarry.pinming:=ds.FieldValues['Ʒ��'];
          form20.formatstr(bomarry.pinming,40,bomarry.pinming);
          if   varisnull(ds.FieldValues['���˵��']) then
             bomarry.guigeshuoming:=''
           // form20.formatstr(bomarry.guigeshuoming,100,bomarry.guigeshuoming);
            else
            form20.formatstr(bomarry.guigeshuoming,100,bomarry.guigeshuoming);
         // bomarry.pinming:=pl[0];
         if   varisnull(ds.FieldValues['�ײ�']) then
              bomarry.jieceng:=''
              //ds.FieldValues['�ײ�']:=''
              else
          bomarry.jieceng:=ds.FieldValues['�ײ�'];
         form20.formatstr(bomarry.jieceng,10,bomarry.jieceng);
          if varisnull(ds.FieldValues['�Ϻ�']) then
          bomarry.liaogao:=''
          else
          bomarry.liaogao:=ds.FieldValues['�Ϻ�'];
          //bomarry.guigeshuoming:=pl[1];
          form20.formatstr(bomarry.liaogao,20,bomarry.liaogao);
          if   VarIsNull(ds.FieldValues['��λ����']) then
               bomarry.danweiyongliang:=''
          else
          bomarry.danweiyongliang:=ds.FieldValues['��λ����'];
         form20.formatstr(bomarry.danweiyongliang,50,bomarry.danweiyongliang);
          if VarIsNull(ds.FieldValues['��������']) then
             bomarry.gongdanyongliang:=''
          else
          bomarry.gongdanyongliang:=ds.FieldValues['��������'];
         form20.formatstr(bomarry.gongdanyongliang,50,bomarry.gongdanyongliang);
          if VarIsNull(ds.FieldValues['���λ��']) then
            bomarry.linjianweizhi:=''
           else
           bomarry.linjianweizhi:=ds.FieldValues['���λ��'];
         form20.formatstr(bomarry.linjianweizhi,200, bomarry.linjianweizhi);
         // ind:=ind+1;
          //  fomatstr(bomarry.pinming,10) ;
            //setlength(bomarry.jieceng,10);
           // setlength(bomarry.liaogao,20) ;
           // setlength(bomarry.danweiyongliang,50)  ;
            //setlength(bomarry.gongdanyongliang,50) ;
            //setlength(bomarry.guigeshuoming,100) ;
            //setlength(bomarry.linjianweizhi,200) ;
     // end;
end;    }

{procedure getextdatas(ds:tadotable;liaohao:string);
//var pl: array[0..1] of string;
//i:integer;
begin

            dm.ADOTable6.Close;
            dm.ADOTable6.TableName:='lingjianliaohao';
            dm.ADOTable6.Active:=true;
            dm.ADOTable6.Locate('�Ϻ�',liaohao,[loPartialKey]);

     //while (true)  do
    //  begin
          //dm.getpl(ds.FieldValues['�Ϻ�'],pl);
    try
         if varisnull(dm.adotable6.FieldValues['Ʒ��']) then
              bomarry.pinming:=''
         else
          bomarry.pinming:=dm.adotable6.FieldValues['Ʒ��'];
    except
    end;
          if   varisnull(dm.adotable6.FieldValues['���˵��']) then
            bomarry.guigeshuoming:=''
            else
          bomarry.guigeshuoming:=dm.adotable6.FieldValues['���˵��'];
         // bomarry.pinming:=pl[0];
           // dm.ADOTable6.Close;
           // dm.ADOTable6.TableName:='lingjianliaohao';
           // dm.ADOTable6.Active:=true;
           // dm.ADOTable6.Locate('�Ϻ�',liaohao,[loPartialKey]);
         
         if   varisnull(ds.FieldValues['�ײ�']) then
              ds.FieldValues['�ײ�']:=''
              else
          bomarry.jieceng:=ds.FieldValues['�ײ�'];
          if varisnull(ds.FieldValues['�Ϻ�']) then
          else
          bomarry.liaogao:=ds.FieldValues['�Ϻ�'];
          //bomarry.guigeshuoming:=pl[1];
          if   VarIsNull(ds.FieldValues['��λ����']) then
               bomarry.danweiyongliang:=''
          else
          bomarry.danweiyongliang:=ds.FieldValues['��λ����'];
          if VarIsNull(ds.FieldValues['��������']) then
             bomarry.gongdanyongliang:=''
          else
          bomarry.gongdanyongliang:=ds.FieldValues['��������'];
          if VarIsNull(ds.FieldValues['���λ��']) then
              bomarry.linjianweizhi:=''
           else
           bomarry.linjianweizhi:=ds.FieldValues['���λ��'];
         // ind:=ind+1;

     // end;

        form20.formatstr(bomarry.pinming,40,bomarry.pinming);
         // if   varisnull(ds.FieldValues['���˵��']) then
          //  form20.formatstr(bomarry.guigeshuoming,100,bomarry.guigeshuoming);
          //  else
            form20.formatstr(bomarry.guigeshuoming,100,bomarry.guigeshuoming);
         // bomarry.pinming:=pl[0];
         //if   varisnull(ds.FieldValues['�ײ�']) then
            //  ds.FieldValues['�ײ�']:=''
            //  else
         // bomarry.jieceng:=ds.FieldValues['�ײ�'];
         form20.formatstr(bomarry.jieceng,10,bomarry.jieceng);
         // if varisnull(ds.FieldValues['�Ϻ�']) then
         // else
         // bomarry.liaogao:=ds.FieldValues['�Ϻ�'];
          //bomarry.guigeshuoming:=pl[1];
          form20.formatstr(bomarry.liaogao,20,bomarry.liaogao);
         // if   VarIsNull(ds.FieldValues['��λ����']) then
              // bomarry.danweiyongliang:=''
         // else
         // bomarry.danweiyongliang:=ds.FieldValues['��λ����'];
         form20.formatstr(bomarry.danweiyongliang,50,bomarry.danweiyongliang);
         // if VarIsNull(ds.FieldValues['��������']) then
            // bomarry.gongdanyongliang:=''
         // else
         // bomarry.gongdanyongliang:=ds.FieldValues['��������'];
         form20.formatstr(bomarry.gongdanyongliang,50,bomarry.gongdanyongliang);
          //if VarIsNull(ds.FieldValues['���λ��']) then
            // bomarry.linjianweizhi:=''
         //  else
         //  bomarry.linjianweizhi:=ds.FieldValues['���λ��'];
         form20.formatstr(bomarry.linjianweizhi,200, bomarry.linjianweizhi);


end;  }

{procedure setpannel(str:string;flag:boolean);
begin
      if flag=true then
      form1.Panel4.Visible:=true
      else
      form1.Panel4.Visible:=false;
      if trim(str)<>'' then
      form1.Panel4.Caption:=str;
end;     }

{procedure setstatebar(username:string);
begin
form1.StatusBar1.Panels[0].Text:='��ǰ���ڣ� '+datetimetostr(date());
form1.StatusBar1.Panels[1].Text:='��ǰ�û��� '+ username;
//form1.StatusBar1.Panels[2].Text:=
end;  }

{procedure conncettodatabase(sever:string);
var
constr:string;
begin
//Provider=SQLOLEDB.1;Persist Security Info=False;User ID=administrator;Data Source=A\macky;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=A;Use Encryption for Data=False;Tag with column collation when possible=False
dm.ADOConnection1.Close;
dm.ADOConnection1.Connected:=false;
constr:='Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=HMEBOM;'+'Data Source='+sever;
dm.ADOConnection1.ConnectionString:=constr;
dm.ADOConnection1.Connected:=true;
//settable('bomlist');
//settitle('BOM �ļ��嵥�����');
snapole(false);
end;  }

procedure locaterecord(fieldname,key:string);
begin
  //  form1.adotable1.Locate(fieldname,key,[loPartialKey]);
end;
procedure setdataset(dataset:tadotable);
begin
 //form1.DataSource1.DataSet:=dataset;
end;
{procedure snapole(ole:boolean);
begin
    if ole=false then
     begin
      form1.OleContainer1.Visible:=false;
      form1.DBGrid1.Visible:=true;
      form1.Panel3.Visible:=true;
      end
     else
        begin
           form1.OleContainer1.Visible:=true;
           form1.DBGrid1.Visible:=false;
           form1.Panel3.Visible:=false;
           form1.OleContainer1.Align:=alclient;
        end;
end;

procedure settable(tablename:string);
begin
   form1.ADOTable1.Close;
   form1.ADOTable1.TableName:=tablename;
   form1.DataSource1.DataSet:=form1.ADOTable1;
   form1.ADOTable1.Active:=true;
end;

procedure settitle(titlename:string);
begin
    form1.Panel3.Caption:='';
    form1.Panel3.Caption:=titlename;
    form1.Panel3.Visible:=true;
end;

procedure createExcelbyfile(excelfilename:string);
begin

form1.olecontainer1.createObjectFromFile(excelfilename,false);
snapole(true);
 form1.OleContainer1.doverb(0);
 form1.OleContainer1.OleObject.application.CommandBars['Standard'].Visible:=false;
 form1.OleContainer1.OleObject.application.CommandBars['Formatting'].Visible:=false;
 form1.OleContainer1.OleObject.application.CommandBars['Reviewing'].Visible:=false;
form1.OleContainer1.doverb(0);
//form1.olecontainer1.Align:=alclient;
//form1.olecontainer1.show;

excelflag:=true;


end;        }

procedure runapplication(h:hwnd; filename:string);
begin
//if opendialog1.Execute then
//begin
//str := opendialog1.FileName; file:
//winexec(PChar(str), SW_SHOWNORMAL);
ShellExecute(h,'open',pchar(filename),'-s','',SW_SHOWNORMAL);
if filename='progressbarDP.exe' then
begin
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 2, 2);
PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 2, 2);
end;

//ShellExecute(handle,'open','msimn.exe','-s','',SW_SHOWNORMAL);

end;



end.
 