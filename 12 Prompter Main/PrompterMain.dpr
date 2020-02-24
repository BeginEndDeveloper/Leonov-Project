program PrompterMain;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
