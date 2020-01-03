unit uNotification;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Notification, System.Actions, FMX.ActnList, FMX.StdCtrls, FMX.Edit,
  FMX.EditBox, FMX.SpinBox, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation;

type
  TfmNotification = class(TForm)
    tbTop: TToolBar;
    lbNotification: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    sbInterval: TSpinBox;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    NotificationCenter1: TNotificationCenter;
    aBackToMainForm: TAction;
    aNotify: TAction;
    procedure aBackToMainFormExecute(Sender: TObject);
    procedure aNotifyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNotification: TfmNotification;

implementation

{$R *.fmx}

procedure TfmNotification.aBackToMainFormExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmNotification.aNotifyExecute(Sender: TObject);
var
  myNotification: TNotification;
begin
  myNotification := NotificationCenter1.CreateNotification;
  try
    myNotification.AlertBody := 'Повторить стих';
    myNotification.FireDate := Now + EncodeTime(0, Round(sbInterval.Value), 10, 0);
    NotificationCenter1.ScheduleNotification(myNotification);
  finally
    myNotification.Free;
  end;
end;

procedure TfmNotification.FormShow(Sender: TObject);
begin
  sbInterval.Value := 1;
end;

end.
