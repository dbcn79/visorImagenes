object frmEdicionImagen: TfrmEdicionImagen
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Edici'#243'n Imagen'
  ClientHeight = 465
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 424
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnTiposImagenes: TPanel
      Left = 599
      Top = 0
      Width = 198
      Height = 424
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object listTIPOSIMAGENES: TcxCheckListBox
        Left = 0
        Top = 19
        Width = 198
        Height = 405
        Align = alClient
        Items = <>
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 198
        Height = 19
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object lbTiposImagenes: TcxLabel
          Left = 0
          Top = 0
          Align = alClient
          Caption = 'Tipos de Im'#225'genes'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = clGrayText
          Style.BorderStyle = ebsUltraFlat
          Style.Color = clSilver
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clWhite
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          AnchorX = 99
        end
      end
    end
    object lbPaciente: TcxLabel
      Left = 16
      Top = 19
      Caption = 'Paciente'
      Transparent = True
    end
    object lbDescripcion: TcxLabel
      Left = 16
      Top = 42
      Caption = 'Descripci'#243'n'
      Transparent = True
    end
    object txtPACIENTE: TcxTextEdit
      Left = 120
      Top = 18
      Style.Color = clInfoBk
      TabOrder = 3
      Width = 209
    end
    object txtDESCRIPCION: TcxTextEdit
      Left = 120
      Top = 41
      TabOrder = 4
      Width = 209
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 65
      Caption = 'Fecha Catalogaci'#243'n'
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 88
      Caption = 'Fecha Importaci'#243'n'
      Transparent = True
    end
    object deFECCATALOG: TcxDateEdit
      Left = 120
      Top = 64
      Properties.DateButtons = []
      TabOrder = 7
      Width = 121
    end
    object deFECIMPORTA: TcxDateEdit
      Left = 120
      Top = 87
      Properties.DateButtons = []
      TabOrder = 8
      Width = 121
    end
    object txtHORIMPORTA: TcxTextEdit
      Left = 241
      Top = 87
      TabOrder = 9
      Width = 42
    end
    object ImgPaciente: TcxImage
      Left = 336
      Top = 19
      Properties.GraphicClassName = 'TJPEGImage'
      TabOrder = 10
      Transparent = True
      Height = 229
      Width = 257
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 111
      Caption = 'Zona'
      Transparent = True
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 134
      Caption = 'Fuente'
      Transparent = True
    end
    object cxLabel5: TcxLabel
      Left = 16
      Top = 157
      Caption = 'Factor de Magnif.'
      Transparent = True
    end
    object cxLabel6: TcxLabel
      Left = 16
      Top = 180
      Caption = 'Calibre'
      Transparent = True
    end
    object cxLabel7: TcxLabel
      Left = 16
      Top = 203
      Caption = 'Imagen'
      Transparent = True
    end
    object txtIMAGEN: TcxTextEdit
      Left = 120
      Top = 202
      Style.Color = clInfoBk
      TabOrder = 16
      Width = 209
    end
    object cxLabel8: TcxLabel
      Left = 16
      Top = 228
      Caption = 'Especialidad'
      Transparent = True
    end
    object ceFACTOR: TcxCalcEdit
      Left = 120
      Top = 156
      EditValue = 1.000000000000000000
      TabOrder = 18
      Width = 121
    end
    object ceCALIBRE: TcxCalcEdit
      Left = 120
      Top = 179
      EditValue = 0.000000000000000000
      TabOrder = 19
      Width = 121
    end
    object cxLabel9: TcxLabel
      Left = 16
      Top = 251
      Caption = 'Piezas'
      Transparent = True
    end
    object txtPIEZAS: TcxTextEdit
      Left = 120
      Top = 250
      TabOrder = 21
      Width = 473
    end
    object cxLabel10: TcxLabel
      Left = 16
      Top = 274
      Caption = 'Comentario'
      Transparent = True
    end
    object mCOMENTARIO: TcxMemo
      Left = 120
      Top = 273
      TabOrder = 23
      Height = 151
      Width = 473
    end
    object cbZona: TcxExtLookupComboBox
      Left = 121
      Top = 110
      TabOrder = 24
      Width = 208
    end
    object cbFuente: TcxExtLookupComboBox
      Left = 121
      Top = 133
      TabOrder = 25
      Width = 208
    end
    object cbEspec: TcxExtLookupComboBox
      Left = 121
      Top = 227
      TabOrder = 26
      Width = 208
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 424
    Width = 797
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnAceptar: TcxButton
      Left = 618
      Top = 6
      Width = 82
      Height = 29
      Caption = 'Aceptar'
      ModalResult = 1
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000C0E0A1500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000031362652909F70F32D32234C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000003136265293A373F997A776FF93A373F92B3022490000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000003136265293A373F997A776FF97A776FF97A776FF93A273F82B2F
        2148000000000000000000000000000000000000000000000000000000000000
        00003136265393A373F997A776FF91A071F54951397B93A273F897A776FF93A2
        73F82B2F21480000000000000000000000000000000000000000000000000506
        0409839166DD97A776FF91A071F5262A1E40000000002B2F214893A273F897A7
        76FF93A273F82B30224900000000000000000000000000000000000000000000
        000015171023808D64D8262A1E400000000000000000000000002B2F214893A2
        73F897A776FF93A273F82B302249000000000000000000000000000000000000
        0000000000000202010300000000000000000000000000000000000000002B2F
        214893A273F897A776FF93A273F82B3022490000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00002B2F214893A273F897A776FF93A273F82B30224900000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000002B2F214893A273F897A776FF76825CC701010001000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000002B2F214875825CC60B0C081200000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000010100010000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 0
    end
    object btnCancelar: TcxButton
      Left = 705
      Top = 6
      Width = 82
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
end
