program HMEBMS;
uses
  Forms,
  Unit1 in 'Unit1.pas' {mainfm},
  luut in 'luut.pas' {lufm},
  dmut in 'dmut.pas' {DM: TDataModule},
  glbut in 'glbut.pas',
  lheut in 'lheut.pas' {lhefm},
  appendliaohao in 'appendliaohao.pas' {appliaofm},
  createbomut in 'createbomut.pas' {CREATEBOMFM},
  checkliaohaout in 'checkliaohaout.pas' {checkliaohaofm},
  glut in 'glut.pas',
  dengluut in 'dengluut.pas' {denglufm},
  Unit22 in 'Unit22.pas' {Form22},
  checkut in 'checkut.pas' {checkfm},
  checkoptionut in 'checkoptionut.pas' {checkoptionfm},
  userut in 'userut.pas' {userfm},
  changeps in 'changeps.pas' {changepsfm},
  gpnameut in 'gpnameut.pas' {gpfm},
  checkappliaout in 'checkappliaout.pas' {checkappliaofm},
  liaohaoshencha in 'liaohaoshencha.pas' {checkappliaofm2},
  shenqingprintut in 'shenqingprintut.pas' {shenqingprint},
  noruleut in 'noruleut.pas' {norulefm},
  addruleut in 'addruleut.pas' {addrulefm},
  importut in 'importut.pas' {importfm},
  Unit11 in 'Unit11.pas' {Form11},
  liaohaoprintut in 'liaohaoprintut.pas' {liaohaoprint: TQuickRep},
  bomedit in 'bomedit.pas' {bomeditfm},
  lingjian in 'lingjian.pas' {lufm2},
  BOM in 'BOM.pas' {BOMFM},
  LOOKUPBOM in 'LOOKUPBOM.pas' {LOOKUPBOMFM},
  copybom in 'copybom.pas' {copybomfm},
  bomcheck in 'bomcheck.pas' {bomcheckfm},
  bomdelete in 'bomdelete.pas' {bomdeletefm},
  liaohaolist in 'liaohaolist.pas' {liaohaolistfm},
  bomlist in 'bomlist.pas' {bomlistfm},
  EP in 'EP.pas' {EPFM},
  ECR in 'ECR.pas' {ECRFM},
  saveecr in 'saveecr.pas' {saveecrfm},
  checkerc in 'checkerc.pas' {checkercfm},
  surplyer in 'surplyer.pas' {surplyerfm},
  editsurplyer in 'editsurplyer.pas' {editsurplyerfm},
  lookup in 'lookup.pas' {lookupsurplyerfm},
  checksurplyer in 'checksurplyer.pas' {checksurplyerfm},
  flash in 'flash.pas' {flashfm},
  setclient in 'setclient.pas' {setclientfm},
  sysinf in 'sysinf.pas' {sysinffm},
  bommaping in 'bommaping.pas' {bommapingfm},
  lookupliaohao in 'lookupliaohao.pas' {lookupliaohaofm},
  getbomliao in 'getbomliao.pas' {LOOKUPBOMFM2},
  CREATEECN in 'CREATEECN.pas' {CREATEECNFM},
  createcr in 'createcr.pas' {createcrfm},
  checkecr2 in 'checkecr2.pas' {checkercfm2},
  sta in 'sta.pas' {stafm},
  exchange in 'exchange.pas' {exchangefm},
  editprice in 'editprice.pas' {lufm3},
  price in 'price.pas' {pricefm},
  avg in 'avg.pas' {avgfm},
  outexcel in 'outexcel.pas' {outexcelfm},
  bomdetailfm in 'bomdetailfm.pas' {bomdetail},
  ecnroption in 'ecnroption.pas' {ecnroptionfm},
  lookupliao in 'lookupliao.pas' {lookupliaofm},
  appliaohao in 'appliaohao.pas' {appliaohaofm},
  modalliao in 'modalliao.pas' {modalliaofm},
  editbom in 'editbom.pas' {editbomffm},
  printsetup in 'printsetup.pas' {printsetupfm},
  ecnlist in 'ecnlist.pas' {ecnlistfm: TQuickRep},
  chengrenliaohao in 'chengrenliaohao.pas' {chengrenliaohaofm},
  lookupbomecn in 'lookupbomecn.pas' {LOOKUPBOMECNFM},
  upload in 'upload.pas' {uploadfm},
  shenchaliaohao in 'shenchaliaohao.pas' {shenchaliaohaofm},
  makebom in 'makebom.pas' {makebomfm},
  CREATEBOM2 in 'CREATEBOM2.pas' {CREATEBOMFM2},
  tidailiao in 'tidailiao.pas' {tidailiaofm},
  ole in 'ole.pas' {olefm},
  plcrqr in 'plcrqr.pas' {QuickReport2: TQuickRep},
  chengrenshu in 'chengrenshu.pas' {chengrenshufm: TQuickRep},
  printcrsoption in 'printcrsoption.pas' {printcrsoptionfm},
  VERSIONUPDATE in 'VERSIONUPDATE.pas' {VERSIONUPDATEFM},
  problemreport in 'problemreport.pas' {problemreportfm},
  extendbomqp in 'extendbomqp.pas' {extendbomqpfm},
  openbom in 'openbom.pas' {openbomfm},
  opendialog in 'opendialog.pas' {opendialogfm},
  bomwh in 'bomwh.pas' {bomwhfm},
  addliao in 'addliao.pas' {addliaofm},
  saveas in 'saveas.pas' {saveasfm},
  deleteoption in 'deleteoption.pas' {deleteoptionfm},
  newbomoption in 'newbomoption.pas' {newbomoptinfm},
  bjbm in 'bjbm.pas' {BJBMFM},
  thhp in 'thhp.pas' {thhpfm},
  CHECKECN in 'CHECKECN.pas' {CHECKECNFM},
  APPROVEBOM in 'APPROVEBOM.pas' {APPROVEBOMFM},
  BOMINFO in 'BOMINFO.pas' {BOMINFOFM},
  lookupbackup in 'lookupbackup.pas' {lookupbackupfm},
  checklh in 'checklh.pas' {checklhfm},
  fixitemwidththre in 'fixitemwidththre.pas';

{$R *.res}

  var i,s:integer;
  flashfm:tflashfm;
begin

  //DEBUG:=TRUE;   //SET DEBUG OPTION;
 // if DEBUG<>TRUE THEN
  BEGIN
  flashfm:=Tflashfm.Create(application);
  flashfm.Show;
  flashfm.Update;
  for i:=0 to 1000000 do
     s:=i+1;
  //flashfm.close;
  END;


  flashfm.Label1.Caption:='开始初始化...请稍等...Initialize';
  flashfm.Label1.Update;
  
  Application.Initialize;
  Application.Title := '物料管理系统';
  flashfm.Label1.Caption:='请稍等...Initialize...';
  flashfm.Label1.Update;

  Application.CreateForm(Tmainfm, mainfm);
  Application.CreateForm(Tdenglufm, denglufm);
  Application.CreateForm(Toutexcelfm, outexcelfm);
  Application.CreateForm(Tavgfm, avgfm);
  Application.CreateForm(TLOOKUPBOMECNFM, LOOKUPBOMECNFM);
  Application.CreateForm(Tuploadfm, uploadfm);
  Application.CreateForm(Tshenchaliaohaofm, shenchaliaohaofm);
  Application.CreateForm(Tmakebomfm, makebomfm);
  Application.CreateForm(TCREATEBOMFM2, CREATEBOMFM2);
  Application.CreateForm(Ttidailiaofm, tidailiaofm);
  Application.CreateForm(Tolefm, olefm);
  Application.CreateForm(TQuickReport2, QuickReport2);
  Application.CreateForm(Tlookupliaohaofm, lookupliaohaofm);
  Application.CreateForm(TLOOKUPBOMFM2, LOOKUPBOMFM2);
  Application.CreateForm(TCREATEECNFM, CREATEECNFM);
  Application.CreateForm(Tcreatecrfm, createcrfm);
  Application.CreateForm(Tcheckercfm2, checkercfm2);
  Application.CreateForm(Tstafm, stafm);
  Application.CreateForm(Texchangefm, exchangefm);
  Application.CreateForm(Tlufm3, lufm3);
  Application.CreateForm(Tpricefm, pricefm);
  Application.CreateForm(Tbomeditfm, bomeditfm);
  Application.CreateForm(Tbomcheckfm, bomcheckfm);
  Application.CreateForm(TLOOKUPBOMFM, LOOKUPBOMFM);
  Application.CreateForm(Tbomdetail, bomdetail);
  Application.CreateForm(Tecnroptionfm, ecnroptionfm);
  Application.CreateForm(Tlookupliaofm, lookupliaofm);
  Application.CreateForm(Tappliaohaofm, appliaohaofm);
  Application.CreateForm(Tmodalliaofm, modalliaofm);
  Application.CreateForm(Teditbomffm, editbomffm);
  Application.CreateForm(Tprintsetupfm, printsetupfm);
  Application.CreateForm(Tecnlistfm, ecnlistfm);
  Application.CreateForm(Tchengrenliaohaofm, chengrenliaohaofm);
  Application.CreateForm(Tchengrenshufm, chengrenshufm);
  Application.CreateForm(Tprintcrsoptionfm, printcrsoptionfm);
  Application.CreateForm(TVERSIONUPDATEFM, VERSIONUPDATEFM);
  Application.CreateForm(Tproblemreportfm, problemreportfm);
  Application.CreateForm(Textendbomqpfm, extendbomqpfm);
  Application.CreateForm(Topenbomfm, openbomfm);
  Application.CreateForm(Topendialogfm, opendialogfm);
  Application.CreateForm(Tbomwhfm, bomwhfm);
  Application.CreateForm(Taddliaofm, addliaofm);
  Application.CreateForm(Tsaveasfm, saveasfm);
  Application.CreateForm(Tdeleteoptionfm, deleteoptionfm);
  Application.CreateForm(Tnewbomoptinfm, newbomoptinfm);
  Application.CreateForm(TBJBMFM, BJBMFM);
  Application.CreateForm(Tthhpfm, thhpfm);
  Application.CreateForm(TCHECKECNFM, CHECKECNFM);
  Application.CreateForm(TAPPROVEBOMFM, APPROVEBOMFM);
  Application.CreateForm(TBOMINFOFM, BOMINFOFM);
  Application.CreateForm(Tlookupbackupfm, lookupbackupfm);
  Application.CreateForm(Tchecklhfm, checklhfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tdenglufm, denglufm)';
  flashfm.Label1.Update;

  Application.CreateForm(TECRFM, ECRFM);
  flashfm.Label1.Caption:='请稍等...正在装载(TECRFM, ECRFM)';
  flashfm.Label1.Update;

  Application.CreateForm(Tbomdeletefm, bomdeletefm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tbomdeletefm, bomdeletefm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tcheckappliaofm2, checkappliaofm2);
  flashfm.Label1.Caption:='请稍等...正在装载(Tcheckappliaofm2, checkappliaofm2)';
  flashfm.Label1.Update;

  Application.CreateForm(Tshenqingprint, shenqingprint);
  flashfm.Label1.Caption:='请稍等...正在装载(Tshenqingprint, shenqingprint)';
  flashfm.Label1.Update;

  //Application.CreateForm(Tlhappffm, lhappffm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tlhappffm, lhappffm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tuserfm, userfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tuserfm, userfm)';
  flashfm.Label1.Update;

  //Application.CreateForm(Tmainfm, mainfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tmainfm, mainfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tlufm, lufm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tlufm, lufm)';
  flashfm.Label1.Update;

  Application.CreateForm(TDM, DM);
  flashfm.Label1.Caption:='请稍等...正在装载(TDM, DM)';
  flashfm.Label1.Update;

  //Application.CreateForm(Tlbfm, lbfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tlbfm, lbfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tlhefm, lhefm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tlhefm, lhefm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tappliaofm, appliaofm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tappliaofm, appliaofm)';
  flashfm.Label1.Update;

  Application.CreateForm(TCREATEBOMFM, CREATEBOMFM);
  flashfm.Label1.Caption:='请稍等...正在装载(TCREATEBOMFM, CREATEBOMFM)';
  flashfm.Label1.Update;

  Application.CreateForm(Tcheckliaohaofm, checkliaohaofm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tcheckliaohaofm, checkliaohaofm)';
  flashfm.Label1.Update;

  Application.CreateForm(TForm22, Form22);
  flashfm.Label1.Caption:='请稍等...正在装载(TForm22, Form22)';
  flashfm.Label1.Update;

  Application.CreateForm(Tcheckfm, checkfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tcheckfm, checkfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tcheckoptionfm, checkoptionfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tcheckoptionfm, checkoptionfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tchangepsfm, changepsfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tchangepsfm, changepsfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tgpfm, gpfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tgpfm, gpfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tcheckappliaofm, checkappliaofm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tcheckappliaofm, checkappliaofm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tnorulefm, norulefm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tnorulefm, norulefm)';
  flashfm.Label1.Update;

  Application.CreateForm(Taddrulefm, addrulefm);
  flashfm.Label1.Caption:='请稍等...正在装载(Taddrulefm, addrulefm)';
  flashfm.Label1.Update;

  Application.CreateForm(Timportfm, importfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Timportfm, importfm)';
  flashfm.Label1.Update;

  Application.CreateForm(TForm11, Form11);
  flashfm.Label1.Caption:='请稍等...正在装载(TForm11, Form11)';
  flashfm.Label1.Update;

  Application.CreateForm(Tliaohaoprint, liaohaoprint);
  flashfm.Label1.Caption:='请稍等...正在装载(Tliaohaoprint, liaohaoprint)';
  flashfm.Label1.Update;

  Application.CreateForm(Tlufm2, lufm2);
  flashfm.Label1.Caption:='请稍等...正在装载(Tlufm2, lufm2)';
  flashfm.Label1.Update;

  Application.CreateForm(TBOMFM, BOMFM);
  flashfm.Label1.Caption:='请稍等...正在装载(TBOMFM, BOMFM)';
  flashfm.Label1.Update;

  Application.CreateForm(Tcopybomfm, copybomfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tcopybomfm, copybomfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tliaohaolistfm, liaohaolistfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tliaohaolistfm, liaohaolistfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tbomlistfm, bomlistfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tbomlistfm, bomlistfm)';
  flashfm.Label1.Update;

  Application.CreateForm(TEPFM, EPFM);
  flashfm.Label1.Caption:='请稍等...正在装载(TEPFM, EPFM)';
  flashfm.Label1.Update;

  Application.CreateForm(Tsaveecrfm, saveecrfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tsaveecrfm, saveecrfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tcheckercfm, checkercfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tcheckercfm, checkercfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tsurplyerfm, surplyerfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tsurplyerfm, surplyerfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Teditsurplyerfm, editsurplyerfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Teditsurplyerfm, editsurplyerfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tlookupsurplyerfm, lookupsurplyerfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tlookupsurplyerfm, lookupsurplyerfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tchecksurplyerfm, checksurplyerfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tchecksurplyerfm, checksurplyerfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tsetclientfm, setclientfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tsetclientfm, setclientfm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tsysinffm, sysinffm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tsysinffm, sysinffm)';
  flashfm.Label1.Update;

  Application.CreateForm(Tbommapingfm, bommapingfm);
  flashfm.Label1.Caption:='请稍等...正在装载(Tbommapingfm, bommapingfm)';
  flashfm.Label1.Update;

  flashfm.close;
  flashfm.Free;
  if debug<>true then
  begin

  Application.CreateForm(Tdenglufm, denglufm);
  denglufm.ShowModal;
  end;
    //PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 1, 1);
   // PostMessage(FindWindow(nil, 'ProgressBarFm'), WM_DATA, 1, 1);
  Application.Run;
end.
