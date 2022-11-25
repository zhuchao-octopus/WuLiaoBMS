object tidailiaofm: Ttidailiaofm
  Left = 237
  Top = 171
  BorderStyle = bsDialog
  Caption = #22686#21152#29289#26009#36873#39033
  ClientHeight = 440
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 41
    Top = 69
    Width = 75
    Height = 15
    Caption = #21333#20301#29992#37327#65306
  end
  object Label2: TLabel
    Left = 40
    Top = 44
    Width = 75
    Height = 15
    Caption = #35268#26684#35828#26126#65306
  end
  object Label3: TLabel
    Left = 40
    Top = 235
    Width = 120
    Height = 15
    Caption = #26367#20195#26009#35268#26684#35828#26126#65306
  end
  object Label4: TLabel
    Left = 17
    Top = 88
    Width = 75
    Height = 15
    Caption = #38646#20214#20301#32622#65306
  end
  object R1: TRadioButton
    Left = 21
    Top = 17
    Width = 113
    Height = 17
    Caption = #22686#21152#29289#26009
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = R1Click
  end
  object R2: TRadioButton
    Left = 22
    Top = 206
    Width = 113
    Height = 17
    Caption = #22686#21152#19968#26367#20195#26009#65306
    TabOrder = 1
    OnClick = R2Click
  end
  object BitBtn1: TBitBtn
    Left = 360
    Top = 405
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 109
    Top = 59
    Width = 376
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 109
    Top = 7
    Width = 376
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 4
    OnKeyPress = Edit2KeyPress
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 256
    Width = 530
    Height = 138
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
  end
  object Edit3: TEdit
    Left = 109
    Top = 33
    Width = 408
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 6
    OnKeyPress = Edit3KeyPress
  end
  object Panel2: TPanel
    Left = -1
    Top = 187
    Width = 537
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 7
  end
  object Button1: TButton
    Left = 438
    Top = 405
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 8
    OnClick = Button1Click
  end
  object Edit4: TEdit
    Left = 152
    Top = 200
    Width = 334
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 9
    OnKeyPress = Edit4KeyPress
  end
  object Edit5: TEdit
    Left = 152
    Top = 227
    Width = 368
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 10
    OnKeyPress = Edit5KeyPress
  end
  object Memo1: TMemo
    Left = 86
    Top = 88
    Width = 443
    Height = 91
    BevelKind = bkSoft
    BorderStyle = bsNone
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao where '#21697#21517' like '#39'%'#30005#38459'%'#39)
    Left = 232
    Top = 192
    object ADOQuery1DSDesigner: TStringField
      FieldName = #21697#21517
      Size = 40
    end
    object ADOQuery1DSDesigner2: TStringField
      FieldName = #26009#21495
    end
    object ADOQuery1DSDesigner3: TStringField
      FieldName = #35268#26684#35828#26126
      Size = 100
    end
    object ADOQuery1DSDesigner11: TWideStringField
      FieldName = #23458#25143#26426#31181#21495
      FixedChar = True
    end
    object ADOQuery1DSDesigner12: TStringField
      FieldName = #21046#36896#21830
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner13: TStringField
      FieldName = #20379#24212#21830
      Size = 200
    end
    object ADOQuery1DSDesigner14: TWideStringField
      FieldName = #21378#23478#26009#21495
      FixedChar = True
    end
    object ADOQuery1DSDesigner15: TStringField
      FieldName = #35268#26684#20070
      Size = 50
    end
    object ADOQuery1DSDesigner16: TStringField
      FieldName = #25215#35748
      FixedChar = True
      Size = 10
    end
    object ADOQuery1DSDesigner19: TStringField
      FieldName = #20351#29992#26426#31181
      Size = 100
    end
    object ADOQuery1DSDesigner20: TStringField
      FieldName = #30003#35831#20154
      FixedChar = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 144
    Top = 176
  end
end
