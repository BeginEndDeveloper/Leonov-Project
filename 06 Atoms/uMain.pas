unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, FMX.Types3D, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Controls3D, FMX.Objects3D, FMX.MaterialSources, FMX.Viewport3D,
  FMX.Layouts;

type
  TForm4 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Viewport3D1: TViewport3D;
    Dummy1: TDummy;
    lmsBlue: TLightMaterialSource;
    lmsRed: TLightMaterialSource;
    lmsGreen: TLightMaterialSource;
    lmsGray: TLightMaterialSource;
    spOxygen1: TSphere;
    spOxygen2: TSphere;
    duOxygen: TDummy;
    Light1: TLight;
    TrackBar1: TTrackBar;
    duWater: TDummy;
    Sphere1: TSphere;
    Sphere2: TSphere;
    Sphere3: TSphere;
    TrackBar2: TTrackBar;
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.TrackBar1Change(Sender: TObject);
begin
  Dummy1.RotationAngle.Y := TrackBar1.Value;
end;

procedure TForm4.TrackBar2Change(Sender: TObject);
begin
  Dummy1.RotationAngle.X := TrackBar2.Value;
end;

end.
