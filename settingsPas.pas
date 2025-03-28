unit settingsPas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    TrackBar1: TTrackBar;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Panel4: TPanel;
    Label18: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    Panel6: TPanel;
    Memo1: TMemo;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Label10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure swapSettingPanel(obj: Tlabel; pan: Tpanel);
    procedure LoadLicense();
  end;

var
  Form6: TForm6;
  AllMenuButtonPanels: array of Tpanel;
  backPanel: Tpanel;

implementation

{$R *.dfm}

uses MainMenuFile, proced, AtifkaLab;

procedure TForm6.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
ExitingTheProgram(form2)
end;

procedure TForm6.FormCreate(Sender: TObject);
begin


  backPanel := panel2;
  Form6.Constraints.MaxWidth := 640;
  Form6.Constraints.MaxHeight := 460;
  Form6.Constraints.MinWidth := 640;
  Form6.Constraints.MinHeight := 460;
  Self.DoubleBuffered := True;


  AllMenuButtonPanels := [];
  panel2.Left := 165;
  panel2.Top := 0;
  label2.BringToFront;
  label3.BringToFront;
  label7.BringToFront;
  label8.BringToFront;

  form6.Width := 541;
  form6.Top := 509;
//  Form6.Constraints.MinWidth := 541;
//  Form6.Constraints.MaxWidth := 509;
//  Form6.Constraints.MinHeight := 541;
//  Form6.Constraints.MaxHeight := 509;

  // swapSettingPanel(label2, panel3);
  LoadLicense();
  swapSettingPanel(label2, panel2);
//    label5.Top := (label2.Top + (label2.Height div 2)) - (label5.Height div 2);
//  label6.Top := (label2.Top + (label2.Height div 2)) - (label6.Height div 2) + 1;
end;

procedure TForm6.Label10Click(Sender: TObject);
begin
ExitingTheProgram(form2);
end;

procedure TForm6.Label2Click(Sender: TObject);
begin
swapSettingPanel(label2, panel2);
end;

procedure TForm6.Label3Click(Sender: TObject);
begin
swapSettingPanel(label3, panel6);

end;

procedure TForm6.Label7Click(Sender: TObject);
begin
  TakeMeBackForAtifka := form6;
  swichWindow(form5)
end;

procedure TForm6.Label8Click(Sender: TObject);
begin
swapSettingPanel(label8, panel4);
end;

procedure TForm6.Label9Click(Sender: TObject);
begin
swichWindow(TakeMeBackForSettings)
end;

procedure TForm6.Panel5Click(Sender: TObject);
begin
  Screen.Cursor := LoadCursorFromFile('cursors/normal.cur');
end;

procedure Tform6.swapSettingPanel(obj: Tlabel; pan: Tpanel);
begin
  label5.Top := (obj.Top + (obj.Height div 2)) - (label5.Height div 2);
  label6.Top := (obj.Top + (obj.Height div 2)) - (label6.Height div 2) + 1;

  label5.Left := obj.Left - 10;
  label6.Left := obj.Left + obj.Width + 2;

  backPanel.Left := 1000;
  pan.Left := 165;
  pan.Top := 0;
  backPanel := pan;
end;

procedure TForm6.LoadLicense();
var
  LicenseFile: string;
begin
  LicenseFile := ExtractFilePath(ParamStr(0)) + 'GPLv3.txt'; // ���� � ����� �������
  if FileExists(LicenseFile) then
  begin
    Memo1.Lines.LoadFromFile(LicenseFile);
  end
  else
  begin
    ShowMessage('���� �������� �� ������.');
  end;
end;

end.
