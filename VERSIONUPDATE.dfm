object VERSIONUPDATEFM: TVERSIONUPDATEFM
  Left = 275
  Top = 203
  BorderStyle = bsDialog
  Caption = #29256#26412#21319#32423
  ClientHeight = 106
  ClientWidth = 464
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
    Left = 19
    Top = 17
    Width = 75
    Height = 15
    Caption = #24403#21069#29256#26412#65306
  end
  object Label2: TLabel
    Left = 21
    Top = 46
    Width = 90
    Height = 15
    Caption = #29256#26412#21319#32423#20026#65306
  end
  object Edit1: TEdit
    Left = 112
    Top = 8
    Width = 209
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 112
    Top = 35
    Width = 249
    Height = 23
    BevelKind = bkSoft
    BorderStyle = bsNone
    TabOrder = 1
  end
  object Button1: TButton
    Left = 296
    Top = 72
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 376
    Top = 72
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
end
