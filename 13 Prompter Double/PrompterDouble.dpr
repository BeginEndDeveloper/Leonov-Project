program PrompterDouble;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
