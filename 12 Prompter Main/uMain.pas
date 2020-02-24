unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, IPPeerClient, IPPeerServer,
  System.Tether.Manager, System.Tether.AppProfile, System.Actions, FMX.ActnList;

type
  TForm8 = class(TForm)
    laCurrent: TLabel;
    laNext: TLabel;
    TetheringAppProfile1: TTetheringAppProfile;
    TetheringManager1: TTetheringManager;
    ActionList1: TActionList;
    Action1: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    procedure Action1Execute(Sender: TObject);
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
    procedure FormCreate(Sender: TObject);
    procedure TetheringManager1PairedToRemote(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

procedure TForm8.Action1Execute(Sender: TObject);
begin
  laCurrent.Text := '';
  laNext.Text := '';
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  Self.Caption := TetheringManager1.Identifier;
end;

procedure TForm8.TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
begin
  if AResource.Hint = 'CurrentString' then
  begin
    laCurrent.Text := AResource.Value.AsString;
  end;
  if AResource.Hint = 'NextString' then
  begin
    laNext.Text := AResource.Value.AsString;
  end;
end;

procedure TForm8.TetheringManager1PairedToRemote(const Sender: TObject;
  const AManagerInfo: TTetheringManagerInfo);
begin
  Label1.Text := AManagerInfo.ManagerIdentifier;
end;

end.
