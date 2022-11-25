inherited lookupsurplyerfm: Tlookupsurplyerfm
  Left = 229
  Top = 202
  Caption = #26597#35810#20379#24212#21830
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar1: TCoolBar
    Height = 99
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 65
        Width = 688
      end
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 27
        Width = 688
      end>
    inherited ToolBar2: TToolBar [0]
      Height = 27
      ButtonHeight = 27
      object Label2: TLabel [0]
        Left = 0
        Top = 2
        Width = 36
        Height = 27
        Caption = #31616#31216#65306
      end
      inherited ComboBox1: TComboBox
        Left = 36
        Top = 5
        Width = 173
      end
      object ToolBar3: TToolBar
        Left = 209
        Top = 2
        Width = 368
        Height = 27
        ButtonHeight = 13
        Caption = 'ToolBar3'
        EdgeBorders = []
        TabOrder = 1
        Transparent = False
        object Label1: TLabel
          Left = 0
          Top = 2
          Width = 52
          Height = 13
          Caption = #32852#32476#20154#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object ComboBox2: TComboBox
          Left = 52
          Top = 2
          Width = 205
          Height = 21
          BevelKind = bkSoft
          Color = clInfoBk
          ItemHeight = 13
          TabOrder = 0
          OnKeyPress = ComboBox2KeyPress
        end
      end
    end
    inherited ToolBar1: TToolBar [1]
      inherited SpeedButton6: TSpeedButton
        Width = 42
      end
      inherited DBNavigator1: TDBNavigator [1]
        Left = 42
        Width = 150
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited ToolButton1: TToolButton [2]
        Left = 192
      end
      inherited SpeedButton1: TSpeedButton [3]
        Left = 200
      end
      inherited ToolButton2: TToolButton [4]
        Left = 240
      end
      inherited SpeedButton3: TSpeedButton
        Left = 248
      end
    end
  end
  inherited DBGrid1: TDBGrid
    Top = 99
    Height = 328
    Color = clWhite
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
  end
end
