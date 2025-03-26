unit AtifkaLab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Panel19: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Panel14: TPanel;
    Panel15: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Panel18: TPanel;
    Panel20: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Panel21: TPanel;
    Panel22: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Panel23: TPanel;
    Panel24: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Panel25: TPanel;
    Panel26: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Panel27: TPanel;
    Panel28: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Panel29: TPanel;
    Panel30: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Panel31: TPanel;
    Panel32: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Panel33: TPanel;
    Panel34: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Panel35: TPanel;
    Panel36: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Panel37: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  mainpanelATI, MainPicATI: array of Tpanel;
  MaintextATI, PostTextATI: array of Tlabel;

implementation

{$R *.dfm}

uses MainMenuFile,proced;

procedure TForm5.Button1Click(Sender: TObject);
begin
swichWindow(form2)
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
//tifonTP := [panel1,panel2,panel3,panel4,panel5,panel6,panel7,panel8,panel9,
//            panel10,panel11,panel12,panel13,panel14,panel15,panel16,panel17,
//            panel18];

//$00D2D2D2  (1)    $00F4F4F4   (0)

mainpanelATI := [panel1, panel3, panel5,panel7, panel9, panel11, panel13,panel15,
                 panel17, panel19, panel21,panel23, panel25, panel27];

MaintextATI := [label1, label3, label5, label7, label9, label11, label13, label15,
                label17, label19, label21, label23, label25, label27];

PostTextATI := [label2, label4, label6, label8, label10, label12, label14, label16,
                label18, label20, label22, label24, label28];

MainPicATI := [panel2, panel4, panel6,panel8, panel10, panel12, panel14,panel16,
               panel18, panel20, panel22,panel24, panel26, panel28];






end;

procedure TForm5.Timer1Timer(Sender: TObject);
begin

for var i := Low(DynamicArrayS) to High(DynamicArrayS) do
begin
  maintextATI[i].Visible := true;
  PostTextATI[i].Visible := true;
  MainPicATI[i].Visible := true;
  mainPanelATI[i].Color := $00D2D2D2;
  mainPanelATI[i].Caption := '';
  maintextATI[i].Caption := DynamicArrayS[i];
  PostTextATI[i].Caption := DynamicArraySs[i];
  MainPicATI[i].Caption := DunamicArrayZnak[i];
  MainPicATI[i].Color := DunamicArrayColorTab[i];
end;

end;

end.
