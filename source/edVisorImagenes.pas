unit edVisorImagenes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, edBaseGrilla, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus, cxContainer,
  dxBarBuiltInMenu, dxSkinsdxBarPainter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, System.Actions,
  Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxBar, cxClasses,
  cxPC, cxLabel, Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ExtCtrls, cxGridCardView, cxGridCustomLayoutView, cxGridDBCardView,
  dxLayoutContainer, cxGridViewLayoutContainer, cxGridLayoutView,
  cxGridDBLayoutView, dxmdaset, jpeg, cxImage, cxTextEdit, cxBarEditItem,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, dxBarExtItems;

type
  TfrmVisorImagenes = class(TfrmBaseGrilla)
    cxGrid1CardView: TcxGridCardView;
    cxGrid1CardViewRow1: TcxGridCardViewRow;
    cxGrid1CardViewRow2: TcxGridCardViewRow;
    cxGrid2: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    grillaCard: TcxGridDBCardView;
    memListado: TdxMemData;
    grillaCardRowImagen: TcxGridDBCardViewRow;
    grillaCardRowFechaCatalogacion: TcxGridDBCardViewRow;
    actVerImagen: TAction;
    dxBarButton2: TdxBarButton;
    grillaCardRowTiposImagen: TcxGridDBCardViewRow;
    cxBarEditItem1: TcxBarEditItem;
    cbTiposImagenes: TdxBarCombo;
    btLimpiar: TdxBarButton;
    btBuscar: TdxBarButton;
    actEditarImagen: TAction;
    dxBarButton3: TdxBarButton;
    grillaCardRowNumHistorial: TcxGridDBCardViewRow;
    actEliminarImagen: TAction;
    pnlBusqueda: TPanel;
    cbTiposImagen: TcxCheckComboBox;
    lbTipoImagen: TcxLabel;
    lbCatalogacionDesde: TcxLabel;
    lbImportacionDesde: TcxLabel;
    deCatalogacionDesde: TcxDateEdit;
    deImportacionDesde: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    deCatalogacionHasta: TcxDateEdit;
    deImportacionHasta: TcxDateEdit;
    btnBuscar: TcxButton;
    cxBarEditItem2: TcxBarEditItem;
    dateDesde: TdxBarDateCombo;
    dxBarListItem1: TdxBarListItem;
    dxBarEdit1: TdxBarEdit;
    cxBarEditItem3: TcxBarEditItem;
    dateHasta: TdxBarDateCombo;
    btBuscarFecha: TdxBarButton;
    btLimpiarFecha: TdxBarButton;
    dxBarButton4: TdxBarButton;
    procedure actVerImagenExecute(Sender: TObject);
    procedure grillaCardEditDblClick(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure btLimpiarClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure grillaCardEditKeyPress(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
    procedure cbTiposImagenesChange(Sender: TObject);
    procedure actEliminarImagenExecute(Sender: TObject);
    procedure actEditarImagenExecute(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure cbTiposImagenPropertiesChange(Sender: TObject);
    procedure deCatalogacionDesdePropertiesEditValueChanged(Sender: TObject);
    procedure deCatalogacionHastaPropertiesEditValueChanged(Sender: TObject);
    procedure deImportacionDesdePropertiesEditValueChanged(Sender: TObject);
    procedure deImportacionHastaPropertiesEditValueChanged(Sender: TObject);
    procedure btBuscarFechaClick(Sender: TObject);
    procedure btLimpiarFechaClick(Sender: TObject);
    procedure dateDesdeChange(Sender: TObject);
    procedure cbTiposImagenesEnter(Sender: TObject);
    procedure cbTiposImagenEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FIdPac: Integer;
    FCodigoTipoImagen: Variant;
    FFecCatalogDesde: Variant;
    FFecCatalogHasta: Variant;
    FFecImportaDesde: Variant;
    FFecImportaHasta: Variant;
    visualizarNumPac: Boolean;

    constructor CreateIncrustado(AOwner: TComponent; AParent: TWinControl); override;

    function MontarQuery: string; override;
    procedure RellenarParametros; override;
    procedure GestionaAcciones; override;
    procedure RefrescarDatos; override;
    procedure ConfiguraColumnas; override;
    procedure RellenarComboTiposImagenes;
    procedure LeerImagenes;
    procedure EditarImagen;
    procedure VerImagen;
    procedure LimpiarFiltros;
    function DameTiposImagen(IdImg: Integer): string;
  end;

var
  frmVisorImagenes: TfrmVisorImagenes;

implementation

uses Data, edImagenPaciente, edEdicionImagen, edFuncionesImagen;

{$R *.dfm}

{ TfrmVisorImagenes }

constructor TfrmVisorImagenes.CreateIncrustado(AOwner: TComponent; AParent: TWinControl);
begin
  inherited;
  FCampoCodigo := 'IdImg';
  grillaCard.DataController.DataSource := dsListado;
  LimpiarFiltros;
end;

procedure TfrmVisorImagenes.LimpiarFiltros;
begin
  FCodigoTipoImagen       := Null;
  FFecCatalogDesde        := Null;
  FFecCatalogHasta        := Null;
  FFecImportaDesde        := Null;
  FFecImportaHasta        := Null;
  visualizarNumPac        := False;

  cbTiposImagen.EditValue       := '';
  deCatalogacionDesde.EditValue := Null;
  deCatalogacionHasta.EditValue := Null;
  deImportacionDesde.EditValue  := Null;
  deImportacionHasta.EditValue  := Null;
end;

function TfrmVisorImagenes.MontarQuery: string;
begin
  FSQL := 'select distinct i.idpac, i.IdImg, i.Descripcion, ti.Descripcio DescTipoImg, f.Descripcio DescFuente, i.FecCatalog, ' +
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
          'where i.idimg > 0';
  if DM.FTipoBusqueda = tbPorPaciente then begin
    FSQL := FSQL + '  and i.IdPac = :IDPAC';
  end else begin
    if FCodigoTipoImagen <> Null then
      FSQL := FSQL + '  and it.IdTipoImg in (' + FCodigoTipoImagen + ')'
    else
      FSQL := FSQL + '  and it.IdTipoImg = -1';
    if (FFecCatalogDesde <> Null) and (FFecCatalogHasta = Null) then begin
      FSQL := FSQL + '  and i.FecCatalog >= :FECCATALOGDESDE';
    end;
    if (FFecCatalogDesde = Null) and (FFecCatalogHasta <> Null) then begin
      FSQL := FSQL + '  and i.FecCatalog <= :FECCATALOGHASTA';
    end;
    if (FFecCatalogDesde <> Null) and (FFecCatalogHasta <> Null) then begin
      FSQL := FSQL + '  and i.FecCatalog >= :FECCATALOGDESDE and i.FecCatalog <= :FECCATALOGHASTA';
    end;
    if (FFecImportaDesde <> Null) and (FFecImportaHasta = Null) then begin
      FSQL := FSQL + '  and i.FecImporta >= :FECIMPORTADESDE';
    end;
    if (FFecImportaDesde = Null) and (FFecImportaHasta <> Null) then begin
      FSQL := FSQL + '  and i.FecImporta <= :FECIMPORTAHASTA';
    end;
    if (FFecImportaDesde <> Null) and (FFecImportaHasta <> Null) then begin
      FSQL := FSQL + '  and i.FecImporta >= :FECIMPORTADESDE and i.FecImporta <= :FECIMPORTAHASTA';
    end;
  end;

  FSQL := FSQL + '  and isnull(i.IdFormato, 0) in (0, 2) '; // Sólo las JPG y DICOM
  if DM.FTipoBusqueda = tbPorPaciente then begin
    FSQL := FSQL + 'order by i.FecImporta desc, i.HorImporta desc';
  end else begin
    FSQL := FSQL + 'order by i.IdPac, i.FecImporta desc, i.HorImporta desc';
  end;
  Result := FSQL;
  inherited;
end;

procedure TfrmVisorImagenes.RellenarParametros;
begin
  inherited;
  if Assigned(TFDQuery(dsListado.DataSet).Params.FindParam('IDPAC')) then begin
    TFDQuery(dsListado.DataSet).ParamByName('IDPAC').Value := DM.FPaciente.idPac;
  end;
  if Assigned(TFDQuery(dsListado.DataSet).Params.FindParam('FECCATALOGDESDE')) then begin
    TFDQuery(dsListado.DataSet).ParamByName('FECCATALOGDESDE').Value := FFecCatalogDesde;
  end;
  if Assigned(TFDQuery(dsListado.DataSet).Params.FindParam('FECCATALOGHASTA')) then begin
    TFDQuery(dsListado.DataSet).ParamByName('FECCATALOGHASTA').Value := FFecCatalogHasta;
  end;
  if Assigned(TFDQuery(dsListado.DataSet).Params.FindParam('FECIMPORTADESDE')) then begin
    TFDQuery(dsListado.DataSet).ParamByName('FECIMPORTADESDE').Value := FFecImportaDesde;
  end;
  if Assigned(TFDQuery(dsListado.DataSet).Params.FindParam('FECIMPORTAHASTA')) then begin
    TFDQuery(dsListado.DataSet).ParamByName('FECIMPORTAHASTA').Value := FFecImportaHasta;
  end;
end;

procedure TfrmVisorImagenes.GestionaAcciones;
begin
  inherited;
  actNuevo.Visible                  := False;
  actEliminar.Visible               := False;
  actGrabar.Visible                 := False;
  actCancelar.Visible               := False;
  actVerImagen.Enabled              := (not dsListado.DataSet.IsEmpty);
  actEliminarImagen.Enabled         := (not dsListado.DataSet.IsEmpty);
  actEditarImagen.Enabled           := (not dsListado.DataSet.IsEmpty);
  pnlBusqueda.Visible               := (DM.FTipoBusqueda = tbGlobal);
  grillaCardRowNumHistorial.Visible := (DM.FTipoBusqueda = tbGlobal) and (visualizarNumPac);
  cbTiposImagenes.Enabled           := (DM.FTipoBusqueda = tbPorPaciente);
  dateDesde.Enabled                 := (DM.FTipoBusqueda = tbPorPaciente);
  dateHasta.Enabled                 := (DM.FTipoBusqueda = tbPorPaciente);
end;

procedure TfrmVisorImagenes.RellenarComboTiposImagenes;
var qTipos: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qTipos);
  try
    qTipos.SQL.Clear;
    qTipos.SQL.Add('SELECT Descripcio FROM TTipoImg WHERE ISNULL(Activo, 1) = 1 ORDER BY IdTipoImg');
    qTipos.Open;

    cbTiposImagenes.Items.Clear;
    while not qTipos.Eof do begin
      cbTiposImagenes.Items.Add(qTipos.FieldByName('Descripcio').AsString);
      qTipos.Next;
    end;
  finally
    DM.DestruirQuery(qTipos);
  end;
end;

procedure TfrmVisorImagenes.grillaCardEditDblClick(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
begin
  inherited;
  DM.FEstadoImagen := eiEditar;
  DM.FImagen.idImg := dsListado.DataSet.FieldByName('IdImg').AsInteger;
  EditarImagen;
end;

procedure TfrmVisorImagenes.grillaCardEditKeyPress(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
  inherited;
  // No hacer nada
end;

procedure TfrmVisorImagenes.RefrescarDatos;
begin
  inherited;
  try
    grillaDB.DataController.DataSource := nil;
    grillaDB.DataController.BeginUpdate;
    grillaDB.OptionsView.HeaderAutoHeight := True;
    memListado.Fields.Clear;
    memListado.FieldDefs.Clear;

    dsListado.DataSet := memListado;
    DM.MemoryCreaCamp(memListado, 'IMAGEN', ftGraphic);
    TdxMemData(memListado).CreateFieldsFromDataSet(qListado);
    DM.MemoryCreaCamp(memListado, 'TIPOSIMAGEN', ftString);

    memListado.AfterPost := nil;
    memListado.DisableControls;
    TdxMemData(memListado).LoadFromDataSet(qListado);

    memListado.Open;
    memListado.Refresh;
    memListado.First;

    LeerImagenes;
    memListado.First;
  finally
    memListado.EnableControls;
    grillaDB.DataController.DataSource := dsListado;
    grillaDB.DataController.EndUpdate;
    if qListado.Active then qListado.Close;
  end;
end;

procedure TfrmVisorImagenes.LeerImagenes;
var nombreImagen: string; jpg: TJPEGImage; stream, f: TStream;
begin
  jpg := TJPEGImage.Create;
  try
    while not memListado.Eof do begin
      nombreImagen := DameNombreImagenTh(memListado.FieldByName('IdImg').AsInteger);
      memListado.Edit;
      if FileExists(nombreImagen) then begin
        jpg.LoadFromFile(nombreImagen);
        memListado.FieldByName('IMAGEN').Assign(jpg);
      end;
      memListado.FieldByName('TIPOSIMAGEN').AsString := DameTiposImagen(memListado.FieldByName('IdImg').AsInteger);
      memListado.Post;
      memListado.Next;
    end;
  finally
    FreeAndNil(jpg);
  end;
end;

function TfrmVisorImagenes.DameTiposImagen(IdImg: Integer): string;
var qTipos: TFDQuery;
begin
  Result := '';
  DM.CrearQuery(DM.ConexionGesimag, qTipos);
  try
    qTipos.SQL.Clear;
    qTipos.SQL.Add('SELECT t.Descripcio');
    qTipos.SQL.Add('  FROM Img_TipoImagen i');
    qTipos.SQL.Add('       LEFT JOIN TTipoImg t ON t.IdTipoImg = i.IdTipoImg');
    qTipos.SQL.Add(' WHERE i.IdImg = :IdImg');
    qTipos.ParamByName('IdImg').AsInteger := IdImg;
    qTipos.Open;

    while not qTipos.Eof  do begin
      Result := Result + qTipos.FieldByName('Descripcio').AsString + '; ';
      qTipos.Next;
    end;
    if Result <> '' then
      Result := Copy(Result, 1, Length(Result) - 2);
  finally
    DM.DestruirQuery(qTipos);
  end;
end;

procedure TfrmVisorImagenes.btBuscarClick(Sender: TObject);
begin
  inherited;
  grillaCard.DataController.Filter.Options := [fcoCaseInsensitive];
  grillaCard.DataController.Filter.Root.BoolOperatorKind := fboOr;
  grillaCard.DataController.Filter.Root.Clear;
  grillaCard.DataController.Filter.Root.AddItem(grillaCardRowTiposImagen, foLike, '%' + cbTiposImagenes.Text + '%', '%' + cbTiposImagenes.Text + '%');
  grillaCard.DataController.Filter.Active := True;
end;

procedure TfrmVisorImagenes.btLimpiarClick(Sender: TObject);
begin
  inherited;
  cbTiposImagenes.ItemIndex := -1;
  grillaCard.DataController.Filter.Root.Clear;
  grillaCard.DataController.Filter.Active := False;
end;

procedure TfrmVisorImagenes.btBuscarFechaClick(Sender: TObject);
var desde, hasta: string; continuar: Boolean;
begin
  inherited;
  continuar := True;
  desde     := '';
  hasta     := '';

  if dateDesde.Date > 0 then
    desde := FormatDateTime('dd/m/yyyy', dateDesde.Date);
  if dateHasta.Date > 0 then
    hasta := FormatDateTime('dd/mm/yyyy', dateHasta.Date);

  if (desde <> '') and (hasta <> '') then begin
    if dateDesde.date > dateHasta.Date then begin
      MessageDlg('La fecha desde no puede ser mayor a la fecha hasta!', mtWarning, [mbOk], 0);
      continuar := False;
    end;
  end;

  if continuar then begin
    grillaCard.DataController.Filter.Options := [fcoCaseInsensitive];
    grillaCard.DataController.Filter.Root.BoolOperatorKind := fboAnd;
    grillaCard.DataController.Filter.Root.Clear;
    if desde <> '' then grillaCard.DataController.Filter.Root.AddItem(grillaCardRowFechaCatalogacion, foGreaterEqual, desde, desde);
    if hasta <> '' then grillaCard.DataController.Filter.Root.AddItem(grillaCardRowFechaCatalogacion, foLessEqual, hasta, hasta);
    grillaCard.DataController.Filter.Active := True;
  end;
end;

procedure TfrmVisorImagenes.btLimpiarFechaClick(Sender: TObject);
begin
  inherited;
  dateDesde.Text := '';
  dateHasta.Text := '';
  grillaCard.DataController.Filter.Root.Clear;
  grillaCard.DataController.Filter.Active := False;
end;

procedure TfrmVisorImagenes.dateDesdeChange(Sender: TObject);
begin
  inherited;
  btBuscarFecha.Enabled := (dateDesde.Date > 0) or (dateHasta.Date > 0);
  btLimpiarFecha.Enabled := (dateDesde.Date > 0) or (dateHasta.Date > 0);
end;

procedure TfrmVisorImagenes.deCatalogacionDesdePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  FFecCatalogDesde := deCatalogacionDesde.EditingValue;
end;

procedure TfrmVisorImagenes.deCatalogacionHastaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  FFecCatalogHasta :=  deCatalogacionHasta.EditingValue;
end;

procedure TfrmVisorImagenes.deImportacionDesdePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  FFecImportaDesde := deImportacionDesde.EditingValue;
end;

procedure TfrmVisorImagenes.deImportacionHastaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  FFecImportaHasta := deImportacionHasta.EditingValue;
end;

procedure TfrmVisorImagenes.btnBuscarClick(Sender: TObject);
var puedoContinuar: Boolean;
begin
  inherited;
  puedoContinuar := False;
  if((FFecCatalogDesde <> Null) and (FFecCatalogHasta = Null)) or ((FFecCatalogDesde = Null) and (FFecCatalogHasta <> Null)) or ((FFecCatalogDesde <> Null) and (FFecCatalogHasta <> Null)) then
    puedoContinuar := True;

  if (puedoContinuar) and ((FFecImportaDesde <> Null) and (FFecImportaHasta = Null)) or ((FFecImportaDesde = Null) and (FFecImportaHasta <> Null)) or ((FFecImportaDesde <> Null) and (FFecImportaHasta <> Null)) then
    puedoContinuar := True;
  if puedoContinuar then begin
    visualizarNumPac := True;
    RefrescarDatos;
  end else begin
    MessageDlg('Por motivos de rendimiento, es obligatorio seleccionar alguna de las fechas de Importación o Catalogación!', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmVisorImagenes.cbTiposImagenPropertiesChange(Sender: TObject);
begin
  inherited;
  FCodigoTipoImagen := DM.DameCodigosSeleccionados(cbTiposImagen);
  deCatalogacionDesde.Enabled := (FCodigoTipoImagen <> Null);
  deCatalogacionHasta.Enabled := deCatalogacionDesde.Enabled;
  deImportacionDesde.Enabled  := deCatalogacionDesde.Enabled;
  deImportacionHasta.Enabled  := deCatalogacionDesde.Enabled;
  btnBuscar.Enabled           := deCatalogacionDesde.Enabled;
end;

procedure TfrmVisorImagenes.cbTiposImagenEnter(Sender: TObject);
begin
  inherited;
  DM.CarregaCheckComboBox(SQL_TIPOS_IMAGEN, cbTiposImagen, ['Descripcion']);
end;

procedure TfrmVisorImagenes.cbTiposImagenesChange(Sender: TObject);
begin
  inherited;
  btBuscar.Enabled := cbTiposImagenes.ItemIndex > -1;
  btLimpiar.Enabled := cbTiposImagenes.ItemIndex > -1;
end;

procedure TfrmVisorImagenes.cbTiposImagenesEnter(Sender: TObject);
begin
  inherited;
  RellenarComboTiposImagenes;
end;

procedure TfrmVisorImagenes.actVerImagenExecute(Sender: TObject);
begin
  inherited;
  VerImagen;
end;

procedure TfrmVisorImagenes.VerImagen;
var nombreImagen: string; frmImagenPaciente: TfrmImagenPaciente;
begin
  DM.FImagen.idImg := dsListado.DataSet.FieldByName('IdImg').AsInteger;
  DM.FImagen.LoadFromDB;

  nombreImagen  := DameNombreImagen(DM.FImagen.idImg);
  if FileExists(nombreImagen) then begin
    frmImagenPaciente := TfrmImagenPaciente.Create(Self, nombreImagen);
    try
      frmImagenPaciente.ShowModal;
    finally
      frmImagenPaciente.Free;
    end;
  end;
end;

procedure TfrmVisorImagenes.actEditarImagenExecute(Sender: TObject);
begin
  inherited;
  DM.FEstadoImagen := eiEditar;
  DM.FImagen.idImg := dsListado.DataSet.FieldByName('IdImg').AsInteger;
  EditarImagen;
end;

procedure TfrmVisorImagenes.EditarImagen;
var rowActual: Integer; frmEdicionImagen: TfrmEdicionImagen;
begin
  frmEdicionImagen := TfrmEdicionImagen.Create(Self);
  frmEdicionImagen.CargarCombos;
  frmEdicionImagen.PasarDatosImagen;
  if frmEdicionImagen.ShowModal = mrOk then begin
    frmEdicionImagen.ScreenToObject;
    frmEdicionImagen.Free;

    DM.FImagen.guardarImagen;
    if TdxMemData(dsListado.DataSet).Locate('IdImg', DM.FImagen.idImg, []) then begin
      TdxMemData(dsListado.DataSet).Edit;
      TdxMemData(dsListado.DataSet).FieldByName('FecCatalog').Value := DM.FImagen.fecCatalog;
      TdxMemData(dsListado.DataSet).FieldByName('FecImporta').Value := DM.FImagen.fecImporta;
      TdxMemData(dsListado.DataSet).FieldByName('HorImporta').Value := DM.FImagen.horImporta;
      TdxMemData(dsListado.DataSet).FieldByName('DescFuente').Value := DM.FImagen.descFuente;
      TdxMemData(dsListado.DataSet).FieldByName('TIPOSIMAGEN').AsString := DameTiposImagen(DM.FImagen.idImg);
      TdxMemData(dsListado.DataSet).Post;
      TdxMemData(dsListado.DataSet).Refresh;
    end;
  end else begin
    frmEdicionImagen.Free;
  end;
end;

procedure TfrmVisorImagenes.actEliminarImagenExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('¿Desea eliminar la imagen seleccionada?', mtConfirmation, [MbYes, MbNo], 0) = mrYes then begin
    DM.FImagen.idImg          := dsListado.DataSet.FieldByName('IdImg').AsInteger;
    DM.FImagen.nombreImagen   := DameNombreImagen(DM.FImagen.idImg);
    DM.FImagen.nombreImagenTh := DameNombreImagenTh(DM.FImagen.idImg);
    DM.FImagen.eliminarImagen;
    RefrescarDatos;
  end;
end;

procedure TfrmVisorImagenes.ConfiguraColumnas;
begin
  inherited;
  grillaDB.OptionsView.ColumnAutoWidth := True;
  DM.GrillaModificaColumna(grillaDB, 'IdPac', 'Id. Paciente', False, False, 90);
  DM.GrillaModificaColumna(grillaDB, 'IdImg', 'Id. Imagen', True, False, 90);
  DM.GrillaModificaColumna(grillaDB, 'DescTipoImg', 'Tipo Imagen', True, False, 100);
end;


end.
