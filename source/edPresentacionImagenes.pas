unit edPresentacionImagenes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit, PicShow,
  dxGDIPlusClasses, cxImage, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.FileCtrl,
  cxLabel, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TfrmPresentacionImagenes = class(TForm)
    pnlCentral: TPanel;
    PicShow: TPicShow;
    Timer: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel2: TcxLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PicShowStart(Sender: TObject; Picture, Screen: TBitmap);
    procedure TimerTimer(Sender: TObject);
    procedure PicShowStop(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    style: Integer;
    delay: Integer;
    step: Integer;
    Pictures: TStringList;
    PicturesPath: string;
    ShowingImage: string;
    LoadedImage: string;

    procedure InicializarValores;
    procedure CreateImageList(Path: string);
    procedure CheckTimer;

    procedure LoadNextImage;
    procedure ShowNextImage;

  end;

var
  frmPresentacionImagenes: TfrmPresentacionImagenes;

implementation

{$R *.dfm}

procedure TfrmPresentacionImagenes.FormCreate(Sender: TObject);
begin
  Pictures := TStringList.Create;
end;

procedure TfrmPresentacionImagenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Pictures.Free;
end;

procedure TfrmPresentacionImagenes.InicializarValores;
begin
  PicShow.Style    := style;
  PicShow.Delay    := delay;
  PicShow.Step     := step;
  PicShow.OverDraw := True;

  CheckTimer;
end;

procedure TfrmPresentacionImagenes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then begin
    Timer.Enabled := False;
    Close;
  end;
end;

procedure TfrmPresentacionImagenes.CreateImageList(Path: string);
var
  FileList: TFileListBox;
begin
  if Path <> PicturesPath then begin
    FileList := TFileListBox.Create(nil);
    try
      FileList.Visible := False;
      FileList.Parent := Self;
      FileList.Mask := GraphicFileMask(TGraphic);
      FileList.Directory := Path;
      if FileList.Items.Count > 0 then begin
        Pictures.Assign(FileList.Items);
        PicturesPath := Path;
        if (Length(Path) > 0) and (PicturesPath[Length(Path)] = '\') then
          Delete(PicturesPath, Length(Path), 1);
        LoadNextImage;
      end;
    finally
      FileList.Free;
    end;
  end;
end;

// Begins transition of the currently loaded image
procedure TfrmPresentacionImagenes.ShowNextImage;
begin
  Timer.Enabled := False;
  // if there is no picture in the list, exit
  if Pictures.Count = 0 then Exit;
  // if PicShow is playing, stops it
  if PicShow.Busy then PicShow.Stop;
  // Updates image name status
  ShowingImage := LoadedImage;
  // Begins the transition
  PicShow.Execute;
end;

procedure TfrmPresentacionImagenes.TimerTimer(Sender: TObject);
begin
  ShowNextImage;
end;

procedure TfrmPresentacionImagenes.CheckTimer;
begin
  Timer.Enabled := not PicShow.Busy and (Pictures.Count > 0);
end;

procedure TfrmPresentacionImagenes.LoadNextImage;
var
  Index: Integer;
begin
  LoadedImage := '';
  if Pictures.Count > 0 then begin
    repeat
      Index := Random(Pictures.Count);
    until (Pictures.Count <= 1) or (ShowingImage <> Pictures[Index]);
    LoadedImage := Pictures[Index];
    PicShow.Picture.LoadFromFile(PicturesPath + '\' + LoadedImage);
  end;
end;

procedure TfrmPresentacionImagenes.PicShowStart(Sender: TObject; Picture, Screen: TBitmap);
begin
  CheckTimer;
  LoadNextImage;
end;

procedure TfrmPresentacionImagenes.PicShowStop(Sender: TObject);
begin
  CheckTimer;
end;

end.
