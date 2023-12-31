unit edGrillaZonasBucales;

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
  Vcl.ExtCtrls, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxTextEdit;

type
  TfrmGrillaZonasBucales = class(TfrmBaseGrilla)
    lbDescripcion: TcxLabel;
    txtDESCRIPCION: TcxTextEdit;
    lbEspecialidad: TcxLabel;
    cbESPECIALIDAD: TcxImageComboBox;
    procedure actEliminarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function MontarQuery: string; override;
    procedure ConfiguraColumnas; override;
    procedure GestionaAcciones; override;
    procedure Nuevo; override;
    procedure Modificar; override;
    procedure Guardar; override;
    procedure InsertarRegistro;
    procedure ModificarRegistro;

    procedure InicializaValores;
    procedure CargarDatosBD;
  end;

var
  frmGrillaZonasBucales: TfrmGrillaZonasBucales;

implementation

uses Data;

{$R *.dfm}

constructor TfrmGrillaZonasBucales.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCampoCodigo := 'IdZona';
  RefrescarDatos;
  DM.CargaValores('TEspec', 'IdEspec', 'Descripcio', cbESPECIALIDAD);
end;

function TfrmGrillaZonasBucales.MontarQuery: string;
begin
  FSQL := 'SELECT z.IdZona, z.Descripcio, z.IdEspec, e.Descripcio DescEspec ' +
          '  FROM TZona z ' +
          '       LEFT JOIN TEspec e ON e.IdEspec = z.IdEspec ' +
          ' WHERE ISNULL(z.Activo, 1) = 1' +
          'ORDER BY z.IdZona';

  Result := FSQL;
  inherited;
end;

procedure TfrmGrillaZonasBucales.GestionaAcciones;
begin
  inherited;
  actEliminar.Enabled  := (grillaDB.Controller.SelectedRowCount = 1);
  actModificar.Enabled := (grillaDB.Controller.SelectedRowCount = 1);
end;

procedure TfrmGrillaZonasBucales.Nuevo;
begin
  inherited;
  InicializaValores;
  if txtDESCRIPCION.CanFocusEx then
    txtDESCRIPCION.SetFocus;
end;

procedure TfrmGrillaZonasBucales.InicializaValores;
begin
  txtDESCRIPCION.EditValue := Null;
  cbESPECIALIDAD.EditValue := ID_ESTOMATOLOGIA;
end;

procedure TfrmGrillaZonasBucales.Modificar;
begin
  inherited;
  CargarDatosBD;
  if txtDESCRIPCION.CanFocusEx then
    txtDESCRIPCION.SetFocus;
end;

procedure TfrmGrillaZonasBucales.CargarDatosBD;
begin
  txtDESCRIPCION.EditValue := dsListado.DataSet.FieldByName('Descripcio').Value;
  cbESPECIALIDAD.EditValue := dsListado.DataSet.FieldByName('IdEspec').Value;
end;

procedure TfrmGrillaZonasBucales.Guardar;
begin
  inherited;
  case FEstado of
    teInsertar: InsertarRegistro;
    teEditar: ModificarRegistro;
  end;
end;

procedure TfrmGrillaZonasBucales.InsertarRegistro;
var qInsertar: TFDQuery; ultimoCodigo: Integer;
begin
  DM.CrearQuery(DM.ConexionGesimag, qInsertar);
  try
    ultimoCodigo := DM.DameUltimoValor('TZona', FCampoCodigo);

    qInsertar.SQL.Clear;
    qInsertar.SQL.Add('insert into TZona (IdZona, Descripcio, IdEspec) values (:IdZona, :Descripcio, :IdEspec)');
    qInsertar.ParamByName('IdZona').AsInteger    := ultimoCodigo;
    qInsertar.ParamByName('Descripcio').AsString := txtDESCRIPCION.EditingValue;
    qInsertar.ParamByName('IdEspec').AsInteger   := cbESPECIALIDAD.EditingValue;
    try
      qInsertar.ExecSQL;
    except
      on E: Exception do begin
        MessageDlg('Hubo un error a la hora de insertar la zona: ' + E.Message, mtError, [mbOk], 0);
      end;
    end;
  finally
    DM.DestruirQuery(qInsertar);
  end;
end;

procedure TfrmGrillaZonasBucales.ModificarRegistro;
var qModificar: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qModificar);
  try
    qModificar.SQL.Clear;
    qModificar.SQL.Add('update TZona set Descripcio = :Descripcio, IdEspec = :IdEspec');
    qModificar.SQL.Add('where IdZona = :IdZona');
    qModificar.ParamByName('IdZona').AsInteger    := FCodigo;
    qModificar.ParamByName('Descripcio').AsString := txtDESCRIPCION.EditingValue;
    qModificar.ParamByName('IdEspec').AsInteger   := cbESPECIALIDAD.EditingValue;
    try
      qModificar.ExecSQL;
    except
      on E: Exception do begin
        MessageDlg('Hubo un error a la hora de modificar la zona: ' + E.Message, mtError, [mbOk], 0);
      end;
    end;
  finally
    DM.DestruirQuery(qModificar);
  end;
end;

procedure TfrmGrillaZonasBucales.actEliminarExecute(Sender: TObject);
var qGenerica: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qGenerica);
  try
    if MessageDlg('�Est� seguro de eliminar el registro seleccionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      qGenerica.SQL.Clear;
      qGenerica.SQL.Add('update TZona set Activo = 0 where IdZona = ' + dsListado.DataSet.FieldByName('IdZona').AsString);
      try
        qGenerica.ExecSQL;
        RefrescarDatos;
      except
        on E: Exception do begin
          MessageDlg('Hubo un error a la hora de modificar la zona bucal: ' + E.Message, mtError, [mbOk], 0);
        end;
      end;
    end;
  finally
    DM.DestruirQuery(qGenerica);
  end;
end;

procedure TfrmGrillaZonasBucales.ConfiguraColumnas;
begin
  inherited;
  grillaDB.OptionsView.ColumnAutoWidth := True;
  DM.GrillaModificaColumna(grillaDB, 'IdZona', 'Id. Zona', False, False, 100);
  DM.GrillaModificaColumna(grillaDB, 'Descripcio', 'Descripci�n', True, False, 120);
  DM.GrillaModificaColumna(grillaDB, 'IdEspec', 'Id. Especialidad', False, False, 100);
  DM.GrillaModificaColumna(grillaDB, 'DescEspec', 'Especialidad', True, False, 90);

  DM.GrillaSumatoriTotal(grillaDB, 'Descripcio', '');
end;

initialization
  RegisterClass(TfrmGrillaZonasBucales);

end.
