object CHECKECNFM: TCHECKECNFM
  Left = 223
  Top = 135
  BorderStyle = bsDialog
  Caption = #26680#20934'ECN'
  ClientHeight = 377
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 17
    Width = 60
    Height = 13
    Caption = #29289#26009#32534#21495#65306
  end
  object Label2: TLabel
    Left = 8
    Top = 41
    Width = 60
    Height = 13
    Caption = #35268#26684#35828#26126#65306
  end
  object Label3: TLabel
    Left = 9
    Top = 64
    Width = 60
    Height = 13
    Caption = #20351#29992#26426#31181#65306
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 88
    Width = 635
    Height = 209
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 64
    Top = 8
    Width = 257
    Height = 21
    DataField = #26009#21495
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 64
    Top = 32
    Width = 489
    Height = 21
    DataField = #35268#26684#35828#26126
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 64
    Top = 56
    Width = 577
    Height = 21
    DataField = #20351#29992#26426#31181
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 3
  end
  object C1: TCheckBox
    Left = 16
    Top = 304
    Width = 97
    Height = 17
    Caption = #26680#20934#24403#21069'ECN  '
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object C2: TCheckBox
    Left = 120
    Top = 304
    Width = 193
    Height = 17
    Caption = #26680#20934#21518#31435#21363#24212#29992#24403#21069'ECN '
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 489
    Top = 338
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 566
    Top = 338
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object Panel1: TPanel
    Left = 3
    Top = 330
    Width = 638
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 8
  end
  object ADOTable1: TADOTable
    Connection = DM.ADOConnection1
    Left = 56
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 104
    Top = 264
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao')
    Left = 128
    Top = 32
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = ADOQuery1
    Left = 176
    Top = 24
  end
end
