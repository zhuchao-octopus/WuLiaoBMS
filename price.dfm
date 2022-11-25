object pricefm: Tpricefm
  Left = 482
  Top = 296
  BorderStyle = bsDialog
  Caption = #36755#20837#21333#20215
  ClientHeight = 181
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 51
    Top = 16
    Width = 63
    Height = 20
    Caption = #21333#20215#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 49
    Height = 16
    Caption = #24065#31181#65306'   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 56
    Top = 40
    Width = 249
    Height = 24
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Panel1: TPanel
    Left = 15
    Top = 112
    Width = 297
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 1
  end
  object Button1: TButton
    Left = 152
    Top = 120
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 119
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 3
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 56
    Top = 72
    Width = 249
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 4
    Text = #20154#27665#24065
    Items.Strings = (
      #21488#24065
      #28207#24065
      #32654#20803
      #27431#20803
      #20154#27665#24065)
  end
end
