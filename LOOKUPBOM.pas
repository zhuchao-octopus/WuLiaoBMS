unit LOOKUPBOM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bomedit, ADODB, DB, Grids, DBGrids, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, ToolWin, Menus, ImgList, Mask, DBCtrls;

type
  TLOOKUPBOMFM = class(Tbomeditfm)
    BOM4: TMenuItem;
    procedure BOM1Click(Sender: TObject);
    procedure BOM4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cbKeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure getbomlistbymodal(modal:string);
    procedure getmodel(model:string);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    bomliaohao:string;
  end;

var
  LOOKUPBOMFM: TLOOKUPBOMFM;

implementation
           uses glbut;
{$R *.dfm}

procedure TLOOKUPBOMFM.BOM1Click(Sender: TObject);
begin
  inherited;
  if trim(tv.Selected.Text)<>'' then
     begin
         bomliaohao:=tv.Selected.Text;
         close;
     end;
end;

procedure TLOOKUPBOMFM.BOM4Click(Sender: TObject);
begin
  if trim(tv.Selected.Text)<>'' then
     begin
         bomliaohao:=tv.Selected.Text;
        // close;
        showmessage('�ɹ������Ϻţ��� '+bomliaohao);
     end;
end;

procedure TLOOKUPBOMFM.DBGrid1DblClick(Sender: TObject);
begin
;

end;

procedure TLOOKUPBOMFM.getmodel(model:string);
begin

adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select * from lingjianliaohao where ʹ�û��� like '+''''+'%'+trim(model)+'%'+''''+' and �Ϻ� like '+''''+'99%'+''''+' and ����='+''''+'�Ѻ�׼'+'''');
adoquery1.Open;
if adoquery1.RecordCount<1 then
   showmessage('û�з��ִ˻�����ص�BOM�����ȷʵ���ڣ�������δ����׼ͨ��������');

end;
procedure TLOOKUPBOMFM.getbomlistbymodal(modal:string);
var
  l1, l2: TTreeNode;
  i:integer;
begin
if trim(modal)='' then
exit;
   getmodel(modal);
   if adoquery1.RecordCount>=1 then
      begin
      statusbar1.Panels.Items[2].Text:='';
      statusbar1.Panels.Items[3].Text:='���Եȣ����ڲ�ѯBOM��������' ;
          with tv.Items do
               begin
                   tv.Items.Clear;
                   adoquery1.First;
                   l1:=add(nil ,'�����ͺ�'+'('+trim(adoquery1.FieldValues['ʹ�û���'])+')');
                   for i:=0 to adoquery1.RecordCount-1 do
                       begin
                          addchild(l1 ,adoquery1.FieldValues['Ʒ��']+'('+trim(adoquery1.FieldValues['�Ϻ�'])+')');
                          adoquery1.Next;
                       end;
               end;
      end;
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count)+'������';
statusbar1.Panels.Items[3].Text:='ˢ��������ɣ�������' ;

end;
procedure TLOOKUPBOMFM.cbKeyPress(Sender: TObject; var Key: Char);
var
  l1: TTreeNode;
  i1:integer;
  liaohao:string;
  sqlstr:string;
begin
if key=#13 then
begin

if trim(cb.Text)='' then
   exit;
getbomlistbymodal(trim(cb.Text));
end;


  {
 statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
 statusbar1.Update;

   sqlstr:='select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(cb.text)+'%'+''''+' and ����='+''''+'�Ѻ�׼'+'''';
with tv.Items do
   begin
     clear;

       with adoquery2 do
       begin
           close;
           sql.Clear;
           sql.Add(sqlstr);
           open;
           First;
           if recordcount<1 then    //select bom
           begin
               application.MessageBox('û���ҵ�ƥ���BOM����������Ч�ؼ��֣�������         ','��ʾ��',MB_OK+MB_iconinformation) ;
               statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
               statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ���������';
               exit;
           end;

          { fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
           if existbom(liaohao)=false then    //check bom
              begin
               application.MessageBox('��֮ƥ���BOM�����ڣ���������ȷ�Ϲؼ���         ','��ʾ��',MB_OK+MB_iconinformation) ;
               statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
               statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ���������';
               exit;
              end; }

          { for i1:=0 to adoquery2.RecordCount-1 do        //expent bom
                begin
                fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
                 if existbom(liaohao)=true then    //check bom
                   begin
                   l1:=add(nil ,adoquery2.FieldValues['Ʒ��']+'('+trim(adoquery2.FieldValues['�Ϻ�'])+')');
                   end;
                  {  l1:=add(nil ,adoquery2.FieldValues['Ʒ��']+'('+trim(adoquery2.FieldValues['�Ϻ�'])+')');
                    fomatliaohao(trim(adoquery2.FieldValues['�Ϻ�']),liaohao);
                         if existbom(liaohao)=true then
                            begin
                                 acttable(liaohao,t2);
                                 for i2:=0 to t2.recordcount-1 do
                                    begin
                                         l2:=AddChild(l1 ,trim(t2.FieldValues['�Ϻ�']));
                                         fomatliaohao(trim(t2.FieldValues['�Ϻ�']),liaohao);
                                           if existbom(liaohao)=true then
                                              begin
                                                 acttable(liaohao,t3);
                                                 for i3:=0 to t3.recordcount-1 do
                                                     begin
                                                        l3:=AddChild(l2 ,trim(t3.FieldValues['�Ϻ�']));
                                                        fomatliaohao(trim(t3.FieldValues['�Ϻ�']),liaohao);
                                                        if existbom(liaohao)=true then
                                                        begin
                                                          acttable(liaohao,t4);
                                                          for i4:=0 to t4.recordcount-1 do
                                                          begin
                                                            l4:=AddChild(l3 ,trim(t4.FieldValues['�Ϻ�']));
                                                            fomatliaohao(trim(t4.FieldValues['�Ϻ�']),liaohao);
                                                              if existbom(liaohao)=true then
                                                                begin
                                                                 acttable(liaohao,t5);
                                                                 for i5:=0 to t5.recordcount-1 do
                                                                 begin
                                                                   l5:=AddChild(l4 ,trim(t5.FieldValues['�Ϻ�']));
                                                                   fomatliaohao(trim(t5.FieldValues['�Ϻ�']),liaohao);
                                                                   if existbom(liaohao)=true then
                                                                      begin
                                                                         acttable(liaohao,t6);
                                                                         for i6:=0 to t6.recordcount-1 do
                                                                         begin
                                                                            l6:=AddChild(l5 ,trim(t6.FieldValues['�Ϻ�']));
                                                                            fomatliaohao(trim(t6.FieldValues['�Ϻ�']),liaohao);
                                                                             if existbom(liaohao)=true then
                                                                             begin
                                                                                 acttable(liaohao,t7);
                                                                                  for i7:=0 to t7.recordcount-1 do
                                                                                  begin
                                                                                      l7:=AddChild(l6 ,trim(t7.FieldValues['�Ϻ�']));
                                                                                      t7.Next;
                                                                                  end;
                                                                             end;
                                                                           t6.Next;
                                                                         end;
                                                                      end;

                                                                   t5.Next;
                                                                 end;
                                                                end;

                                                            t4.Next
                                                          end;
                                                        end;

                                                         t3.Next;
                                                     end;
                                              end;



                                         t2.Next;
                                    end;
                            end;          }



   {                 adoquery2.Next;
                end;
       end;

end;

   end;


  statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
  statusbar1.Panels.Items[3].Text:='ˢ��BOM��ɣ���������';   }
end;


procedure TLOOKUPBOMFM.TabSheet1Show(Sender: TObject);
var
i,count:integer;
strsql,tname:string;
begin
exit;
bomlist.Close;                            //get all bom
bomlist.Open;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin
               tname:=parseliaohao(bomlist.FieldValues['name']);
               strsql:='select * from lingjianliaohao where �Ϻ�='+''''+tname+''''+' and ����='+''''+'�Ѻ�׼'+'''';
               adoquery1.Close;
               adoquery1.SQL.Clear;                              //get checked bom
               adoquery1.SQL.Add(strsql);
               adoquery1.Open;

               if  adoquery1.RecordCount=1 then
                   begin
                    //  liaohao:=adoquery1.FieldValues['�Ϻ�'];
                    //  adoquery2.Close;                          //get checked bom information
                    //  adoquery2.SQL.Clear;
                    //  adoquery2.SQL.Add('select * from lingjianliaohao where �Ϻ�= '+''''+liaohao+'''');
                   //   adoquery2.Open;
                      lv.Items.Add;
                      count:=lv.Items.Count;
                      lv.Items[count-1].Caption:=adoquery1.FieldValues['�Ϻ�'];          //add to string list
                      if  adoquery1.FieldValues['Ʒ��']<>null then
                      lv.Items[count-1].SubItems.add(adoquery1.FieldValues['Ʒ��']);
                      lv.Items[count-1].SubItems.add(adoquery1.FieldValues['���˵��']);

                   end;


               bomlist.Next;
            end;
   end;
end;



procedure TLOOKUPBOMFM.TabSheet2Show(Sender: TObject);
begin
;

end;

procedure TLOOKUPBOMFM.Edit10KeyPress(Sender: TObject; var Key: Char);
var
i,count:integer;
strsql,tname,liaohao,bomliao:string;
begin
if key=#13 then
begin
if trim(edit10.Text)='' then
    exit;
lv.Clear;
bomlist.Close;
bomlist.SQL.Clear;
bomlist.SQL.Add('select * from lingjianliaohao where �Ϻ� like '+''''+'%'+trim(edit10.Text)+'%'+''''+ ' and ����='+''''+'�Ѻ�׼'+'''');                           //get all bom
bomlist.Open;
if bomlist.RecordCount>=1 then
   begin
        for i:=0 to bomlist.RecordCount-1 do
            begin


                      bomliao:=bomlist.FieldValues['�Ϻ�'];
                      fomatliaohao(bomliao,bomliao);
                      if existbom(bomliao)=true then
                         begin
                      lv.Items.Add;
                      count:=lv.Items.Count;
                      lv.Items[count-1].Caption:=trim(bomlist.FieldValues['�Ϻ�']);          //add to string list
                      if  bomlist.FieldValues['Ʒ��']<>null then
                      lv.Items[count-1].SubItems.add(bomlist.FieldValues['Ʒ��']);
                      lv.Items[count-1].SubItems.add(bomlist.FieldValues['���˵��']);

                   end;


               bomlist.Next;
            end;
            bomlist.Close;
   end;
end;
end;


procedure TLOOKUPBOMFM.SpeedButton1Click(Sender: TObject);
var
  l1, l2,l3,l4,l5,l6: TTreeNode;
  i1,i2,i3,i4,i5,i6:integer;
  liaohao:string;
begin
statusbar1.Panels.Items[3].Text:='���Ե�...����ˢ��BOM.................' ;
statusbar1.Update;
///////////////////////////get bom list///////////////////////
with tv.Items do
   begin
     clear;
     with tq do
       begin
           close;
           sql.Clear;
           sql.Add('SELECT * FROM lingjianliaohao WHERE �Ϻ� LIKE '+''''+'99%'+''''+' and Ʒ�� like '+''''+'%��Ʒ%'+''''+' and ����='+''''+'�Ѻ�׼'+'''');
           open;
           tq.First;
           for i1:=0 to tq.RecordCount-1 do
                begin
                    l1:=add(nil ,tq.FieldValues['Ʒ��']+'('+trim(tq.FieldValues['�Ϻ�'])+')');
                    tq.Next;
                end;
       end;
   end;
statusbar1.Panels.Items[2].Text:=inttostr(tv.Items.Count);
statusbar1.Panels.Items[3].Text:='ˢ��������ɣ�������' ;
end;


procedure TLOOKUPBOMFM.DBGrid2DblClick(Sender: TObject);
begin
;

end;

procedure TLOOKUPBOMFM.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
aqljlh.Locate('�Ϻ�',key,[lopartialkey]);

end;

end.
