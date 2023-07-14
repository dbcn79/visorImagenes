unit edSeleccionImagenes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxLabel, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, Vcl.ComCtrls, dxCore, cxDateUtils, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxMaskEdit, cxCheckBox, cxCheckComboBox, cxDBLookupComboBox, cxTrackBar,
  cxSpinEdit, cxImageComboBox, cxGridDBTableView, Data.DB, FireDAC.Comp.Client;

type
  TfrmSeleccionImagenes = class(TForm)
    pnFiltros: TPanel;
    pnBotones: TPanel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    cxLabel6: TcxLabel;
    pnPropiedades: TPanel;
    lblDisplayInterval: TLabel;
    lblDisplayIntervalValue: TLabel;
    cbEstilos: TcxImageComboBox;
    gbProgressControl: TGroupBox;
    lblProgressStep: TLabel;
    lblProgressDelay: TLabel;
    seProgressStep: TcxSpinEdit;
    seProgressDelay: TcxSpinEdit;
    cxLabel4: TcxLabel;
    tbDisplayInterval: TcxTrackBar;
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel7: TcxLabel;
    cbTiposImagen: TcxCheckComboBox;
    deDesde: TcxDateEdit;
    cxLabel8: TcxLabel;
    deHasta: TcxDateEdit;
    Timer: TTimer;
    cbFuente: TcxExtLookupComboBox;
    cbZona: TcxExtLookupComboBox;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbDisplayIntervalPropertiesChange(Sender: TObject);
    procedure deDesdePropertiesEditValueChanged(Sender: TObject);
    procedure deHastaPropertiesEditValueChanged(Sender: TObject);
    procedure cbTiposImagenPropertiesChange(Sender: TObject);
  private
    procedure CargarCombos;
    { Private declarations }
  public
    { Public declarations }
    FRepositoryZona: TcxEditRepositoryExtLookupComboBoxItem;
    FRepositoryFuente: TcxEditRepositoryExtLookupComboBoxItem;
    FVistaZona: TcxGridDBTableView;
    FVistaFuente: TcxGridDBTableView;
    FdsZona: TDataSource;
    FdsFuente: TDataSource;
    FqZona: TFDQuery;
    FqFuente: TFDQuery;

    directorioTemporal: string;
    FFecImportaDesde: Variant;
    FFecImportaHasta: Variant;
    FCodigoTipoImagen: Variant;
    FCodigoFuente: Variant;
    FCodigoZona: Variant;

    destructor Destroy;
    function DameSQL: string;
    procedure PresentarImagenes;
  end;

var
  frmSeleccionImagenes: TfrmSeleccionImagenes;

implementation

uses Data, edPresentacionImagenes, edFuncionesImagen;

{$R *.dfm}

procedure TfrmSeleccionImagenes.FormCreate(Sender: TObject);
begin
  CargarCombos;
  directorioTemporal := IncludeTrailingBackslash(IncludeTrailingBackslash(GetTempDir) + 'Presentacion');
  directorioTemporal := IncludeTrailingBackslash(directorioTemporal + DM.FPaciente.idPac.ToString);
  ForceDirectories(directorioTemporal);
  FFecImportaDesde  := Null;
  FFecImportaHasta  := Null;
  FCodigoTipoImagen := Null;
  FCodigoFuente     := Null;
  FCodigoZona       := Null;
end;

destructor TfrmSeleccionImagenes.Destroy;
begin
  FqZona.Free;
  FqFuente.Free;
  FdsZona.Free;
  FdsFuente.Free;
  FVistaZona.Free;
  FVistaFuente.Free;
  FRepositoryZona.Free;
  FRepositoryFuente.Free;
end;

procedure TfrmSeleccionImagenes.CargarCombos;
begin
  DM.CarregaDades(SQL_ZONA, FRepositoryZona, FVistaZona, FqZona, FdsZona, cbZona,
                  ['CODIGO', 'DESCRIPCIO'], ['Código', 'Zona'], [False, True], [0, 0], [], [], 'DESCRIPCIO', False);
  DM.CarregaDades(SQL_FUENTE, FRepositoryFuente, FVistaFuente, FqFuente, FdsFuente, cbFuente,
                  ['CODIGO', 'DESCRIPCIO'], ['Código', 'Fuente'], [False, True], [0, 0], [], [], 'DESCRIPCIO', False);
  DM.CarregaCheckComboBox(SQL_TIPOS_IMAGEN, cbTiposImagen, ['Descripcion']);
end;

procedure TfrmSeleccionImagenes.tbDisplayIntervalPropertiesChange(Sender: TObject);
begin
  Timer.Interval := tbDisplayInterval.Position;
  lblDisplayIntervalValue.Caption := Format('[ %.1f Segundos ]', [Timer.Interval / 1000]);
end;

procedure TfrmSeleccionImagenes.btnAceptarClick(Sender: TObject);
var qGenerica: TFDQuery; nombreImagen: string;
begin
  DM.CrearQuery(DM.ConexionGesimag, qGenerica);
  try
    qGenerica.SQL.Add(DameSQL);
    qGenerica.ParamByName('IDPAC').Value := DM.FPaciente.idPac;
    if Assigned(qGenerica.Params.FindParam('FECIMPORTADESDE')) then begin
      qGenerica.ParamByName('FECIMPORTADESDE').Value := FFecImportaDesde;
    end;
    if Assigned(qGenerica.Params.FindParam('FECIMPORTAHASTA')) then begin
      qGenerica.ParamByName('FECIMPORTAHASTA').Value := FFecImportaHasta;
    end;
    qGenerica.Open;
    while not qGenerica.Eof do begin
      nombreImagen := DameNombreImagen(qGenerica.FieldByName('IdImg').AsInteger);
      CopyFile(PChar(nombreImagen), PChar(directorioTemporal + ExtractFileName(nombreImagen)), True);
      qGenerica.Next;
    end;
  finally
    if qGenerica.RecordCount > 1 then begin
      PresentarImagenes;
    end else begin
      MessageDlg('La presentación debe de contemplar más de una imagen', mtInformation, [mbOk], 0);
    end;
    DM.DestruirQuery(qGenerica);
  end;
end;

function TfrmSeleccionImagenes.DameSQL: string;
begin
  Result := 'select distinct i.idpac, i.IdImg, i.Descripcion, ti.Descripcio DescTipoImg, f.Descripcio DescFuente, i.FecCatalog, ' +
            '       i.FecImporta, i.HorImporta, i.Calibre, i.Automatica, cast(i.Comentario as varchar(2000)) Comentario, ' +
            '       i.Cefalometria, i.Implantologia, i.Piezas, e.Descripcio DescEspec, tm.Descripcio DescTipoMag, ' +
            '       isnull(i.IdFormato, 0) IdFormato, p.NumPac, p.Nombre + '' '' + p.Apellidos NombrePaciente ' +
            'from img i ' +
            '  left join TTipoImg ti on ti.IdTipoImg = i.IdTipoImg ' +
            '  left join TFuente f on f.IdFuente = i.IdFuente ' +
            '  left join TZona z on z.IdZona = i.IdZona ' +
            '  left join TTipoMag tm on tm.IdTipo = i.FactorMag ' +
            '  left join TEspec e on e.IdEspec = i.IdEspec ' +
            '  left join Paciente p on p.IdPac = i.IdPac ' +
            '  left join Img_TipoImagen it on it.IdImg = i.IdImg ' +
            'where i.idimg > 0' +
            '  and i.IdPac = :IDPAC';

    if (FFecImportaDesde <> Null) and (FFecImportaHasta = Null) then begin
      Result := Result + '  and i.FecImporta >= :FECIMPORTADESDE';
    end;
    if (FFecImportaDesde = Null) and (FFecImportaHasta <> Null) then begin
      Result := Result + '  and i.FecImporta <= :FECIMPORTAHASTA';
    end;
    if (FFecImportaDesde <> Null) and (FFecImportaHasta <> Null) then begin
      Result := Result + '  and i.FecImporta >= :FECIMPORTADESDE and i.FecImporta <= :FECIMPORTAHASTA';
    end;
    if FCodigoTipoImagen <> Null then
      Result := Result + '  and it.IdTipoImg in (' + FCodigoTipoImagen + ')';
    if FCodigoFuente <> Null then
      Result := Result + '  and i.IdFuente = ' + FCodigoFuente.ToString;
    if FCodigoZona <> Null then
      Result := Result + '  and i.IdZona = ' + FCodigoZona.ToString;

  Result := Result + '  and isnull(i.IdFormato, 0) in (0, 2) '; // Sólo las JPG y DICOM
  Result := Result + 'order by i.IdPac, i.FecImporta desc, i.HorImporta desc';
end;

procedure TfrmSeleccionImagenes.PresentarImagenes;
var frmPresentacionImagenes: TfrmPresentacionImagenes;
begin
  frmPresentacionImagenes := TfrmPresentacionImagenes.Create(Self);
  frmPresentacionImagenes.style := cbEstilos.EditValue;
  frmPresentacionImagenes.delay := seProgressDelay.Value;
  frmPresentacionImagenes.step  := seProgressStep.Value;
  frmPresentacionImagenes.CreateImageList(directorioTemporal);
  frmPresentacionImagenes.InicializarValores;
  frmPresentacionImagenes.WindowState := wsMaximized;
  frmPresentacionImagenes.ShowModal;
  frmPresentacionImagenes.Free;
end;

procedure TfrmSeleccionImagenes.deDesdePropertiesEditValueChanged(Sender: TObject);
begin
  FFecImportaDesde := deDesde.EditValue;
end;

procedure TfrmSeleccionImagenes.deHastaPropertiesEditValueChanged(Sender: TObject);
begin
  FFecImportaHasta := deHasta.EditValue;
end;

procedure TfrmSeleccionImagenes.cbTiposImagenPropertiesChange(Sender: TObject);
begin
  FCodigoTipoImagen := DM.DameCodigosSeleccionados(cbTiposImagen);
end;

end.
