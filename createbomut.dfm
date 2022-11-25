object CREATEBOMFM: TCREATEBOMFM
  Left = 164
  Top = 101
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26032#24314#31354#30340'BOM'
  ClientHeight = 509
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label6: TLabel
    Left = 7
    Top = 10
    Width = 45
    Height = 15
    Caption = #26009#21495#65306
  end
  object Label9: TLabel
    Left = 7
    Top = 34
    Width = 75
    Height = 15
    Caption = #35268#26684#35828#26126#65306
  end
  object Label1: TLabel
    Left = 16
    Top = 237
    Width = 62
    Height = 15
    Caption = #26009#21495':   '
  end
  object Label2: TLabel
    Left = 16
    Top = 264
    Width = 46
    Height = 15
    Caption = #21697#21517': '
  end
  object Label7: TLabel
    Left = 16
    Top = 339
    Width = 92
    Height = 15
    Caption = #26368#26032#29256#26412':   '
  end
  object Label8: TLabel
    Left = 16
    Top = 365
    Width = 62
    Height = 15
    Caption = #26426#31181' :  '
  end
  object Label5: TLabel
    Left = 15
    Top = 314
    Width = 115
    Height = 15
    Caption = #23458#25143#26426#31181#21495':    '
  end
  object Label3: TLabel
    Left = 15
    Top = 289
    Width = 54
    Height = 15
    Caption = #23458#25143':  '
  end
  object Label4: TLabel
    Left = 16
    Top = 386
    Width = 92
    Height = 15
    Caption = #35268#26684#25551#36848':   '
  end
  object SpeedButton1: TSpeedButton
    Left = 570
    Top = 377
    Width = 79
    Height = 27
    Caption = #21019#24314
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 570
    Top = 470
    Width = 77
    Height = 27
    Caption = #20851#38381
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 570
    Top = 347
    Width = 79
    Height = 29
    Caption = #22797#21046'BOM'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 572
    Top = 188
    Width = 74
    Height = 25
    Caption = #30830#23450
    OnClick = SpeedButton4Click
  end
  object Edit1: TEdit
    Left = 102
    Top = 223
    Width = 363
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clMenu
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 102
    Top = 249
    Width = 459
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clMenu
    ReadOnly = True
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 102
    Top = 324
    Width = 150
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 102
    Top = 274
    Width = 291
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 102
    Top = 299
    Width = 411
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 4
  end
  object Edit7: TEdit
    Left = 102
    Top = 349
    Width = 459
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 5
  end
  object Memo1: TMemo
    Left = 102
    Top = 375
    Width = 459
    Height = 86
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clMenu
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object Panel2: TPanel
    Left = 2
    Top = 465
    Width = 647
    Height = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 2
    Top = 216
    Width = 648
    Height = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 8
  end
  object Button1: TButton
    Left = 569
    Top = 409
    Width = 79
    Height = 29
    Caption = #21462#28040'/'#28165#31354
    TabOrder = 9
    OnClick = Button1Click
  end
  object Edit6: TEdit
    Left = 72
    Top = 2
    Width = 201
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    TabOrder = 10
    OnKeyPress = Edit6KeyPress
  end
  object Edit8: TEdit
    Left = 72
    Top = 29
    Width = 369
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    TabOrder = 11
    OnKeyPress = Edit8KeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 640
    Height = 129
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 12
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object ADOTable1: TADOTable
    Connection = DM.ADOConnection1
    TableName = 'lingjianliaohao'
    Left = 104
    Top = 328
  end
  object ADOCommand1: TADOCommand
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 408
    Top = 160
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 456
    Top = 152
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao')
    Left = 528
    Top = 80
    object ADOQuery2DSDesigner: TStringField
      FieldName = #21697#21517
      Size = 40
    end
    object ADOQuery2DSDesigner2: TWideStringField
      FieldName = #26009#21495
      FixedChar = True
    end
    object ADOQuery2DSDesigner3: TStringField
      FieldName = #35268#26684#35828#26126
      Size = 100
    end
    object ADOQuery2DSDesigner4: TStringField
      FieldName = #26426#31181
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner5: TStringField
      FieldName = #38454#23618
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner6: TStringField
      FieldName = #26368#26032#29256#26412
      Size = 50
    end
    object ADOQuery2DSDesigner7: TStringField
      FieldName = #21333#20301#29992#37327
      Size = 50
    end
    object ADOQuery2DSDesigner8: TStringField
      FieldName = #24037#21333#29992#37327
      Size = 50
    end
    object ADOQuery2DSDesigner9: TStringField
      FieldName = #38646#20214#20301#32622
      Size = 200
    end
    object ADOQuery2DSDesigner10: TStringField
      FieldName = #23458#25143
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner11: TWideStringField
      FieldName = #23458#25143#26426#31181#21495
      FixedChar = True
    end
    object ADOQuery2DSDesigner12: TStringField
      FieldName = #21046#36896#21830
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner13: TStringField
      FieldName = #20379#24212#21830
      Size = 200
    end
    object ADOQuery2DSDesigner14: TWideStringField
      FieldName = #21378#23478#26009#21495
      FixedChar = True
    end
    object ADOQuery2DSDesigner15: TStringField
      FieldName = #35268#26684#20070
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner16: TStringField
      FieldName = #25215#35748
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner17: TBCDField
      FieldName = #21333#20215
      Precision = 20
    end
    object ADOQuery2DSDesigner18: TStringField
      FieldName = #24065#31181
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner19: TStringField
      FieldName = #30003#35831#20154
      FixedChar = True
    end
    object ADOQuery2DSDesigner20: TStringField
      FieldName = #20351#29992#26426#31181
      Size = 100
    end
    object ADOQuery2DSDesigner21: TBooleanField
      FieldName = #38145
    end
    object ADOQuery2DSDesigner22: TBooleanField
      FieldName = #29366#24577
    end
    object ADOQuery2DSDesigner23: TStringField
      FieldName = #31867#21035
      FixedChar = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 440
    Top = 72
  end
end
