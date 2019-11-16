unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.Layouts;

type
  TForm7 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    ToolBar2: TToolBar;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Layout1: TLayout;
    Label1: TLabel;
    SpinBox1: TSpinBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpinBox2: TSpinBox;
    SpinBox3: TSpinBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpinBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    xb, xe: single;
    n: integer;
    a, b, c: single;
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.fmx}

function MyFunction(xi, ai, bi, ci: single): single;
var
  yi: single;
begin
  yi := ai * xi * xi + bi * xi + ci;
  result := yi;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  xb := 0;
  xe := 4;
  n := 5;
  a := 1;
  b := 0;
  c := 2;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
var
  d: single;
  x, y: single;
  i: integer;
begin
  d := (xe - xb) / (n - 1);
  for i := 1 to n do
  begin
    x := xb + d * (i - 1);
    y := MyFunction(x, a, b, c);
    Chart1.Series[0].AddXY(x, y);
  end;
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
  Chart1.Series[0].Clear;
  Inc(n);
  // n := n + 1;
  xe := xe + 1;
  SpeedButton1Click(Sender);
end;

procedure TForm7.SpeedButton3Click(Sender: TObject);
begin
  Chart1.Series[0].Clear;
  Inc(n, -1);
  // n := n + 1;
  xe := xe - 1;
  SpeedButton1Click(Sender);
end;

procedure TForm7.SpeedButton4Click(Sender: TObject);
begin
  Chart1.Axes[0].Maximum := Chart1.Axes[0].Maximum + 1;
end;

procedure TForm7.SpeedButton5Click(Sender: TObject);
begin
  Chart1.Axes[0].Maximum := Chart1.Axes[0].Maximum - 1;
end;

procedure TForm7.SpeedButton6Click(Sender: TObject);
begin
  Chart1.Axes[0].Minimum := Chart1.Axes[0].Minimum - 1;
end;

procedure TForm7.SpeedButton7Click(Sender: TObject);
begin
  Chart1.Axes[0].Minimum := Chart1.Axes[0].Minimum + 1;
end;

procedure TForm7.SpinBox1Change(Sender: TObject);
begin
  a := SpinBox1.Value;
  b := SpinBox2.Value;
  c := SpinBox3.Value;
  Chart1.Series[0].Clear;
  SpeedButton1.OnClick(Sender);
end;

end.
