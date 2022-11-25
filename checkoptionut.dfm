object checkoptionfm: Tcheckoptionfm
  Left = 304
  Top = 317
  BorderStyle = bsDialog
  Caption = #26816#26597#36873#39033
  ClientHeight = 105
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 4
    Top = 37
    Width = 309
    Height = 11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 162
    Top = 61
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object liaohao: TRadioButton
    Left = 24
    Top = 24
    Width = 113
    Height = 17
    Caption = #26009#21495#21807#19968#24615#26816#27979
    TabOrder = 2
  end
  object shuoming: TRadioButton
    Left = 166
    Top = 24
    Width = 143
    Height = 17
    Caption = #35268#26684#35828#26126#21807#19968#24615#26816#27979' '
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object Button2: TButton
    Left = 240
    Top = 61
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
  object c1: TCheckBox
    Left = 8
    Top = 86
    Width = 185
    Height = 17
    Caption = #33258#21160#21024#38500#37325#22797#20887#20313#26009#21495
    Color = clMenuBar
    Ctl3D = True
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 5
    OnClick = c1Click
  end
  object c2: TCheckBox
    Left = 8
    Top = 66
    Width = 97
    Height = 17
    Caption = #20154#24037#25163#21160#26356#27491' '
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = c2Click
  end
end
