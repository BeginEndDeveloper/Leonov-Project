unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.Media, System.IOUtils,
  System.Permissions;

type
  TfmMian = class(TForm)
    tbTop: TToolBar;
    lbTop: TLabel;
    meFull: TMemo;
    tcMain: TTabControl;
    tiMain: TTabItem;
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
    procedure FormCreate(Sender: TObject);
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
  // Задать имя файла для воспроизведения
  MediaPlayer.FileName := TPath.GetHomePath + PathDelim + 'poem.3GP';
  // Запустить проигрыватель
  MediaPlayer.Play;
end;

procedure TfmMian.aStartRecordExecute(Sender: TObject);
begin
  // Инициализация микрофона
  FMicrophone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
  // задание файла для записи голоса
  FMicrophone.FileName := TPath.GetHomePath + PathDelim + 'poem.3GP';
  // начать запись голоса
  try
    FMicrophone.StartCapture;
  except
    on E: EPermissionException do // System.Permissions
      ShowMessage('Нет доступа к записи звука');
    on E: Exception do
      ShowMessage('Ошибка');
  end;
end;

procedure TfmMian.aStopPlayBackExecute(Sender: TObject);
begin
  // Остановить воспроизведение
  MediaPlayer.Stop;
end;

procedure TfmMian.aStopRecordExecute(Sender: TObject);
begin
  // Остановить запись голоса
  FMicrophone.StopCapture;
end;

procedure TfmMian.FormCreate(Sender: TObject);
begin
  tbRecord.Visible := False;
  tcMain.ActiveTab := tiMain;
end;

procedure TfmMian.sbHideRecordToolBarClick(Sender: TObject);
begin
  tbRecord.Visible := True;
end;

procedure TfmMian.sbShowRecordToolBarClick(Sender: TObject);
begin
  tbRecord.Visible := False;
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
      GotFirst := False;
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
