object Form1: TForm1
  Left = 184
  Top = 137
  Width = 566
  Height = 359
  Caption = 'createecrmodelfm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 558
    Height = 41
    ButtonHeight = 39
    ButtonWidth = 8
    Caption = 'ToolBar1'
    EdgeBorders = [ebBottom]
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 2
      Width = 33
      Height = 39
      Caption = 'open'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 33
      Top = 2
      Width = 40
      Height = 39
      Caption = 'save'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 73
      Top = 2
      Width = 40
      Height = 39
      Caption = 'check'
      Flat = True
      OnClick = SpeedButton3Click
    end
  end
  object OleContainer1: TOleContainer
    Left = 0
    Top = 41
    Width = 558
    Height = 291
    Align = alClient
    Caption = 'OleContainer1'
    TabOrder = 1
  end
  object OD: TOpenDialog
    Left = 64
    Top = 128
  end
  object sd: TSaveDialog
    Left = 96
    Top = 56
  end
end
