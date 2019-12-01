unit uMian;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.TabControl, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.ListBox, FMX.Layouts, FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.ScrollBox,
  FMX.Memo, FMX.DateTimeCtrls, FMX.StdActns, FMX.MediaLibrary.Actions;

type
  TMain = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ToolBar2: TToolBar;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ChangeTabAction2: TChangeTabAction;
    ListBox1: TListBox;
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
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
    arDate: array [1 .. 31] of TDate; // �������� ����
    arTime: array [1 .. 31] of TTime; // �������� �������
    arLength: array [1 .. 31] of single; // �������� �����
    arWater: array [1 .. 31] of boolean; // �������� ������
    arComment: array [1 .. 31] of string; // ��������
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.fmx}

procedure TMain.FormCreate(Sender: TObject);
var
  i: integer;
begin
  TabControl1.ActiveTab := TabItem1;
  //
  for i := 1 to 31 do
  begin
    arLength[i] := 0.0;
    arDate[i] := 0;
    arTime[i] := 0;
    arWater[i] := false;
    arComment[i] := '';
  end;

end;

procedure TMain.FormShow(Sender: TObject);
var
  FileName: string; // ������ ��� �����
  MyFile: TextFile; // ���� ������������
  BigString: string; // ������ ��� ������ �����
  sDate, sTime, sLength, sWater, sComment: string;
  i, n, j: integer;
  NewListBoxItem: TListBoxItem;
begin
  // �������� ������ ��� ����� � ����
  exit;
  try
    FileName := TPath.GetDocumentsPath + PathDelim + 'diary.txt';
  except
    on E: exception do
      ShowMessage(E.Message);
  end;
  // ������� �������� ���������� � ������ �����
  AssignFile(MyFile, FileName);
  // ������� ���� �� ������
  Reset(MyFile);
  // ���� �� ���������� ����
  n := 0;
  while not Eof(MyFile) do
  begin
    // ��������� ������
    Readln(MyFile, BigString);
    //
    sDate := '';
    sTime := '';
    sLength := '';
    sWater := '';
    sComment := '';

    i := Low(BigString);
    while BigString[i] <> ' ' do
    begin
      sDate := sDate + BigString[i];
      i := i + 1;
    end;
    i := i + 1;
    while BigString[i] <> ' ' do
    begin
      sTime := sTime + BigString[i];
      i := i + 1;
    end;
    i := i + 1;
    while BigString[i] <> ' ' do
    begin
      sLength := sLength + BigString[i];
      i := i + 1;
    end;
    i := i + 1;
    while BigString[i] <> ' ' do
    begin
      sWater := sWater + BigString[i];
      i := i + 1;
    end;
    i := i + 1;
    while i < High(BigString) do
    begin
      if BigString[i] <> '"' then
        sComment := sComment + BigString[i];
      i := i + 1;
    end;
    //

    arDate[n] := StrToDate(sDate);
    arTime[n] := StrToTime(sTime);
    arLength[n] := StrToFloat(sLength);
    if sWater = '��' then
      arWater[n] := true
    else
      arWater[n] := false;
    arComment[n] := sComment;
    //
    n := n + 1;
  end;
  // ��������� ����
  CloseFile(MyFile);
  for j := 1 to n do
  begin
    NewListBoxItem := TListBoxItem.Create(ListBox1);
    NewListBoxItem.Parent := ListBox1;
    NewListBoxItem.StyleLookup := 'listboxitembottomdetail';
    NewListBoxItem.Height := 44;
    NewListBoxItem.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
    NewListBoxItem.ItemData.Text := DateToStr(arDate[j]) + ' ' +
      TimeToStr(arTime[j]);
    NewListBoxItem.ItemData.Detail := '����� ������ ' +
      FloatToStr(arLength[j]) + ' ��';
  end;
end;

procedure TMain.ListBox1Click(Sender: TObject);
var
  ListBoxItemIndex: integer;
begin
  // ���� ������� �� ������
  if ListBox1.ItemIndex < 0 then
    exit;
  // ������ ��������
  ListBoxItemIndex := ListBox1.ItemIndex + 1;
  laDateTimeValue.Text := DateToStr(arDate[ListBoxItemIndex]) + ' ' +
    TimeToStr(arTime[ListBoxItemIndex]);
  laLenghtValue.Text := '����� ������ ' +
    FloatToStr(arLength[ListBoxItemIndex]) + ' ��';
  if arWater[ListBoxItemIndex] then
    laWaterValue.Text := '��'
  else
    laWaterValue.Text := '���';
  laCommentValue.Text := arComment[ListBoxItemIndex];
  // ��������� �� ������ ��������
  ChangeTabAction3.ExecuteTarget(TabControl1);
end;

procedure TMain.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.TextMessage := 'Hello from mobile!';
end;

procedure TMain.SpeedButton4Click(Sender: TObject);
var
  NewIndex: integer;
  NewListBoxItem: TListBoxItem;

  MyFile: TextFile;
  FileName: string;
  MyString: string;
begin
  // ShowMessage('������ ���������');
  // ����� 1. ���������� ������ � ������
  NewIndex := ListBox1.Count + 1;
  arDate[NewIndex] := deDateNew.Date;
  arTime[NewIndex] := teTimeNew.Time;
  arLength[NewIndex] := sbLengthNew.Value;
  arWater[NewIndex] := swWaterNew.IsChecked;
  arComment[NewIndex] := meCommentNew.Text;
  // ����� 2, ���������� �������� � ������
  NewListBoxItem := TListBoxItem.Create(ListBox1);
  NewListBoxItem.Parent := ListBox1;
  NewListBoxItem.StyleLookup := 'listboxitembottomdetail';
  NewListBoxItem.Height := 44;
  NewListBoxItem.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
  NewListBoxItem.ItemData.Text := DateToStr(arDate[NewIndex]) + ' ' +
    TimeToStr(arTime[NewIndex]);
  NewListBoxItem.ItemData.Detail := '����� ������ ' +
    FloatToStr(arLength[NewIndex]) + ' ��';

  FileName := TPath.GetDocumentsPath + PathDelim + 'diary.txt';
  if not FileExists(FileName) then
    AssignFile(MyFile, FileName);

  if not FileExists(FileName) then
    Rewrite(MyFile)
  else
    Append(MyFile);
  MyString := DateToStr(arDate[NewIndex]) + ' ' + TimeToStr(arTime[NewIndex]) +
    ' ' + FloatToStr(arLength[NewIndex]);
  if arWater[NewIndex] = true then
    MyString := MyString + ' ' + '��' + ' '
  else
    MyString := MyString + ' ' + '���' + ' ';
  MyString := MyString + '"' + arComment[NewIndex] + '"';
  Writeln(MyFile, MyString);
  CloseFile(MyFile);
  // ��������� �� ������ ���������
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
