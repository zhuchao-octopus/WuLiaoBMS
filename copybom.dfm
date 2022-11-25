object copybomfm: Tcopybomfm
  Left = 235
  Top = 200
  BorderStyle = bsDialog
  Caption = #25335#36125'BOM'
  ClientHeight = 200
  ClientWidth = 481
  Color = clBtnFace
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
  object Label1: TLabel
    Left = 7
    Top = 52
    Width = 126
    Height = 13
    Caption = #26032#30340#30446#26631'BOM'#26009#21495#65306'  '
  end
  object SpeedButton1: TSpeedButton
    Left = 416
    Top = 23
    Width = 54
    Height = 23
    Caption = '...'
    OnClick = SpeedButton1Click
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 119
    Height = 13
    Caption = #35201#25335#36125#30340#28304'BOM'#26009#21495' '
  end
  object SpeedButton2: TSpeedButton
    Left = 416
    Top = 65
    Width = 54
    Height = 22
    Caption = '...'
    OnClick = SpeedButton2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 66
    Width = 400
    Height = 21
    Color = clMenu
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 4
    Top = 93
    Width = 477
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 1
  end
  object Button1: TButton
    Left = 322
    Top = 101
    Width = 75
    Height = 25
    Caption = #24320#22987#22797#21046
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 402
    Top = 101
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 3
    OnClick = Button2Click
  end
  object Panel2: TPanel
    Left = 3
    Top = 157
    Width = 476
    Height = 38
    Caption = #35831#31245#21518#65281'...'#27491#22312#22797#21046#24403#21069'BOM'#65281#65281
    TabOrder = 4
    Visible = False
  end
  object Edit2: TEdit
    Left = 8
    Top = 24
    Width = 400
    Height = 21
    Color = clMenu
    TabOrder = 5
  end
  object R1: TRadioButton
    Left = 8
    Top = 104
    Width = 233
    Height = 17
    Caption = #22914#26524#23384#22312#30456#21516'BOM'#20801#35768#35206#30422'  '
    TabOrder = 6
  end
  object R2: TRadioButton
    Left = 8
    Top = 120
    Width = 249
    Height = 17
    Caption = #22914#26524'BOM'#23384#22312#22797#21046#29289#26009#36861#21152#21040#30446#26631'BOM'#20013'  '
    TabOrder = 7
  end
  object R3: TRadioButton
    Left = 8
    Top = 137
    Width = 313
    Height = 17
    Caption = #22914#26524'BOM'#23384#22312#19981#25191#34892#20219#20309#25805#20316
    Checked = True
    TabOrder = 8
    TabStop = True
  end
  object AD: TADOCommand
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 48
    Top = 160
  end
  object ADOTable1: TADOTable
    Connection = DM.ADOConnection1
    TableName = 'lingjianliaohao'
    Left = 96
    Top = 152
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 208
    Top = 176
  end
end
