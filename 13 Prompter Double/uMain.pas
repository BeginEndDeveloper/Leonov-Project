unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile;

type
  TForm9 = class(TForm)
    paLeft: TPanel;
    lbPoem: TListBox;
    buDiscover: TButton;
    buClear: TButton;
    lbManager: TListBox;
    lbProfiles: TListBox;
    TetheringManager2: TTetheringManager;
    TetheringAppProfile2: TTetheringAppProfile;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    procedure buDiscoverClick(Sender: TObject);
    procedure TetheringManager2EndManagersDiscovery(const Sender: TObject; const ARemoteManagers: TTetheringManagerInfoList);
    procedure lbManagerClick(Sender: TObject);
    procedure TetheringManager2EndProfilesDiscovery(const Sender: TObject; const ARemoteProfiles: TTetheringProfileInfoList);
    procedure lbProfilesClick(Sender: TObject);
    procedure buClearClick(Sender: TObject);
    procedure lbPoemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

procedure TForm9.buClearClick(Sender: TObject);
begin
  TetheringAppProfile2.RunRemoteAction(TetheringManager2.RemoteProfiles[lbProfiles.ItemIndex], 'Action1');
end;

procedure TForm9.buDiscoverClick(Sender: TObject);
var
  i: integer;
begin
  for i := TetheringManager2.PairedManagers.Count - 1 downto 0 do
  begin
    TetheringManager2.UnPairManager(TetheringManager2.PairedManagers[i]);
  end;
  lbManager.Clear;
  TetheringManager2.DiscoverManagers;
  // TetheringManager2.DiscoverManagers(1000, '');
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  Self.Caption := TetheringManager2.Identifier;
end;

procedure TForm9.lbManagerClick(Sender: TObject);
begin
  // "спаривание" менеджера с менеджером внешнего приложения по номеру в списке
  TetheringManager2.PairManager(TetheringManager2.RemoteManagers[lbManager.ItemIndex]);
end;

procedure TForm9.lbPoemClick(Sender: TObject);
begin
  TetheringAppProfile2.SendString( //
    TetheringManager2.RemoteProfiles[lbProfiles.ItemIndex], // выбранный удаленный профиль
    'CurrentString', // просто некая строка
    lbPoem.Items[lbPoem.ItemIndex]); // текущая по индексу
  if (lbPoem.Count) > (lbPoem.ItemIndex + 1) then
    TetheringAppProfile2.SendString( //
      TetheringManager2.RemoteProfiles[lbProfiles.ItemIndex], // выбранный удаленный профиль
      'NextString', // просто некая строка
      lbPoem.Items[lbPoem.ItemIndex + 1]) // текущая по индексу
  else
    TetheringAppProfile2.SendString( //
      TetheringManager2.RemoteProfiles[lbProfiles.ItemIndex], // выбранный удаленный профиль
      'NextString', // просто некая строка
      ' ') // текущая по индексу

end;

procedure TForm9.lbProfilesClick(Sender: TObject);
begin
  TetheringAppProfile2.Connect(TetheringManager2.RemoteProfiles[lbProfiles.ItemIndex]);
end;

procedure TForm9.TetheringManager2EndManagersDiscovery(const Sender: TObject; const ARemoteManagers: TTetheringManagerInfoList);
var
  i: integer;
begin
  lbManager.Items.Clear;
  for i := 0 to ARemoteManagers.Count - 1 do
  begin
    lbManager.Items.Add(ARemoteManagers[i].ManagerText + ' ' + ARemoteManagers[I].ManagerIdentifier);
  end;
end;

procedure TForm9.TetheringManager2EndProfilesDiscovery(const Sender: TObject; const ARemoteProfiles: TTetheringProfileInfoList);
var
  i: integer;
begin
  // Очистка списка профилей
  lbProfiles.Items.Clear;
  // Проходим по найденым профилям и добаляем их в список
  for i := 0 to ARemoteProfiles.Count - 1 do
  begin
    lbProfiles.Items.Add(ARemoteProfiles[i].ProfileText);
  end;
end;

end.
