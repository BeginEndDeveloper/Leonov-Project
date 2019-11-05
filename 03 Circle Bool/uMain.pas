unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Circle: TCircle;
    FloatAnimation1: TFloatAnimation;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FloatAnimation1Process(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  d: single;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Circle.Position.X := 184;
  Circle.Position.Y := 264;
  //
  FloatAnimation1.StartValue := 0;
  FloatAnimation1.StopValue := 264;
  FloatAnimation1.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Circle.Position.X := 184;
  Circle.Position.Y := 264;
  //
  FloatAnimation1.StartValue := 0;
  FloatAnimation1.StopValue := 264;
  d := FloatAnimation1.StopValue;
  FloatAnimation1.Enabled := True;
  FloatAnimation1.OnProcess := FloatAnimation1Process;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FloatAnimation1.Enabled := False;
end;

procedure TForm1.FloatAnimation1Process(Sender: TObject);
begin
  if Circle.Position.Y = FloatAnimation1.StopValue then
  begin
    d := d / 2;
    FloatAnimation1.StartValue := FloatAnimation1.StartValue + d;
    if FloatAnimation1.StartValue + 1 >= FloatAnimation1.StopValue then
      FloatAnimation1.Enabled := False;
  end;
end;

end.
