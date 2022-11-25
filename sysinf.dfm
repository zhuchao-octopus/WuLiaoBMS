object sysinffm: Tsysinffm
  Left = 231
  Top = 165
  BorderIcons = [biSystemMenu, biHelp]
  BorderStyle = bsDialog
  Caption = #31995#32479#28040#24687
  ClientHeight = 281
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 6
    Top = 3
    Width = 481
    Height = 246
    BevelKind = bkSoft
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 411
    Top = 254
    Width = 75
    Height = 25
    Caption = #20851#38381' '
    TabOrder = 1
    OnClick = Button1Click
  end
end
