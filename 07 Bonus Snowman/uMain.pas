unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Types3D,
  System.Math.Vectors, FMX.Layouts, FMX.Objects3D, FMX.Ani, FMX.Controls3D,
  FMX.Viewport3D, FMX.MaterialSources, FMX.TabControl;

type
  TMain = class(TForm)
    lmsWhite: TLightMaterialSource;
    lmsBlack: TLightMaterialSource;
    lmsOrangered: TLightMaterialSource;
    lmsSaddlebrown: TLightMaterialSource;
    Viewport3D1: TViewport3D;
    Light1: TLight;
    Sphere1: TSphere;
    Sphere2: TSphere;
    Cylinder2: TCylinder;
    Cylinder4: TCylinder;
    Sphere3: TSphere;
    Cylinder1: TCylinder;
    Cylinder3: TCylinder;
    Disk1: TDisk;
    Cone1: TCone;
    Sphere4: TSphere;
    Sphere5: TSphere;
    FloatAnimation2: TFloatAnimation;
    Text3D1: TText3D;
    FloatAnimation1: TFloatAnimation;
    Layout1: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Viewport3D2: TViewport3D;
    Light2: TLight;
    Model3D1: TModel3D;
    FloatAnimation3: TFloatAnimation;
    Model3D1Mat02: TLightMaterialSource;
    Model3D1Mat35: TLightMaterialSource;
    Model3D1Mat24: TLightMaterialSource;
    Model3D1Mat36: TLightMaterialSource;
    Model3D1Mat25: TLightMaterialSource;
    Model3D1Mat37: TLightMaterialSource;
    Model3D1Mat26: TLightMaterialSource;
    Model3D1Mat38: TLightMaterialSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.fmx}

end.
