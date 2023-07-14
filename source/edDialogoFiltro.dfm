inherited frmDialogoFiltro: TfrmDialogoFiltro
  ClientHeight = 188
  ClientWidth = 271
  ParentFont = False
  OnShow = FormShow
  ExplicitWidth = 277
  ExplicitHeight = 237
  PixelsPerInch = 96
  TextHeight = 13
  inherited lblInformacion: TPanel
    Width = 271
    ExplicitWidth = 271
  end
  inherited Panel1: TPanel
    Top = 163
    Width = 271
    ExplicitTop = 163
    ExplicitWidth = 271
  end
  inherited Panel2: TPanel
    Width = 271
    Height = 138
    ExplicitWidth = 271
    ExplicitHeight = 138
    inherited btnAceptar: TcxButton
      Left = 166
      Top = 3
      ExplicitLeft = 166
      ExplicitTop = 3
    end
    object Edit1: TcxTextEdit
      Left = 16
      Top = 8
      TabOrder = 1
      Width = 144
    end
    object chkEmpiezaPor: TcxCheckBox
      Left = 14
      Top = 32
      Caption = 'Contiene El Texto'
      State = cbsChecked
      TabOrder = 2
      Transparent = True
    end
    object RadioGroup1: TcxRadioGroup
      Left = 16
      Top = 51
      TabStop = False
      Ctl3D = False
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Igual'
        end
        item
          Caption = 'Diferente'
        end
        item
          Caption = 'Menor'
        end
        item
          Caption = 'Alcalde'
        end
        item
          Caption = 'Menor o Igual'
        end
        item
          Caption = 'alcalde o Igual'
        end
        item
          Caption = 'en Lista'
        end
        item
          Caption = 'Vac'#237'o'
        end>
      ItemIndex = 0
      Style.Color = clWhite
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Height = 85
      Width = 241
    end
  end
  inherited MainMenu1: TMainMenu
    Left = 308
    Top = 65520
    inherited N1: TMenuItem
      inherited Aceptar: TMenuItem
        ShortCut = 13
      end
    end
  end
end
