object bomlistfm: Tbomlistfm
  Left = 398
  Top = 181
  BorderStyle = bsDialog
  Caption = 'BOM'#21015#34920
  ClientHeight = 453
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 286
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 136
      Top = 1
      Width = 65
      Height = 40
      Caption = #30830#23450
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 216
      Top = 1
      Width = 65
      Height = 40
      Caption = #20851#38381
      OnClick = SpeedButton2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 286
    Height = 412
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
    Top = 88
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM lingjianliaohao WHERE '#21697#21517' LIKE '#39'%'#25104#21697'%'#39)
    Left = 112
    Top = 192
  end
end
