object saveecrfm: Tsaveecrfm
  Left = 279
  Top = 241
  BorderStyle = bsDialog
  Caption = #20445#23384'ECR'
  ClientHeight = 116
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 154
    Height = 13
    Caption = #20027#26723'BOM/'#30446#26631'BOM'#30340#26009#21495'  '
  end
  object Edit1: TEdit
    Left = 8
    Top = 40
    Width = 305
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 152
    Top = 72
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 72
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 2
    OnClick = Button2Click
  end
end
