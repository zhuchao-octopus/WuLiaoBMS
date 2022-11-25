object checklhfm: Tchecklhfm
  Left = 335
  Top = 319
  BorderStyle = bsDialog
  Caption = #26816#26597#36873#39033
  ClientHeight = 309
  ClientWidth = 341
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
    Top = 132
    Width = 48
    Height = 13
    Caption = #26816#26597#33539#22260
  end
  object Label2: TLabel
    Left = 8
    Top = 4
    Width = 48
    Height = 13
    Caption = #26816#26597#39033#30446
  end
  object C1: TCheckBox
    Left = 16
    Top = 24
    Width = 209
    Height = 17
    Caption = #26816#26597#26009#21495#26159#21542#22312#24211#20013#23384#22312
    Checked = True
    State = cbChecked
    TabOrder = 0
  end
  object C2: TCheckBox
    Left = 16
    Top = 48
    Width = 273
    Height = 17
    Caption = #22914#26524#26009#21495#22312#26009#24211#20013#19981#23384#22312#65292#21017#33258#21160#30003#35831
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object C3: TCheckBox
    Left = 16
    Top = 72
    Width = 137
    Height = 17
    Caption = #27178#21521#26816#26597#20301#21495
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = C3Click
  end
  object C4: TCheckBox
    Left = 16
    Top = 96
    Width = 225
    Height = 17
    Caption = #32437#21521#26816#26597#20301#21495
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = C4Click
  end
  object Panel1: TPanel
    Left = 2
    Top = 146
    Width = 337
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 4
    Top = 18
    Width = 337
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 5
  end
  object R1: TRadioButton
    Left = 16
    Top = 160
    Width = 113
    Height = 17
    Caption = #22312#24403#21069'BOM'#26816#26597
    Checked = True
    TabOrder = 6
    TabStop = True
  end
  object R2: TRadioButton
    Left = 152
    Top = 160
    Width = 113
    Height = 17
    Caption = #32423#32852#26816#26597
    Enabled = False
    TabOrder = 7
    OnClick = R2Click
  end
  object Panel3: TPanel
    Left = -3
    Top = 242
    Width = 341
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 8
  end
  object Button1: TButton
    Left = 183
    Top = 248
    Width = 75
    Height = 25
    Caption = #24320#22987#26816#26597
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 248
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 10
    OnClick = Button2Click
  end
end
