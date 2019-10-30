unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TMain = class(TForm)
    lTime: TLabel;
    bStart: TButton;
    bStop: TButton;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure bStartClick(Sender: TObject);
    procedure bStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.fmx}

procedure TMain.bStartClick(Sender: TObject);
begin
  bStart.Enabled := False;
  bStop.Enabled := True;
  lTime.Text := '0';
  Timer.Enabled := True;
end;

procedure TMain.bStopClick(Sender: TObject);
begin
  Timer.Enabled := False;
  bStop.Enabled := False;
  bStart.Enabled := True;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  bStop.Enabled := False;
end;

procedure TMain.TimerTimer(Sender: TObject);
begin
  lTime.Text := IntToStr(StrToInt(lTime.Text) + 1);
end;

end.
