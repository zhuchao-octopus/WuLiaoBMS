object openbomfm: Topenbomfm
  Left = 237
  Top = 154
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'Open'
  ClientHeight = 287
  ClientWidth = 647
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
  object Label1: TLabel
    Left = 10
    Top = 11
    Width = 107
    Height = 15
    Caption = #26597#25214'BOM'#26009#21495#65306' '
  end
  object Label2: TLabel
    Left = 7
    Top = 233
    Width = 45
    Height = 15
    Caption = #26009#21495#65306
  end
  object Label3: TLabel
    Left = 8
    Top = 260
    Width = 75
    Height = 15
    Caption = #26009#21495#31867#22411#65306
  end
  object Label4: TLabel
    Left = 546
    Top = 8
    Width = 68
    Height = 15
    Caption = #35268#26684#35828#26126' '
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 32
    Width = 505
    Height = 185
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
  end
  object ComboBox1: TComboBox
    Left = 104
    Top = 4
    Width = 313
    Height = 23
    ItemHeight = 15
    TabOrder = 1
    OnKeyPress = ComboBox1KeyPress
  end
  object DBNavigator1: TDBNavigator
    Left = 424
    Top = 1
    Width = 88
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 80
    Top = 224
    Width = 338
    Height = 23
    TabOrder = 3
  end
  object CB: TComboBox
    Left = 80
    Top = 251
    Width = 338
    Height = 23
    ItemHeight = 15
    TabOrder = 4
    Text = #25152#26377#23384#22312'BOM'
    OnChange = CBChange
    Items.Strings = (
      #25104#21697'BOM'
      #21322#25104#21697'BOM'
      #29992#25143#33258#24049#21019#24314#30340'BOM'
      #25152#26377#23384#22312'BOM')
  end
  object Button1: TButton
    Left = 439
    Top = 224
    Width = 75
    Height = 25
    Caption = #25171#24320
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 439
    Top = 256
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 6
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 519
    Top = 32
    Width = 122
    Height = 209
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    Lines.Strings = (
      #35268#26684#35828#26126)
    TabOrder = 7
  end
  object BitBtn1: TBitBtn
    Left = 520
    Top = 256
    Width = 75
    Height = 25
    Caption = #22797#21046#26009#21495
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 80
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao where '#26009#21495' like '#39'99%'#39)
    Left = 152
    Top = 80
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
    object ADOQuery1DSDesigner4: TStringField
      FieldName = #26426#31181
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner6: TStringField
      FieldName = #26368#26032#29256#26412
      Size = 50
    end
    object ADOQuery1DSDesigner7: TStringField
      FieldName = #21333#20301#29992#37327
      Size = 50
    end
    object ADOQuery1DSDesigner8: TStringField
      FieldName = #24037#21333#29992#37327
      Size = 50
    end
    object ADOQuery1DSDesigner9: TStringField
      FieldName = #38646#20214#20301#32622
      Size = 200
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
    object ADOQuery1DSDesigner17: TBCDField
      FieldName = #21333#20215
      Precision = 20
    end
    object ADOQuery1DSDesigner18: TStringField
      FieldName = #24065#31181
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner19: TStringField
      FieldName = #20351#29992#26426#31181
      Size = 100
    end
    object ADOQuery1DSDesigner20: TStringField
      FieldName = #30003#35831#20154
      FixedChar = True
    end
  end
end
