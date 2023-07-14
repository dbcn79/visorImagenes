inherited frmGrillaTiposImagenes: TfrmGrillaTiposImagenes
  Caption = 'Tipos de Im'#225'genes'
  ClientHeight = 622
  ClientWidth = 479
  ExplicitWidth = 495
  ExplicitHeight = 661
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrilla: TPanel
    Width = 479
    Height = 548
    ExplicitWidth = 479
    ExplicitHeight = 548
    inherited BarraControl: TdxBarDockControl
      Top = 522
      Width = 477
      ExplicitTop = 522
      ExplicitWidth = 477
    end
    inherited cxGrid1: TcxGrid
      Width = 477
      Height = 521
      ExplicitWidth = 477
      ExplicitHeight = 521
    end
  end
  inherited pnlDetalle: TPanel
    Top = 548
    Width = 479
    Height = 74
    ExplicitTop = 548
    ExplicitWidth = 479
    ExplicitHeight = 74
    inherited cxLabel6: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 479
      Width = 479
      AnchorX = 240
      AnchorY = 9
    end
    inherited pcContenedorDetalle: TcxPageControl
      Width = 479
      Height = 56
      ExplicitWidth = 479
      ExplicitHeight = 56
      ClientRectBottom = 56
      ClientRectRight = 479
      inherited TabCabecera: TcxTabSheet
        ExplicitWidth = 479
        ExplicitHeight = 56
        inherited pnlTituloDatosBasicos: TPanel
          Width = 479
          ExplicitWidth = 479
          inherited cxLabel3: TcxLabel
            Style.IsFontAssigned = True
            ExplicitWidth = 479
            Width = 479
            AnchorX = 240
            AnchorY = 0
          end
        end
        object lbDescripcion: TcxLabel
          Left = 8
          Top = 8
          Caption = 'Tipo de Imagen'
        end
        object txtDESCRIPCION: TcxTextEdit
          Left = 8
          Top = 24
          TabOrder = 2
          Width = 257
        end
        object lbEspecialidad: TcxLabel
          Left = 271
          Top = 8
          Caption = 'Especialidad'
        end
        object cbESPECIALIDAD: TcxImageComboBox
          Left = 271
          Top = 24
          Properties.Items = <>
          TabOrder = 4
          Width = 186
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
