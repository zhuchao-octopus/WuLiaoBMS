object CREATEECNFM: TCREATEECNFM
  Left = 304
  Top = 203
  BorderStyle = bsDialog
  Caption = 'BOM'#21464#26356#21333
  ClientHeight = 521
  ClientWidth = 559
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
  object Label3: TLabel
    Left = 8
    Top = 39
    Width = 98
    Height = 15
    Caption = #21464#26356#21069#35268#26684#65306' '
  end
  object SpeedButton8: TSpeedButton
    Left = 408
    Top = 489
    Width = 70
    Height = 25
    Caption = #30830#23450
    OnClick = SpeedButton8Click
  end
  object Label1: TLabel
    Left = 9
    Top = 62
    Width = 98
    Height = 15
    Caption = #21464#26356#21069#29992#37327#65306' '
  end
  object Label2: TLabel
    Left = 9
    Top = 86
    Width = 98
    Height = 15
    Caption = #21464#26356#21069#20301#21495#65306' '
  end
  object SpeedButton1: TSpeedButton
    Left = 464
    Top = 32
    Width = 69
    Height = 27
    Caption = #26597#35810#26009#21495
    Enabled = False
  end
  object SpeedButton2: TSpeedButton
    Left = 472
    Top = 219
    Width = 70
    Height = 24
    Caption = #35745#31639#25968#37327
    OnClick = SpeedButton2Click
  end
  object Label4: TLabel
    Left = 8
    Top = 15
    Width = 90
    Height = 15
    Caption = #21464#26356#21069#26009#21495#65306
  end
  object Label5: TLabel
    Left = 5
    Top = 177
    Width = 90
    Height = 15
    Caption = #21464#26356#21518#26009#21495#65306
  end
  object Label6: TLabel
    Left = 7
    Top = 202
    Width = 90
    Height = 15
    Caption = #21464#26356#21518#35268#26684#65306
  end
  object Label7: TLabel
    Left = 6
    Top = 248
    Width = 98
    Height = 15
    Caption = #21464#26356#21518#20301#21495#65306' '
  end
  object Label8: TLabel
    Left = 6
    Top = 224
    Width = 98
    Height = 15
    Caption = #21464#26356#21518#29992#37327#65306' '
  end
  object Edit2: TEdit
    Left = 92
    Top = 32
    Width = 363
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 92
    Top = 58
    Width = 209
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 92
    Top = 84
    Width = 453
    Height = 61
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 486
    Top = 487
    Width = 70
    Height = 27
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 92
    Top = 6
    Width = 364
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 324
    Width = 550
    Height = 159
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
  end
  object Edit4: TEdit
    Left = 88
    Top = 168
    Width = 369
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 6
    OnKeyPress = Edit4KeyPress
  end
  object Edit5: TEdit
    Left = 88
    Top = 194
    Width = 444
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 7
    OnKeyPress = Edit5KeyPress
  end
  object Panel1: TPanel
    Left = 2
    Top = 158
    Width = 557
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 8
  end
  object Edit6: TEdit
    Left = 89
    Top = 220
    Width = 209
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 9
  end
  object Memo2: TMemo
    Left = 89
    Top = 246
    Width = 456
    Height = 73
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 10
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao where '#21697#21517' like '#39'%'#30005#38459'%'#39)
    Left = 176
    Top = 400
    object ADOQuery1DSDesigner: TStringField
      FieldName = #21697#21517
      Size = 40
    end
    object ADOQuery1DSDesigner2: TStringField
      FieldName = #26009#21495
    end
    object ADOQuery1DSDesigner3: TStringField
      FieldName = #35268#26684#35828#26126
      Size = 100
    end
    object ADOQuery1DSDesigner10: TStringField
      FieldName = #23458#25143
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner11: TWideStringField
      FieldName = #23458#25143#26426#31181#21495
      FixedChar = True
    end
    object ADOQuery1DSDesigner12: TStringField
      FieldName = #21046#36896#21830
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner13: TStringField
      FieldName = #20379#24212#21830
      Size = 200
    end
    object ADOQuery1DSDesigner14: TWideStringField
      FieldName = #21378#23478#26009#21495
      FixedChar = True
    end
    object ADOQuery1DSDesigner15: TStringField
      FieldName = #35268#26684#20070
      Size = 50
    end
    object ADOQuery1DSDesigner16: TStringField
      FieldName = #25215#35748
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner19: TStringField
      FieldName = #20351#29992#26426#31181
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 112
    Top = 424
  end
end
