unit edGrillaTiposPlantillas;

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
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, System.Actions, Vcl.ActnList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dxBar, cxClasses, cxPC, cxLabel,
  Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls;

type
  TfrmGrillaTiposPlantillas = class(TfrmBaseGrilla)
    lbDescripcion: TcxLabel;
    txtDESCRIPCION: TcxTextEdit;
    cbFUENTE: TcxImageComboBox;
    lbArchivoGrafico: TcxLabel;
    procedure actEliminarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function MontarQuery: string; override;
    procedure ConfiguraColumnas; override;
    procedure Nuevo; override;
    procedure Modificar; override;
    procedure Guardar; override;
    procedure InsertarRegistro;
    procedure ModificarRegistro;

    procedure InicializaValores;
    procedure CargarDatosBD;
  end;

var
  frmGrillaZonasBucales: TfrmGrillaTiposPlantillas;

implementation

uses Data;

{$R *.dfm}

constructor TfrmGrillaTiposPlantillas.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCampoCodigo := 'IdTipoPlt';
  FDeleteSQL := 'DELETE FROM TTipoPlt WHERE IdTipoPlt = :IDTIPOPLT';
  RefrescarDatos;
  DM.CargaValores('TFuente', 'IdFuente', 'Descripcio', cbFUENTE);
end;

function TfrmGrillaTiposPlantillas.MontarQuery: string;
begin
  FSQL := 'SELECT p.IdTipoPlt, p.Descripcio, p.IdFuente, f.Descripcio DescFuente ' +
          '  FROM TTipoPlt p ' +
          '       LEFT JOIN TFuente f ON p.IdFuente = f.IdFuente ' +
          ' WHERE ISNULL(p.Activo, 1) = 1' +
          'ORDER BY p.IdTipoPlt';

  Result := FSQL;
  inherited;
end;

procedure TfrmGrillaTiposPlantillas.Nuevo;
begin
  inherited;
  InicializaValores;
  if txtDESCRIPCION.CanFocusEx then
    txtDESCRIPCION.SetFocus;
end;

procedure TfrmGrillaTiposPlantillas.InicializaValores;
begin
  txtDESCRIPCION.EditValue := Null;
  cbFUENTE.EditValue := Null;
end;

procedure TfrmGrillaTiposPlantillas.Modificar;
begin
  inherited;
  CargarDatosBD;
  if txtDESCRIPCION.CanFocusEx then
    txtDESCRIPCION.SetFocus;
end;

procedure TfrmGrillaTiposPlantillas.CargarDatosBD;
begin
  txtDESCRIPCION.EditValue := dsListado.DataSet.FieldByName('Descripcio').Value;
  cbFUENTE.EditValue := dsListado.DataSet.FieldByName('IdFuente').Value;
end;

procedure TfrmGrillaTiposPlantillas.Guardar;
begin
  inherited;
  case FEstado of
    teInsertar: InsertarRegistro;
    teEditar: ModificarRegistro;
  end;
end;

procedure TfrmGrillaTiposPlantillas.InsertarRegistro;
var qInsertar: TFDQuery; ultimoCodigo: Integer;
begin
  DM.CrearQuery(DM.ConexionGesimag, qInsertar);
  try
    ultimoCodigo := DM.DameUltimoValor('TTipoPlt', FCampoCodigo);

    qInsertar.SQL.Clear;
    qInsertar.SQL.Add('insert into TTipoPlt (IdTipoPlt, Descripcio, IdFuente) values (:IdTipoPlt, :Descripcio, :IdFuente)');
    qInsertar.ParamByName('IdTipoPlt').AsInteger := ultimoCodigo;
    qInsertar.ParamByName('Descripcio').AsString := txtDESCRIPCION.EditingValue;
    qInsertar.ParamByName('IdFuente').AsInteger  := cbFUENTE.EditingValue;
    try
      qInsertar.ExecSQL;
    except
      on E: Exception do begin
        MessageDlg('Hubo un error a la hora de insertar el tipo de plantilla: ' + E.Message, mtError, [mbOk], 0);
      end;
    end;
  finally
    DM.DestruirQuery(qInsertar);
  end;
end;

procedure TfrmGrillaTiposPlantillas.ModificarRegistro;
var qModificar: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qModificar);
  try
    qModificar.SQL.Clear;
    qModificar.SQL.Add('update TTipoPlt set Descripcio = :Descripcio, IdFuente = :IdFuente');
    qModificar.SQL.Add('where IdTipoPlt = :IdTipoPlt');
    qModificar.ParamByName('IdTipoPlt').AsInteger := FCodigo;
    qModificar.ParamByName('Descripcio').AsString := txtDESCRIPCION.EditingValue;
    qModificar.ParamByName('IdFuente').AsInteger  := cbFUENTE.EditingValue;
    try
      qModificar.ExecSQL;
    except
      on E: Exception do begin
        MessageDlg('Hubo un error a la hora de modificar el tipo de plantilla: ' + E.Message, mtError, [mbOk], 0);
      end;
    end;
  finally
    DM.DestruirQuery(qModificar);
  end;
end;

procedure TfrmGrillaTiposPlantillas.actEliminarExecute(Sender: TObject);
var qGenerica: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qGenerica);
  try
    if MessageDlg('¿Está seguro de eliminar el registro seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      qGenerica.SQL.Clear;
      qGenerica.SQL.Add('update TTipoPlt set Activo = 0 where IdTipoPlt = ' + dsListado.DataSet.FieldByName('IdTipoPlt').AsString);
      try
        qGenerica.ExecSQL;
        RefrescarDatos;
      except
        on E: Exception do begin
          MessageDlg('Hubo un error a la hora de modificar el tipo de plantilla: ' + E.Message, mtError, [mbOk], 0);
        end;
      end;
    end;
  finally
    DM.DestruirQuery(qGenerica);
  end;
end;

procedure TfrmGrillaTiposPlantillas.ConfiguraColumnas;
begin
  inherited;
  grillaDB.OptionsView.ColumnAutoWidth := True;
  DM.GrillaModificaColumna(grillaDB, 'IdTipoPlt', 'Id. Plantilla', False, False, 100);
  DM.GrillaModificaColumna(grillaDB, 'Descripcio', 'Descripción', True, False, 120);
  DM.GrillaModificaColumna(grillaDB, 'IdFuente', 'Id. Fuente', False, False, 100);
  DM.GrillaModificaColumna(grillaDB, 'DescFuente', 'Fuente', True, False, 90);

  DM.GrillaSumatoriTotal(grillaDB, 'Descripcio', '');
end;

initialization
  RegisterClass(TfrmGrillaTiposPlantillas);

end.

