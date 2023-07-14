unit Data;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Cipher.HCMngr, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase, System.IniFiles,
  Winapi.Windows, Vcl.Forms, Vcl.Dialogs, cxGridTableView, cxGridDBTableView,
  cxClasses, cxStyles, cxDataStorage, cxCustomData, cxEdit, cxEditRepositoryItems,
  cxImageComboBox, Vcl.ImgList, Vcl.Controls, cxGraphics, cxCheckComboBox, cxImage,
  System.Variants, System.StrUtils, cxDBExtLookupComboBox, cxGrid, Generics.Collections;

const
  // Password encriptado utilizandose como clave
  KEY              = 'xgXq6SJBu/wM5hg=';      // Nuestro password
  KEY_GKC          = 'NOLYBAB/KBO';           // KEY para la encriptación de los ficheros GKC
  PASSSWORD_SA     = 'NEWYORK1930';
  ID_ESTOMATOLOGIA = 19;

  SQL_ZONA         = 'SELECT IdZona Codigo, Descripcio FROM TZona WHERE ISNULL(Activo, 1) = 1 ORDER BY Descripcio';
  SQL_FUENTE       = 'SELECT IdFuente Codigo, Descripcio FROM TFuente ORDER BY Descripcio';
  SQL_TIPOS_IMAGEN = 'SELECT IdTipoImg Codigo, Descripcio Descripcion FROM TTipoImg WHERE ISNULL(Activo, 1) = 1 ORDER BY Descripcio';

type
  TTipoBusqueda = (tbPorPaciente, tbGlobal);
  TEstadoImagen = (eiInsertar, eiEditar, eiEliminar);

  TPaciente = class(TObject)
  public
    idPac: Integer;
    numPac: string;
    nombre: string;
    apellidos: string;
    direccion: string;
    cp: string;
    poblacion: string;
    provincia: string;
    telPrivado: string;
    telTrabajo: string;
    fecNacim: TDateTime;
    sexo: string;

    procedure loadFromDB;
    procedure iniFileToObject;
    procedure guardarPaciente;

    constructor Create;
    destructor Destroy; override;
  end;

  TImagen = class(TObject)
  public
    idImg: Integer;
    idPac: Integer;
    nombrePaciente: string;
    descripcion: string;
    idFuente: Integer;
    descFuente: string;
    factorMag: Integer;
    idCompres: Integer;
    idZona: Integer;
    fecCatalog: TDateTime;
    fecImporta: TDateTime;
    horImporta: string;
    calibre: Single;
    automatica: string;
    comentario: string;
    cefalometria: string;
    implantologia: string;
    id_cataleg: Integer;
    piezas: string;
    idEspec: Integer;
    idUsu: Integer;
    nombreImagenTemporal: string;
    nombreImagen: string;
    nombreImagenTh: string;
    lstTiposImagen: TList<Integer>;

    constructor Create;
    destructor Destroy; override;

    procedure clear;
    procedure loadFromDB;
    procedure guardarImagen;
    procedure insertarImagen;
    procedure editarImagen;
    procedure eliminarImagen;
    procedure eliminarTiposImagen;
    procedure guardarTiposImagen;
    procedure generarImagen;
    procedure dameTiposImagen;
  end;

  TDM = class(TDataModule)
    ConexionGesimag: TFDConnection;
    FDTransaction: TFDTransaction;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    qrySEL: TFDQuery;
    qryUPD: TFDQuery;
    Hash: THashManager;
    Cipher: TCipherManager;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    qryINS: TFDQuery;
    cxStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxEditRepository: TcxEditRepository;
    cxEditRepositoryImagen: TcxEditRepositoryImageItem;
    qryDEL: TFDQuery;
    cxImageList: TcxImageList;
    gvrVistes: TcxGridViewRepository;
    ODFicheros: TOpenDialog;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FPaciente: TPaciente;
    FImagen: TImagen;
    Fservidor: string;
    FbaseDatos: string;
    Fusuario: string;
    Fpassword: string;
    FrutaImagenes: string;
    FinstanciasCreadas: TStringList;
    FTipoBusqueda: TTipoBusqueda;
    FEstadoImagen: TEstadoImagen;

    {$region 'FICHERO INI'}
    procedure ParametrizacionServicio;
    {$endregion}

    {$region 'CONEXION BASE DE DATOS'}
    function ConectarBaseDatosGesimag: Boolean;
    procedure DesconectarBaseDatosGesimag;
    {$endregion}

    {$region 'DESENCRIPTACION'}
    procedure SetKeyGKC;
    procedure SetKey(inKey: Ansistring);
    function DesencriptaStr(eStr: Ansistring): AnsiString;
    {$endregion}

    {$region 'COMPROBACIONES CAMPOS'}
    procedure CrearTablaTTipoImg;
    procedure CrearCamposActivoTTipoImg;
    procedure CrearCamposActivoTTipoPlt;
    procedure CrearCamposActivoTZona;
    {$endregion}

    function BuscarInstancias(AValue: string): Boolean;
    function DameUltimoValor(parTabla, parCampo: string): Integer;

    procedure CarregaCheckComboBox(parSQL: string; var parCombo: TcxCheckComboBox; parColumnas: array of string);
    procedure CargaValores(parTabla, parCodigo, parDescripcion: string; parImageCombo: TcxImageComboBox);
    procedure ImageComboDades(parCombo: TcxImageComboBox; parValor: Variant; parDescripcio: string; parImatge: Integer);
    function DameCodigosSeleccionados(parCheckComboBox: TcxCheckComboBox): Variant;

    procedure CarregaDades(parSQL: string;
                           out parRepository: TcxEditRepositoryExtLookupComboBoxItem;
                           out parVista: TcxGridDBTableView;
                           out parQuery: TFDQuery;
                           out parDataSource: TDataSource;
                           parCombo: TcxExtLookupComboBox;
                           parColumnas: array of string;
                           parTitulos: array of string;
                           parColVisible: array of Boolean;
                           parColWidth: array of Integer;
                           parColParams: array of string;
                           parColParamsValue: array of Variant;
                           parListFieldItem: string;
                           parLimpiarCampos: Boolean);

    function MemoryCreaCamp(parMemData: TDataSet; parCampNom: String; parCampTipus: TFieldType): TField;
    procedure GrillaOcultaColumnes(Vista: TcxGridDBTableView);
    procedure GrillaModificaColumna(Vista: TcxGridDBTableView; Camp, Titol: WideString; Visible, Agrupable: Boolean; Amplada: Integer);
    procedure GrillaSumatoriGrups(parVista: TcxGridDBTableView; parCampVisualitzacio, parFormat: string);
    procedure GrillaSumatoriTotal(parVista: TcxGridDBTableView; parCampVisualitzacio, parFormat: string; parCount: Boolean = True);
    procedure VistaModificaColumna(Vista: TcxGridDBTableView; Camp, Titol: String; Visible: Boolean; Agrupable: Boolean = true); overload;
    procedure VistaModificaColumna(Vista: TcxGridDBTableView; Camp, Titol: string; Visible: Boolean; Width: Integer; Agrupable: Boolean = true); overload;

    function CrearQuery(var DB:TFDConnection; out qGenerica: TFDQuery): Boolean;
    function CrearDataSource(parOwner: TComponent; parDataSet: TDataSet; out parDataSource: TDataSource): Boolean;
    function CrearRepository(parVista: TcxGridDBTableView; out RepositoryGenerico: TcxEditRepositoryExtLookupComboBoxItem): Boolean;
    function CrearDBTableView(parDataSource: TDataSource; out VistaGenerica: TcxGridDBTableView): Boolean;
    procedure DestruirQuery(var qGenerica: TFDQuery);
    procedure DestruirDataSource(var dsGenerico: TDataSource);
    procedure DestruirRepository(var rGenerico: TcxEditRepositoryExtLookupComboBoxItem);
    procedure DestruirDBTableView(var tbGenerico: TcxGridDBTableView);
  end;

var
  DM: TDM;

implementation

uses edFuncionesImagen;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FPaciente := TPaciente.Create;
  FImagen   := TImagen.Create;
  FinstanciasCreadas := TStringList.Create;
  FinstanciasCreadas.Clear;
  ParametrizacionServicio;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FPaciente.Free;
  FinstanciasCreadas.Clear;
  FreeAndNil(FinstanciasCreadas);
end;

{$region ' Fichero INI'}
procedure TDM.ParametrizacionServicio;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Visorimagenes.config');
  try
    // Recogemos los valores del GKC
    Fservidor     := IniFile.ReadString('SITE', 'Server', '');
    FbaseDatos    := IniFile.ReadString('SITE', 'BBDD', '');
    Fusuario      := IniFile.ReadString('SITE', 'Login', '');
    Fpassword     := IniFile.ReadString('SITE', 'Password', '');
    FrutaImagenes := IniFile.ReadString('SITE', 'IMG', '');
    FrutaImagenes := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName)) + FrutaImagenes;

    if Fpassword <> '' then begin
      Fpassword  := DesencriptaStr(Fpassword);
    end else begin
      Fpassword := PASSSWORD_SA;
    end;
  finally
    IniFile.Free;
  end;
end;
{$endregion}

{$region 'CONEXION BASE DE DATOS'}
function TDM.ConectarBaseDatosGesimag: Boolean;
begin
  Result := False;

  ConexionGesimag.Connected:= False;
  ConexionGesimag.Params.Clear;
  ConexionGesimag.Params.Add('DriverId=GESIMAG');
  ConexionGesimag.Params.Add('Server=' + Fservidor);
  ConexionGesimag.Params.Add('Database=' + FbaseDatos);
  ConexionGesimag.Params.Add('OSAuthent=No');
  ConexionGesimag.Params.Add('User_Name=' + Fusuario);
  ConexionGesimag.Params.Add('Password=' + Fpassword);
  ConexionGesimag.Params.Add('MetaDefSchema=dbo');
  ConexionGesimag.Params.Add('MetaDefCatalog=' + FbaseDatos);
  try
    ConexionGesimag.Connected := True;
    Result := True;
  except
    on E: Exception do
      MessageDlg('ERROR: No se pudo establecer conexión con la base de datos ' + FbaseDatos + ' (' + E.Message + ')', mtError, [mbOk], 0);
  end;
end;

procedure TDM.DesconectarBaseDatosGesimag;
begin
  if qryUPD.Active then qryUPD.Close;
  if qrySEL.Active then qrySEL.Close;
  if ConexionGesimag.Connected then
    ConexionGesimag.Connected := False;
end;
{$endregion'}

{$region 'DESENCRIPTACION'}
procedure TDM.SetKeyGKC;
begin
  // Establecemos la clave de encriptación/desencriptación para el fichero GKC
  Cipher.InitKey(KEY_GKC, nil);
end;

procedure TDM.SetKey(inKey: Ansistring);
begin
  // Establecemos la clave de encriptación/desencriptación
  Cipher.InitKey(inKey, nil);
end;

function TDM.DesencriptaStr(eStr: AnsiString): AnsiString;
begin
   // Clave
  SetKeyGKC;
   // Desencripta la cadena indicada
  Result := '';
  if eStr <> '' then
    Result := Cipher.DecodeString(eStr);
end;
{$endregion}

{$region 'COMPROBACIONES CAMPOS'}
procedure TDM.CrearTablaTTipoImg;
var qGenerica: TFDQuery;
begin
  CrearQuery(ConexionGesimag, qGenerica);
  try
    qGenerica.SQL.Add('if not exists (select o.name from sysobjects o where o.name = ''Img_TipoImagen'')');
    qGenerica.SQL.Add('begin');
    qGenerica.SQL.Add('  create table Img_TipoImagen (');
    qGenerica.SQL.Add('    IdImg int,');
    qGenerica.SQL.Add('	IdTipoImg smallint)');
    qGenerica.SQL.Add('end');
    qGenerica.ExecSQL;
  finally
    DestruirQuery(qGenerica);
  end;
end;

procedure TDM.CrearCamposActivoTTipoImg;
var qGenerica: TFDQuery;
begin
  CrearQuery(ConexionGesimag, qGenerica);
  try
    qGenerica.SQL.Add('if not exists (select c.name');
    qGenerica.SQL.Add('                 from sysobjects o');
    qGenerica.SQL.Add('				      inner join syscolumns c on c.id = o.id');
    qGenerica.SQL.Add('				where o.name = ''TTipoImg''');
    qGenerica.SQL.Add('				  and c.name = ''Activo'')');
    qGenerica.SQL.Add('begin');
    qGenerica.SQL.Add('  alter table TTipoImg add Activo smallint default 1');
    qGenerica.SQL.Add('end');
    qGenerica.ExecSQL;
  finally
    DestruirQuery(qGenerica);
  end;
end;

procedure TDM.CrearCamposActivoTTipoPlt;
var qGenerica: TFDQuery;
begin
  CrearQuery(ConexionGesimag, qGenerica);
  try
    qGenerica.SQL.Add('if not exists (select c.name');
    qGenerica.SQL.Add('                 from sysobjects o');
    qGenerica.SQL.Add('				      inner join syscolumns c on c.id = o.id');
    qGenerica.SQL.Add('				where o.name = ''TTipoPlt''');
    qGenerica.SQL.Add('				  and c.name = ''Activo'')');
    qGenerica.SQL.Add('begin');
    qGenerica.SQL.Add('  alter table TTipoPlt add Activo smallint default 1');
    qGenerica.SQL.Add('end');
    qGenerica.ExecSQL;
  finally
    DestruirQuery(qGenerica);
  end;
end;

procedure TDM.CrearCamposActivoTZona;
var qGenerica: TFDQuery;
begin
  CrearQuery(ConexionGesimag, qGenerica);
  try
    qGenerica.SQL.Add('if not exists (select c.name');
    qGenerica.SQL.Add('                 from sysobjects o');
    qGenerica.SQL.Add('				      inner join syscolumns c on c.id = o.id');
    qGenerica.SQL.Add('				where o.name = ''TZona''');
    qGenerica.SQL.Add('				  and c.name = ''Activo'')');
    qGenerica.SQL.Add('begin');
    qGenerica.SQL.Add('  alter table TZona add Activo smallint default 1');
    qGenerica.SQL.Add('end');
    qGenerica.ExecSQL;
  finally
    DestruirQuery(qGenerica);
  end;
end;
{$endregion}

function TDM.DameUltimoValor(parTabla, parCampo: string): Integer;
begin
  if qrySEL.Active then
    qrySEL.Close;

  try
    qrySEL.SQL.Clear;
    qrySEL.SQL.Add('SELECT ISNULL(MAX(' + parCampo + '), 0) as MAXVALOR');
    qrySEL.SQL.Add('  FROM ' + parTabla);
    qrySEL.Open;
    Result := qrySEL.FieldByName('MAXVALOR').AsInteger + 1;
  finally
    qrySEL.Close;
  end;
end;

function TDM.BuscarInstancias(AValue: string): Boolean;
begin
  Result := (FinstanciasCreadas.IndexOf(AValue) <> - 1);
end;

procedure TDM.CarregaCheckComboBox(parSQL: string; var parCombo: TcxCheckComboBox; parColumnas: array of string);
var
  i,j: Integer;
  parQuery: TFDQuery;
  varDesc: string;
begin
  CrearQuery(ConexionGesimag, parQuery);
  try
    if parQuery.Active then
      parQuery.Close;
    parQuery.SQL.Clear;
    parQuery.SQL.Add(parSQL);
    parQuery.Open;
    i := 0;
    parCombo.Properties.BeginUpdate;
    parCombo.Properties.Items.Clear;
    while not parQuery.Eof do begin
      parCombo.Properties.Items.Add;
      varDesc := '';
      if Length(parColumnas) = 1 then begin
        varDesc := parQuery.FieldByName(parColumnas[0]).AsString;
      end else if Length(parColumnas) > 1 then begin
        varDesc := parQuery.FieldByName(parColumnas[0]).AsString;
        for j := 1 to Length(parColumnas) - 1 do
          varDesc := varDesc + ' - ' + parQuery.FieldByName(parColumnas[j]).AsString;
      end;
      parCombo.Properties.Items.Items[i].Description := varDesc;
      parCombo.Properties.Items.Items[i].Enabled := True;
      parCombo.Properties.Items.Items[i].Tag := parQuery.FieldByName('CODIGO').AsInteger;
      Inc(i);
      parQuery.Next;
    end;
    parCombo.Properties.EndUpdate;
  finally
    DM.DestruirQuery(parQuery);
  end;
end;

procedure TDM.CargaValores(parTabla, parCodigo, parDescripcion: string; parImageCombo: TcxImageComboBox);
begin
  try
    parImageCombo.Properties.Items.Clear;
    parImageCombo.Properties.Items.BeginUpdate;
    if (qrySEL.Active) then qrySEL.Close;
    qrySEL.SQL.Clear;

    qrySEL.SQL.Add('SELECT ' + parCodigo + ',' + parDescripcion);
    qrySEL.SQL.Add('FROM ' + parTabla);
    qrySEL.SQL.Add('ORDER BY ' + parDescripcion);
    qrySEL.Open;
    if (not qrySEL.IsEmpty) then begin
      while (not qrySEL.Eof) do begin
        ImageComboDades(parImageCombo, qrySEL.FieldByName(parCodigo).AsInteger, qrySEL.FieldByName(parDescripcion).AsString, -1);
        qrySEL.Next;
      end;
      if (parImageCombo.Properties.Items.Count = 1)
      then parImageCombo.ItemIndex := 0;
    end;
    qrySEL.Close;
  finally
    parImageCombo.Properties.Items.EndUpdate;
  end;
end;

procedure TDM.ImageComboDades(parCombo: TcxImageComboBox; parValor: Variant; parDescripcio: string; parImatge: Integer);
var
  varItem: TcxImageComboBoxItem;
begin
  varItem := parCombo.Properties.Items.Add as TcxImageComboBoxItem;
  varItem.Value := parValor;
  varItem.Description := parDescripcio;
  varItem.ImageIndex := parImatge;
end;

procedure TDM.CarregaDades(parSQL: string;
                           out parRepository: TcxEditRepositoryExtLookupComboBoxItem;
                           out parVista: TcxGridDBTableView;
                           out parQuery: TFDQuery;
                           out parDataSource: TDataSource;
                           parCombo: TcxExtLookupComboBox;
                           parColumnas: array of string;
                           parTitulos: array of string;
                           parColVisible: array of Boolean;
                           parColWidth: array of Integer;
                           parColParams: array of string;
                           parColParamsValue: array of Variant;
                           parListFieldItem: string;
                           parLimpiarCampos: Boolean);
var i: Integer;
begin
  try
    if not Assigned(parQuery) then CrearQuery(ConexionGesimag, parQuery);
    if not Assigned(parDataSource) then CrearDataSource(nil, parQuery, parDataSource);
    if not Assigned(parVista) then CrearDBTableView(parDataSource, parVista);
    if not Assigned(parRepository) then CrearRepository(parVista, parRepository);

    parQuery.SQL.Clear;
    parQuery.SQL.Text := parSQL;
    // En caso que hayan parámetros, pasámos el parámetro y su valor
    for i := Low(parColParams) to High(parColParams) do begin
      if (Assigned(parQuery.Params.FindParam(parColParams[i]))) then
        parQuery.ParamByName(parColParams[i]).Value := parColParamsValue[i];
    end;
    // Abrimos el query
    parQuery.Open;

    if (not parQuery.IsEmpty) then begin
      parVista.FindPanel.ApplyInputDelay := 500;
      parVista.FindPanel.UseExtendedSyntax := True;
      if parLimpiarCampos then begin
        parVista.ClearItems;
      end;
      parVista.DataController.KeyFieldNames := 'CODIGO';
      parVista.DataController.CreateAllItems;
      // Añadimos las columnas

      //VPA, ANTES DEBERIAMOS OCULATARLAS TODAS NO?
      GrillaOcultaColumnes(parVista);

      for i := Low(parColumnas) to High(parColumnas) do begin
        DM.VistaModificaColumna(parVista, parColumnas[i], parTitulos[i], parColVisible[i], parColWidth[i]);
      end;

      parRepository.Properties.ListFieldItem := parVista.GetColumnByFieldName(parListFieldItem);
      parRepository.Properties.KeyFieldNames := 'CODIGO';
      parRepository.Properties.DropDownAutoSize := True;
      parRepository.Properties.DropDownSizeable := True;

      parCombo.Properties.View := parVista;
      parCombo.Properties.View.Repository := gvrVistes;
      parCombo.RepositoryItem := parRepository;
    end;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TDM.VistaModificaColumna(Vista: TcxGridDBTableView; Camp, Titol: String; Visible: Boolean; Agrupable: Boolean = true);
begin
  if Assigned(Vista.GetColumnByFieldName(Camp)) then begin
    Vista.GetColumnByFieldName(Camp).Options.Grouping := Agrupable;
    Vista.GetColumnByFieldName(Camp).Caption := Titol;
    Vista.GetColumnByFieldName(Camp).Visible := Visible;
  end;
end;

procedure TDM.VistaModificaColumna(Vista: TcxGridDBTableView; Camp, Titol: string; Visible: Boolean; Width: Integer; Agrupable: Boolean = true);
begin
  if Assigned(Vista.GetColumnByFieldName(Camp)) then begin
    Vista.GetColumnByFieldName(Camp).Options.Grouping := Agrupable;
    Vista.GetColumnByFieldName(Camp).Caption := Titol;
    Vista.GetColumnByFieldName(Camp).Visible := Visible;
    Vista.GetColumnByFieldName(Camp).Width  := Width;
  end;
end;

function TDM.DameCodigosSeleccionados(parCheckComboBox: TcxCheckComboBox): Variant;
var
  AFieldValue: string;
  IndicesArray: TArray<string>;
  i: Integer;
begin
  Result := Null;
  IndicesArray := AnsiReplaceStr(parCheckComboBox.EditingValue, ';', '').Split([',']);
  if Assigned(IndicesArray) then begin
    AFieldValue := IntToStr(parCheckComboBox.Properties.Items[StrToInt(IndicesArray[0])].Tag);
    for i := 1 to length(IndicesArray) - 1 do
      AFieldValue := AFieldValue + ', ' + IntToStr(parCheckComboBox.Properties.Items[StrToInt(IndicesArray[i])].Tag);
  end;
  if AFieldValue <> '' then
    Result := AFieldValue;
end;

function TDM.MemoryCreaCamp(parMemData: TDataSet; parCampNom: String; parCampTipus: TFieldType): TField;
begin
  //Procedure extreta de DevExpress:
  Result := nil;
  if ((parMemData <> nil) and (parCampNom <> '')) then begin

    if parMemData.FieldDefs.IndexOf(parCampNom) > -1 then
      parMemData.FieldDefs.Delete(parMemData.FieldDefs.IndexOf(parCampNom));
    if parMemData.FieldList.IndexOf(parCampNom) > -1 then
      parMemData.Fields.Remove(parMemData.FieldByName(parCampNom));
    with parMemData.FieldDefs.AddFieldDef do begin
      Name := parCampNom;
      DataType := parCampTipus;
      if (parCampTipus = ftString)
      then Size := 255;
      Result := CreateField(parMemData);
    end;
  end;
end;

procedure TDM.GrillaOcultaColumnes(Vista: TcxGridDBTableView);
var i: Integer;
begin
  Vista.BeginUpdate;
  try
    for i := 0 to Vista.ColumnCount - 1 do begin
      Vista.Columns[i].Visible := false;
      Vista.Columns[i].Options.Editing := false;
    end;
  finally
    Vista.EndUpdate;
  end;
end;

procedure TDM.GrillaModificaColumna(Vista: TcxGridDBTableView; Camp, Titol: WideString; Visible, Agrupable: Boolean; Amplada: Integer);
begin
  if Assigned(Vista.GetColumnByFieldName(Camp)) then
  begin
    Vista.GetColumnByFieldName(Camp).Options.Grouping := True;
    Vista.GetColumnByFieldName(Camp).Caption := Titol;
    Vista.GetColumnByFieldName(Camp).Visible := Visible;
    Vista.GetColumnByFieldName(Camp).Width := Amplada;
    Vista.GetColumnByFieldName(Camp).Tag := 1;
  end;
end;

procedure TDM.GrillaSumatoriGrups(parVista: TcxGridDBTableView; parCampVisualitzacio, parFormat: string);
var
  SumatoriGrup: TcxDataSummaryGroup;
  SumatoriItem: TcxGridDBTableSummaryItem;
begin
  //Inicialitzem Sumatoris:
  if Assigned(parVista.GetColumnByFieldName(parCampVisualitzacio)) then
  begin
    parVista.DataController.Summary.BeginUpdate;
    SumatoriGrup := parVista.DataController.Summary.SummaryGroups.Add;
    TcxGridTableSummaryGroupItemLink(SumatoriGrup.Links.Add).Column := parVista.GetColumnByFieldName(parCampVisualitzacio);
    SumatoriItem := SumatoriGrup.SummaryItems.Add as TcxGridDBTableSummaryItem;
    SumatoriItem.Kind := skCount;
    if (parFormat <> '') then SumatoriItem.Format := parFormat
    else SumatoriItem.Format := 'Total: 0';
    //Actualitzem sumatoris:
    parVista.DataController.Summary.EndUpdate;
    parVista.DataController.ClearDetails;
  end;
end;

procedure TDM.GrillaSumatoriTotal(parVista: TcxGridDBTableView; parCampVisualitzacio, parFormat: string; parCount: Boolean = True);
var
  Sumatori: TcxDataSummaryItem;
begin
  if Assigned(parVista.GetColumnByFieldName(parCampVisualitzacio)) then
  begin
    if ((((parVista.GetColumnByFieldName(parCampVisualitzacio).DataBinding.ValueTypeClass = TcxIntegerValueType)
          or (parVista.GetColumnByFieldName(parCampVisualitzacio).DataBinding.ValueTypeClass = TcxSmallintValueType)
          or (parVista.GetColumnByFieldName(parCampVisualitzacio).DataBinding.ValueTypeClass = TcxLargeIntValueType)
          or (parVista.GetColumnByFieldName(parCampVisualitzacio).DataBinding.ValueTypeClass = TcxFloatValueType)
          or (parVista.GetColumnByFieldName(parCampVisualitzacio).DataBinding.ValueTypeClass = TcxCurrencyValueType)
          or (parVista.GetColumnByFieldName(parCampVisualitzacio).DataBinding.ValueTypeClass = TcxFMTBcdValueType))
          and (not parCount))
          or parCount) then
    begin
      //Inicialitzem Sumatoris:
      parVista.DataController.Summary.BeginUpdate;
      //Creem total per al camp parCampVisualitzacio:

      Sumatori := parVista.DataController.Summary.FooterSummaryItems.ItemOfItemLink(parVista.GetColumnByFieldName(parCampVisualitzacio));
      if not Assigned(Sumatori) then
        Sumatori := parVista.DataController.Summary.FooterSummaryItems.Add;

      if (parCount)  then Sumatori.Kind := skCount
      else Sumatori.Kind := skSum;
      if (parFormat <> '') then Sumatori.Format := parFormat
      else begin
        if parCount then Sumatori.Format := 'Total: 0'
        else Sumatori.Format := 'Sum: #,##0.00';
      end;
      Sumatori.ItemLink := parVista.GetColumnByFieldName(parCampVisualitzacio);
      //Actualitzem sumatoris:
      parVista.DataController.Summary.EndUpdate;
      parVista.DataController.ClearDetails;
    end;
  end;
end;

function TDM.CrearQuery(var DB:TFDConnection; out qGenerica: TFDQuery): Boolean;
begin
  Result := True;
  qGenerica := TFDQuery.Create(nil);
  try
    qGenerica.Connection := DB;
    if qGenerica.Active then qGenerica.Close;
    qGenerica.SQL.Clear;
  except
    Result := False;
  end;
end;

function TDM.CrearDBTableView(parDataSource: TDataSource; out VistaGenerica: TcxGridDBTableView): Boolean;
begin
  VistaGenerica := TcxGridDBTableView.Create(gvrVistes);
  try
    VistaGenerica.ClearItems;
    VistaGenerica.OptionsView.Indicator := True;
    VistaGenerica.OptionsView.GroupByBox := True; //Agrupable per Marques
    VistaGenerica.OptionsView.ColumnAutoWidth := True;
    VistaGenerica.OptionsData.Deleting := False;
    VistaGenerica.OptionsData.Editing := False;
    VistaGenerica.OptionsData.Inserting := False;
    VistaGenerica.OptionsCustomize.ColumnsQuickCustomization := True;
    VistaGenerica.DataController.DataSource := parDataSource;
    Result := True;
  except
   Result := False;
  end;
end;

function TDM.CrearRepository(parVista: TcxGridDBTableView; out RepositoryGenerico: TcxEditRepositoryExtLookupComboBoxItem): Boolean;
begin
  RepositoryGenerico := TcxEditRepositoryExtLookupComboBoxItem.Create(nil);
  try
    RepositoryGenerico.Properties.View := parVista;
    RepositoryGenerico.Properties.FocusPopup := True;
    Result := True;
  except
   Result := False;
  end;
end;

function TDM.CrearDataSource(parOwner: TComponent; parDataSet: TDataSet; out parDataSource: TDataSource): Boolean;
begin
  parDataSource := TDataSource.Create(parOwner);
  try
    parDataSource.DataSet := parDataSet;
    Result := True;
  except
   Result := False;
  end;
end;

procedure TDM.DestruirQuery(var qGenerica: TFDQuery);
begin
  if Assigned(qGenerica) then
  begin
    if qGenerica.Active then
      qGenerica.Close;
    qGenerica.Free;
  end;
end;

procedure TDM.DestruirDataSource(var dsGenerico: TDataSource);
begin
  if Assigned(dsGenerico) then
    dsGenerico.Free;
end;

procedure TDM.DestruirRepository(var rGenerico: TcxEditRepositoryExtLookupComboBoxItem);
begin
  if Assigned(rGenerico) then
    rGenerico.Free;
end;

procedure TDM.DestruirDBTableView(var tbGenerico: TcxGridDBTableView);
begin
  if Assigned(tbGenerico) then
    tbGenerico.Free;
end;

{ TPaciente }

constructor TPaciente.Create;
begin
  idPac      := 0;
  numPac     := '';
  nombre     := '';
  apellidos  := '';
  direccion  := '';
  cp         := '';
  poblacion  := '';
  provincia  := '';
  telPrivado := '';
  telTrabajo := '';
  fecNacim   := 0;
  sexo       := '';
end;

destructor TPaciente.Destroy;
begin

  inherited;
end;

procedure TPaciente.loadFromDB;
begin
  if DM.qrySEL.Active then DM.qrySEL.Active := False;

  try
    DM.qrySEL.SQL.Clear;
    DM.qrySEL.SQL.Add('SELECT NumPac, Nombre, Apellidos, Direccion, CP, FecNacim, Poblacion, Provincia, TelPrivado, TelTrabajo, Sexo');
    DM.qrySEL.SQL.Add('  FROM Paciente');
    DM.qrySEL.SQL.Add(' WHERE IdPac = ' + idPac.ToString);
    DM.qrySEL.Open;

    if not DM.qrySEL.IsEmpty then begin
      numPac     := DM.qrySEL.FieldByName('NumPac').Value;
      nombre     := DM.qrySEL.FieldByName('Nombre').Value;
      apellidos  := DM.qrySEL.FieldByName('Apellidos').Value;
      direccion  := DM.qrySEL.FieldByName('Direccion').Value;
      cp         := DM.qrySEL.FieldByName('CP').Value;
      poblacion  := DM.qrySEL.FieldByName('Poblacion').Value;
      provincia  := DM.qrySEL.FieldByName('Provincia').Value;
      fecNacim   := DM.qrySEL.FieldByName('FecNacim').Value;
      telPrivado := DM.qrySEL.FieldByName('TelPrivado').Value;
      telTrabajo := DM.qrySEL.FieldByName('TelTrabajo').Value;
      sexo       := DM.qrySEL.FieldByName('Sexo').Value;
    end;
  finally
    DM.qrySEL.Close;
  end;
end;

procedure TPaciente.iniFileToObject;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create('IMCONECT.ini');
  try
    idPac      := IniFile.ReadInteger('DATOS FILIACION', 'IdPac', -1);
    numPac     := IniFile.ReadString('DATOS FILIACION', 'NumPac', '');
    nombre     := IniFile.ReadString('DATOS FILIACION', 'Nombre', '');
    apellidos  := IniFile.ReadString('DATOS FILIACION', 'Apellidos', '');
    direccion  := IniFile.ReadString('DATOS FILIACION', 'Direccion', '');
    poblacion  := IniFile.ReadString('DATOS FILIACION', 'Poblacion', '');
    cp         := IniFile.ReadString('DATOS FILIACION', 'CP', '');
    provincia  := IniFile.ReadString('DATOS FILIACION', 'Provincia', '');
    telPrivado := IniFile.ReadString('DATOS FILIACION', 'TelPrivado', '');
    telTrabajo := IniFile.ReadString('DATOS FILIACION', 'TelTrabajo', '');
    fecNacim   := IniFile.ReadDate('DATOS FILIACION', 'FecNacim', 0);
    sexo       := IniFile.ReadString('DATOS FILIACION', 'Sexo', '');
  finally
    IniFile.Free;
  end;
end;

procedure TPaciente.guardarPaciente;
var qPaciente: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qPaciente);
  try
    qPaciente.SQL.Add('INSERT INTO Paciente (IdPac, NumPac, Nombre, Apellidos, Direccion, Poblacion, CP, Provincia, TelPrivado, TelTrabajo, FecNacim, Sexo)');
    qPaciente.SQL.Add('VALUES (:IdPac, :NumPac, :Nombre, :Apellidos, :Direccion, :Poblacion, :CP, :Provincia, :TelPrivado, :TelTrabajo, :FecNacim, :Sexo)');
    qPaciente.ParamByName('IdPac').AsInteger := idPac;
    qPaciente.ParamByName('NumPac').AsString := numPac;
    qPaciente.ParamByName('Nombre').AsString := nombre;
    qPaciente.ParamByName('Apellidos').AsString := apellidos;
    qPaciente.ParamByName('Direccion').AsString := direccion;
    qPaciente.ParamByName('Poblacion').AsString := poblacion;
    qPaciente.ParamByName('CP').AsString := cp;
    qPaciente.ParamByName('Provincia').AsString :=  provincia;
    qPaciente.ParamByName('TelPrivado').AsString := telPrivado;
    qPaciente.ParamByName('TelTrabajo').AsString := telTrabajo;
    if fecNacim > 0 then
      qPaciente.ParamByName('FecNacim').AsDateTime := fecNacim
    else begin
      qPaciente.ParamByName('FecNacim').Clear;
      qPaciente.ParamByName('FecNacim').DataType := ftDate;
    end;
    qPaciente.ParamByName('Sexo').AsString := sexo;
    try
      qPaciente.ExecSQL;
    except
      on E: Exception do begin
        MessageDlg('Error a la hora de insertar el paciente ' + nombre + ' ' + apellidos + ' [' + E.Message + ']', mtError, [mbOk], 0);
      end;

    end;
  finally
    DM.DestruirQuery(qPaciente);
  end;
end;

{ TImagen }

procedure TImagen.clear;
begin
  idImg := 0;
  idPac := 0;
  nombrePaciente := '';
  descripcion := '';
  idFuente := 1;
  descFuente := '';
  idCompres := 0;
  idZona := 0;
  factorMag := 1;
  fecCatalog := Now;
  fecImporta := Date;
  horImporta := FormatDateTime('hh:mm', Now);
  calibre := 0;
  automatica := 'S';
  comentario := '';
  cefalometria := 'N';
  implantologia := 'N';
  id_cataleg := 0;
  piezas := '';
  idEspec := 19;
  idUsu := 0;
  nombreImagenTemporal := '';
  nombreImagen := '';
  nombreImagenTh := '';
end;

constructor TImagen.Create;
begin
  clear;
  lstTiposImagen := TList<Integer>.Create;
end;

destructor TImagen.Destroy;
begin
  FreeAndNil(lstTiposImagen);
  inherited;
end;

procedure TImagen.loadFromDB;
begin
  if DM.qrySEL.Active then DM.qrySEL.Active := False;

  try
    DM.qrySEL.SQL.Clear;
    DM.qrySEL.SQL.Add('select i.IdPac, i.IdImg, i.Descripcion, i.FecCatalog, i.FecImporta, i.HorImporta, i.Calibre, i.IdFuente,');
    DM.qrySEL.SQL.Add('       i.Automatica, cast(i.Comentario as varchar(2000)) Comentario, i.Cefalometria, i.Implantologia,');
    DM.qrySEL.SQL.Add('       isnull(i.Piezas, '''') Piezas, i.id_cataleg, f.descripcio DescFuente, i.IdUsu, i.IdEspec, i.FactorMag,');
    DM.qrySEL.SQL.Add('       isnull(i.IdCompres, 0) IdCompres, isnull(i.IdZona, -1) IdZona, p.Nombre + '' '' + p.Apellidos NomPac');
    DM.qrySEL.SQL.Add('from img i');
    DM.qrySEL.SQL.Add('  left join Paciente p on p.IdPac = i.IdPac');
    DM.qrySEL.SQL.Add('  left join TFuente f on f.IdFuente = i.IdFuente');
    DM.qrySEL.SQL.Add('where i.IdImg = ' + idImg.ToString);
    DM.qrySEL.Open;

    if not DM.qrySEL.IsEmpty then begin
      idPac          := DM.qrySEL.FieldByName('IdPac').Value;
      nombrePaciente := DM.qrySEL.FieldByName('NomPac').Value;
      descripcion    := DM.qrySEL.FieldByName('Descripcion').Value;
      idFuente       := DM.qrySEL.FieldByName('IdFuente').Value;
      descFuente     := DM.qrySEL.FieldByName('DescFuente').Value;
      idCompres      := DM.qrySEL.FieldByName('IdCompres').Value;
      factorMag      := DM.qrySEL.FieldByName('FactorMag').Value;
      idZona         := DM.qrySEL.FieldByName('IdZona').Value;
      fecCatalog     := DM.qrySEL.FieldByName('FecCatalog').Value;
      fecImporta     := DM.qrySEL.FieldByName('FecImporta').Value;
      horImporta     := DM.qrySEL.FieldByName('HorImporta').Value;
      calibre        := DM.qrySEL.FieldByName('Calibre').Value;
      automatica     := DM.qrySEL.FieldByName('Automatica').Value;
      comentario     := VarToStr(DM.qrySEL.FieldByName('Comentario').Value);
      cefalometria   := DM.qrySEL.FieldByName('Cefalometria').Value;
      implantologia  := DM.qrySEL.FieldByName('Implantologia').Value;
      id_cataleg     := DM.qrySEL.FieldByName('id_cataleg').Value;
      piezas         := VarToStr(DM.qrySEL.FieldByName('Piezas').Value);
      idEspec        := DM.qrySEL.FieldByName('IdEspec').Value;
      idUsu          := DM.qrySEL.FieldByName('IdUsu').Value;

      dameTiposImagen;
    end;
  finally
    DM.qrySEL.Close;
  end;
end;

procedure TImagen.GuardarImagen;
begin
  case DM.FEstadoImagen of
    eiInsertar: insertarImagen;
    eiEditar  : editarImagen;
  end;
  // Eliminamos los antiguos tipos de imagen asociados
  eliminarTiposImagen;
  // Si hay algún tipo de imagen asociado lo grabamos
  if lstTiposImagen.Count > 0 then
    GuardarTiposImagen;
end;

procedure TImagen.insertarImagen;
var qImagen: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qImagen);
  try
    idImg := DM.DameUltimoValor('IMG', 'IdImg');

    qImagen.SQL.Add('INSERT INTO Img (IdImg,');
    qImagen.SQL.Add('                 IdPac,');
    qImagen.SQL.Add('                 Descripcion,');
    qImagen.SQL.Add('                 IdFuente,');
    qImagen.SQL.Add('                 FactorMag,');
    qImagen.SQL.Add('                 IdZona,');
    qImagen.SQL.Add('                 FecCatalog,');
    qImagen.SQL.Add('                 FecImporta,');
    qImagen.SQL.Add('                 HorImporta,');
    qImagen.SQL.Add('                 Calibre,');
    qImagen.SQL.Add('                 Comentario,');
    qImagen.SQL.Add('                 Piezas,');
    qImagen.SQL.Add('                 IdEspec,');
    qImagen.SQL.Add('                 Automatica,');
    qImagen.SQL.Add('                 Cefalometria,');
    qImagen.SQL.Add('                 Implantologia,');
    qImagen.SQL.Add('                 id_cataleg,');
    qImagen.SQL.Add('                 IdCompres,');
    qImagen.SQL.Add('                 IdUsu)');
    qImagen.SQL.Add('VALUES (:IdImg,');
    qImagen.SQL.Add('        :IdPac,');
    qImagen.SQL.Add('        :Descripcion,');
    qImagen.SQL.Add('        :IdFuente,');
    qImagen.SQL.Add('        :FactorMag,');
    qImagen.SQL.Add('        :IdZona,');
    qImagen.SQL.Add('        :FecCatalog,');
    qImagen.SQL.Add('        :FecImporta,');
    qImagen.SQL.Add('        :HorImporta,');
    qImagen.SQL.Add('        :Calibre,');
    qImagen.SQL.Add('        :Comentario,');
    qImagen.SQL.Add('        :Piezas,');
    qImagen.SQL.Add('        :IdEspec,');
    qImagen.SQL.Add('        :Automatica,');
    qImagen.SQL.Add('        :Cefalometria,');
    qImagen.SQL.Add('        :Implantologia,');
    qImagen.SQL.Add('        :id_cataleg,');
    qImagen.SQL.Add('        :IdCompres,');
    qImagen.SQL.Add('        :IdUsu)');

    qImagen.ParamByName('IdImg').Value         := idImg;
    qImagen.ParamByName('IdPac').Value         := DM.FPaciente.idPac;
    qImagen.ParamByName('Descripcion').Value   := descripcion;
    qImagen.ParamByName('IdFuente').Value      := idFuente;
    qImagen.ParamByName('FactorMag').Value     := factorMag;
    if idZona > 0 then qImagen.ParamByName('IdZona').Value := idZona
    else begin
      qImagen.ParamByName('IdZona').Clear;
      qImagen.ParamByName('IdZona').DataType := ftInteger;
    end;
    qImagen.ParamByName('FecCatalog').Value    := fecCatalog;
    qImagen.ParamByName('FecImporta').Value    := fecImporta;
    qImagen.ParamByName('HorImporta').Value    := horImporta;
    qImagen.ParamByName('Calibre').Value       := calibre;
    qImagen.ParamByName('Comentario').Value    := comentario;
    qImagen.ParamByName('Piezas').Value        := piezas;
    qImagen.ParamByName('IdEspec').Value       := idEspec;
    qImagen.ParamByName('Automatica').Value    := automatica;
    qImagen.ParamByName('Cefalometria').Value  := cefalometria;
    qImagen.ParamByName('Implantologia').Value := implantologia;
    qImagen.ParamByName('id_cataleg').Value    := DM.FPaciente.idPac;
    qImagen.ParamByName('IdCompres').Value     := idCompres;
    qImagen.ParamByName('IdUsu').Value         := idUsu;
    try
      qImagen.ExecSQL;

      // Generamos la imagen y el thumbnail
      GenerarImagen;
    except
      on E: Exception do
        MessageDlg('Error a la hora de insertar la imagen [' + E.Message + ']', mtError, [mbOk], 0);
    end;
  finally
    DM.DestruirQuery(qImagen);
  end;
end;

procedure TImagen.generarImagen;
var img: TcxImage;
begin
  img := TcxImage.Create(nil);
  try
    img.Picture.LoadFromFile(nombreImagenTemporal);
    nombreImagen := DameNombreImagen(idImg);
    img.Picture.SaveToFile(nombreImagen);
    nombreImagenTh := DameNombreImagenTh(idImg);
    CrearThumbnail(nombreImagen, nombreImagenTh);
    DeleteFile(PChar(nombreImagenTemporal));
    nombreImagenTemporal := '';
  finally
    img.Free;
  end;
end;

procedure TImagen.editarImagen;
var qImagen: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qImagen);
  try
    qImagen.SQL.Add('UPDATE Img');
    qImagen.SQL.Add('   SET Descripcion = :Descripcion,');
    qImagen.SQL.Add('       IdFuente    = :IdFuente,');
    qImagen.SQL.Add('       FactorMag   = :FactorMag,');
    qImagen.SQL.Add('       IdZona      = :IdZona,');
    qImagen.SQL.Add('       FecCatalog  = :FecCatalog,');
    qImagen.SQL.Add('       FecImporta  = :FecImporta,');
    qImagen.SQL.Add('       HorImporta  = :HorImporta,');
    qImagen.SQL.Add('       Calibre     = :Calibre,');
    qImagen.SQL.Add('       Comentario  = :Comentario,');
    qImagen.SQL.Add('       Piezas      = :Piezas,');
    qImagen.SQL.Add('       IdEspec     = :IdEspec');
    qImagen.SQL.Add(' WHERE IdImg       = :IdImg');
    qImagen.ParamByName('Descripcion').Value   := descripcion;
    qImagen.ParamByName('IdFuente').Value      := idFuente;
    qImagen.ParamByName('FactorMag').Value     := factorMag;
    if idZona > 0 then qImagen.ParamByName('IdZona').Value := idZona
    else begin
      qImagen.ParamByName('IdZona').Clear;
      qImagen.ParamByName('IdZona').DataType := ftInteger;
    end;
    qImagen.ParamByName('FecCatalog').Value    := fecCatalog;
    qImagen.ParamByName('FecImporta').Value    := fecImporta;
    qImagen.ParamByName('HorImporta').Value    := horImporta;
    qImagen.ParamByName('Calibre').Value       := calibre;
    qImagen.ParamByName('Comentario').Value    := comentario;
    qImagen.ParamByName('Piezas').Value        := piezas;
    qImagen.ParamByName('IdEspec').Value       := idEspec;
    qImagen.ParamByName('IdImg').Value         := idImg;
    try
      qImagen.ExecSQL;
    except
      on E: Exception do
        MessageDlg('Error a la hora de modificar la imagen [' + E.Message + ']', mtError, [mbOk], 0);
    end;
  finally
    DM.DestruirQuery(qImagen);
  end;
end;

procedure TImagen.eliminarImagen;
var qImagen: TFDQuery;
begin
  // Primero eliminamos los tipos de imagen
  eliminarTiposImagen;

  DM.CrearQuery(DM.ConexionGesimag, qImagen);
  try
    qImagen.SQL.Add('DELETE FROM Img');
    qImagen.SQL.Add(' WHERE IdImg       = :IdImg');
    qImagen.ParamByName('IdImg').Value := idImg;
    try
      qImagen.ExecSQL;
      DeleteFile(PChar(nombreImagen));
      DeleteFile(PChar(nombreImagenTh));
    except
      on E: Exception do
        MessageDlg('Error a la hora de eliminar la imagen [' + E.Message + ']', mtError, [mbOk], 0);
    end;
  finally
    DM.DestruirQuery(qImagen);
  end;
end;

procedure TImagen.eliminarTiposImagen;
var qTiposImagen: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qTiposImagen);
  try
    qTiposImagen.SQL.Add('DELETE FROM Img_TipoImagen WHERE IdImg = ' + idImg.ToString);
    qTiposImagen.ExecSQL;
  finally
    DM.DestruirQuery(qTiposImagen);
  end;
end;

procedure TImagen.guardarTiposImagen;
var qTiposImagen: TFDQuery; i: Integer;
begin
  DM.CrearQuery(DM.ConexionGesimag, qTiposImagen);
  try
    qTiposImagen.SQL.Add('INSERT INTO Img_TipoImagen(IdImg, IdTipoImg) VALUES (:IdImg, :IdTipoImg)');
    for i := 0  to lstTiposImagen.Count - 1 do begin
      qTiposImagen.ParamByName('IdTipoImg').Value := lstTiposImagen[i];
      qTiposImagen.ParamByName('IdImg').Value     := idImg;
      qTiposImagen.ExecSQL;
    end;
  finally
    DM.DestruirQuery(qTiposImagen);
  end;
end;

procedure TImagen.dameTiposImagen;
var qTiposImagen: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qTiposImagen);
  try
    qTiposImagen.SQL.Add('SELECT IdTipoImg');
    qTiposImagen.SQL.Add('  FROM Img_TipoImagen');
    qTiposImagen.SQL.Add(' WHERE IdImg = ' + idImg.ToString);
    qTiposImagen.Open;

    lstTiposImagen.Clear;
    while not qTiposImagen.Eof do
    begin
      lstTiposImagen.Add(qTiposImagen.FieldByName('IdTipoImg').AsInteger);

      qTiposImagen.Next;
    end;
  finally
    DM.DestruirQuery(qTiposImagen);
  end;
end;

end.
