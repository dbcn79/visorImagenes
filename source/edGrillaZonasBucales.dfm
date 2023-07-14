inherited frmGrillaZonasBucales: TfrmGrillaZonasBucales
  Caption = 'Mantenimiento de Zonas Bucales'
  ClientHeight = 527
  ClientWidth = 467
  ExplicitWidth = 483
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlGrilla: TPanel
    Width = 467
    Height = 456
    ExplicitWidth = 467
    ExplicitHeight = 456
    inherited BarraControl: TdxBarDockControl
      Top = 430
      Width = 465
      ExplicitTop = 430
      ExplicitWidth = 465
    end
    inherited cxGrid1: TcxGrid
      Width = 465
      Height = 429
      ExplicitWidth = 465
      ExplicitHeight = 429
    end
  end
  inherited pnlDetalle: TPanel
    Top = 456
    Width = 467
    Height = 71
    ExplicitTop = 456
    ExplicitWidth = 467
    ExplicitHeight = 71
    inherited cxLabel6: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 467
      Width = 467
      AnchorX = 234
      AnchorY = 9
    end
    inherited pcContenedorDetalle: TcxPageControl
      Width = 467
      Height = 53
      ExplicitWidth = 467
      ExplicitHeight = 53
      ClientRectBottom = 53
      ClientRectRight = 467
      inherited TabCabecera: TcxTabSheet
        ExplicitWidth = 467
        ExplicitHeight = 53
        inherited pnlTituloDatosBasicos: TPanel
          Width = 467
          ExplicitWidth = 467
          inherited cxLabel3: TcxLabel
            Style.IsFontAssigned = True
            ExplicitWidth = 467
            Width = 467
            AnchorX = 234
            AnchorY = 0
          end
        end
        object lbDescripcion: TcxLabel
          Left = 8
          Top = 8
          Caption = 'Zona'
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
