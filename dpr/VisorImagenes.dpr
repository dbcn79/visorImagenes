program VisorImagenes;

uses
  Vcl.Forms,
  PrincipalF in '..\source\PrincipalF.pas' {frmPrincipal},
  edFichaPaciente in '..\source\edFichaPaciente.pas' {frmFichaPaciente},
  Data in '..\source\Data.pas' {DM: TDataModule},
  edBaseGrilla in '..\source\edBaseGrilla.pas' {frmBaseGrilla},
  edVisorImagenes in '..\source\edVisorImagenes.pas' {frmVisorImagenes},
  edImagenPaciente in '..\source\edImagenPaciente.pas' {frmImagenPaciente},
  edGrillaTiposImagenes in '..\source\edGrillaTiposImagenes.pas' {frmGrillaTiposImagenes},
  edDialogoFechas in '..\source\edDialogoFechas.pas' {frmDialogoFechas},
  edDialogoFiltro in '..\source\edDialogoFiltro.pas' {frmDialogoFiltro},
  edDialogoBase in '..\source\edDialogoBase.pas' {frmDialogoBase},
  edGrillaZonasBucales in '..\source\edGrillaZonasBucales.pas' {frmGrillaZonasBucales},
  edGrillaTiposPlantillas in '..\source\edGrillaTiposPlantillas.pas' {frmGrillaTiposPlantillas},
  edGrillaTiposMagnificacion in '..\source\edGrillaTiposMagnificacion.pas' {frmGrillaTiposMagnificacion},
  edEdicionImagen in '..\source\edEdicionImagen.pas' {frmEdicionImagen},
  edFuncionesImagen in '..\source\edFuncionesImagen.pas',
  edHistorialPaciente in '..\source\edHistorialPaciente.pas' {frmHistorialPaciente},
  edSeleccionImagenes in '..\source\edSeleccionImagenes.pas' {frmSeleccionImagenes},
  edPresentacionImagenes in '..\source\edPresentacionImagenes.pas' {frmPresentacionImagenes};

//  edFuncionesImagenes in '..\source\edFuncionesImagenes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmHistorialPaciente, frmHistorialPaciente);
  Application.Run;
end.
