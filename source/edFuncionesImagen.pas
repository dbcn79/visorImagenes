unit edFuncionesImagen;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms, Data, Vcl.Imaging.jpeg,
  Vcl.Graphics, Winapi.ShlObj, System.Masks, Winapi.ShellApi;

const
  EXT_IMG = '.jpg';
  EXT_TH_IMG = 'T.jpg';

procedure CrearThumbnail(fichero, nombreImagen: string);
function RedimensionarImagen(source: string): TBitmap;
function GetTempDir: string;
procedure BorrarCarpeta(const vOrigen: string);
function LPad(pCadena: string; pLong: Word; pRelleno: string = ' '): string;
function DameNombreImagen(idImg: Integer): string;
function DameNombreImagenTh(idImg: Integer): string;

implementation

procedure CrearThumbnail(fichero, nombreImagen: string);
var jpgImage: TJPEGImage; bitmap: TBitMap;
begin
  bitmap := RedimensionarImagen(fichero);
  jpgImage := TJPEGImage.Create;
  try
  jpgImage.Assign(bitmap);
  jpgImage.SaveToFile(nombreImagen);
  finally
    jpgImage.Free;
  end;
end;

function RedimensionarImagen(source: string): TBitmap;
var
  Pic: TPicture;
begin
  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(source);
    Result := TBitmap.Create;
    try
      if Pic.Graphic is TBitmap then
        Result.PixelFormat := TBitmap(Pic.Graphic).PixelFormat
      else
        Result.PixelFormat := pf32bit;
      if Pic.Width > Pic.Height then begin
        Result.Width := 90;
        Result.Height := 60;
      end else begin
        Result.Width := 65;
        Result.Height := 90;
      end;
      Result.Canvas.StretchDraw(Rect(0, 0, Result.Width, Result.Height), Pic.Graphic);
    except
      Result.Free;
      raise;
    end;
  finally
    Pic.Free;
  end;
end;

function GetTempDir: string;
var Buffer: Array[0..Max_path] of char;
begin
  FillChar(Buffer,Max_Path + 1, 0);
  GetTempPath(Max_path, Buffer);
  Result := String(Buffer);
  if Result[Length(Result)] <> '\' then Result := Result + '\';
end;

procedure BorrarCarpeta(const vOrigen: string);
var vCarpetas: TSHFileOpStruct;
begin
  // Inicializamos la variable vCarpetas
  FillChar(vCarpetas, SizeOf(vCarpetas), #0);

  // Preparamos las propiedades de vCarpetas para borrar
  vCarpetas.wFunc := FO_DELETE;
  vCarpetas.Wnd := GetDesktopWindow;
  vCarpetas.pFrom := PChar(vOrigen + #0#0);

  // Cargamos las banderas de
  // FOF_NOCONFIRMATION -> no pide confirmación para copiar
  // FOF_SILENT -> no muestra el dialogo de progreso
  // FOF_ALLOWUNDO -> preserva la información para deshacer, si es posible
  vCarpetas.fFlags := FOF_NOCONFIRMATION or FOF_SILENT or FOF_ALLOWUNDO;

  // Ejecutamos el proceso con ShFileOperation y si devuelve 0, la operación es un éxito
  ShFileOperation(vCarpetas);
end;

function LPad(pCadena: string; pLong: Word; pRelleno: string = ' '): string;
var long: Integer;
begin
  Result := pCadena;
  long := 0;
  while long < pLong do begin
    Result := pRelleno + Result;
    Inc(long);
  end;
end;

function DameNombreImagen(idImg: Integer): string;
var dirPac, nombreImagen, extension: string;
begin
  dirPac := IncludeTrailingBackslash(LPad(DM.FPaciente.idPac.ToString, 8 - DM.FPaciente.idPac.ToString.Length, '0'));
  nombreImagen := LPad(idImg.ToString, 8 - idImg.ToString.Length, '0');
  Result := IncludeTrailingBackslash(DM.FrutaImagenes) + dirPac + nombreImagen + EXT_IMG;
end;

function DameNombreImagenTh(idImg: Integer): string;
var dirPac, nombreImagen: string;
begin
  dirPac := IncludeTrailingBackslash(LPad(DM.FPaciente.idPac.ToString, 8 - DM.FPaciente.idPac.ToString.Length, '0'));
  nombreImagen := LPad(idImg.ToString, 8 - idImg.ToString.Length, '0');
  Result := IncludeTrailingBackslash(DM.FrutaImagenes) + dirPac + nombreImagen + EXT_TH_IMG;
end;

end.
