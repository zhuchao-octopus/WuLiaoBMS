object exchangefm: Texchangefm
  Left = 399
  Top = 288
  BorderStyle = bsDialog
  Caption = #27719#29575#35774#32622' '
  ClientHeight = 176
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 34
    Width = 91
    Height = 13
    Caption = #20154#27665#24065#23545#32654#20803#65306
  end
  object Label2: TLabel
    Left = 16
    Top = 59
    Width = 98
    Height = 13
    Caption = #20154#27665#24065#23545#28207#24065#65306' '
  end
  object Label3: TLabel
    Left = 16
    Top = 84
    Width = 98
    Height = 13
    Caption = #20154#27665#24065#23545#21488#24065#65306' '
  end
  object Label4: TLabel
    Left = 16
    Top = 108
    Width = 91
    Height = 13
    Caption = #20154#27665#24065#23545#27431#20803#65306
  end
  object Edit1: TEdit
    Left = 112
    Top = 25
    Width = 297
    Height = 21
    TabOrder = 0
    Text = '0.00'
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 112
    Top = 49
    Width = 177
    Height = 21
    TabOrder = 1
    Text = '0.00'
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 112
    Top = 74
    Width = 249
    Height = 21
    TabOrder = 2
    Text = '0.00'
    OnKeyPress = Edit3KeyPress
  end
  object Edit4: TEdit
    Left = 112
    Top = 99
    Width = 297
    Height = 21
    TabOrder = 3
    Text = '0.00'
    OnKeyPress = Edit4KeyPress
  end
  object Panel1: TPanel
    Left = 2
    Top = 129
    Width = 480
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 400
    Top = 138
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 138
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object ADOTable1: TADOTable
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    TableName = 'rate'
    Left = 384
    Top = 64
  end
end
