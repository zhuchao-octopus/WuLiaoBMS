object gpfm: Tgpfm
  Left = 442
  Top = 382
  BorderStyle = bsDialog
  Caption = #37325#21629#21517#29992#25143#32452
  ClientHeight = 173
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 52
    Height = 13
    Caption = #26032#32452#21517#65306
  end
  object Edit1: TEdit
    Left = 56
    Top = 40
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 96
    Top = 88
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 88
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 2
    OnClick = Button2Click
  end
  object ad: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 32
    Top = 80
  end
end
