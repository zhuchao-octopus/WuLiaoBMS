object addrulefm: Taddrulefm
  Left = 363
  Top = 272
  BorderStyle = bsDialog
  Caption = #22686#21152#35268#21017
  ClientHeight = 202
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 13
    Width = 46
    Height = 13
    Caption = #22823#31867#65306' '
  end
  object Label2: TLabel
    Left = 15
    Top = 33
    Width = 46
    Height = 13
    Caption = #21697#21517#65306' '
  end
  object Label3: TLabel
    Left = 15
    Top = 52
    Width = 72
    Height = 13
    Caption = #35268#21017#23450#20041#65306' '
  end
  object Edit1: TEdit
    Left = 72
    Top = 2
    Width = 145
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 72
    Top = 27
    Width = 193
    Height = 21
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 72
    Top = 53
    Width = 313
    Height = 89
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button1: TButton
    Left = 216
    Top = 152
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 312
    Top = 152
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 4
    OnClick = Button2Click
  end
  object ADOTable1: TADOTable
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    TableName = 'NumberRule'
    Left = 40
    Top = 80
  end
  object ad: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 24
    Top = 120
  end
end
