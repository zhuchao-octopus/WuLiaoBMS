object ecnroptionfm: Tecnroptionfm
  Left = 26
  Top = 144
  BorderStyle = bsDialog
  Caption = 'ECN/ECR'
  ClientHeight = 162
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 80
    Width = 98
    Height = 13
    Caption = #35831#36873#25321#21457#25991#21333#20301' '
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 98
    Height = 13
    Caption = #35831#36873#25321#36755#20986#26684#24335' '
  end
  object ECN: TRadioButton
    Left = 48
    Top = 31
    Width = 113
    Height = 17
    Caption = #36755#20986'ECN'
    TabOrder = 0
  end
  object ECR: TRadioButton
    Left = 48
    Top = 55
    Width = 153
    Height = 17
    Caption = #35797#20135'BOM'#21464#26356#36890#30693#21333'  '
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 5
    Top = 94
    Width = 402
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 5
    Top = 127
    Width = 402
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 104
    Width = 97
    Height = 17
    Caption = 'QAD'
    TabOrder = 4
  end
  object CheckBox2: TCheckBox
    Left = 70
    Top = 104
    Width = 97
    Height = 17
    Caption = 'ENG'
    TabOrder = 5
  end
  object CheckBox3: TCheckBox
    Left = 127
    Top = 104
    Width = 97
    Height = 17
    Caption = 'PQ'
    TabOrder = 6
  end
  object CheckBox4: TCheckBox
    Left = 184
    Top = 104
    Width = 97
    Height = 17
    Caption = 'RD'
    TabOrder = 7
  end
  object CheckBox5: TCheckBox
    Left = 237
    Top = 104
    Width = 98
    Height = 17
    Caption = 'PD'
    TabOrder = 8
  end
  object CheckBox6: TCheckBox
    Left = 292
    Top = 104
    Width = 97
    Height = 17
    Caption = 'MARKET'
    TabOrder = 9
  end
  object CheckBox7: TCheckBox
    Left = 361
    Top = 104
    Width = 44
    Height = 17
    Caption = 'MC'
    TabOrder = 10
  end
  object Panel3: TPanel
    Left = 6
    Top = 23
    Width = 401
    Height = 3
    BevelOuter = bvLowered
    TabOrder = 11
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 132
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 12
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 330
    Top = 131
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 13
    OnClick = BitBtn2Click
  end
end
