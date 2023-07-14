unit edBaseGrilla;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, dxSkinsdxBarPainter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  dxBar, cxClasses, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, cxContainer, cxLabel, Vcl.Menus, dxBarBuiltInMenu, cxPC,
  Vcl.StdCtrls, cxButtons;

const
  WM_GRID_SELECCION_CAMBIADA = WM_USER + 1;

type
  TEstado = (teNinguno, teInsertar, teEditar, teBorrar);

  TfrmBaseGrilla = class(TForm)
    dxBarManager1: TdxBarManager;
    BarraBotones: TdxBar;
    btNuevo: TdxBarButton;
    btEliminar: TdxBarButton;
    btGrabar: TdxBarButton;
    btModificar: TdxBarButton;
    btCancelar: TdxBarButton;
    btSalir: TdxBarButton;
    qListado: TFDQuery;
    dsListado: TDataSource;
    actPrincipal: TActionList;
    actNuevo: TAction;
    actEliminar: TAction;
    actModificar: TAction;
    actGrabar: TAction;
    actCancelar: TAction;
    actSalir: TAction;
    dxBarButton1: TdxBarButton;
    pnlGrilla: TPanel;
    BarraControl: TdxBarDockControl;
    cxGrid1: TcxGrid;
    grillaDB: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pnlDetalle: TPanel;
    cxButton3: TcxButton;
    cxButton5: TcxButton;
    cxLabel6: TcxLabel;
    pcContenedorDetalle: TcxPageControl;
    TabCabecera: TcxTabSheet;
    pnlTituloDatosBasicos: TPanel;
    cxLabel3: TcxLabel;
    pmMenu: TPopupMenu;
    actRefrescarDatos: TAction;
    RefrescarDatos1: TMenuItem;
    Nuevo1: TMenuItem;
    Modificar1: TMenuItem;
    Eliminar1: TMenuItem;
    N1: TMenuItem;
    procedure actSalirExecute(Sender: TObject);
    procedure grillaDBSelectionChanged(Sender: TcxCustomGridTableView);
    procedure actNuevoExecute(Sender: TObject);
    procedure actEliminarExecute(Sender: TObject);
    procedure actModificarExecute(Sender: TObject);
    procedure actGrabarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grillaDBDblClick(Sender: TObject);
    procedure actRefrescarDatosExecute(Sender: TObject);
    procedure grillaDBKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    FSQL: string;
    FCampoCodigo: string;
    FDeleteSQL: string;
    FCodigo: Integer;
    FFocoRowIndice: Integer;
    FInsertando: Boolean;
    FCambiarAlSiguienteRegistro: Boolean;
    FEstado: TEstado;
    FOwner: TComponent;

    constructor Create(AOwner: TComponent); virtual;
    constructor CreateIncrustado(AOwner: TComponent; AParent: TWinControl); virtual;
    destructor Destroy; override;

    function MontarQuery: string; virtual;
    procedure PreparaQuery(Query: string); virtual;
    procedure GestionaAcciones; virtual;
    procedure PreparaGrid; virtual;
    procedure RellenarParametros; virtual;
    procedure RefrescarDatos; virtual;
    procedure ConfiguraColumnas; virtual;
    procedure PosicionarFoco(FocoRowIndice: Integer); virtual;
    procedure CambiaDeRegistro; virtual;
    procedure Nuevo; virtual;
    procedure Modificar; virtual;
    procedure Guardar; virtual;

    procedure ReiniciarVariablesRegistro;
    procedure Desenfoca;
    procedure GrillaSeleccionCambiada(var Msg: TMessage); message WM_GRID_SELECCION_CAMBIADA;
  end;

  TfrmBaseGrillaClass = class of TfrmBaseGrilla;

var
  frmBaseGrilla: TfrmBaseGrilla;

implementation

uses Data, edDialogoFiltro, edDialogoFechas;

{$R *.dfm}

constructor TfrmBaseGrilla.Create(AOwner: TComponent);
begin
  inherited Create(nil);
  BorderStyle := bsSingle;
  BorderIcons := [biSystemMenu];
  Position := poScreenCenter;

  FOwner := AOwner;
  FInsertando := False;
  FEstado := teNinguno;
  FCambiarAlSiguienteRegistro := True;
  Visible := True;
  if Assigned(DM) then
    DM.FinstanciasCreadas.Add(ClassName);
end;

constructor TfrmBaseGrilla.CreateIncrustado(AOwner: TComponent; AParent: TWinControl);
begin
  inherited Create(nil);
  Parent := AParent;
  FOwner := AOwner;

  Align := alClient;
  BorderIcons := [];
  BorderStyle := bsNone;
  Visible := True;
  FEstado := teNinguno;
  FInsertando := False;
  FCambiarAlSiguienteRegistro := True;
  actSalir.Visible := False;
end;

destructor TfrmBaseGrilla.Destroy;
begin
  if dsListado.DataSet.Active then
    dsListado.DataSet.Close;

  if Assigned(Self) then begin
    if Assigned(DM) then begin
      if Assigned(DM.FinstanciasCreadas) then begin
        try
          if DM.FinstanciasCreadas.IndexOf(ClassName) > -1 then
            DM.FinstanciasCreadas.Delete(DM.FinstanciasCreadas.IndexOf(ClassName));
        except
        end;
      end;
    end;
  end;

  inherited;
end;

procedure TfrmBaseGrilla.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmBaseGrilla.MontarQuery: string;
begin
  Result := FSQL;
end;

procedure TfrmBaseGrilla.PreparaQuery(Query: string);
var i: Integer;
begin
  if dsListado.DataSet.Active then
    dsListado.DataSet.Close;

  dsListado.DataSet := qListado;
  TFDQuery(dsListado.DataSet).SQL.Text := Query;

  RellenarParametros;
  //siempre se llenan los parametros antes del prepare
  if not (TFDQuery(dsListado.DataSet).Prepared) then TFDQuery(dsListado.DataSet).Prepare;

  dsListado.DataSet.Open;

  GestionaAcciones;
end;

procedure TfrmBaseGrilla.RellenarParametros;
begin
  // Lo hacen los hijos
end;

procedure TfrmBaseGrilla.ConfiguraColumnas;
begin
// Lo hacen los hijos
end;

procedure TfrmBaseGrilla.GestionaAcciones;
begin
  pnlDetalle.Visible := (FEstado in [teInsertar, teEditar]);

  actNuevo.Enabled := (FEstado = teNinguno);
  actModificar.Enabled := (FEstado = teNinguno) and (not dsListado.DataSet.IsEmpty);
  actEliminar.Enabled := (FEstado = teNinguno) and (not dsListado.DataSet.IsEmpty);
  actGrabar.Enabled := FEstado in [teInsertar, teEditar];
  actCancelar.Enabled := FEstado in [teInsertar, teEditar];
end;

procedure TfrmBaseGrilla.PreparaGrid;
begin
  grilladb.ClearItems;
  grillaDB.DataController.DataSource := dsListado;
  grillaDB.DataController.CreateAllItems(True);
  grillaDB.DataController.DataModeController.GridMode := False;
  grillaDB.OptionsView.HeaderAutoHeight := False;
  DM.GrillaOcultaColumnes(grillaDB);
  if dsListado.DataSet.Active then begin
    grillaDB.DataController.Filter.Active := True;
    grillaDB.DataController.ClearSorting(true);
    grillaDB.ApplyBestFit(nil);
    grillaDB.ViewInfo.GroupByBoxViewInfo.Text := 'Arrastra aquí una columna para agrupar por su contenido';
  end;
end;

procedure TfrmBaseGrilla.RefrescarDatos;
begin
  grillaDB.OnSelectionChanged := nil;
  try
    //grillaDB.DataController.BeginFullUpdate;
    PreparaQuery(MontarQuery);

    if grillaDB.ColumnCount = 0 then begin
      PreparaGrid;
      ConfiguraColumnas;
      //GrillaDB.RestoreFromIniFile(FRutaConfigGrid, True, False, [], '', ClassName);
    end;
  finally
    grillaDB.OnSelectionChanged := grillaDBSelectionChanged;
    if FInsertando then begin
      dsListado.DataSet.Last;
      FFocoRowIndice := grillaDB.ViewData.RowCount - 1;
    end;
    PosicionarFoco(FFocoRowIndice);
  end;
end;

procedure TfrmBaseGrilla.PosicionarFoco;
begin
  if grillaDB.ViewData.RowCount > 0 then begin
    if (FFocoRowIndice >= 0) and (FFocoRowIndice < grillaDB.ViewData.RowCount) then begin
      grillaDB.ViewData.Rows[FFocoRowIndice].Focused := True;
      grillaDB.ViewData.Rows[FFocoRowIndice].Selected := True;
    end else begin
      if grillaDB.ViewData.RowCount = FFocoRowIndice then begin
        FFocoRowIndice := grillaDB.ViewData.RowCount - 1;
        grillaDB.ViewData.Rows[FFocoRowIndice].Focused := True;
        grillaDB.ViewData.Rows[FFocoRowIndice].Selected := True;
      end else begin
        FFocoRowIndice := 0;
        grillaDB.ViewData.Rows[0].Focused := True;
        grillaDB.ViewData.Rows[0].Selected := True;
      end;
    end;
  end;
end;

procedure TfrmBaseGrilla.Desenfoca;
begin
// Función que quita el foco al control activo. Muchos controles de, sobre todo, Dev Express (tipo Tcx...etc)
// No adoptan realmente el valor entrado hasta que no pierden el foco engañando a veces al usuario
// con esta rutina se pretende forzar la perdica del foco para evitar ese efecto indeseable

  try
    SelectFirst;// se posiciona en el primer control enfocable
    SelectNext(Self.ActiveControl, True, False);// pasa el foco al siguiente control
  except
    // dado que no es una función vital no nos arriesgamos lo mas mínimo
    // podría fallar (supongo) si no hay nungún control enfocable en ese momento por estar disabled la pantalla p.e.
  end;
end;

procedure TfrmBaseGrilla.grillaDBDblClick(Sender: TObject);
begin
  try
    LockWindowUpdate(Self.Handle);
    FEstado := teEditar;
    GestionaAcciones;
    Modificar;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TfrmBaseGrilla.grillaDBKeyPress(Sender: TObject; var Key: Char);
var
  KeyPressEvent: TKeyPressEvent;
  Valor, ValorDesde, ValorHasta: string;
//  frmDialogoFiltro : TFrmDialogoFiltro;
  Forma: TcxFilterOperatorKind;
  ColumnaEditable: Boolean;
  FiltroAnterior: TcxFilterCriteriaItem;
  ListaFiltros: TcxFilterCriteriaItemList;
begin
  KeyPressEvent := OnKeyPress;
  OnKeyPress := nil;
  try
    try
	    if GrillaDB.DataController.DataSet.Active then begin
	      ColumnaEditable := GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].Options.Editing;

        //if not (dsListado.DataSet.State in [dsInsert, dsEdit]) then begin
        if FEstado = teNinguno then begin
          GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].Options.Editing := False;

          if Assigned(KeyPressEvent) then KeyPressEvent(Self, Key);

          if not (GetKeyState(VK_CONTROL) < 0) then begin
            case ord(Key) of
              VK_ESCAPE, VK_BACK{, VK_F3}: begin
                if (GrillaDB.DataController.Filter.Root.Count > 0) then begin
                  GrillaDB.DataController.Filter.Root.Items[GrillaDB.DataController.Filter.Root.Count-1].Free;
                end;
              end;
              3 : OnKeyPress := KeyPressEvent;
              else if (GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].DataBinding.Field.DataType = ftDateTime) then begin
                frmDialogoFechas := TfrmDialogoFechas.Create(Self);
                frmDialogoFechas.cbDesde.HelpKeyword := key;
                if frmDialogoFechas.ShowModal = mrOk then begin
                  ValorDesde := UpperCase(frmDialogoFechas.cbDesde.Text);
                  ValorHasta := UpperCase(frmDialogoFechas.cbHasta.Text);
                  GrillaDB.DataController.Filter.Active := True;
                  GrillaDB.DataController.Filter.BeginUpdate;
                  GrillaDB.DataController.Filter.SupportedLike := true;
                  GrillaDB.DataController.Filter.Options:= [fcoCaseInsensitive,fcoSoftCompare];

                  try
                    if (ValorDesde <> '') then GrillaDB.DataController.Filter.Root.AddItem(GrillaDB.DataController.GetItemByFieldName(GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].DataBinding.FieldName), foGreaterEqual, ValorDesde, ValorDesde);
                    if (ValorHasta <> '') then GrillaDB.DataController.Filter.Root.AddItem(GrillaDB.DataController.GetItemByFieldName(GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].DataBinding.FieldName), foLessEqual, ValorHasta, ValorHasta);
                  finally
                    GrillaDB.DataController.Filter.EndUpdate;
                  end;
                end;
              end else begin
                frmDialogoFiltro := TFrmDialogoFiltro.Create(Self);
                frmDialogoFiltro.Edit1.Text :=key;
                frmDialogoFiltro.Edit1.SelStart := 1;
                if frmDialogoFiltro.ShowModal = mrOk then begin
                  Valor := uppercase(FrmDialogoFiltro.Edit1.Text);
                  if frmDialogoFiltro.chkEmpiezaPor.Checked then
                    Valor := '%' + Valor + '%';

                  case frmDialogoFiltro.RadioGroup1.ItemIndex of
                    0: Forma := folike;
                    1: Forma := foNotLike;
                    2: Forma := foLess;
                    3: Forma := foGreater;
                    4: Forma := foLessEqual;
                    5: Forma := foGreaterEqual;
                    6: Forma := foInList;
                    7: begin
                        Forma := foEqual;
                        Valor := '';
                    end;
                    else Forma := foEqual;
                  end;
                  GrillaDB.DataController.Filter.Active := True;
                  GrillaDB.DataController.Filter.BeginUpdate;
                  GrillaDB.DataController.Filter.SupportedLike := True;
                  GrillaDB.DataController.Filter.Options:= [fcoCaseInsensitive,fcoSoftCompare];

                  try
                    FiltroAnterior := GrillaDB.DataController.Filter.FindItemByItemLink(GrillaDB.DataController.GetItemByFieldName(GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].DataBinding.FieldName));
                    if Assigned(FiltroAnterior) then begin
                      ListaFiltros := FiltroAnterior.Parent;
                      ListaFiltros.BoolOperatorKind := fboOR;
                      ListaFiltros.AddItem(GrillaDB.DataController.GetItemByFieldName(GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].DataBinding.FieldName), Forma, Valor, Valor);
                    end else begin
                      ListaFiltros := GrillaDB.DataController.Filter.Root.AddItemList(fboAnd);
                      ListaFiltros.AddItem(GrillaDB.DataController.GetItemByFieldName(GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].DataBinding.FieldName), Forma, Valor, Valor);
                    end;
                  finally
                    GrillaDB.DataController.Filter.EndUpdate;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    except
      on E:Exception do begin
        E.Message := '[grillaDBKeyPress] ' + E.Message;
        raise;
      end;
    end;
  finally
    GrillaDB.Columns[GrillaDB.Controller.FocusedColumn.Index].Options.Editing := ColumnaEditable;
    Key := #0;
    OnKeyPress := KeyPressEvent;
  end;
end;

procedure TfrmBaseGrilla.grillaDBSelectionChanged(Sender: TcxCustomGridTableView);
begin
  PostMessage(Handle, WM_GRID_SELECCION_CAMBIADA, 0, 0);
end;

procedure TfrmBaseGrilla.GrillaSeleccionCambiada(var Msg: TMessage);
var
  varTotalSeleccio: Integer;
begin
  try
    grillaDB.DataController.BeginUpdate;
    if FCambiarAlSiguienteRegistro then begin
      if grilladb.Controller.SelectedRecordCount = 0 then begin
        PosicionarFoco(FFocoRowIndice);
      end else begin
        FFocoRowIndice := grillaDB.DataController.FocusedRowIndex;
      end;

      CambiaDeRegistro;
      GestionaAcciones;
    end;
  finally
    grillaDB.DataController.EndUpdate;
  end;
end;

procedure TfrmBaseGrilla.CambiaDeRegistro;
begin
  ReiniciarVariablesRegistro;
end;

procedure TfrmBaseGrilla.ReiniciarVariablesRegistro;
begin
  if (not dsListado.DataSet.IsEmpty) and (not FCampoCodigo.IsEmpty) then begin
    FCodigo := dsListado.DataSet.FieldByName(FCampoCodigo).AsInteger;
  end else begin
    FCodigo := -1;
  end;

  if FEstado in [teInsertar, teEditar] then begin
    FEstado := teNinguno;
  end;
end;

procedure TfrmBaseGrilla.actNuevoExecute(Sender: TObject);
begin
  FEstado := teInsertar;
  GestionaAcciones;
  Nuevo;
end;

procedure TfrmBaseGrilla.actRefrescarDatosExecute(Sender: TObject);
begin
  RefrescarDatos;
end;

procedure TfrmBaseGrilla.Nuevo;
begin
//
end;

procedure TfrmBaseGrilla.actEliminarExecute(Sender: TObject);
begin
  try
    if (MessageDlg('¿Está seguro que desea eliminar el registro seleccionado?', mtConfirmation, mbYesNo, 0, mbNo) = mrYes) then begin
      DM.qryDEL.SQL.Text := FDeleteSQL;
      DM.qryDEL.ParamByName(FCampoCodigo).Value := FCodigo;
      DM.qryDEL.ExecSQL;
      RefrescarDatos;
    end;
  except
    on E: Exception do begin
      ShowMessage(E.Message);
    end;
  end;
  FEstado := teNinguno;
end;

procedure TfrmBaseGrilla.actModificarExecute(Sender: TObject);
begin
  FEstado := teEditar;
  GestionaAcciones;
  Modificar;
end;

procedure TfrmBaseGrilla.Modificar;
begin
//
end;

procedure TfrmBaseGrilla.Guardar;
begin
//
end;

procedure TfrmBaseGrilla.actGrabarExecute(Sender: TObject);
begin
  FInsertando := (FEstado = teInsertar);
  Desenfoca;
  // Guardamos
  Guardar;
  // Refrescamos los datos de la grilla
  RefrescarDatos;
  if FInsertando then
    FInsertando := False;
end;

procedure TfrmBaseGrilla.actCancelarExecute(Sender: TObject);
begin
  FEstado := teNinguno;
  GestionaAcciones;
end;

procedure TfrmBaseGrilla.actSalirExecute(Sender: TObject);
begin
  Close;
end;

initialization
  RegisterClass(TfrmBaseGrilla);

end.
