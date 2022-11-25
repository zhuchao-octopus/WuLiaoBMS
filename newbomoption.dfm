object newbomoptinfm: Tnewbomoptinfm
  Left = 248
  Top = 185
  BorderStyle = bsDialog
  Caption = #26032#24314#65314#65327#65325#36873#39033
  ClientHeight = 128
  ClientWidth = 462
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
    Left = 8
    Top = 63
    Width = 75
    Height = 15
    Caption = #35268#26684#35828#26126#65306
  end
  object R1: TRadioButton
    Left = 24
    Top = 8
    Width = 249
    Height = 19
    Caption = #26681#25454#26009#24211#20013#24050#26377#30340#26009#21495#21019#24314#65314#65327#65325
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object R2: TRadioButton
    Left = 24
    Top = 31
    Width = 209
    Height = 24
    Caption = #26032#24314#19968#20010#20020#26102#65314#65327#65325
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 4
    Top = 88
    Width = 454
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object Button1: TButton
    Left = 302
    Top = 95
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 382
    Top = 94
    Width = 75
    Height = 25
    Caption = ' '#21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 83
    Top = 57
    Width = 374
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clHighlightText
    TabOrder = 5
  end
end
