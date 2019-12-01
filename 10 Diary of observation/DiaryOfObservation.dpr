program DiaryOfObservation;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMian in 'uMian.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
