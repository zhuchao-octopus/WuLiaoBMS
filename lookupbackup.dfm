object lookupbackupfm: Tlookupbackupfm
  Left = 204
  Top = 172
  Width = 696
  Height = 480
  Caption = #22791#20221#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 48
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 45
        Width = 684
      end>
    object ToolBar1: TToolBar
      Left = 9
      Top = 0
      Width = 671
      Height = 45
      ButtonHeight = 43
      Caption = 'ToolBar1'
      EdgeBorders = []
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 2
        Width = 32
        Height = 43
        Caption = #25171#21360
      end
      object SpeedButton2: TSpeedButton
        Left = 32
        Top = 2
        Width = 32
        Height = 43
        Caption = #23548#20986
      end
      object SpeedButton3: TSpeedButton
        Left = 64
        Top = 2
        Width = 32
        Height = 43
        Caption = #20851#38381
        OnClick = SpeedButton3Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 688
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 0
      Top = 2
      Width = 686
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnKeyPress = ComboBox1KeyPress
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 74
    Width = 688
    Height = 360
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Text = #22791#20221#26597#35810
        Width = 50
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 248
    Top = 184
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ADOQuery1
    Left = 128
    Top = 200
  end
end
