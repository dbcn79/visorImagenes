unit edHistorialPaciente;

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
  dxSkinXmas2008Blue, Vcl.ComCtrls, Winapi.ShlObj, cxShellCommon, cxControls,
  cxContainer, cxEdit, cxListView, cxShellListView, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Cipher.HCMngr, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.ODBCBase;

type
  TfrmHistorialPaciente = class(TForm)
    Panel2: TPanel;
    btnCerrar: TcxButton;
    pnlPrincipal: TPanel;
    lvHistorial: TcxShellListView;
  private
    { Private declarations }
  public
    { Public declarations }
    directorioTemporal: string;
    procedure Inicializar;
    procedure CargarHistorial;
  end;

var
  frmHistorialPaciente: TfrmHistorialPaciente;

implementation

uses Data, edFuncionesImagen;

{$R *.dfm}

procedure TfrmHistorialPaciente.Inicializar;
begin
  directorioTemporal := IncludeTrailingBackslash(IncludeTrailingBackslash(GetTempDir) + DM.FPaciente.idPac.ToString);
  ForceDirectories(directorioTemporal);
  lvHistorial.Root.CustomPath := directorioTemporal;
end;

procedure TfrmHistorialPaciente.CargarHistorial;
var qImagen: TFDQuery; nombreImagen, newNombreImagen, sIndice: string; indice: Integer;
begin
  DM.CrearQuery(DM.ConexionGesimag, qImagen);
  try
    qImagen.SQL.Add('SELECT IdImg, FecCatalog');
    qImagen.SQL.Add('  FROM Img');
    qImagen.SQL.Add(' WHERE IdPac = ' + DM.FPaciente.idPac.ToString);
    qImagen.SQL.Add('ORDER BY FecCatalog DESC');
    qImagen.Open;

    indice := 1;
    while not qImagen.Eof do begin
      nombreImagen    := DameNombreImagen(qImagen.FieldByName('IdImg').AsInteger);
      if Length(indice.ToString) = 1 then sIndice := '0' + indice.ToString
      else sIndice := indice.ToString;
      newNombreImagen := '(' + sIndice + ') ' + FormatDateTime('dd-mm-yyyy', qImagen.FieldByName('FecCatalog').AsDateTime) + '.jpg';
      CopyFile(PChar(nombreImagen), PChar(directorioTemporal + newNombreImagen), True);

      qImagen.Next;
      Inc(indice);
    end;
  finally
    DM.DestruirQuery(qImagen);
  end;

  directorioTemporal := IncludeTrailingBackslash(IncludeTrailingBackslash(GetTempDir) + DM.FPaciente.idPac.ToString);
  lvHistorial.Root.CustomPath := directorioTemporal;
end;

end.
