object upgradefm: Tupgradefm
  Left = 286
  Top = 145
  BorderStyle = bsDialog
  Caption = #31995#32479#21319#32423
  ClientHeight = 318
  ClientWidth = 553
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
  object Label4: TLabel
    Left = 11
    Top = 289
    Width = 52
    Height = 13
    Caption = #27880#20876#30721#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 56
    Top = 289
    Width = 65
    Height = 13
    Caption = #27880#20876#30721#20002#22833
  end
  object Label1: TLabel
    Left = 9
    Top = 10
    Width = 118
    Height = 13
    Caption = #24403#21069#26159#20351#29992#29256#26412#65306'  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 120
    Top = 10
    Width = 99
    Height = 13
    Caption = #29256#26412#20449#24687#20002#22833'   '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 11
    Top = 30
    Width = 52
    Height = 13
    Caption = #21319#32423#20026#65306
  end
  object Label6: TLabel
    Left = 123
    Top = 30
    Width = 49
    Height = 13
    Caption = '       '
  end
  object Label7: TLabel
    Left = 56
    Top = 48
    Width = 430
    Height = 13
    Caption = #24314#35758#22312#21319#32423#20043#21069#20851#25481#25152#26377#30340#20854#20182#19982#31995#32479#26377#20851#30340#24212#29992#31243#24207#65292#36991#20813#21319#32423#22833#36133' '#12290' '
  end
  object Button1: TButton
    Left = 384
    Top = 277
    Width = 76
    Height = 28
    Caption = #31435#21363#21319#32423
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 472
    Top = 277
    Width = 76
    Height = 28
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 72
    Width = 537
    Height = 161
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 8
    Top = 241
    Width = 537
    Height = 21
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 3
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 537
      Height = 21
      Align = alClient
    end
    object Gauge1: TGauge
      Left = 0
      Top = 0
      Width = 537
      Height = 21
      Align = alClient
      ForeColor = clBlue
      Progress = 0
    end
  end
  object AD: TADOTable
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=HMEBOM;Data Source=ww'
    CursorType = ctStatic
    TableName = 'VERSION'
    Left = 288
    Top = 248
  end
  object aq: TADOQuery
    Parameters = <>
    Left = 232
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = AD
    Left = 160
    Top = 216
  end
  object DownLoadTcp: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    OnWork = DownLoadTcpWork
    OnWorkBegin = DownLoadTcpWorkBegin
    Host = '192.168.4.145'
    Port = 7788
    Left = 256
    Top = 176
  end
end
