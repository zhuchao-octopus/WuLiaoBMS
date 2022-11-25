inherited checksurplyerfm: Tchecksurplyerfm
  Left = 264
  Top = 175
  Width = 673
  Caption = #23457#26680#20379#24212#21830
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar1: TCoolBar
    Width = 665
    Height = 96
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 65
        Width = 665
      end
      item
        Control = ToolBar2
        ImageIndex = -1
        Width = 665
      end>
    inherited ToolBar2: TToolBar [0]
      Width = 652
      inherited ComboBox1: TComboBox
        Width = 257
      end
    end
    inherited ToolBar1: TToolBar [1]
      Width = 652
      inherited SpeedButton1: TSpeedButton
        Enabled = True
        OnClick = SpeedButton1Click
      end
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited DBGrid1: TDBGrid
    Top = 96
    Width = 665
    Height = 338
  end
  inherited StatusBar1: TStatusBar
    Width = 665
  end
  inherited AQ: TADOQuery
    SQL.Strings = (
      'select * from surplyer where '#23457#26680'='#39#26410#23457#26680#39)
  end
end
