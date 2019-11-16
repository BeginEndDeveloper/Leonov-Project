program Chart;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
