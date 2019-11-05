unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Types3D,
  System.Math.Vectors, FMX.MaterialSources, FMX.Objects3D, FMX.Controls3D,
  FMX.Viewport3D, FMX.Ani, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm3 = class(TForm)
    Viewport3D1: TViewport3D;
    Light1: TLight;
    Sphere1: TSphere;
    LightMaterialSource1: TLightMaterialSource;
    Sphere2: TSphere;
    Sphere3: TSphere;
    LightMaterialSource2: TLightMaterialSource;
    FloatAnimation1: TFloatAnimation;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  Sphere1.Scale.X:= Sphere1.Scale.X * 0.9;
  Sphere1.Scale.Y:= Sphere1.Scale.Y * 0.9;
  Sphere1.Scale.Z:= Sphere1.Scale.Z * 0.9;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  Sphere1.Scale.X:= Sphere1.Scale.X * 1.1;
  Sphere1.Scale.Y:= Sphere1.Scale.Y * 1.1;
  Sphere1.Scale.Z:= Sphere1.Scale.Z * 1.1;
end;

end.
