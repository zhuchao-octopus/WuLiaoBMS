object bommapingfm: Tbommapingfm
  Left = 599
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #24341#29992#21015#34920
  ClientHeight = 229
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid3: TDBGrid
    Left = 0
    Top = 0
    Width = 410
    Height = 229
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object AQ: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from BomMapping')
    Left = 48
    Top = 56
    object AQmn2: TStringField
      DisplayLabel = #19978#32423'BOM'#26009#21495
      FieldName = 'mn'
      Size = 50
    end
    object AQcn: TWideStringField
      DisplayLabel = #24403#21069'BOM'#26009#21495
      FieldName = 'cn'
      FixedChar = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ
    Left = 8
    Top = 120
  end
end
