inherited lufm3: Tlufm3
  Left = 66
  Top = 221
  Width = 894
  Caption = #32534#36753#20215#26684
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar1: TCoolBar
    Width = 886
    Bands = <
      item
        Control = ToolBar1
        ImageIndex = -1
        MinHeight = 59
        Width = 886
      end
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 26
        Width = 886
      end>
    inherited ToolBar2: TToolBar [0]
      Width = 873
      inherited ToolBar3: TToolBar
        Width = 206
        inherited Edit2: TEdit
          Width = 163
        end
      end
      inherited CoolBar2: TCoolBar
        Left = 206
      end
      inherited CoolBar3: TCoolBar
        Left = 443
        Width = 249
        Bands = <
          item
            Control = ToolBar5
            ImageIndex = -1
            MinHeight = 24
            Width = 249
          end>
        inherited ToolBar5: TToolBar
          Width = 236
          inherited Edit3: TEdit
            Width = 173
          end
        end
      end
      object CoolBar4: TCoolBar
        Left = 692
        Top = 2
        Width = 196
        Height = 26
        Bands = <
          item
            Control = ToolBar6
            ImageIndex = -1
            Width = 196
          end>
        EdgeBorders = [ebBottom]
        object ToolBar6: TToolBar
          Left = 9
          Top = 0
          Width = 183
          Height = 25
          ButtonHeight = 19
          Caption = 'ToolBar6'
          EdgeBorders = []
          TabOrder = 0
          object Label3: TLabel
            Left = 0
            Top = 2
            Width = 36
            Height = 19
            Caption = #21333#20215#65306
          end
          object Edit4: TEdit
            Left = 36
            Top = 2
            Width = 135
            Height = 19
            BevelKind = bkSoft
            BorderStyle = bsNone
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnKeyPress = Edit4KeyPress
          end
        end
      end
    end
    inherited ToolBar1: TToolBar [1]
      Width = 873
    end
  end
  inherited Panel2: TPanel
    Width = 886
    inherited DBGrid1: TDBGrid
      Width = 886
      PopupMenu = PopupMenu2
      OnCellClick = DBGrid1CellClick
      OnDblClick = DBGrid1DblClick
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 886
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
        Text = #32534#36753#21333#20215
        Width = 50
      end>
  end
  inherited DataSource1: TDataSource
    Left = 80
  end
  inherited PopupMenu1: TPopupMenu
    Top = 232
  end
  object PopupMenu2: TPopupMenu
    Left = 312
    Top = 131
    object N4: TMenuItem
      Caption = #21452#20987#27169#24335
      OnClick = N4Click
    end
  end
end
