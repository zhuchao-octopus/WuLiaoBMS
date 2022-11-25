object Form11: TForm11
  Left = 291
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #23548#20837#21040'EXCEL'
  ClientHeight = 312
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 32
    Top = 21
    Width = 80
    Height = 13
    Caption = #27880#24847#20107#39033'    '
  end
  object Label4: TLabel
    Left = 56
    Top = 48
    Width = 399
    Height = 13
    Caption = #22312#20320#23548#20837#25968#25454#20043#21069#19968#23450#35201#30830#23450#35201#23548#20837#30340'EXCEL'#34920#22788#20110#28608#27963#29366#24577#24182#19988#25968#25454
  end
  object Label5: TLabel
    Left = 34
    Top = 71
    Width = 274
    Height = 13
    Caption = #26684#24335#21015#39034#24207#35201#19982#25968#25454#24211#30456#21305#37197'.              '
  end
  object Label1: TLabel
    Left = 29
    Top = 134
    Width = 112
    Height = 13
    Caption = #26377#25928#34892' '#12288#12288' '#20174#12288' '
  end
  object Label2: TLabel
    Left = 30
    Top = 160
    Width = 60
    Height = 13
    Caption = #26377#25928#21015'   '
  end
  object SpeedButton1: TSpeedButton
    Left = 376
    Top = 123
    Width = 70
    Height = 27
    Caption = #24320#22987#23548#20837
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 368
    Top = 270
    Width = 74
    Height = 26
    Caption = #20851#38381
    OnClick = SpeedButton2Click
  end
  object Label6: TLabel
    Left = 32
    Top = 187
    Width = 86
    Height = 13
    Caption = #23548#20837#21015#36827#24230'   '
  end
  object Label7: TLabel
    Left = 32
    Top = 227
    Width = 86
    Height = 13
    Caption = #23548#20837#34892#36827#24230'   '
  end
  object Label8: TLabel
    Left = 29
    Top = 106
    Width = 91
    Height = 13
    Caption = #36873#25321#30446#26631#25968#25454#34920
  end
  object Label9: TLabel
    Left = 237
    Top = 131
    Width = 39
    Height = 13
    Caption = #21040#12288#12288
  end
  object Panel1: TPanel
    Left = 8
    Top = 92
    Width = 459
    Height = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 32
    Top = 204
    Width = 412
    Height = 20
    Step = 1
    TabOrder = 1
  end
  object ProgressBar2: TProgressBar
    Left = 32
    Top = 241
    Width = 412
    Height = 21
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 128
    Top = 127
    Width = 97
    Height = 21
    TabOrder = 3
    Text = '2'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 128
    Top = 153
    Width = 240
    Height = 21
    TabOrder = 4
    Text = '4'
    OnChange = Edit2Change
  end
  object Panel2: TPanel
    Left = 8
    Top = 182
    Width = 457
    Height = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 5
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 100
    Width = 240
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 6
    Text = #22522#26412#38646#20214#26009#21495#34920
    Items.Strings = (
      #22522#26412#38646#20214#26009#21495#34920)
  end
  object Panel3: TPanel
    Left = 7
    Top = 34
    Width = 459
    Height = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 7
  end
  object Edit3: TEdit
    Left = 256
    Top = 128
    Width = 112
    Height = 21
    TabOrder = 8
    OnChange = Edit3Change
  end
end
