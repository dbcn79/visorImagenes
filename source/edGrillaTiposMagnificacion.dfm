inherited frmGrillaTiposMagnificacion: TfrmGrillaTiposMagnificacion
  Caption = 'Mantenimiento Tipos de Magnificacion'
  ClientWidth = 414
  ExplicitWidth = 430
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrilla: TPanel
    Width = 414
    Height = 504
    TabOrder = 1
    inherited BarraControl: TdxBarDockControl
      Top = 478
      Width = 412
    end
    inherited cxGrid1: TcxGrid
      Width = 412
      Height = 477
    end
  end
  inherited pnlDetalle: TPanel
    Top = 504
    Width = 414
    Height = 74
    ExplicitTop = 504
    ExplicitWidth = 414
    ExplicitHeight = 74
    inherited cxLabel6: TcxLabel
      Style.IsFontAssigned = True
      Width = 414
      AnchorX = 207
      AnchorY = 9
    end
    inherited pcContenedorDetalle: TcxPageControl
      Width = 414
      Height = 56
      ClientRectBottom = 56
      ClientRectRight = 414
      inherited TabCabecera: TcxTabSheet
        inherited pnlTituloDatosBasicos: TPanel
          Width = 414
          inherited cxLabel3: TcxLabel
            Style.IsFontAssigned = True
            Width = 414
            AnchorX = 207
            AnchorY = 0
          end
        end
        object lbDescripcion: TcxLabel
          Left = 8
          Top = 8
          Caption = 'Descripci'#243'n'
        end
        object txtDESCRIPCION: TcxTextEdit
          Left = 8
          Top = 24
          TabOrder = 2
          Width = 323
        end
        object lbArchivoGrafico: TcxLabel
          Left = 337
          Top = 8
          Caption = 'Conversi'#243'n'
        end
        object varCONVERSION: TcxCalcEdit
          Left = 337
          Top = 24
          EditValue = 0.000000000000000000
          TabOrder = 4
          Width = 65
        end
      end
    end
  end
  inherited dxBarManager1: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
  end
end
