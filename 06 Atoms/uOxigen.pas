unit uOxigen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, FMX.Types3D, FMX.Controls3D, FMX.Objects3D,
  FMX.Viewport3D, FMX.MaterialSources, FMX.Layouts, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo;

type
  TForm5 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    lmsBlue: TLightMaterialSource;
    lmsRed: TLightMaterialSource;
    lmsGreen: TLightMaterialSource;
    lmsGray: TLightMaterialSource;
    Viewport3D1: TViewport3D;
    Dummy1: TDummy;
    duOxygen: TDummy;
    spOxygen1: TSphere;
    spOxygen2: TSphere;
    Light1: TLight;
    duWater: TDummy;
    Sphere1: TSphere;
    Sphere2: TSphere;
    Sphere3: TSphere;
    Memo1: TMemo;
    procedure spOxygen2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.spOxygen2Click(Sender: TObject);
begin
  duOxygen.AnimateFloat('RotationAngle.Y', 360, 2);
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Это молекула Кислорода');
end;

end.
