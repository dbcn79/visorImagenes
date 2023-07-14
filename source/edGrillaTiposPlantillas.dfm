inherited frmGrillaTiposPlantillas: TfrmGrillaTiposPlantillas
  Caption = 'Mantenimiento Tipos de Plantilla'
  ClientWidth = 465
  ExplicitWidth = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrilla: TPanel
    Width = 465
    Height = 504
    ExplicitWidth = 465
    ExplicitHeight = 504
    inherited BarraControl: TdxBarDockControl
      Top = 478
      Width = 463
      ExplicitTop = 478
      ExplicitWidth = 463
    end
    inherited cxGrid1: TcxGrid
      Width = 463
      Height = 477
      ExplicitWidth = 463
      ExplicitHeight = 477
    end
  end
  inherited pnlDetalle: TPanel
    Top = 504
    Width = 465
    Height = 74
    ExplicitTop = 504
    ExplicitWidth = 465
    ExplicitHeight = 74
    inherited cxLabel6: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 465
      Width = 465
      AnchorX = 233
      AnchorY = 9
    end
    inherited pcContenedorDetalle: TcxPageControl
      Width = 465
      Height = 56
      ExplicitWidth = 465
      ExplicitHeight = 56
      ClientRectBottom = 56
      ClientRectRight = 465
      inherited TabCabecera: TcxTabSheet
        ExplicitWidth = 465
        ExplicitHeight = 56
        inherited pnlTituloDatosBasicos: TPanel
          Width = 465
          ExplicitWidth = 465
          inherited cxLabel3: TcxLabel
            Style.IsFontAssigned = True
            ExplicitWidth = 465
            Width = 465
            AnchorX = 233
            AnchorY = 0
          end
        end
        object lbDescripcion: TcxLabel
          Left = 8
          Top = 8
          Caption = 'Tipo Plantilla'
        end
        object txtDESCRIPCION: TcxTextEdit
          Left = 8
          Top = 24
          TabOrder = 2
          Width = 257
        end
        object cbFUENTE: TcxImageComboBox
          Left = 271
          Top = 24
          Properties.Items = <>
          TabOrder = 3
          Width = 186
        end
        object lbArchivoGrafico: TcxLabel
          Left = 271
          Top = 8
          Caption = 'Tipo Fuente'
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
