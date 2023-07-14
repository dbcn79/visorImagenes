unit edEdicionImagen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit, cxCheckListBox, cxButtons,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxImage, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxLabel, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMemo, cxCalc, cxDBExtLookupComboBox, cxGridDBTableView,
  Data.DB, FireDAC.Comp.Client;

const
  SQL_ESPECIALIDAD = 'SELECT IdEspec Codigo, Descripcio FROM TEspec ORDER BY Descripcio';

type
  TfrmEdicionImagen = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAceptar: TcxButton;
    pnTiposImagenes: TPanel;
    listTIPOSIMAGENES: TcxCheckListBox;
    Panel4: TPanel;
    lbTiposImagenes: TcxLabel;
    lbPaciente: TcxLabel;
    lbDescripcion: TcxLabel;
    txtPACIENTE: TcxTextEdit;
    txtDESCRIPCION: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    deFECCATALOG: TcxDateEdit;
    deFECIMPORTA: TcxDateEdit;
    txtHORIMPORTA: TcxTextEdit;
    ImgPaciente: TcxImage;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    txtIMAGEN: TcxTextEdit;
    cxLabel8: TcxLabel;
    ceFACTOR: TcxCalcEdit;
    ceCALIBRE: TcxCalcEdit;
    cxLabel9: TcxLabel;
    txtPIEZAS: TcxTextEdit;
    cxLabel10: TcxLabel;
    mCOMENTARIO: TcxMemo;
    cbZona: TcxExtLookupComboBox;
    cbFuente: TcxExtLookupComboBox;
    cbEspec: TcxExtLookupComboBox;
    btnCancelar: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
    FRepositoryZona: TcxEditRepositoryExtLookupComboBoxItem;
    FRepositoryFuente: TcxEditRepositoryExtLookupComboBoxItem;
    FRepositoryEspecialidad: TcxEditRepositoryExtLookupComboBoxItem;
    FVistaZona: TcxGridDBTableView;
    FVistaFuente: TcxGridDBTableView;
    FVistaEspecialidad: TcxGridDBTableView;
    FdsZona: TDataSource;
    FdsFuente: TDataSource;
    FdsEspecialidad: TDataSource;
    FqZona: TFDQuery;
    FqFuente: TFDQuery;
    FqEspecialidad: TFDQuery;

    FNombreImagen: string;

    destructor Destroy;
    procedure CargarCombos;
    procedure RellenarCheckListBoxTiposImagenes;
    procedure PasarDatosImagen;
    procedure ObjectToScreen;
    procedure ScreenToObject;
  end;

var
  frmEdicionImagen: TfrmEdicionImagen;

implementation

uses Data, edFuncionesImagen;

{$R *.dfm}

{ TfrmEdicionImagen }

destructor TfrmEdicionImagen.Destroy;
begin
  FqZona.Free;
  FqFuente.Free;
  FqEspecialidad.Free;
  FdsZona.Free;
  FdsFuente.Free;
  FdsEspecialidad.Free;
  FVistaZona.Free;
  FVistaFuente.Free;
  FVistaEspecialidad.Free;
  FRepositoryZona.Free;
  FRepositoryFuente.Free;
  FRepositoryEspecialidad.Free;
end;

procedure TfrmEdicionImagen.CargarCombos;
begin
  DM.CarregaDades(SQL_ZONA, FRepositoryZona, FVistaZona, FqZona, FdsZona, cbZona,
                  ['CODIGO', 'DESCRIPCIO'], ['Código', 'Zona'], [False, True], [0, 0], [], [], 'DESCRIPCIO', False);
  DM.CarregaDades(SQL_FUENTE, FRepositoryFuente, FVistaFuente, FqFuente, FdsFuente, cbFuente,
                  ['CODIGO', 'DESCRIPCIO'], ['Código', 'Fuente'], [False, True], [0, 0], [], [], 'DESCRIPCIO', False);
  DM.CarregaDades(SQL_ESPECIALIDAD, FRepositoryEspecialidad, FVistaEspecialidad, FqEspecialidad, FdsEspecialidad, cbEspec,
                  ['CODIGO', 'DESCRIPCIO'], ['Código', 'Especialidad'], [False, True], [0, 0], [], [], 'DESCRIPCIO', False);

  RellenarCheckListBoxTiposImagenes;
end;

procedure TfrmEdicionImagen.RellenarCheckListBoxTiposImagenes;
var qTipos: TFDQuery; Item: TcxCheckListBoxItem;
begin
  DM.CrearQuery(DM.ConexionGesimag, qTipos);
  try
    qTipos.SQL.Clear;
    qTipos.SQL.Add('SELECT IdTipoImg, Descripcio FROM TTipoImg WHERE ISNULL(Activo, 1) = 1 ORDER BY IdTipoImg');
    qTipos.Open;

    listTIPOSIMAGENES.Items.Clear;
    while not qTipos.Eof do begin
      Item := listTIPOSIMAGENES.Items.Add;
      Item.Text := qTipos.FieldByName('Descripcio').AsString;
      Item.Tag  := qTipos.FieldByName('IdTipoImg').AsInteger;
      qTipos.Next;
    end;
  finally
    DM.DestruirQuery(qTipos);
  end;
end;

procedure TfrmEdicionImagen.PasarDatosImagen;
begin
  if DM.FEstadoImagen = eiEditar then begin
    DM.FImagen.loadFromDB;
    ImgPaciente.Picture.LoadFromFile(DameNombreImagen(DM.FImagen.idImg));
  end else begin
    ImgPaciente.Picture.LoadFromFile(DM.FImagen.nombreImagenTemporal);
  end;
  ObjectToScreen;
end;

procedure TfrmEdicionImagen.ObjectToScreen;
var i: Integer;
begin
  case DM.FEstadoImagen of
    eiInsertar: begin
                  txtDESCRIPCION.EditValue := ExtractFileName(DM.FImagen.nombreImagenTemporal);
                  txtIMAGEN.EditValue      := Null;
                end;
    eiEditar  : begin
                  txtDESCRIPCION.EditValue := DM.FImagen.descripcion;
                  txtIMAGEN.EditValue      := LPad(DM.FImagen.idImg.ToString, 8 - Length(DM.FImagen.idImg.ToString), '0') + '.jpg';
                  Self.Caption             := 'Edición Imagen ' + txtIMAGEN.EditValue;
                end;
  end;
  txtPACIENTE.EditValue    := DM.FImagen.nombrePaciente;
  deFECCATALOG.EditValue   := FormatDateTime('dd/mm/yyyy', DM.FImagen.fecCatalog);
  deFECIMPORTA.EditValue   := FormatDateTime('dd/mm/yyyy', DM.FImagen.fecImporta);
  txtHORIMPORTA.EditValue  := DM.FImagen.horImporta;
  cbZona.EditValue         := DM.FImagen.idZona;
  cbFuente.EditValue       := DM.FImagen.idFuente;
  ceFACTOR.EditValue       := DM.FImagen.factorMag;
  ceCALIBRE.EditValue      := DM.FImagen.calibre;
  cbEspec.EditValue        := DM.FImagen.idEspec;
  txtPIEZAS.EditValue      := DM.FImagen.piezas;
  mCOMENTARIO.EditValue    := DM.FImagen.comentario;

  for i := 0 to listTIPOSIMAGENES.Items.Count - 1 do
    listTIPOSIMAGENES.Items[i].Checked := (DM.FImagen.lstTiposImagen.IndexOf(listTIPOSIMAGENES.Items[i].Tag) > -1);
end;

procedure TfrmEdicionImagen.ScreenToObject;
var i: Integer;
begin
  DM.FImagen.descripcion := txtDESCRIPCION.EditingValue;
  DM.FImagen.fecCatalog  := deFECCATALOG.Date;
  DM.FImagen.fecImporta  := deFECIMPORTA.Date;
  DM.FImagen.horImporta  := txtHORIMPORTA.EditingValue;
  DM.FImagen.idZona      := cbZona.EditingValue;
  DM.FImagen.idFuente    := cbFuente.EditingValue;
  DM.FImagen.factorMag   := ceFACTOR.EditingValue;
  DM.FImagen.calibre     := ceCALIBRE.EditingValue;
  DM.FImagen.idEspec     := cbEspec.EditingValue;
  DM.FImagen.piezas      := txtPIEZAS.EditingValue;
  DM.FImagen.comentario  := mCOMENTARIO.EditingValue;

  DM.FImagen.lstTiposImagen.Clear;
  for i := 0 to listTIPOSIMAGENES.Items.Count - 1 do
    if listTIPOSIMAGENES.Items[i].Checked then
      DM.FImagen.lstTiposImagen.Add(listTIPOSIMAGENES.Items[i].Tag);
end;

end.
