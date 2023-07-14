inherited frmDialogoFechas: TfrmDialogoFechas
  Left = 487
  Top = 430
  ClientHeight = 195
  ClientWidth = 173
  OnShow = FormShow
  ExplicitWidth = 179
  ExplicitHeight = 244
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel [0]
    Width = 173
    Height = 145
    ExplicitWidth = 173
    ExplicitHeight = 145
    object Label1: TLabel [0]
      Left = 28
      Top = 8
      Width = 68
      Height = 13
      Caption = 'Fecha DESDE:'
    end
    object Label2: TLabel [1]
      Left = 28
      Top = 50
      Width = 68
      Height = 13
      Caption = #161'Hasta Fecha:'
    end
    inherited btnAceptar: TcxButton
      Left = 28
      Top = 96
      Width = 121
      ExplicitLeft = 28
      ExplicitTop = 96
      ExplicitWidth = 121
    end
    object cbDesde: TcxDateEdit
      Left = 28
      Top = 23
      BeepOnEnter = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 121
    end
    object cbHasta: TcxDateEdit
      Left = 28
      Top = 65
      BeepOnEnter = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 2
      Width = 121
    end
  end
  inherited lblInformacion: TPanel [1]
    Width = 173
    ExplicitWidth = 173
  end
  inherited Panel1: TPanel [2]
    Top = 170
    Width = 173
    ExplicitTop = 170
    ExplicitWidth = 173
  end
  inherited MainMenu1: TMainMenu
    Left = 168
    Top = 80
  end
end
