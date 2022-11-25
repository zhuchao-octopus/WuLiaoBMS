object printsetupfm: Tprintsetupfm
  Left = 208
  Top = 234
  BorderStyle = bsDialog
  Caption = #25171#21360#35774#32622
  ClientHeight = 188
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 4
    Top = 14
    Width = 90
    Height = 15
    Caption = #25171#21360#33539#22260#35774#32622
  end
  object Label2: TLabel
    Left = 8
    Top = 84
    Width = 60
    Height = 15
    Caption = #38468#21152#23383#27573
  end
  object Button1: TButton
    Left = 386
    Top = 157
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 463
    Top = 156
    Width = 75
    Height = 26
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel2: TPanel
    Left = 3
    Top = 27
    Width = 536
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 3
    Top = 148
    Width = 534
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object C1: TCheckBox
    Left = 43
    Top = 109
    Width = 97
    Height = 17
    Caption = #25215#35748
    TabOrder = 4
  end
  object C2: TCheckBox
    Left = 94
    Top = 109
    Width = 97
    Height = 17
    Caption = #21512#35745
    TabOrder = 5
  end
  object C3: TCheckBox
    Left = 144
    Top = 109
    Width = 97
    Height = 17
    Caption = #21333#20215
    TabOrder = 6
  end
  object Allbom: TRadioButton
    Left = 151
    Top = 36
    Width = 202
    Height = 17
    Caption = #25171#21360#25972#20221'BOM'
    Checked = True
    TabOrder = 7
    TabStop = True
  end
  object partbom: TRadioButton
    Left = 151
    Top = 56
    Width = 362
    Height = 17
    Caption = #25171#21360#37096#20998'BOM'#65288#23457#26680#25110#26680#20934#20043'BOM'#19981#36827#34892#23884#22871#25171#21360#65289
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 3
    Top = 98
    Width = 534
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 9
  end
  object rdonelayer: TRadioButton
    Left = 151
    Top = 76
    Width = 362
    Height = 17
    Caption = #25171#21360#24403#21069#19968#38454'BOM'#65288#25171#21360#24403#21069#36873#31181#30340#19968#23618'BOM'#65289
    TabOrder = 10
  end
  object CheckBox1: TCheckBox
    Left = 205
    Top = 108
    Width = 97
    Height = 17
    Caption = #21378#23478#26009#21495
    TabOrder = 11
  end
  object CheckBox2: TCheckBox
    Left = 296
    Top = 107
    Width = 97
    Height = 17
    Caption = #20379#24212#21830
    TabOrder = 12
  end
end
