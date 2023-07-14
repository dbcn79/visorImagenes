unit edGrillaTiposMagnificacion;

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
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, cxCalc;

type
  TfrmGrillaTiposMagnificacion = class(TfrmBaseGrilla)
    lbDescripcion: TcxLabel;
    txtDESCRIPCION: TcxTextEdit;
    lbArchivoGrafico: TcxLabel;
    varCONVERSION: TcxCalcEdit;
  private
    { Private declarations }
  public
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
  frmGrillaZonasBucales: TfrmGrillaTiposMagnificacion;

implementation

uses Data;

{$R *.dfm}

constructor TfrmGrillaTiposMagnificacion.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCampoCodigo := 'IdTipo';
  FDeleteSQL := 'DELETE FROM TTipoMag WHERE IdTipo = :IDTIPO';
  RefrescarDatos;
end;

function TfrmGrillaTiposMagnificacion.MontarQuery: string;
begin
  FSQL := 'SELECT IdTipo, Descripcio, Conversion ' +
          '  FROM TTipoMag ' +
          'ORDER BY IdTipo';

  Result := FSQL;
  inherited;
end;

procedure TfrmGrillaTiposMagnificacion.Nuevo;
begin
  inherited;
  InicializaValores;
  if txtDESCRIPCION.CanFocusEx then
    txtDESCRIPCION.SetFocus;
end;

procedure TfrmGrillaTiposMagnificacion.InicializaValores;
begin
  txtDESCRIPCION.EditValue := Null;
  varCONVERSION.EditValue := 0;
end;

procedure TfrmGrillaTiposMagnificacion.Modificar;
begin
  inherited;
  CargarDatosBD;
  if txtDESCRIPCION.CanFocusEx then
    txtDESCRIPCION.SetFocus;
end;

procedure TfrmGrillaTiposMagnificacion.CargarDatosBD;
begin
  txtDESCRIPCION.EditValue := dsListado.DataSet.FieldByName('Descripcio').Value;
  varCONVERSION.EditValue := dsListado.DataSet.FieldByName('Conversion').Value;
end;

procedure TfrmGrillaTiposMagnificacion.Guardar;
begin
  inherited;
  case FEstado of
    teInsertar: InsertarRegistro;
    teEditar: ModificarRegistro;
  end;
end;

procedure TfrmGrillaTiposMagnificacion.InsertarRegistro;
var qInsertar: TFDQuery; ultimoCodigo: Integer;
begin
  DM.CrearQuery(DM.ConexionGesimag, qInsertar);
  try
    ultimoCodigo := DM.DameUltimoValor('TTipoMag', FCampoCodigo);

    qInsertar.SQL.Clear;
    qInsertar.SQL.Add('insert into TTipoMag (IdTipo, Descripcio, Conversion) values (:IdTipo, :Descripcio, :Conversion)');
    qInsertar.ParamByName('IdTipo').AsInteger    := ultimoCodigo;
    qInsertar.ParamByName('Descripcio').AsString := txtDESCRIPCION.EditingValue;
    qInsertar.ParamByName('Conversion').AsFloat  := varCONVERSION.EditingValue;
    try
      qInsertar.ExecSQL;
    except
      on E: Exception do begin
        MessageDlg('Hubo un error a la hora de insertar el tipo de magnificación: ' + E.Message, mtError, [mbOk], 0);
      end;
    end;
  finally
    DM.DestruirQuery(qInsertar);
  end;
end;

procedure TfrmGrillaTiposMagnificacion.ModificarRegistro;
var qModificar: TFDQuery;
begin
  DM.CrearQuery(DM.ConexionGesimag, qModificar);
  try
    qModificar.SQL.Clear;
    qModificar.SQL.Add('update TTipoMag set Descripcio = :Descripcio, Conversion = :Conversion');
    qModificar.SQL.Add('where IdTipo = :IdTipo');
    qModificar.ParamByName('IdTipo').AsInteger    := FCodigo;
    qModificar.ParamByName('Descripcio').AsString := txtDESCRIPCION.EditingValue;
    qModificar.ParamByName('Conversion').AsFloat  := varCONVERSION.EditingValue;
    try
      qModificar.ExecSQL;
    except
      on E: Exception do begin
        MessageDlg('Hubo un error a la hora de modificar el tipo de magnificación: ' + E.Message, mtError, [mbOk], 0);
      end;
    end;
  finally
    DM.DestruirQuery(qModificar);
  end;
end;

procedure TfrmGrillaTiposMagnificacion.ConfiguraColumnas;
begin
  inherited;
  grillaDB.OptionsView.ColumnAutoWidth := True;
  DM.GrillaModificaColumna(grillaDB, 'IdTipo', 'Id. Tipo', False, False, 100);
  DM.GrillaModificaColumna(grillaDB, 'Descripcio', 'Descripción', True, False, 120);
  DM.GrillaModificaColumna(grillaDB, 'Conversion', 'Conversión', True, False, 90);

  DM.GrillaSumatoriTotal(grillaDB, 'Descripcio', '');
end;

initialization
  RegisterClass(TfrmGrillaTiposMagnificacion);

end.

