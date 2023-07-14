unit edFichaPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
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
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, cxControls, cxContainer, cxEdit, cxTextEdit, cxLabel;

type
  TModoFicha = (mfNuevo, mfVerFicha);

  TfrmFichaPaciente = class(TForm)
    pnFicha: TPanel;
    pnSalir: TPanel;
    btnSalir: TcxButton;
    txtNombre: TcxTextEdit;
    txtApellidos: TcxTextEdit;
    txtDireccion: TcxTextEdit;
    lbNombre: TcxLabel;
    lbApellidos: TcxLabel;
    lbDireccion: TcxLabel;
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FModoFicha: TModoFicha;

    procedure LimpiarDatos;
    procedure CargarDatos(ADataSet: TDataSet);
  end;

var
  frmFichaPaciente: TfrmFichaPaciente;

implementation

{$R *.dfm}

procedure TfrmFichaPaciente.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFichaPaciente.CargarDatos(ADataSet: TDataSet);
begin
  txtNombre.EditValue    := ADataSet.FieldByName('Nombre').Value;
  txtApellidos.EditValue := ADataSet.FieldByName('Apellidos').Value;
  txtDireccion.EditValue := ADataSet.FieldByName('Direccion').Value;

  pnFicha.Enabled := False;
end;

procedure TfrmFichaPaciente.LimpiarDatos;
begin
  txtNombre.EditValue    := Null;
  txtApellidos.EditValue := Null;
  txtDireccion.EditValue := Null;
end;

end.
