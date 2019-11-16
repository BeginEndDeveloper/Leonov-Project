unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMXTee.Engine,
  FMXTee.Series, FMX.StdCtrls, FMXTee.Procs, FMXTee.Chart,
  FMX.Controls.Presentation;

type
  TForm6 = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Chart1: TChart;
    SpeedButton1: TSpeedButton;
    Series1: TLineSeries;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    xb, xe: single;
    n: integer;
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

function MyFunction(xi: single): single;
// var
// yi: single;
begin
  // yi := xi * xi + 2;
  // result := yi;
  result := xi * xi + 2;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  xb := 1;
  xe := 4;
  n := 4;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
var
  d: single;
  x, y: single;
  i: integer;
begin
  d := (xe - xb) / (n - 1);
  for i := 1 to n do
  begin
    x := xb + d * (i - 1);
    y := MyFunction(x);
    Chart1.Series[0].AddXY(x, y);
  end;
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
begin
  Chart1.Series[0].Clear;
  Inc(n);
  //  n := n + 1;
  xe := xe + 1;
  SpeedButton1Click(Sender);
end;

procedure TForm6.SpeedButton3Click(Sender: TObject);
begin
  Chart1.Series[0].Clear;
  Inc(n,-1);
  //  n := n + 1;
  xe := xe -1;
  SpeedButton1Click(Sender);
end;

procedure TForm6.SpeedButton4Click(Sender: TObject);
begin
  Chart1.Axes[0].Maximum := Chart1.Axes[0].Maximum + 1;
end;

procedure TForm6.SpeedButton5Click(Sender: TObject);
begin
  Chart1.Axes[0].Maximum := Chart1.Axes[0].Maximum - 1;
end;

procedure TForm6.SpeedButton6Click(Sender: TObject);
begin
  Chart1.Axes[0].Minimum := Chart1.Axes[0].Minimum - 1;
end;

procedure TForm6.SpeedButton7Click(Sender: TObject);
begin
  Chart1.Axes[0].Minimum := Chart1.Axes[0].Minimum + 1;
end;

end.
