unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.ScrollBox, FMX.Memo,
  System.Actions, FMX.ActnList;

type
  TMain = class(TForm)
    tbMain: TTabControl;
    tiQuestion1: TTabItem;
    tiQuestion2: TTabItem;
    tiQuestion3: TTabItem;
    tbTop: TToolBar;
    tiQuestion4: TTabItem;
    tiResult: TTabItem;
    Label1: TLabel;
    b2Q1: TButton;
    b3Q1: TButton;
    b4Q1: TButton;
    tbBottom: TToolBar;
    Label3: TLabel;
    lAnt2: TLabel;
    b1Q2: TButton;
    b2Q2: TButton;
    b3Q2: TButton;
    b4Q2: TButton;
    Label5: TLabel;
    b1Q3: TButton;
    b2Q3: TButton;
    b3Q3: TButton;
    b4Q3: TButton;
    Label7: TLabel;
    lAnt4: TLabel;
    b1Q4: TButton;
    b2Q4: TButton;
    b3Q4: TButton;
    b4Q4: TButton;
    ToolBar3: TToolBar;
    Memo1: TMemo;
    Label2: TLabel;
    ActionList: TActionList;
    NextTabAction: TNextTabAction;
    lAnt1: TLabel;
    lAnt3: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    b1Q1: TButton;
    procedure bQuest1Click(Sender: TObject);
    procedure bQuest2Click(Sender: TObject);
    procedure bQuest3Click(Sender: TObject);
    procedure bQuest4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

procedure TMain.bQuest1Click(Sender: TObject);
begin
  lAnt1.Text := (Sender As TButton).Text;
  if Sender = b3Q1 then
    Memo1.Lines.Add('Вопрос №1 - правильно')
  else
    Memo1.Lines.Add('Вопрос №1 - не правильно');
  NextTabAction.Execute;
end;

procedure TMain.bQuest2Click(Sender: TObject);
begin
  lAnt2.Text := (Sender As TButton).Text;
  if Sender = b3Q2 then
    Memo1.Lines.Add('Вопрос №2 - правильно')
  else
    Memo1.Lines.Add('Вопрос №2 - не правильно');
  NextTabAction.Execute;
end;

procedure TMain.bQuest3Click(Sender: TObject);
begin
  lAnt3.Text := (Sender As TButton).Text;
  if Sender = b3Q3 then
    Memo1.Lines.Add('Вопрос №2 - правильно')
  else
    Memo1.Lines.Add('Вопрос №2 - не правильно');
  NextTabAction.Execute;
end;

procedure TMain.bQuest4Click(Sender: TObject);
begin
  lAnt4.Text := (Sender As TButton).Text;
  if Sender = b3Q3 then
    Memo1.Lines.Add('Вопрос №2 - правильно')
  else
    Memo1.Lines.Add('Вопрос №2 - не правильно');
  NextTabAction.Execute;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  tbMain.ActiveTab:= tiQuestion1;
end;

procedure TMain.SpeedButton6Click(Sender: TObject);
begin
  ShowMessage('Подсказочка');
end;

end.
