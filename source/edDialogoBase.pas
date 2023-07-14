unit edDialogoBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxLabel, cxGraphics, cxLookAndFeels, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, ExtCtrls,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmDialogoBase = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Aceptar: TMenuItem;
    Salir: TMenuItem;
    lblInformacion: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnAceptar: TcxButton;
    procedure SalirClick(Sender: TObject);
    procedure AceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject); virtual;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

const
  ANCHONAVEGADOR = 200;
var
  frmDialogoBase: TfrmDialogoBase;

implementation

uses Data;

{$R *.dfm}

procedure TfrmDialogoBase.AceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDialogoBase.SalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

constructor TfrmDialogoBase.Create(AOwner: TComponent);
begin
  inherited;
  Visible := False;
end;

procedure TfrmDialogoBase.FormCreate(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

initialization
  RegisterClass(TfrmDialogoBase);

end.
