object appliaohaofm: Tappliaohaofm
  Left = 188
  Top = 80
  BorderStyle = bsDialog
  Caption = #30003#35831#26009#21495
  ClientHeight = 568
  ClientWidth = 563
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 3
    Top = 304
    Width = 65
    Height = 13
    Caption = #35268#21017#25552#31034#65306
    Visible = False
  end
  object SpeedButton2: TSpeedButton
    Left = 512
    Top = 455
    Width = 31
    Height = 22
    Caption = '...'
    OnClick = SpeedButton2Click
  end
  object PageControl1: TPageControl
    Left = 5
    Top = 2
    Width = 554
    Height = 534
    ActivePage = TabSheet1
    TabOrder = 17
    object TabSheet1: TTabSheet
      Caption = #26009#21495#30003#35831#21333
      object Label11: TLabel
        Left = 5
        Top = 485
        Width = 85
        Height = 13
        Caption = #19978#20256#35268#26684#20070#65306' '
      end
      object Label12: TLabel
        Left = 4
        Top = 463
        Width = 78
        Height = 13
        Caption = #35268#26684#20070#21517#31216#65306
      end
      object Label7: TLabel
        Left = 3
        Top = 196
        Width = 65
        Height = 13
        Caption = #35268#26684#35828#26126#65306
      end
      object Label10: TLabel
        Left = 3
        Top = 175
        Width = 65
        Height = 13
        Caption = #20351#29992#26426#31181#65306
      end
      object Label9: TLabel
        Left = 3
        Top = 153
        Width = 52
        Height = 13
        Caption = #21046#36896#21830#65306
      end
      object Label6: TLabel
        Left = 3
        Top = 129
        Width = 39
        Height = 13
        Caption = #29256#26412#65306
      end
      object Label5: TLabel
        Left = 3
        Top = 105
        Width = 65
        Height = 13
        Caption = #21378#23478#26009#21495#65306
      end
      object Label4: TLabel
        Left = 3
        Top = 80
        Width = 66
        Height = 13
        Caption = #30003' '#35831' '#20154#65306
      end
      object Label3: TLabel
        Left = 3
        Top = 56
        Width = 66
        Height = 13
        Caption = #20379' '#24212' '#21830#65306
      end
      object Label2: TLabel
        Left = 3
        Top = 33
        Width = 60
        Height = 13
        Caption = #26009'   '#21495#65306
      end
      object Label1: TLabel
        Left = 3
        Top = 10
        Width = 60
        Height = 13
        Caption = #21697'   '#21517#65306
      end
      object SpeedButton1: TSpeedButton
        Left = 468
        Top = 44
        Width = 73
        Height = 25
        Caption = #26597#35810#20379#24212#21830
        OnClick = SpeedButton1Click
      end
    end
  end
  object Edit1: TEdit
    Left = 72
    Top = 28
    Width = 345
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 72
    Top = 52
    Width = 281
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 1
    OnChange = Edit2Change
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 72
    Top = 74
    Width = 379
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 72
    Top = 97
    Width = 201
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clGrayText
    ReadOnly = True
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 72
    Top = 121
    Width = 321
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 72
    Top = 218
    Width = 474
    Height = 89
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    ScrollBars = ssBoth
    TabOrder = 5
    OnKeyPress = Memo1KeyPress
  end
  object Memo2: TMemo
    Left = 8
    Top = 327
    Width = 475
    Height = 147
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clGrayText
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 6
    Visible = False
  end
  object Button1: TButton
    Left = 475
    Top = 136
    Width = 75
    Height = 49
    Caption = #25552#20132
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 475
    Top = 537
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 8
    OnClick = Button2Click
  end
  object Edit6: TEdit
    Left = 72
    Top = 169
    Width = 353
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 9
  end
  object Edit7: TEdit
    Left = 72
    Top = 193
    Width = 474
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 10
  end
  object Edit8: TEdit
    Left = 88
    Top = 481
    Width = 385
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 11
  end
  object Edit9: TEdit
    Left = 88
    Top = 504
    Width = 329
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 12
  end
  object BitBtn1: TBitBtn
    Left = 475
    Top = 479
    Width = 75
    Height = 25
    Caption = #19978#20256
    Enabled = False
    TabOrder = 13
    OnClick = BitBtn1Click
  end
  object Edit10: TEdit
    Left = 72
    Top = 145
    Width = 151
    Height = 21
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    TabOrder = 14
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 310
    Width = 542
    Height = 165
    Color = clScrollBar
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 15
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
  end
  object Button3: TButton
    Left = 437
    Top = 27
    Width = 113
    Height = 25
    Caption = #26597#30475#24050#30003#35831#30340#26009#21495
    TabOrder = 16
    OnClick = Button3Click
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 104
    Top = 512
  end
  object ADOTable1: TADOTable
    Connection = DM.ADOConnection1
    TableName = 'prelingjianliaohao'
    Left = 40
    Top = 384
  end
  object OpenDialog1: TOpenDialog
    Left = 424
    Top = 272
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from lingjianliaohao ')
    Left = 656
    Top = 184
    object ADOQuery2DSDesigner: TStringField
      FieldName = #21697#21517
      Size = 40
    end
    object ADOQuery2DSDesigner2: TWideStringField
      FieldName = #26009#21495
      FixedChar = True
    end
    object ADOQuery2DSDesigner3: TStringField
      FieldName = #35268#26684#35828#26126
      Size = 100
    end
    object ADOQuery2DSDesigner4: TStringField
      FieldName = #26426#31181
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner6: TStringField
      FieldName = #26368#26032#29256#26412
      Size = 50
    end
    object ADOQuery2DSDesigner10: TStringField
      FieldName = #23458#25143
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner11: TWideStringField
      FieldName = #23458#25143#26426#31181#21495
      FixedChar = True
    end
    object ADOQuery2DSDesigner12: TStringField
      FieldName = #21046#36896#21830
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner13: TStringField
      FieldName = #20379#24212#21830
      Size = 200
    end
    object ADOQuery2DSDesigner14: TWideStringField
      FieldName = #21378#23478#26009#21495
      FixedChar = True
    end
    object ADOQuery2DSDesigner15: TStringField
      FieldName = #35268#26684#20070
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner16: TStringField
      FieldName = #25215#35748
      FixedChar = True
      Size = 10
    end
    object ADOQuery2DSDesigner19: TStringField
      FieldName = #30003#35831#20154
      FixedChar = True
    end
    object ADOQuery2DSDesigner20: TStringField
      FieldName = #20351#29992#26426#31181
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 600
    Top = 128
  end
end
