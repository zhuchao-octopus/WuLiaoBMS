inherited bomwhfm: Tbomwhfm
  Left = 10
  Top = 103
  Caption = 'BOM'#32500#25252
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar1: TCoolBar
    inherited ToolBar2: TToolBar [0]
      ButtonHeight = 21
      inherited Lbom: TLabel
        Height = 21
      end
      inherited DBEdit1: TDBEdit
        Height = 21
      end
      inherited DBEdit2: TDBEdit
        Height = 21
        ReadOnly = False
      end
      inherited DBEdit4: TDBEdit
        Height = 21
      end
      inherited DBEdit5: TDBEdit
        Height = 21
      end
      inherited DBEdit6: TDBEdit
        Height = 21
      end
      inherited DBEdit3: TDBEdit
        Height = 21
        ReadOnly = False
      end
    end
    inherited ToolBar1: TToolBar [1]
      inherited SpeedButton2: TSpeedButton
        Width = 37
      end
      inherited ToolButton2: TToolButton
        Left = 124
      end
      inherited SpeedButton1: TSpeedButton
        Left = 131
        Width = 36
      end
      inherited SpeedButton4: TSpeedButton
        Left = 167
      end
      inherited SpeedButton5: TSpeedButton
        Left = 206
      end
      inherited printbutton: TSpeedButton
        Left = 247
        Width = 39
      end
      inherited SpeedButton3: TSpeedButton
        Left = 286
      end
      inherited saveas: TSpeedButton
        Left = 326
      end
      inherited SpeedButton9: TSpeedButton
        Left = 364
      end
      inherited SButton15: TSpeedButton
        Left = 404
      end
      inherited Sp15: TSpeedButton
        Left = 444
      end
      inherited Sp11: TSpeedButton
        Left = 485
      end
    end
  end
  inherited PopupMenu4: TPopupMenu
    object BOM1: TMenuItem
      Caption = #37325#21629#21517#24403#21069'BOM'#26009#21495
      OnClick = BOM1Click
    end
  end
  inherited aqljlh: TADOQuery
    Top = 178
  end
end
