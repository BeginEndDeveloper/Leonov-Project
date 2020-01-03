unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Media, System.IOUtils;

type
  TfmMian = class(TForm)
    tbTop: TToolBar;
    lbTop: TLabel;
    meFull: TMemo;
    tcMain: TTabControl;
    TabItem1: TTabItem;
    tiEveryOtherLine: TTabItem;
    tiFirsWords: TTabItem;
    meEveryOtherLine: TMemo;
    meFirstWords: TMemo;
    tbRecord: TToolBar;
    sbStopPlayBack: TSpeedButton;
    sbStartPlayBack: TSpeedButton;
    sbStartRecord: TSpeedButton;
    sbStopRecord: TSpeedButton;
    ActionList: TActionList;
    aStartRecord: TAction;
    aStopRecord: TAction;
    aStartPlayBack: TAction;
    aStopPlayBack: TAction;
    MediaPlayer: TMediaPlayer;
    aShowRecordToolBar: TAction;
    aHideRecordToolBar: TAction;
    sbShowRecordToolBar: TSpeedButton;
    sbHideRecordToolBar: TSpeedButton;
    sbShowNotification: TSpeedButton;
    aShowNotificationForm: TAction;
    procedure tcMainChange(Sender: TObject);
    procedure aStartPlayBackExecute(Sender: TObject);
    procedure aStartRecordExecute(Sender: TObject);
    procedure aStopPlayBackExecute(Sender: TObject);
    procedure aStopRecordExecute(Sender: TObject);
    procedure sbShowRecordToolBarClick(Sender: TObject);
    procedure sbHideRecordToolBarClick(Sender: TObject);
    procedure aShowNotificationFormExecute(Sender: TObject);
  private
    { Private declarations }
    FMicrophone: TAudioCaptureDevice;
  public
    { Public declarations }
  end;

var
  fmMian: TfmMian;

implementation

{$R *.fmx}

uses uNotification;

procedure TfmMian.aShowNotificationFormExecute(Sender: TObject);
begin
  fmNotification.Show;
end;

procedure TfmMian.aStartPlayBackExecute(Sender: TObject);
begin
  MediaPlayer.FileName := TPath.GetHomePath + '/poem.3GP';
  MediaPlayer.Play;
end;

procedure TfmMian.aStartRecordExecute(Sender: TObject);
begin
  FMicrophone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;

  FMicrophone.FileName := TPath.GetHomePath + '/poem.3GP';

  FMicrophone.StartCapture;
end;

procedure TfmMian.aStopPlayBackExecute(Sender: TObject);
begin
  MediaPlayer.Stop;
end;

procedure TfmMian.aStopRecordExecute(Sender: TObject);
begin
  FMicrophone.StopCapture;
end;

procedure TfmMian.sbHideRecordToolBarClick(Sender: TObject);
begin
  tbRecord.Visible := True;
end;

procedure TfmMian.sbShowRecordToolBarClick(Sender: TObject);
begin
  tbRecord.Visible := false;
end;

procedure TfmMian.tcMainChange(Sender: TObject);
var
  Str: string;
  i: integer;
  j: integer;
  GotFirst: boolean;
begin
  if tcMain.ActiveTab = tiFirsWords then
  begin
    meFirstWords.Lines.Clear;
    for i := 0 to meFull.Lines.Count - 1 do
    begin
      Str := meFull.Lines[i];
      GotFirst := false;
      for j := Low(Str) to High(Str) do
      begin
        if GotFirst and (Str[j] <> ' ') then
          Str[j] := 'x';
        if not GotFirst and (Str[j] = ' ') then
          GotFirst := True;
      end;
      meFirstWords.Lines.Add(Str);
    end;
  end;
  //
  if tcMain.ActiveTab = tiEveryOtherLine then
  begin
    meEveryOtherLine.Lines.Clear;
    for i := 0 to meFull.Lines.Count - 1 do
    begin
      Str := meFull.Lines[i];
      if (i mod 2) = 1 then
      begin
        for j := Low(Str) to High(Str) do
        begin
          if Str[j] <> ' ' then
            Str[j] := 'x';
        end;
      end;
      meEveryOtherLine.Lines.Add(Str);
    end;
  end;
end;

end.
