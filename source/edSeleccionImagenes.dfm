object frmSeleccionImagenes: TfrmSeleccionImagenes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecci'#243'n de Im'#225'genes'
  ClientHeight = 309
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnFiltros: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 132
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 80
    ExplicitTop = 8
    ExplicitWidth = 635
    ExplicitHeight = 268
    object cxLabel6: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 'Filtros im'#225'genes'
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clGray
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clActiveCaption
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.TextColor = clWhite
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clActiveCaption
      StyleDisabled.BorderStyle = ebsSingle
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.TextColor = clWhite
      StyleDisabled.TextStyle = []
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.ShadowedColor = clBlack
      ExplicitWidth = 633
      Height = 18
      Width = 437
      AnchorX = 219
      AnchorY = 9
    end
    object cxLabel5: TcxLabel
      Left = 12
      Top = 27
      Caption = 'Fecha Importaci'#243'n'
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 12
      Top = 54
      Caption = 'Tipos de Imagen'
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 12
      Top = 80
      Caption = 'Fuente'
      Transparent = True
    end
    object cxLabel7: TcxLabel
      Left = 12
      Top = 107
      Caption = 'Zona'
      Transparent = True
    end
    object cbTiposImagen: TcxCheckComboBox
      Left = 113
      Top = 52
      Properties.EditValueFormat = cvfIndices
      Properties.Items = <>
      Properties.OnChange = cbTiposImagenPropertiesChange
      TabOrder = 2
      Width = 314
    end
    object deDesde: TcxDateEdit
      Left = 113
      Top = 26
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ShowToday = False
      Properties.OnEditValueChanged = deDesdePropertiesEditValueChanged
      TabOrder = 0
      Width = 129
    end
    object cxLabel8: TcxLabel
      Left = 251
      Top = 27
      Caption = 'Hasta'
      Transparent = True
    end
    object deHasta: TcxDateEdit
      Left = 298
      Top = 26
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ShowToday = False
      Properties.OnEditValueChanged = deHastaPropertiesEditValueChanged
      TabOrder = 1
      Width = 129
    end
    object cbFuente: TcxExtLookupComboBox
      Left = 113
      Top = 79
      TabOrder = 3
      Width = 314
    end
    object cbZona: TcxExtLookupComboBox
      Left = 113
      Top = 106
      TabOrder = 4
      Width = 314
    end
  end
  object pnBotones: TPanel
    Left = 0
    Top = 268
    Width = 437
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 274
    ExplicitWidth = 635
    object btnAceptar: TcxButton
      Left = 229
      Top = 6
      Width = 117
      Height = 29
      Caption = 'Ver Presentaci'#243'n'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF00000000848484FF0000
        0000848484FF00000000848484FF00000000848484FF00000000848484FF0000
        0000848484FF00000000848484FF00000000848484FF00000000848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF00000000848484FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000848484FF00000000848484FF0000
        0000000000000000000000000000000000003827174D00000000000000000000
        000000000000000000000000000000000000848484FF00000000848484FF0000
        000000000000000000000000000000000000B8824DFF3827174D000000000000
        000000000000000000000000000000000000848484FF00000000848484FF0000
        000000000000000000000000000000000000B8824DFFB8824DFF3827174D0000
        000000000000000000000000000000000000848484FF00000000848484FF0000
        000000000000000000000000000000000000B8824DFFB8824DFFB8824DFF3827
        174D00000000000000000000000000000000848484FF00000000848484FF0000
        000000000000000000000000000000000000B8824DFFB8824DFF3827174D0000
        000000000000000000000000000000000000848484FF00000000848484FF0000
        000000000000000000000000000000000000B8824DFF3827174D000000000000
        000000000000000000000000000000000000848484FF00000000848484FF0000
        0000000000000000000000000000000000003827174D00000000000000000000
        000000000000000000000000000000000000848484FF00000000848484FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000848484FF00000000848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF00000000848484FF0000
        0000848484FF00000000848484FF00000000848484FF00000000848484FF0000
        0000848484FF00000000848484FF00000000848484FF00000000848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF00000000}
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TcxButton
      Left = 349
      Top = 6
      Width = 78
      Height = 29
      Caption = 'Cancelar'
      ModalResult = 2
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        200000000000000400000000000000000000000000000000000000000000131C
        3C471E2B5F700000000000000000000000000000000000000000000000000000
        00000000000000000000000000001F2D6375131C3C4700000000131C3C474260
        D0F64463D8FF1F2D617300000000000000000000000000000000000000000000
        00000000000000000000202E65774463D8FF4260D1F7131C3C472130687B4463
        D8FF4463D8FF4463D8FF1F2D6173000000000000000000000000000000000000
        000000000000202E65774463D8FF4463D8FF4463D8FF212F677A000000002231
        6C7F4463D8FF4463D8FF4463D8FF1F2D61730000000000000000000000000000
        0000202E65774463D8FF4463D8FF4463D8FF22316B7E00000000000000000000
        000022316C7F4463D8FF4463D8FF4463D8FF1F2D61730000000000000000202E
        65774463D8FF4463D8FF4463D8FF22316B7E0000000000000000000000000000
        00000000000022316C7F4463D8FF4463D8FF4463D8FF1F2D6173202E65774463
        D8FF4463D8FF4463D8FF22316B7E000000000000000000000000000000000000
        0000000000000000000022316C7F4463D8FF4463D8FF4463D8FF4463D8FF4463
        D8FF4463D8FF22316B7E00000000000000000000000000000000000000000000
        000000000000000000000000000022316C7F4463D8FF4463D8FF4463D8FF4463
        D8FF22316B7E0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000202E65774463D8FF4463D8FF4463D8FF4463
        D8FF1F2D62740000000000000000000000000000000000000000000000000000
        00000000000000000000202E65774463D8FF4463D8FF4463D8FF4463D8FF4463
        D8FF4463D8FF1F2D627400000000000000000000000000000000000000000000
        000000000000202E65774463D8FF4463D8FF4463D8FF22316B7E22316C7F4463
        D8FF4463D8FF4463D8FF1F2D6274000000000000000000000000000000000000
        0000202E65774463D8FF4463D8FF4463D8FF21316A7D00000000000000002231
        6C7F4463D8FF4463D8FF4463D8FF1F2D6274000000000000000000000000202E
        65774463D8FF4463D8FF4463D8FF21316A7D0000000000000000000000000000
        000022316C7F4463D8FF4463D8FF4463D8FF1F2D6274000000001F2D63754463
        D8FF4463D8FF4463D8FF21316A7D000000000000000000000000000000000000
        00000000000022316C7F4463D8FF4463D8FF4463D8FF1E2C6172151E414D4261
        D3F94463D8FF21316A7D00000000000000000000000000000000000000000000
        0000000000000000000022316C7F4463D8FF4261D3F9151E424E00000000151E
        414D212F677A0000000000000000000000000000000000000000000000000000
        00000000000000000000000000002130687B151E414D00000000}
      TabOrder = 1
    end
  end
  object pnPropiedades: TPanel
    Left = 0
    Top = 132
    Width = 437
    Height = 136
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 246
    ExplicitWidth = 448
    object lblDisplayInterval: TLabel
      Left = 12
      Top = 60
      Width = 85
      Height = 13
      Caption = 'Intervalo Display:'
    end
    object lblDisplayIntervalValue: TLabel
      Left = 113
      Top = 60
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = '[ 1.0 Segundos ]'
    end
    object cbEstilos: TcxImageComboBox
      Left = 113
      Top = 27
      EditValue = 1
      Properties.Items = <
        item
          Description = 'Expandir desde la derecha'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'Expandir desde la izquierda'
          Value = 2
        end
        item
          Description = 'Expandir desde el centro'
          Value = 9
        end
        item
          Description = 'Expandir desde los lados'
          Value = 13
        end
        item
          Description = 'Expandir desde abajo'
          Value = 18
        end
        item
          Description = 'Expandir desde arriba'
          Value = 19
        end
        item
          Description = 'Barrido desde la derecha'
          Value = 3
        end
        item
          Description = 'Barrido desde la izquierda'
          Value = 4
        end
        item
          Description = 'Barrido desde abajo'
          Value = 20
        end
        item
          Description = 'Barrido desde arriba'
          Value = 21
        end
        item
          Description = 'Disolver'
          Value = 169
        end
        item
          Description = 'Barras desde la derecha'
          Value = 60
        end
        item
          Description = 'Barras desde la izquierda'
          Value = 61
        end
        item
          Description = 'Barras desde abajo'
          Value = 71
        end
        item
          Description = 'Barras desde arriba'
          Value = 72
        end
        item
          Description = 'Barras ambos lados'
          Value = 64
        end>
      TabOrder = 0
      Width = 314
    end
    object gbProgressControl: TGroupBox
      Left = 229
      Top = 54
      Width = 198
      Height = 82
      Caption = ' Control  Progreso'
      TabOrder = 1
      object lblProgressStep: TLabel
        Left = 16
        Top = 25
        Width = 48
        Height = 13
        Caption = 'Step (%):'
      end
      object lblProgressDelay: TLabel
        Left = 16
        Top = 50
        Width = 72
        Height = 13
        Caption = 'Intervalo (ms):'
      end
      object seProgressStep: TcxSpinEdit
        Left = 118
        Top = 22
        TabOrder = 0
        Value = 3
        Width = 73
      end
      object seProgressDelay: TcxSpinEdit
        Left = 118
        Top = 47
        TabOrder = 1
        Value = 30
        Width = 73
      end
    end
    object cxLabel4: TcxLabel
      Left = 12
      Top = 29
      Caption = 'Estilos'
      Transparent = True
    end
    object tbDisplayInterval: TcxTrackBar
      Left = 12
      Top = 81
      Position = 1000
      Properties.Frequency = 500
      Properties.Max = 9500
      Properties.Min = 500
      Properties.OnChange = tbDisplayIntervalPropertiesChange
      TabOrder = 3
      Height = 29
      Width = 198
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 'Propiedades de la presentaci'#243'n'
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clGray
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clActiveCaption
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'Arial'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.TextColor = clWhite
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clActiveCaption
      StyleDisabled.BorderStyle = ebsSingle
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.TextColor = clWhite
      StyleDisabled.TextStyle = []
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.ShadowedColor = clBlack
      ExplicitTop = 8
      Height = 18
      Width = 437
      AnchorX = 219
      AnchorY = 9
    end
  end
  object Timer: TTimer
    Enabled = False
    Left = 128
    Top = 32
  end
end
