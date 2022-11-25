object ProgressBarFm: TProgressBarFm
  Left = 559
  Top = 671
  BorderStyle = bsNone
  Caption = 'ProgressBarFm'
  ClientHeight = 32
  ClientWidth = 459
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 32
    Align = alClient
    BevelInner = bvRaised
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 136
      Top = 40
      Width = 186
      Height = 13
      Caption = #35831#31245#31561#65281#27491#22312#36733#20837#65294#65294#65294'    '
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object BitBtn3: TBitBtn
      Left = 112
      Top = 64
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      Visible = False
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 272
      Top = 64
      Width = 75
      Height = 25
      Caption = #20013#26029
      TabOrder = 1
      Visible = False
      OnClick = BitBtn4Click
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 444
    Height = 14
    TabOrder = 0
    Visible = False
    object image1: TImage
      Left = 1
      Top = 1
      Width = 442
      Height = 12
      Align = alClient
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = #26368#21069#38754
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = #40657#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 64
    Width = 75
    Height = 25
    Caption = #24320#22987
    TabOrder = 2
    Visible = False
    OnClick = BitBtn2Click
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 16
    Top = 32
  end
end
