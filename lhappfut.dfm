object lhappffm: Tlhappffm
  Left = 165
  Top = 43
  Width = 655
  Height = 707
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26009#21495#30003#35831#21333
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 67
    Width = 67
    Height = 13
    Caption = #21697'   '#21517#65306' '
  end
  object Label2: TLabel
    Left = 8
    Top = 91
    Width = 60
    Height = 13
    Caption = #26009'   '#21495#65306
  end
  object Label3: TLabel
    Left = 8
    Top = 213
    Width = 65
    Height = 13
    Caption = #35268#26684#35828#26126#65306
  end
  object Label4: TLabel
    Left = 8
    Top = 118
    Width = 59
    Height = 13
    Caption = #20379#24212#21830' '#65306
  end
  object Label5: TLabel
    Left = 9
    Top = 139
    Width = 66
    Height = 13
    Caption = #30003#35831#20154' '#65306' '
  end
  object Label7: TLabel
    Left = 8
    Top = 188
    Width = 65
    Height = 13
    Caption = #30003#35831#26085#26399#65306
  end
  object Label8: TLabel
    Left = 8
    Top = 165
    Width = 65
    Height = 13
    Caption = #21378#23478#26009#21495#65306
  end
  object Label9: TLabel
    Left = 16
    Top = 10
    Width = 208
    Height = 13
    Caption = #30003#35831#19968#20010#22522#26412#26009#21495#24211#20013#19981#23384#22312#30340#26009#21495
  end
  object Label10: TLabel
    Left = 40
    Top = 34
    Width = 430
    Height = 13
    Caption = #35831#36755#20837#35201#30003#35831#30340#26009#21495#30340#30456#20851#20449#24687#65292#23436#25104#21518#25353#30830#23450#25353#32445#20445#23384#65292#28982#21518#31561#24453#23457#26680'. '
  end
  object Label11: TLabel
    Left = 8
    Top = 295
    Width = 91
    Height = 13
    Caption = #26009#21495#26126#32454#35828#26126#65306
  end
  object Edit1: TEdit
    Left = 66
    Top = 59
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 66
    Top = 83
    Width = 262
    Height = 21
    Hint = #25552#31034#65306'AAXBBBBBB-CC-D:'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnChange = Edit2Change
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 66
    Top = 131
    Width = 146
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 66
    Top = 107
    Width = 414
    Height = 21
    Hint = #25552#31034#65306'AAXBBBBBB-CC-D'
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 67
    Top = 204
    Width = 358
    Height = 89
    BevelInner = bvNone
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 8
    Top = 608
    Width = 625
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 5
  end
  object Button1: TButton
    Left = 376
    Top = 620
    Width = 75
    Height = 28
    Caption = #30830#23450
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 560
    Top = 620
    Width = 75
    Height = 27
    Caption = #20851#38381
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 459
    Top = 620
    Width = 71
    Height = 28
    Caption = #21462#28040'/'#28165#31354
    TabOrder = 8
    OnClick = Button3Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 67
    Top = 180
    Width = 215
    Height = 21
    Date = 38372.708205104170000000
    Time = 38372.708205104170000000
    TabOrder = 9
  end
  object Edit6: TEdit
    Left = 66
    Top = 155
    Width = 247
    Height = 21
    TabOrder = 10
  end
  object Button4: TButton
    Left = 284
    Top = 620
    Width = 75
    Height = 28
    Caption = #19978#20256#25991#20214
    TabOrder = 11
    OnClick = Button4Click
  end
  object Panel2: TPanel
    Left = 9
    Top = 50
    Width = 624
    Height = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 12
  end
  object BitBtn1: TBitBtn
    Left = 352
    Top = 78
    Width = 75
    Height = 25
    Caption = #26816#26597
    TabOrder = 13
    OnClick = BitBtn1Click
  end
  object msg: TMemo
    Left = 67
    Top = 309
    Width = 526
    Height = 255
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    Lines.Strings = (
      'msg')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 14
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 440
    Top = 160
  end
  object ADOTable1: TADOTable
    Connection = DM.ADOConnection1
    TableName = 'prelingjianliaohao'
    Left = 488
    Top = 160
  end
  object OpenDialog1: TOpenDialog
    Left = 536
    Top = 200
  end
end
