program Atoms;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form4},
  uOxigen in 'uOxigen.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
//  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
