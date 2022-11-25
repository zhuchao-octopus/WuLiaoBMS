object editbomffm: Teditbomffm
  Left = 202
  Top = 175
  BorderStyle = bsDialog
  Caption = #32534#36753'BOM'
  ClientHeight = 268
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 6
    Top = 60
    Width = 45
    Height = 15
    Caption = #38454#23618#65306
  end
  object Label2: TLabel
    Left = 6
    Top = 86
    Width = 45
    Height = 15
    Caption = #29992#37327#65306
  end
  object Label3: TLabel
    Left = 6
    Top = 111
    Width = 45
    Height = 15
    Caption = #20301#32622#65306
  end
  object Label4: TLabel
    Left = 5
    Top = 8
    Width = 45
    Height = 15
    Caption = #26009#21495#65306
  end
  object Label5: TLabel
    Left = 5
    Top = 32
    Width = 45
    Height = 15
    Caption = #35268#26684#65306
  end
  object Edit1: TEdit
    Left = 44
    Top = 55
    Width = 126
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 44
    Top = 81
    Width = 230
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 44
    Top = 107
    Width = 509
    Height = 111
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 2
    Top = 224
    Width = 557
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object Button1: TButton
    Left = 400
    Top = 233
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 481
    Top = 232
    Width = 73
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 44
    Top = 1
    Width = 365
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 44
    Top = 28
    Width = 509
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 7
  end
end
