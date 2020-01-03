unit uMian;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.TabControl, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.ListBox, FMX.Layouts, FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.ScrollBox,
  FMX.Memo, FMX.DateTimeCtrls, FMX.StdActns, FMX.MediaLibrary.Actions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TMain = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    ActionList: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ToolBar2: TToolBar;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ChangeTabAction2: TChangeTabAction;
    lbTask: TListBox;
    ChangeTabAction3: TChangeTabAction;
    ToolBar3: TToolBar;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Layout1: TLayout;
    paDateTimeHeader: TPanel;
    laDateTimeHeader: TLabel;
    loDateTimeValue: TLayout;
    laDateTimeValue: TLabel;
    ListBox2: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem3: TListBoxItem;
    deDateNew: TDateEdit;
    teTimeNew: TTimeEdit;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem4: TListBoxItem;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem5: TListBoxItem;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    ListBoxItem6: TListBoxItem;
    meCommentNew: TMemo;
    sbLengthNew: TSpinBox;
    swWaterNew: TSwitch;
    paLenghtHeader: TPanel;
    loWaterValue: TLayout;
    laWaterValue: TLabel;
    laLenghtHeader: TLabel;
    loCommentValue: TLayout;
    laCommentValue: TLabel;
    paCommentHeader: TPanel;
    laCommentHeader: TLabel;
    loLenghtValue: TLayout;
    laLenghtValue: TLabel;
    paWaterHeader: TPanel;
    laWaterHeader: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label1: TLabel;
    ShowShareSheetAction1: TShowShareSheetAction;
    fdcBase: TFDConnection;
    fdtTask: TFDTable;
    fdQuery: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbTaskClick(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure fdcBaseAfterConnect(Sender: TObject);
    procedure fdcBaseBeforeConnect(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AddListBoxItem(aDate, aTime: string; aLenght: single);
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.fmx}

procedure TMain.AddListBoxItem(aDate, aTime: string; aLenght: single);
var
  NewListBoxItem: TListBoxItem;
begin
  NewListBoxItem := TListBoxItem.Create(lbTask);
  NewListBoxItem.Parent := lbTask;
  NewListBoxItem.StyleLookup := 'listboxitembottomdetail';
  NewListBoxItem.Height := 44;
  NewListBoxItem.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
  NewListBoxItem.ItemData.Text := aDate + ' ' + aTime;
  NewListBoxItem.ItemData.Detail := 'Длина ростка ' + FloatToStr(aLenght) + ' мм';
end;

procedure TMain.fdcBaseAfterConnect(Sender: TObject);
begin
  fdcBase.ExecSQL('CREATE TABLE IF NOT EXISTS Task (' + //
    'ID INTEGER NOT NULL, ' + // ID
    'Length REAL NOT NULL, ' + // длины
    'Date TEXT NOT NULL, ' + // даты
    'Time TEXT NOT NULL, ' + // времени
    'Water INTEGER NOT NULL, ' + // полива
    'Comment TEXT ' + // коммент
    ')');
end;

procedure TMain.fdcBaseBeforeConnect(Sender: TObject);
begin
{$IF DEFINED(MSWINDOWS)}
  // IncludeTrailingBackslash
  fdcBase.Params.Values['Database'] := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'tasks.sdb';
{$ELSE}
  fdcBase.Params.Values['Database'] := TPath.GetDocumentsPath + PathDelim + 'tasks.sdb';
{$ENDIF}
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  try
    fdcBase.Connected := True;
    fdtTask.TableName := 'Task';
    fdtTask.Active := True;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
  TabControl1.ActiveTab := TabItem1;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  fdtTask.First;
  while not fdtTask.Eof do
  begin
    AddListBoxItem(fdtTask.FieldByName('Date').AsString, fdtTask.FieldByName('Time').AsString, fdtTask.FieldByName('Length').AsFloat);
    fdtTask.Next;
  end;
end;

procedure TMain.lbTaskClick(Sender: TObject);
begin
  // Если элемент не выбран
  if lbTask.ItemIndex < 0 then
    exit;
  // Индекс элемента
  fdQuery.Close;
  fdQuery.SQL.Clear;
  fdQuery.SQL.Add('select * from task where id = :id');
  fdQuery.ParamByName('id').AsInteger := lbTask.ItemIndex + 1;
  fdQuery.Open;
  laDateTimeValue.Text := fdQuery.FieldByName('Date').AsString + ' ' + fdQuery.FieldByName('Time').AsString;
  laLenghtValue.Text := 'Длина ростка ' + fdQuery.FieldByName('Length').AsString + ' мм';
  if fdQuery.FieldByName('Water').AsInteger = 1 then
    laWaterValue.Text := 'Да'
  else
    laWaterValue.Text := 'Нет';
  laCommentValue.Text := fdQuery.FieldByName('Comment').AsString;
  fdQuery.Close;
  // Навигация на вторую страницу
  ChangeTabAction3.ExecuteTarget(TabControl1);
end;

procedure TMain.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.TextMessage := 'Hello from mobile!';
end;

procedure TMain.SpeedButton1Click(Sender: TObject);
begin
  //
  deDateNew.Text := DateToStr(Date);
  teTimeNew.Text := TimeToStr(Now);
  sbLengthNew.Value := 0;
  swWaterNew.IsChecked := False;
  meCommentNew.Lines.Clear;
  ChangeTabAction1.ExecuteTarget(TabControl1);
end;

procedure TMain.SpeedButton4Click(Sender: TObject);
begin
  // Часть 1. добавление данных в массив

  (* fdQuery.Close;
    fdQuery.SQL.Clear;
    fdQuery.SQL.Add('Insert into Task (ID, Length, Date, Time, Water, Comment) ');
    fdQuery.SQL.Add('values (:ID, :L, :D, :T, :W, :C)');
    fdQuery.ParamByName('ID').AsInteger := lbTask.Count + 1;
    fdQuery.ParamByName('L').AsFloat := sbLengthNew.Value;
    fdQuery.ParamByName('D').AsString := DateToStr(deDateNew.Date);
    fdQuery.ParamByName('T').AsString := TimeToStr(teTimeNew.Time);
    fdQuery.ParamByName('W').AsInteger := swWaterNew.IsChecked.ToInteger;
    fdQuery.ParamByName('C').AsString := meCommentNew.Text;
    fdQuery.ExecSQL; *)

  // new
  try
    fdQuery.ExecSQL('Insert into Task (ID, Length, Date, Time, Water, Comment) ' + 'values (:ID, :L, :D, :T, :W, :C)',
      [lbTask.Count + 1, sbLengthNew.Value, DateToStr(deDateNew.Date), TimeToStr(teTimeNew.Time), swWaterNew.IsChecked.ToInteger, meCommentNew.Text]);
  except
    on e: Exception do
      ShowMessage(e.Message);
  end;

  // Часть 2, добавление элемента в список
  AddListBoxItem(DateToStr(deDateNew.Date), TimeToStr(teTimeNew.Time), sbLengthNew.Value);
  // Переходим на первую страничку
  ChangeTabAction2.ExecuteTarget(TabControl1);
end;

procedure TMain.SpeedButton8Click(Sender: TObject);
begin
  //
  deDateNew.Text := DateToStr(Date);
  teTimeNew.Text := TimeToStr(Now);
  meCommentNew.Lines.Clear;
end;

procedure TMain.SpeedButton9Click(Sender: TObject);
var
  FileName: string;
  StrList: TStringList;
begin
  FileName := TPath.GetDocumentsPath + PathDelim + 'diary.txt';
  StrList := TStringList.Create;
  try
    StrList.LoadFromFile(FileName);
    ShowShareSheetAction1.TextMessage := StrList.Text;
  finally
    StrList.Free;
  end;
end;

end.
