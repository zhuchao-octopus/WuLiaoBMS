object addliaofm: Taddliaofm
  Left = 234
  Top = 213
  BorderStyle = bsDialog
  Caption = #22686#21152#26032#26009
  ClientHeight = 453
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 14
    Top = 16
    Width = 75
    Height = 15
    Caption = #29289#26009#32534#21495#65306
  end
  object Label2: TLabel
    Left = 14
    Top = 40
    Width = 75
    Height = 15
    Caption = #35268#26684#35828#26126#65306
  end
  object Label3: TLabel
    Left = 14
    Top = 64
    Width = 75
    Height = 15
    Caption = #21333#20301#29992#37327#65306
  end
  object Label4: TLabel
    Left = 14
    Top = 88
    Width = 75
    Height = 15
    Caption = #38646#20214#20301#32622#65306
  end
  object Edit1: TEdit
    Left = 84
    Top = 6
    Width = 469
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 84
    Top = 32
    Width = 469
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clMenu
    ReadOnly = True
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 84
    Top = 58
    Width = 469
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 84
    Top = 84
    Width = 469
    Height = 89
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clInfoBk
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 183
    Width = 625
    Height = 257
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
  end
  object Button1: TButton
    Left = 560
    Top = 28
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 560
    Top = 87
    Width = 75
    Height = 27
    Caption = #20851#38381
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 560
    Top = 56
    Width = 75
    Height = 27
    Caption = #35745#31639#25968#37327
    TabOrder = 7
    OnClick = Button3Click
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao ')
    Left = 224
    Top = 272
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
    Left = 112
    Top = 224
  end
end
