object BJBMFM: TBJBMFM
  Left = 214
  Top = 183
  BorderStyle = bsDialog
  Caption = #32534#36753'BOM'
  ClientHeight = 266
  ClientWidth = 612
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
    Left = 9
    Top = 16
    Width = 53
    Height = 15
    Caption = #26009#21495#65306' '
  end
  object Label2: TLabel
    Left = 9
    Top = 45
    Width = 53
    Height = 15
    Caption = #35268#26684#65306' '
  end
  object Label3: TLabel
    Left = 10
    Top = 94
    Width = 45
    Height = 15
    Caption = #20301#21495#65306
  end
  object Label4: TLabel
    Left = 11
    Top = 70
    Width = 45
    Height = 15
    Caption = #29992#37327#65306
  end
  object Label5: TLabel
    Left = 10
    Top = 238
    Width = 45
    Height = 15
    Caption = #37325#22797#65306
  end
  object Edit1: TEdit
    Left = 47
    Top = 9
    Width = 325
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clMenu
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 48
    Top = 36
    Width = 553
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clMenu
    ReadOnly = True
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 48
    Top = 90
    Width = 553
    Height = 135
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 48
    Top = 63
    Width = 153
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    TabOrder = 3
  end
  object Button1: TButton
    Left = 448
    Top = 232
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 526
    Top = 231
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 224
    Top = 62
    Width = 101
    Height = 25
    Caption = #35745#31639#20301#21495#25968#37327
    TabOrder = 6
    OnClick = Button3Click
  end
  object Edit4: TEdit
    Left = 48
    Top = 232
    Width = 321
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 7
  end
end
