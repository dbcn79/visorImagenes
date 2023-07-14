unit PrincipalF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, cxGraphics, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin,
  Vcl.ActnCtrls, Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm,
  cxClasses, dxRibbon, dxSkinsdxBarPainter, dxBar, dxBarApplicationMenu,
  dxSkinsdxStatusBarPainter, dxStatusBar, Vcl.ExtCtrls, edBaseGrilla,
  Data, dxSkinsForm, Winapi.ShellApi, edVisorImagenes, edHistorialPaciente,
  edFuncionesImagen, edSeleccionImagenes;

type
  TfrmPrincipal = class(TForm)
    ImageListGrandes: TcxImageList;
    alPrincipal: TActionList;
    miMestroTiposImagen: TAction;
    miPacientesVerPaciente: TAction;
    rtOpciones: TdxRibbonTab;
    biPrincipal: TdxRibbon;
    miAccionSalir: TAction;
    bmPrincipal: TdxBarManager;
    amPrincipal: TdxBarApplicationMenu;
    bmMaestros: TdxBar;
    btTiposImagen: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    bmPacientes: TdxBar;
    bmSistema: TdxBar;
    btVerFicha: TdxBarLargeButton;
    btSalir: TdxBarLargeButton;
    btVerFichaPaciente: TdxBarLargeButton;
    btSalirAplicacion: TdxBarLargeButton;
    pnPrincipal: TPanel;
    miBuscarImagenes: TAction;
    btBuscarPaciente: TdxBarLargeButton;
    btBuscaPaciente: TdxBarLargeButton;
    tmrAplicacion: TTimer;
    miImportarmagenes: TAction;
    btMenuExportarImagen: TdxBarLargeButton;
    btImportarImagen: TdxBarLargeButton;
    miInsertarPaciente: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    dxSkinController: TdxSkinController;
    actGenerico: TAction;
    miMestroZonasBucales: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    btZonasBucales: TdxBarLargeButton;
    btCalibres: TdxBarLargeButton;
    miMaestroTiposMagnificacion: TAction;
    btTiposMagnificacion: TdxBarLargeButton;
    miMaestroTiposPlantillas: TAction;
    dxBarButton2: TdxBarButton;
    btTiposPlantillas: TdxBarLargeButton;
    dxBarButton3: TdxBarButton;
    btWeb: TdxBarLargeButton;
    miAccionWeb: TAction;
    miHistorialPaciente: TAction;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    btHistorial: TdxBarLargeButton;
    miPresentacion: TAction;
    dxBarButton5: TdxBarButton;
    btPresentacion: TdxBarLargeButton;
    procedure miAccionSalirExecute(Sender: TObject);
    procedure tmrAplicacionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miImportarmagenesExecute(Sender: TObject);
    procedure actGenericoExecute(Sender: TObject);
    procedure miBuscarImagenesExecute(Sender: TObject);
    procedure miAccionWebExecute(Sender: TObject);
    procedure miHistorialPacienteExecute(Sender: TObject);
    procedure miPresentacionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VisorImagenes: TfrmVisorImagenes;
    busquedaGlobal: Boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if ParamStr(1) <> '' then begin
    DM.FPaciente.idPac := ParamStr(1).ToInteger;
  end;
  dxSkinController.SkinName := 'Office2007Green';
  biPrincipal.ColorSchemeName := 'Office2007Green';
  busquedaGlobal := false;
  tmrAplicacion.Enabled := True;
end;

procedure TfrmPrincipal.miAccionSalirExecute(Sender: TObject);
begin
  if MessageDlg('¿Desea salir de la aplicación?', mtConfirmation, mbOkCancel, 0) = mrOk then begin
    DM.DesconectarBaseDatosGesimag;
    Close;
  end;
end;

procedure TfrmPrincipal.miAccionWebExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://portal.3shapecommunicate.com/login' , '', '', SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.miBuscarImagenesExecute(Sender: TObject);
begin
  busquedaGlobal              := not busquedaGlobal;
  miBuscarImagenes.Checked    := busquedaGlobal;
  miImportarmagenes.Enabled   := not busquedaGlobal;
  miHistorialPaciente.Enabled := not busquedaGlobal;

  if miBuscarImagenes.Checked then DM.FTipoBusqueda := tbGlobal
  else begin
    DM.FTipoBusqueda := tbPorPaciente;
    VisorImagenes.LimpiarFiltros;
  end;
  VisorImagenes.RefrescarDatos;
  VisorImagenes.GestionaAcciones;
end;

procedure TfrmPrincipal.miHistorialPacienteExecute(Sender: TObject);
var frmHistorialPaciente: TfrmHistorialPaciente;
begin
  frmHistorialPaciente := TfrmHistorialPaciente.Create(Self);
  try
    frmHistorialPaciente.Inicializar;
    frmHistorialPaciente.CargarHistorial;
    frmHistorialPaciente.ShowModal;
    BorrarCarpeta(frmHistorialPaciente.directorioTemporal);
  finally
    frmHistorialPaciente.Free;
  end;
end;

procedure TfrmPrincipal.actGenericoExecute(Sender: TObject);
var Existe: Boolean;
begin
  Existe := DM.BuscarInstancias(TAction(Sender).HelpKeyword);
  if not Existe then begin
    with TfrmBaseGrillaClass(GetClass(TAction(Sender).HelpKeyword)).Create(Self) do begin
      LockWindowUpdate(Self.Handle);
      Show;
      LockWindowUpdate(0);
    end;
  end;
end;

procedure TfrmPrincipal.miImportarmagenesExecute(Sender: TObject);
var i: Integer;
begin
  if DM.ODFicheros.Execute then begin
    DM.FEstadoImagen := eiInsertar;
    DM.FImagen.nombrePaciente := DM.FPaciente.nombre + ' ' + DM.FPaciente.apellidos;
    for i := 0 to DM.ODFicheros.Files.Count - 1 do begin
      DM.FImagen.nombreImagenTemporal := DM.ODFicheros.Files[i];
      VisorImagenes.EditarImagen;
    end;
    if DM.ODFicheros.Files.Count > 0 then
      VisorImagenes.RefrescarDatos;
  end;
end;

procedure TfrmPrincipal.miPresentacionExecute(Sender: TObject);
var frmSeleccionImagenes: TfrmSeleccionImagenes;
begin
  frmSeleccionImagenes := TfrmSeleccionImagenes.Create(Self);
  try
    frmSeleccionImagenes.ShowModal;
    BorrarCarpeta(frmSeleccionImagenes.directorioTemporal);
  finally
    frmSeleccionImagenes.Free;
  end;
end;

procedure TfrmPrincipal.tmrAplicacionTimer(Sender: TObject);
begin
  tmrAplicacion.Enabled := False;

  if VisorImagenes = nil then begin
    // Conectamos con la base de datos
    DM.ConectarBaseDatosGesimag;
    // Creamos la tabla Img_TTipoImagen
    DM.CrearTablaTTipoImg;
    // Creamos el campo Activo en las tablas TTipoImg, TTipoPlt y TZona
    DM.CrearCamposActivoTTipoImg;
    DM.CrearCamposActivoTTipoPlt;
    DM.CrearCamposActivoTZona;
    // Cargamos los datos del paciente
    if DM.FPaciente.idPac > 0 then begin
      DM.FPaciente.LoadFromDB;
      // Si no existe el paciente en Gesimag, lo creamos
      if DM.FPaciente.numPac = '' then begin
        DM.FPaciente.iniFileToObject;
        DM.FPaciente.guardarPaciente;
      end;
    end else begin
      MessageDlg('NO SE ENCUENTRA NINGUN PACIENTE!', mtError, [mbOk], 0);
      DM.DesconectarBaseDatosGesimag;
      Application.Terminate;
    end;

    Self.Caption := Self.Caption + ' - ' + DM.FPaciente.nombre + ' ' + DM.FPaciente.apellidos + ' [' + DM.FPaciente.numPac + ']';
    VisorImagenes := TfrmVisorImagenes.CreateIncrustado(Self, pnPrincipal);
  end;
  VisorImagenes.Visible := True;
  VisorImagenes.RefrescarDatos;
end;

end.
