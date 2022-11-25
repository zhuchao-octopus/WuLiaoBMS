object uploadfm: Tuploadfm
  Left = 264
  Top = 259
  BorderStyle = bsDialog
  Caption = #19978#20256#35268#26684#20070
  ClientHeight = 104
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 48
    Height = 13
    Caption = #35268#26684#20070#65306
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 87
    Height = 13
    Caption = #35268#26684#20070#21517#31216#65306' '
  end
  object SpeedButton1: TSpeedButton
    Left = 485
    Top = 7
    Width = 30
    Height = 24
    Caption = #27983#35272
    OnClick = SpeedButton1Click
  end
  object Edit1: TEdit
    Left = 65
    Top = 8
    Width = 412
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 92
    Top = 32
    Width = 385
    Height = 21
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 7
    Top = 60
    Width = 521
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object Button1: TButton
    Left = 360
    Top = 72
    Width = 75
    Height = 25
    Caption = #19978#20256
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 446
    Top = 70
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Left = 240
    Top = 16
  end
end
