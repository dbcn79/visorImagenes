unit edDialogoFechas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, edDialogoBase, Menus, cxLookAndFeelPainters, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, cxControls,
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
  dxSkinWhiteprint, ComCtrls, dxCore, cxDateUtils, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmDialogoFechas = class(TfrmDialogoBase)
    Label1: TLabel;
    Label2: TLabel;
    cbDesde: TcxDateEdit;
    cbHasta: TcxDateEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogoFechas: TfrmDialogoFechas;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmDialogoFechas.FormShow(Sender: TObject);
begin
  try
  try
    try
      try
        if (DayOf(now) < 15) then cbHasta.Date := StrToDate('15/' + inttostr(MonthOf(now)) + '/' + inttostr(YearOf(now)))
        else cbHasta.Date := StrToDate('31/' + inttostr(MonthOf(now)) + '/' + inttostr(YearOf(now)))
      except
        cbHasta.Date := StrToDate('30/' + inttostr(MonthOf(now)) + '/' + inttostr(YearOf(now)))
      end;
    except
      cbHasta.Date := StrToDate('29/' + inttostr(MonthOf(now)) + '/' + inttostr(YearOf(now)))
    end;
  except
    cbHasta.Date := StrToDate('28/' + inttostr(MonthOf(now)) + '/' + inttostr(YearOf(now)))
  end;
  finally
  cbDesde.Clear;
  cbDesde.SetFocus;
  cbDesde.Text := cbDesde.HelpKeyword;
  cbDesde.SelStart := 1;
  end;
end;

end.
