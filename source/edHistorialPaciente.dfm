object frmHistorialPaciente: TfrmHistorialPaciente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Historial del Paciente'
  ClientHeight = 567
  ClientWidth = 974
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
  object Panel2: TPanel
    Left = 0
    Top = 526
    Width = 974
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -162
    ExplicitTop = 258
    ExplicitWidth = 797
    object btnCerrar: TcxButton
      Left = 882
      Top = 6
      Width = 82
      Height = 29
      Caption = 'Cerrar'
      ModalResult = 1
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000004463
        D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463
        D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463
        D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF4463D8FF4261D3F94463D8FF4463D8FF4463D8FF4463
        D8FF4361D5FB4463D8FF4463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF3751B0D0090D1D22344CA5C34463D8FF4463D8FF3147
        9BB70B1023293C57BFE14463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4260D0F6080C191E0000000003050B0D344CA5C331479BB70203
        0607000000000D132A314463D7FE4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF31489DB90304080A0000000003050B0D020306070000
        000004060D0F354DA9C74463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF4463D8FF31489DB90304080A00000000000000000406
        0D0F354DA9C74463D8FF4463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF4463D8FF31479BB70203060700000000000000000305
        0A0C344CA5C34463D8FF4463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF31479BB7020306070000000004050C0E0304080A0000
        000003050A0C344CA5C34463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4261D3F9090D1C210000000004060D0F354DA9C731489DB90304
        080A000000000C11262D4362D6FD4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF3A54B7D80B102329354DA9C74463D8FF4463D8FF3148
        9DB90B11242B3C57BEE04463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF4463D8FF4361D5FB4463D8FF4463D8FF4463D8FF4463
        D8FF4361D5FB4463D8FF4463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463
        D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF00000000000000004463
        D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463
        D8FF4463D8FF4463D8FF4463D8FF4463D8FF4463D8FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 0
    end
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 974
    Height = 526
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 328
    ExplicitTop = 272
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lvHistorial: TcxShellListView
      Left = 0
      Top = 0
      Width = 974
      Height = 526
      Align = alClient
      Options.ShowFolders = False
      Options.FileMask = '*.jpg'
      Root.BrowseFolder = bfCustomPath
      Sorting = True
      TabOrder = 0
      ThumbnailOptions.Height = 80
      ThumbnailOptions.ShowThumbnails = True
      ThumbnailOptions.Width = 80
      ExplicitLeft = 168
      ExplicitTop = 80
      ExplicitWidth = 250
      ExplicitHeight = 150
    end
  end
end
