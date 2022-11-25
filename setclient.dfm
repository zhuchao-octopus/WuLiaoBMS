object setclientfm: Tsetclientfm
  Left = 288
  Top = 125
  BorderStyle = bsDialog
  Caption = #23458#25143#31471#35774#32622
  ClientHeight = 357
  ClientWidth = 512
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
  object Button1: TButton
    Left = 351
    Top = 327
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 429
    Top = 326
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button2Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 5
    Width = 497
    Height = 318
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #24120#35268#35774#32622
      object Label1: TLabel
        Left = 13
        Top = 32
        Width = 80
        Height = 13
        Caption = 'SQL '#26381#21153#22120#65306
      end
      object Label2: TLabel
        Left = 13
        Top = 56
        Width = 73
        Height = 13
        Caption = 'FTP'#26381#21153#22120#65306
      end
      object Label3: TLabel
        Left = 13
        Top = 82
        Width = 73
        Height = 13
        Caption = 'FTP'#29992#25143#21517#65306
      end
      object Label4: TLabel
        Left = 13
        Top = 106
        Width = 54
        Height = 13
        Caption = 'FTP'#23494#30721':'
      end
      object Label5: TLabel
        Left = 13
        Top = 129
        Width = 65
        Height = 13
        Caption = #21319#32423#25991#20214#65306
      end
      object Label6: TLabel
        Left = 133
        Top = 248
        Width = 86
        Height = 13
        Caption = #20195#29702#26381#21153#22120':  '
      end
      object Label7: TLabel
        Left = 315
        Top = 248
        Width = 59
        Height = 13
        Caption = #20195#29702#31471#21475':'
      end
      object Label8: TLabel
        Left = 13
        Top = 8
        Width = 65
        Height = 13
        Caption = #31243#24207#21517#31216#65306
      end
      object Label10: TLabel
        Left = 13
        Top = 176
        Width = 60
        Height = 13
        Caption = #23458#25143#31471'ID:'
      end
      object Label9: TLabel
        Left = 238
        Top = 223
        Width = 65
        Height = 13
        Caption = #24403#21069#29256#26412#65306
      end
      object Label11: TLabel
        Left = 13
        Top = 153
        Width = 65
        Height = 13
        Caption = #20844#20849#30446#24405#65306
      end
      object Edit1: TEdit
        Left = 88
        Top = 24
        Width = 305
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 0
        Text = #19968#21495#26381#21153#22120
      end
      object Edit2: TEdit
        Left = 88
        Top = 48
        Width = 137
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 1
        Text = '192.168.9.234'
      end
      object Edit3: TEdit
        Left = 88
        Top = 72
        Width = 193
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 2
        Text = 'Macky'
      end
      object Edit4: TEdit
        Left = 88
        Top = 96
        Width = 225
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        PasswordChar = '*'
        TabOrder = 3
        Text = 'mackyhme'
      end
      object Edit5: TEdit
        Left = 88
        Top = 120
        Width = 305
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        Color = clScrollBar
        Enabled = False
        TabOrder = 4
        Text = 'Falcon.EXE'
      end
      object Panel1: TPanel
        Left = -16
        Top = 193
        Width = 505
        Height = 3
        BevelOuter = bvLowered
        TabOrder = 5
      end
      object Panel2: TPanel
        Left = -16
        Top = 264
        Width = 505
        Height = 3
        BevelOuter = bvLowered
        TabOrder = 6
      end
      object c1: TCheckBox
        Left = 8
        Top = 202
        Width = 233
        Height = 17
        Caption = #21551#21160#26102#33258#21160#26816#27979#26377#27809#26377#21319#32423#29256#26412
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object c2: TCheckBox
        Left = 8
        Top = 223
        Width = 161
        Height = 17
        Caption = #38544#34255#20027#31383#20307#24038#20391#24037#20855#26639
        TabOrder = 8
      end
      object c3: TCheckBox
        Left = 8
        Top = 244
        Width = 121
        Height = 17
        Caption = #24212#29992#20195#29702#26381#21153#22120
        TabOrder = 9
        OnClick = c3Click
      end
      object Edit6: TEdit
        Left = 207
        Top = 240
        Width = 98
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        Color = clScrollBar
        TabOrder = 10
      end
      object Edit7: TEdit
        Left = 374
        Top = 242
        Width = 33
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        Color = clScrollBar
        TabOrder = 11
      end
      object CheckBox4: TCheckBox
        Left = 408
        Top = 244
        Width = 81
        Height = 17
        Caption = #21311#21517#30331#38470
        Checked = True
        Color = clBtnFace
        ParentColor = False
        State = cbChecked
        TabOrder = 12
      end
      object BitBtn1: TBitBtn
        Left = 408
        Top = 164
        Width = 75
        Height = 25
        Caption = #21319#32423'...'
        TabOrder = 13
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 408
        Top = 135
        Width = 75
        Height = 25
        Caption = #27880#20876#23458#25143#31471
        TabOrder = 14
        OnClick = BitBtn2Click
      end
      object Edit8: TEdit
        Left = 88
        Top = 1
        Width = 305
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        Color = clScrollBar
        Enabled = False
        TabOrder = 15
        Text = #37329#38588#29289#26009#31649#29702#31995#32479
      end
      object Edit10: TEdit
        Left = 88
        Top = 168
        Width = 305
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 16
      end
      object C4: TCheckBox
        Left = 240
        Top = 200
        Width = 217
        Height = 17
        Caption = #33258#21160#26816#27979#21040#26356#26032#29256#26412#21518#33258#21160#21319#32423
        Checked = True
        State = cbChecked
        TabOrder = 17
      end
      object Edit9: TEdit
        Left = 300
        Top = 218
        Width = 173
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        Color = clScrollBar
        Enabled = False
        TabOrder = 18
        Text = '2005-5-4'
      end
      object Button3: TButton
        Left = 408
        Top = 105
        Width = 75
        Height = 27
        Caption = #33719#21462#27880#20876#30721
        TabOrder = 19
        OnClick = Button3Click
      end
      object C5: TCheckBox
        Left = 8
        Top = 268
        Width = 337
        Height = 17
        Caption = #25805#20316#31995#32479#21551#21160#21518#65292#31995#32479#33258#21551#21160'       '
        TabOrder = 20
      end
      object Edit11: TEdit
        Left = 89
        Top = 144
        Width = 264
        Height = 21
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 21
        Text = '\\MackyLee\FALCON\'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #30028#38754#35774#32622
      ImageIndex = 1
      object SpeedButton5: TSpeedButton
        Left = 392
        Top = 160
        Width = 73
        Height = 25
        Caption = #20445#23384#35774#32622
      end
      object SpeedButton6: TSpeedButton
        Left = 392
        Top = 192
        Width = 73
        Height = 24
        Caption = #24674#22797#40664#35748#20540
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 476
        Height = 143
        Caption = #33756#21333#38754#26495#39068#33394
        TabOrder = 0
        object Label12: TLabel
          Left = 14
          Top = 24
          Width = 72
          Height = 13
          Caption = #32972#26223#39068#33394#65306' '
        end
        object Label13: TLabel
          Left = 15
          Top = 53
          Width = 65
          Height = 13
          Caption = #23383#20307#35774#32622#65306
        end
        object Label14: TLabel
          Left = 16
          Top = 80
          Width = 65
          Height = 13
          Caption = #36873#31181#39068#33394#65306
        end
        object SpeedButton1: TSpeedButton
          Left = 356
          Top = 13
          Width = 42
          Height = 23
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 356
          Top = 42
          Width = 42
          Height = 23
          Caption = '...'
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 356
          Top = 71
          Width = 42
          Height = 23
          Caption = '...'
          OnClick = SpeedButton3Click
        end
        object Label15: TLabel
          Left = 16
          Top = 112
          Width = 65
          Height = 13
          Caption = #20998#21106#39068#33394#65306
        end
        object SpeedButton4: TSpeedButton
          Left = 356
          Top = 104
          Width = 42
          Height = 23
          Caption = '...'
          OnClick = SpeedButton4Click
        end
        object Panel3: TPanel
          Left = 136
          Top = 14
          Width = 185
          Height = 25
          Color = clTeal
          TabOrder = 0
        end
        object Panel4: TPanel
          Left = 136
          Top = 43
          Width = 185
          Height = 24
          Color = clNavy
          TabOrder = 1
        end
        object Panel5: TPanel
          Left = 136
          Top = 71
          Width = 185
          Height = 25
          Color = clHotLight
          TabOrder = 2
        end
        object Panel6: TPanel
          Left = 136
          Top = 101
          Width = 185
          Height = 27
          TabOrder = 3
        end
      end
    end
  end
  object AD: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from client')
    Left = 40
    Top = 328
  end
  object ColorDialog1: TColorDialog
    Left = 156
    Top = 189
  end
end
