object APPROVEBOMFM: TAPPROVEBOMFM
  Left = 305
  Top = 152
  BorderStyle = bsDialog
  Caption = #26680#20934'BOM'
  ClientHeight = 363
  ClientWidth = 369
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
    Left = 4
    Top = 15
    Width = 60
    Height = 13
    Caption = #29289#26009#32534#21495#65306
  end
  object Label2: TLabel
    Left = 2
    Top = 39
    Width = 36
    Height = 13
    Caption = #21697#21517#65306
  end
  object Label3: TLabel
    Left = 2
    Top = 63
    Width = 36
    Height = 13
    Caption = #25215#35748#65306
  end
  object Label4: TLabel
    Left = 2
    Top = 87
    Width = 60
    Height = 13
    Caption = #26368#26032#29256#26412#65306
  end
  object Label5: TLabel
    Left = 1
    Top = 112
    Width = 60
    Height = 13
    Caption = #20351#29992#26426#31181#65306
  end
  object Label6: TLabel
    Left = 4
    Top = 135
    Width = 36
    Height = 13
    Caption = #29420#31435#65306
  end
  object Label7: TLabel
    Left = 0
    Top = 208
    Width = 60
    Height = 13
    Caption = #35268#26684#35828#26126#65306
  end
  object DBEdit1: TDBEdit
    Left = 60
    Top = 7
    Width = 301
    Height = 21
    DataField = #26009#21495
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 60
    Top = 31
    Width = 301
    Height = 21
    DataField = #21697#21517
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 60
    Top = 55
    Width = 301
    Height = 21
    DataField = #25215#35748
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 60
    Top = 79
    Width = 301
    Height = 21
    DataField = #26368#26032#29256#26412
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 60
    Top = 103
    Width = 301
    Height = 21
    DataField = #20351#29992#26426#31181
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 60
    Top = 127
    Width = 301
    Height = 21
    DataField = #29366#24577
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 60
    Top = 151
    Width = 301
    Height = 21
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 60
    Top = 174
    Width = 301
    Height = 21
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBMemo1: TDBMemo
    Left = 60
    Top = 199
    Width = 302
    Height = 89
    DataField = #35268#26684#35828#26126
    DataSource = DataSource1
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 4
    Top = 294
    Width = 360
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 9
  end
  object C1: TCheckBox
    Left = 8
    Top = 304
    Width = 97
    Height = 17
    Caption = #32423#32852#26680#20934
    Checked = True
    State = cbChecked
    TabOrder = 10
  end
  object C2: TCheckBox
    Left = 96
    Top = 304
    Width = 97
    Height = 17
    Caption = #35774#20026#29420#31435'BOM'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object C3: TCheckBox
    Left = 192
    Top = 304
    Width = 97
    Height = 17
    Caption = #22791#20221#24403#21069'BOM'
    Checked = True
    State = cbChecked
    TabOrder = 12
  end
  object Button1: TButton
    Left = 216
    Top = 328
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 13
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 292
    Top = 327
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 14
    OnClick = Button2Click
  end
  object C4: TCheckBox
    Left = 8
    Top = 328
    Width = 145
    Height = 17
    Caption = #26356#26032#26426#31181#20449#24687
    Checked = True
    State = cbChecked
    TabOrder = 15
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao')
    Left = 96
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 96
    Top = 88
  end
end
