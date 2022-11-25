object deleteoptionfm: Tdeleteoptionfm
  Left = 325
  Top = 259
  BorderStyle = bsDialog
  Caption = #21024#38500#36873#39033
  ClientHeight = 124
  ClientWidth = 452
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
  object R1: TRadioButton
    Left = 72
    Top = 24
    Width = 249
    Height = 17
    Caption = #21024#38500#36873#31181#30340#26009#21495#22312#24403#21069#65314#65327#65325#20013
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object R2: TRadioButton
    Left = 72
    Top = 48
    Width = 209
    Height = 17
    Caption = #22312#25968#25454#24211#20013#21024#38500#24403#21069#65314#65327#65325
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 4
    Top = 71
    Width = 445
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object Button1: TButton
    Left = 288
    Top = 80
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 80
    Width = 75
    Height = 25
    Caption = ' '#21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
end
