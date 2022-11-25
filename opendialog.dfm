object opendialogfm: Topendialogfm
  Left = 166
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'Open'
  ClientHeight = 350
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 13
    Top = 9
    Width = 75
    Height = 15
    Caption = #26597#25214#33539#22260#65306
  end
  object Label2: TLabel
    Left = 136
    Top = 296
    Width = 60
    Height = 15
    Caption = #25991#20214#21517#65306
  end
  object Label4: TLabel
    Left = 137
    Top = 322
    Width = 130
    Height = 23
    Caption = 'Macky@smt.cc'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 464
    Top = 4
    Width = 29
    Height = 24
    Caption = #21521#19978
    Flat = True
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 495
    Top = 4
    Width = 26
    Height = 24
    Flat = True
  end
  object SpeedButton3: TSpeedButton
    Left = 523
    Top = 3
    Width = 26
    Height = 24
    Flat = True
  end
  object ShellComboBox1: TShellComboBox
    Left = 86
    Top = 4
    Width = 363
    Height = 24
    Root = 'rfDesktop'
    ShellListView = ShellListView1
    UseShellImages = True
    DropDownCount = 8
    TabOrder = 0
  end
  object ShellListView1: TShellListView
    Left = 135
    Top = 36
    Width = 490
    Height = 243
    ObjectTypes = [otFolders, otNonFolders]
    Root = 'rfDesktop'
    ShellTreeView = ShellTreeView1
    ShellComboBox = ShellComboBox1
    Sorted = True
    OnClick = ShellListView1Click
    ReadOnly = False
    HideSelection = False
    TabOrder = 1
    ViewStyle = vsList
  end
  object ShellTreeView1: TShellTreeView
    Left = 8
    Top = 36
    Width = 121
    Height = 305
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    ShellListView = ShellListView1
    UseShellImages = True
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 192
    Top = 287
    Width = 433
    Height = 23
    ItemHeight = 15
    TabOrder = 3
  end
  object Button1: TButton
    Left = 472
    Top = 319
    Width = 75
    Height = 25
    Caption = #25171#24320
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 552
    Top = 318
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = Button2Click
  end
end
