object lookupliaofm: Tlookupliaofm
  Left = 366
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #26597#25214
  ClientHeight = 93
  ClientWidth = 424
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
    Left = 8
    Top = 19
    Width = 86
    Height = 13
    Caption = #26597#25214#20869#23481'(N)'#65306
  end
  object Edit1: TEdit
    Left = 103
    Top = 12
    Width = 210
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 326
    Top = 8
    Width = 87
    Height = 25
    Caption = #26597#25214#19979#19968#20010
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 327
    Top = 40
    Width = 86
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 64
    Width = 113
    Height = 17
    Caption = #21306#20998#22823#23567#20889'(C)  '
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 136
    Top = 43
    Width = 179
    Height = 42
    Caption = #26041#21521
    TabOrder = 4
    object RadioButton1: TRadioButton
      Left = 9
      Top = 16
      Width = 82
      Height = 17
      Caption = #21521#19978'(U)'
      Enabled = False
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 104
      Top = 16
      Width = 68
      Height = 17
      Caption = #21521#19979'(D)'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
  end
end
