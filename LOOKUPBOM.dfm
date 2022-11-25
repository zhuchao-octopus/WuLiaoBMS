inherited LOOKUPBOMFM: TLOOKUPBOMFM
  Left = 28
  Top = 145
  Width = 1036
  Caption = #26597#35810'BOM'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Width = 1028
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Text = #26597#35810'BOM'
        Width = 50
      end>
  end
  inherited CoolBar1: TCoolBar
    Width = 1028
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 59
        Width = 1028
      end
      item
        Control = ToolBar2
        ImageIndex = -1
        Width = 1028
      end>
    inherited ToolBar2: TToolBar [0]
      Width = 1015
      ButtonHeight = 21
      inherited Lbom: TLabel
        Height = 21
      end
      inherited DBEdit1: TDBEdit
        Width = 117
        Height = 21
      end
      inherited DBEdit2: TDBEdit
        Left = 203
        Width = 73
        Height = 21
      end
      inherited DBEdit4: TDBEdit
        Left = 276
        Height = 21
        ReadOnly = True
      end
      inherited DBEdit5: TDBEdit
        Left = 317
        Width = 65
        Height = 21
        ReadOnly = True
      end
      inherited DBEdit6: TDBEdit
        Left = 382
        Height = 21
        ReadOnly = True
      end
      inherited DBEdit3: TDBEdit
        Left = 455
        Width = 466
        Height = 21
      end
    end
    inherited ToolBar1: TToolBar [1]
      Width = 1015
      inherited SpeedButton6: TSpeedButton
        Width = 40
      end
      inherited ToolButton1: TToolButton
        Left = 40
      end
      inherited SpeedButton7: TSpeedButton
        Left = 48
      end
      inherited SpeedButton2: TSpeedButton
        Left = 86
      end
      inherited ToolButton2: TToolButton
        Left = 126
      end
      inherited SpeedButton1: TSpeedButton
        Left = 133
      end
      inherited SpeedButton4: TSpeedButton
        Left = 172
        Enabled = False
        Visible = False
      end
      inherited SpeedButton5: TSpeedButton
        Left = 211
        Enabled = False
        Visible = False
      end
      inherited printbutton: TSpeedButton
        Left = 251
      end
      inherited SpeedButton3: TSpeedButton
        Left = 292
        Enabled = False
        Visible = False
      end
      inherited saveas: TSpeedButton
        Left = 332
        Enabled = False
        Visible = False
      end
      inherited SpeedButton9: TSpeedButton
        Left = 370
        Enabled = False
        Visible = False
      end
      inherited SButton15: TSpeedButton
        Left = 410
        Enabled = False
        Visible = False
      end
      inherited Sp15: TSpeedButton
        Left = 450
        Enabled = False
        Visible = False
      end
      inherited Sp11: TSpeedButton
        Left = 490
        Visible = False
      end
    end
  end
  inherited Panel1: TPanel
    Width = 746
    inherited Splitter2: TSplitter
      Left = 468
    end
    inherited PageControl2: TPageControl
      Width = 746
      inherited TabSheet3: TTabSheet
        inherited DBGrid4: TDBGrid
          Width = 738
          ReadOnly = True
        end
      end
      inherited TabSheet4: TTabSheet
        inherited ListView1: TListView
          Width = 738
          ReadOnly = True
        end
      end
    end
    inherited DBGrid1: TDBGrid
      Left = 471
      Width = 275
      ReadOnly = True
      OnColExit = nil
      OnExit = nil
    end
    inherited DBGrid2: TDBGrid
      Width = 468
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      OnDblClick = nil
      OnKeyPress = DBGrid2KeyPress
    end
  end
  inherited ADOTable1: TADOTable
    LockType = ltReadOnly
  end
  inherited ADOQuery1: TADOQuery
    Top = 83
  end
  inherited tq: TADOQuery
    SQL.Strings = (
      
        'SELECT * FROM lingjianliaohao WHERE '#26009#21495' LIKE '#39'99%'#39' and '#21697#21517' like '#39'%' +
        #25104#21697'%'#39' and '#25215#35748'='#39#24050#26680#20934#39' ')
  end
  inherited PopupMenu4: TPopupMenu
    inherited BOM2: TMenuItem
      Caption = #21047#26032'/'#23637#24320#24403#21069'BOM'
    end
    inherited BOM3: TMenuItem
      Enabled = False
    end
    object BOM4: TMenuItem [4]
      Caption = #22797#21046'BOM'#26009#21495
      OnClick = BOM4Click
    end
    inherited problemn1: TMenuItem
      Enabled = False
    end
  end
  inherited DataSource33: TDataSource
    AutoEdit = False
    Top = 77
  end
end
