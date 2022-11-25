object changepsfm: Tchangepsfm
  Left = 310
  Top = 324
  BorderStyle = bsDialog
  Caption = #20462#25913#23494#30721
  ClientHeight = 111
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 2
    Top = 24
    Width = 141
    Height = 15
    Caption = #26032'  '#23494'  '#30721':       '
  end
  object Label2: TLabel
    Left = 3
    Top = 49
    Width = 155
    Height = 15
    Caption = #26032#30830#35748#23494#30721':         '
  end
  object Edit1: TEdit
    Left = 88
    Top = 16
    Width = 233
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 88
    Top = 41
    Width = 233
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 200
    Top = 80
    Width = 75
    Height = 29
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 285
    Top = 80
    Width = 75
    Height = 29
    Caption = #20851#38381
    TabOrder = 3
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 71
    Width = 362
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 4
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from users where '#29992#25143#21517'=+'#39#39#39#39'+user+'#39#39#39#39)
    Left = 80
    Top = 128
  end
end
