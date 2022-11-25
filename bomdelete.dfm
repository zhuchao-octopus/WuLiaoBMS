object bomdeletefm: Tbomdeletefm
  Left = 134
  Top = 201
  BorderStyle = bsDialog
  Caption = #21024#38500'BOM'#36873#39033
  ClientHeight = 219
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 104
    Top = 61
    Width = 382
    Height = 13
    Caption = #22914#26524#36873#25321#27492#39033#65292#20320#36873#31181#30340#21322#25104#21697'BOM'#25110#25104#21697'BOM '#21482#20174#20854#19978#19968#32423'BOM'#20013
  end
  object Label3: TLabel
    Left = 104
    Top = 80
    Width = 183
    Height = 13
    Caption = #21024#38500#12290#21024#38500#21518#36824#21487#28155#21152#24674#22797#12290'  '
  end
  object Label5: TLabel
    Left = 106
    Top = 131
    Width = 355
    Height = 13
    Caption = #22914#26524#36873#25321#27492#39033#65292#20320#36873#31181#30340#21322#25104#21697'BOM'#25110#25104#21697'BOM '#23558#27704#36828#34987#21024#38500' '
  end
  object Label6: TLabel
    Left = 104
    Top = 152
    Width = 254
    Height = 13
    Caption = #21024#38500#21518#26080#27861#24674#22797#65292#35201#24674#22797#23427#24517#39035#37325#26032#21019#24314' '#12290
  end
  object R1: TRadioButton
    Left = 64
    Top = 40
    Width = 409
    Height = 17
    Caption = #21482#20174#19978#19968#32423'BOM'#20013#21024#38500#12290#65288#24378#21147#25512#33616#65289
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object R2: TRadioButton
    Left = 64
    Top = 112
    Width = 369
    Height = 17
    Caption = #20174#25968#25454#24211#20013#21024#38500#12290
    Enabled = False
    TabOrder = 1
    OnClick = R2Click
  end
  object Panel2: TPanel
    Left = 10
    Top = 101
    Width = 518
    Height = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 9
    Top = 181
    Width = 518
    Height = 3
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 3
  end
  object Button1: TButton
    Left = 344
    Top = 192
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 448
    Top = 192
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = Button2Click
  end
end
