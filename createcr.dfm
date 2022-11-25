object createcrfm: Tcreatecrfm
  Left = 335
  Top = 241
  BorderStyle = bsDialog
  Caption = #21019#24314'ECN'
  ClientHeight = 113
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 225
    Height = 13
    Caption = #24403#21069'BOM'#21253#21547#22810#20010#26426#31181#35831#36873#25321#19968#20010' '
  end
  object Button1: TButton
    Left = 193
    Top = 84
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 274
    Top = 84
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 51
    Width = 329
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'ComboBox1'
  end
end
