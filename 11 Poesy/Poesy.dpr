program Poesy;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {fmMian},
  uNotification in 'uNotification.pas' {fmNotification};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMian, fmMian);
  Application.CreateForm(TfmNotification, fmNotification);
  Application.Run;
end.
