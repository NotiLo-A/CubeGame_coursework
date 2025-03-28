unit Level2;

interface

uses
  Winapi.Windows,Winapi.Messages,System.SysUtils,System.Variants,System.Classes,
  Vcl.Graphics,Vcl.Controls,Vcl.Forms,Vcl.Dialogs,Vcl.StdCtrls,Vcl.ExtCtrls,NPC,
  Vcl.Imaging.pngimage,Vcl.Imaging.GIFImg,Winapi.ShellAPI,proced,System.SyncObjs,
  Vcl.Imaging.jpeg,System.IniFiles,System.Threading,VCL.Styles,Vcl.ComCtrls,
  MovementSystem;

type
  TForm4 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  speed: integer = 1;
  panels, DiePanels, CamPanels, movePanels: array of Tpanel;
  moveImages: array of Timage;
  a,w,s,d:boolean;

implementation

{$R *.dfm}

uses MainMenuFile;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
ExitingTheProgram(form2);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  panels := [panel6,panel7,panel8];
  diePanels := [];
  camPanels := [panel2, panel3, panel4, panel5];
end;

procedure TForm4.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
case Key of
    Ord('W'), VK_UP:    w := true;
    Ord('S'), VK_DOWN:  s := true;
    Ord('A'), VK_LEFT:  a := true;
    Ord('D'), VK_RIGHT: d := true;
  end;
  end;

procedure TForm4.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
    Ord('W'), VK_UP:    w := False;
    Ord('S'), VK_DOWN:  s := False;
    Ord('A'), VK_LEFT:  a := False;
    Ord('D'), VK_RIGHT: d := False;
  end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
   MegaUltimateProcedureForMove(
    form4,//форма
    panel1,//main панель
    speed, //скорость
    panels, DiePanels, CamPanels, movePanels,moveImages,//[стены][смерть стены][для камеры][для движения][для img]
    a,w,s,d); // AWSD
end;

end.
