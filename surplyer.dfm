object surplyerfm: Tsurplyerfm
  Left = 313
  Top = 239
  BorderStyle = bsDialog
  Caption = #30003#35831#20379#24212#21830
  ClientHeight = 328
  ClientWidth = 483
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
    Left = 30
    Top = 40
    Width = 47
    Height = 13
    Caption = #31616#31216'   '
  end
  object Label3: TLabel
    Left = 30
    Top = 158
    Width = 40
    Height = 13
    Caption = #22320#22336'  '
  end
  object Label5: TLabel
    Left = 29
    Top = 112
    Width = 40
    Height = 13
    Caption = #30005#35805'  '
  end
  object Label4: TLabel
    Left = 30
    Top = 86
    Width = 39
    Height = 13
    Caption = #32852#32476#20154
  end
  object Label2: TLabel
    Left = 30
    Top = 63
    Width = 40
    Height = 13
    Caption = #20840#21517'  '
  end
  object Label6: TLabel
    Left = 29
    Top = 134
    Width = 40
    Height = 13
    Caption = #20256#30495'  '
  end
  object Label7: TLabel
    Left = 31
    Top = 181
    Width = 33
    Height = 13
    Caption = #24615#36136' '
  end
  object Label8: TLabel
    Left = 15
    Top = 201
    Width = 39
    Height = 13
    Caption = #22791#27880#25110
  end
  object Label9: TLabel
    Left = 16
    Top = 216
    Width = 59
    Height = 13
    Caption = #32463#33829#33539#22260' '
  end
  object Edit1: TEdit
    Left = 69
    Top = 31
    Width = 211
    Height = 21
    TabOrder = 0
  end
  object Edit4: TEdit
    Left = 70
    Top = 102
    Width = 251
    Height = 21
    TabOrder = 1
  end
  object Edit5: TEdit
    Left = 70
    Top = 125
    Width = 219
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 70
    Top = 78
    Width = 155
    Height = 21
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 69
    Top = 54
    Width = 396
    Height = 21
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 70
    Top = 150
    Width = 395
    Height = 21
    TabOrder = 5
  end
  object Button3: TButton
    Left = 264
    Top = 286
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 360
    Top = 286
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 7
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 278
    Width = 465
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 8
  end
  object Edit7: TEdit
    Left = 71
    Top = 173
    Width = 314
    Height = 21
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 72
    Top = 196
    Width = 393
    Height = 77
    Lines.Strings = (
      'Memo1')
    TabOrder = 10
  end
  object AD: TADOTable
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    TableName = 'surplyer'
    Left = 176
    Top = 104
  end
  object AQ: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 368
    Top = 104
  end
end
