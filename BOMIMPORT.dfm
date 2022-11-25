inherited BOMIMPORTFM: TBOMIMPORTFM
  Left = 223
  Top = 168
  Caption = #23548#20837'BOM'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Panels = <
      item
        Width = 150
      end
      item
        Text = #23548#20837'BOM'
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object lhdb: TADOTable
    Connection = DM.ADOConnection1
    TableName = 'lingjianliaohao'
    Left = 248
    Top = 224
  end
  object ADOCommand1: TADOCommand
    Parameters = <>
    Left = 384
    Top = 200
  end
end
