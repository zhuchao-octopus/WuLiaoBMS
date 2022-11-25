object printcrsoptionfm: Tprintcrsoptionfm
  Left = 231
  Top = 160
  BorderStyle = bsDialog
  Caption = #36873#25321#20379#24212#21830
  ClientHeight = 388
  ClientWidth = 576
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
  object R1: TRadioButton
    Left = 10
    Top = 31
    Width = 209
    Height = 17
    Caption = #36890#29992#25215#35748#20070#23553#38754#20351#29992#25720#26495#19968'   '
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object R2: TRadioButton
    Left = 205
    Top = 30
    Width = 201
    Height = 17
    Caption = #22797#21512#25215#35748#20070#23553#38754#20351#29992#25720#26495#20108' '
    TabOrder = 1
  end
  object R3: TRadioButton
    Left = 400
    Top = 30
    Width = 201
    Height = 17
    Caption = #26009#21495#25209#37327#25215#35748' '#20070#23553#38754' '
    TabOrder = 2
  end
  object Button1: TButton
    Left = 416
    Top = 359
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 496
    Top = 358
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
  object Panel2: TPanel
    Left = 3
    Top = 51
    Width = 569
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 561
    Height = 112
    Color = clScrollBar
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
  end
  object C1: TCheckBox
    Left = 16
    Top = 64
    Width = 97
    Height = 17
    Caption = #36873#25321#20379#24212#21830
    Checked = True
    Color = clMenu
    ParentColor = False
    State = cbChecked
    TabOrder = 7
    OnClick = C1Click
  end
  object Edit1: TEdit
    Left = 99
    Top = 61
    Width = 196
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 8
    OnKeyPress = Edit1KeyPress
  end
  object DBNavigator1: TDBNavigator
    Left = 312
    Top = 61
    Width = 220
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 9
  end
  object C2: TCheckBox
    Left = 14
    Top = 207
    Width = 97
    Height = 17
    Caption = #36873#25321#21046#36896#21830
    TabOrder = 10
  end
  object DBGrid2: TDBGrid
    Left = 9
    Top = 226
    Width = 560
    Height = 120
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    OnDrawColumnCell = DBGrid2DrawColumnCell
  end
  object Edit2: TEdit
    Left = 104
    Top = 203
    Width = 201
    Height = 20
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 12
    OnKeyPress = Edit2KeyPress
  end
  object DBNavigator2: TDBNavigator
    Left = 317
    Top = 200
    Width = 220
    Height = 25
    DataSource = DataSource2
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    TabOrder = 13
  end
  object Panel1: TPanel
    Left = 3
    Top = 354
    Width = 569
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 14
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 152
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from surplyer ')
    Left = 112
    Top = 160
    object ADOQuery1DSDesigner: TStringField
      FieldName = #31616#31216
      Size = 10
    end
    object ADOQuery1DSDesigner2: TWideStringField
      FieldName = #20840#21517
      FixedChar = True
    end
    object ADOQuery1DSDesigner3: TStringField
      FieldName = #22320#22336
      Size = 50
    end
    object ADOQuery1DSDesigner4: TStringField
      FieldName = #32852#32476#20154
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner5: TWideStringField
      FieldName = #21150#20844#30005#35805
      FixedChar = True
    end
    object ADOQuery1DSDesigner6: TWideStringField
      FieldName = #20256#30495
      FixedChar = True
    end
    object ADOQuery1DSDesigner7: TStringField
      FieldName = #24615#36136
      Size = 50
    end
    object ADOQuery1DSDesigner8: TStringField
      FieldName = #23457#26680
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner9: TStringField
      FieldName = #22791#27880
      Size = 200
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 184
    Top = 232
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from surplyer')
    Left = 240
    Top = 272
    object ADOQuery2StringField: TStringField
      FieldName = #31616#31216
      Size = 10
    end
    object ADOQuery2WideStringField: TWideStringField
      FieldName = #20840#21517
      FixedChar = True
    end
    object ADOQuery2StringField2: TStringField
      FieldName = #22320#22336
      Size = 50
    end
    object ADOQuery2StringField3: TStringField
      FieldName = #32852#32476#20154
      FixedChar = True
      Size = 10
    end
    object ADOQuery2WideStringField2: TWideStringField
      FieldName = #21150#20844#30005#35805
      FixedChar = True
    end
    object ADOQuery2WideStringField3: TWideStringField
      FieldName = #20256#30495
      FixedChar = True
    end
    object ADOQuery2StringField4: TStringField
      FieldName = #24615#36136
      Size = 50
    end
    object ADOQuery2StringField5: TStringField
      FieldName = #23457#26680
      FixedChar = True
      Size = 10
    end
    object ADOQuery2StringField6: TStringField
      FieldName = #22791#27880
      Size = 200
    end
  end
end
