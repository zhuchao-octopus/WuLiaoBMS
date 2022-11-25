object BOMINFOFM: TBOMINFOFM
  Left = 311
  Top = 143
  BorderStyle = bsDialog
  Caption = #35814#32454#20449#24687
  ClientHeight = 368
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 14
    Width = 29
    Height = 13
    Caption = #26009#21495
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 29
    Height = 13
    Caption = #21697#21517
  end
  object Label3: TLabel
    Left = 8
    Top = 63
    Width = 43
    Height = 13
    Caption = #35268#26684
  end
  object Label4: TLabel
    Left = 8
    Top = 88
    Width = 39
    Height = 13
    Caption = #25215#35748
  end
  object Label5: TLabel
    Left = 8
    Top = 112
    Width = 33
    Height = 13
    Caption = #26426#31181
  end
  object Label6: TLabel
    Left = 8
    Top = 137
    Width = 30
    Height = 13
    Caption = #21019#24314
  end
  object Label7: TLabel
    Left = 8
    Top = 158
    Width = 34
    Height = 13
    Caption = #38145#23450
  end
  object Label8: TLabel
    Left = 8
    Top = 182
    Width = 29
    Height = 13
    Caption = #29420#31435
  end
  object Label9: TLabel
    Left = 10
    Top = 207
    Width = 29
    Height = 13
    Caption = #23458#25143
  end
  object Label10: TLabel
    Left = 10
    Top = 231
    Width = 28
    Height = 13
    Caption = #29256#26412
  end
  object Label11: TLabel
    Left = 10
    Top = 254
    Width = 29
    Height = 13
    Caption = #25104#26412
  end
  object DBEdit1: TDBEdit
    Left = 48
    Top = 8
    Width = 369
    Height = 21
    DataField = #26009#21495
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 48
    Top = 32
    Width = 369
    Height = 21
    DataField = #21697#21517
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 48
    Top = 56
    Width = 369
    Height = 21
    DataField = #35268#26684#35828#26126
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 48
    Top = 80
    Width = 369
    Height = 21
    DataField = #25215#35748
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 48
    Top = 104
    Width = 369
    Height = 21
    DataField = #26426#31181
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 48
    Top = 127
    Width = 369
    Height = 21
    DataField = #30003#35831#20154
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 48
    Top = 150
    Width = 369
    Height = 21
    DataField = #38145
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 48
    Top = 174
    Width = 369
    Height = 21
    DataField = #29366#24577
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 48
    Top = 198
    Width = 369
    Height = 21
    DataField = #23458#25143
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 2
    Top = 333
    Width = 418
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 9
  end
  object BitBtn1: TBitBtn
    Left = 267
    Top = 338
    Width = 75
    Height = 25
    Caption = #30830#23450
    Enabled = False
    TabOrder = 10
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 338
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 11
    OnClick = BitBtn2Click
  end
  object DBEdit10: TDBEdit
    Left = 48
    Top = 222
    Width = 369
    Height = 21
    DataField = #26368#26032#29256#26412
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 12
  end
  object DBEdit11: TDBEdit
    Left = 48
    Top = 246
    Width = 369
    Height = 21
    DataField = #21333#20215
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 13
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao ')
    Left = 128
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
    Top = 288
  end
end
