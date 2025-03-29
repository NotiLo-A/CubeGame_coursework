unit Level1;

interface

uses
  Winapi.Windows,Winapi.Messages,System.SysUtils,System.Variants,System.Classes,
  Vcl.Graphics,Vcl.Controls,Vcl.Forms,Vcl.Dialogs,Vcl.StdCtrls,Vcl.ExtCtrls,NPC,
  Vcl.Imaging.pngimage,Vcl.Imaging.GIFImg,Winapi.ShellAPI,proced,System.SyncObjs,
  Vcl.Imaging.jpeg,System.IniFiles,System.Threading,VCL.Styles,Vcl.ComCtrls,MainMenuFile,
  MovementSystem, settingsPas;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Timer1: TTimer;
    Panel5: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    Image2: TImage;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Button8: TButton;
    DP1: TPanel;
    Image4: TImage;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Panel18: TPanel;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Panel19: TPanel;
    Panel20: TPanel;
    ColorInv: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Image17: TImage;
    Timer2: TTimer;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel37: TPanel;
    Panel40: TPanel;
    ScrollBox1: TScrollBox;
    Bkk: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel53: TPanel;
    scroller: TPanel;
    Panel41: TPanel;
    Button23: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Panel25Click(Sender: TObject);
    procedure Panel26Click(Sender: TObject);
    procedure Panel27Click(Sender: TObject);
    procedure Panel28Click(Sender: TObject);
    procedure Panel29Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Label10MouseEnter(Sender: TObject);
    procedure Label11MouseEnter(Sender: TObject);
    procedure Label12MouseEnter(Sender: TObject);
    procedure Label10MouseLeave(Sender: TObject);
    procedure Label11MouseLeave(Sender: TObject);
    procedure Label12MouseLeave(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    KeyWPressed: Boolean;
    KeySPressed: Boolean;
    KeyAPressed: Boolean;
    KeyDPressed: Boolean;
    KeyEPressed: Boolean;
    KeyShiftPressed: Boolean;
    KeySpacePressed: Boolean;
     KeyEscPressed: Boolean;

  public
    procedure UpdatePlayerImage;
    function CreateImageArray(const Images: array of TImage): TArray<TImage>;
    function CreatePanelArray(const Panels: array of TPanel): TArray<Tpanel>;
    { Public declarations }
  end;

var
  movepanelsCount: integer;

  NewTopCam: Integer;
  Form1: TForm1;
  NewCam: Boolean;
  PlayerPic: Timage;
  Speed: Integer;
  Movement: Boolean;
  Panels: Tarray<Tpanel>;
  MovePanels: Tarray<Tpanel>;
  MoveImages: TArray<TImage>;
  InventSelected: string;

  DiePanels: array of TPanel;
  CamPanels: array of Tpanel;
  UsePanels: array of TPanel;
  images: array of Timage;
  invCell: array of Tpanel;
  LastSpaceTime: TDateTime;
  Speeddef: integer;
  Speedmod: integer;
  Truecod, gavocod:string;
  Inventory: array[0..4] of string;  // Статический массив на 5 элементов
  ItemCount: Integer;                // Счетчик предметов в инвентаре

  backmessage: Tpanel = nil;
  doorDialogStatus: string = 'hello';
  DoorsDialogFirstUse: boolean = true;

  npcCount:integer = 0;

implementation
{$MINSTACKSIZE 4194304} // Минимальный размер стека 4 МБ
{$MAXSTACKSIZE 4194304} // Максимальный размер стека 4 МБ
{$R *.dfm}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Movement then
  begin
    if (Key = Ord('W')) or (Key = VK_UP) then KeyWPressed := True;
    if (Key = Ord('S')) or (Key = VK_DOWN) then KeySPressed := True;
    if (Key = Ord('A')) or (Key = VK_LEFT) then KeyAPressed := True;
    if (Key = Ord('D')) or (Key = VK_RIGHT) then KeyDPressed := True;
    if Key = VK_SHIFT then KeyShiftPressed := True;
  end;

   if Key = VK_ESCAPE then KeyEscPressed := True;
   if Key = Ord('E') then KeyEPressed := True;

  if Key = VK_ESCAPE then
  begin
    if Image2.Visible then
    begin
      Image2.Visible := False;
      GroupBox1.Visible := False;
      Movement := True;
      Panel19.Visible := True;
      Sleep(100);
    end
    else
    begin
      Movement := False;
      Image2.Visible := True;
      GroupBox1.Visible := True;
      Image2.BringToFront;
      GroupBox1.BringToFront;
      Panel19.Visible := False;
      Panel18.Visible := False;
      Sleep(100);
    end;
  end;

end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = Ord('W')) or (Key = VK_UP) then KeyWPressed := False;
  if (Key = Ord('S')) or (Key = VK_DOWN) then KeySPressed := False;
  if (Key = Ord('A')) or (Key = VK_LEFT) then KeyAPressed := False;
  if (Key = Ord('D')) or (Key = VK_RIGHT) then KeyDPressed := False;
  if Key = Ord('E') then KeyEPressed := False;
  if Key = VK_SHIFT then KeyShiftPressed := False;
  if Key = VK_ESCAPE then KeyEscPressed := False;
end;


procedure TForm1.FormResize(Sender: TObject);
begin
  Panel19.Top := ClientHeight - Panel19.Height + 10;
  panel19.Left := ClientWidth div 2 - panel19.Width div 2;

  Groupbox1.Top := ClientHeight div 2 - Groupbox1.Height div 2;
  Groupbox1.Left := ClientWidth div 2 - Groupbox1.Width div 2;


  Panel18.Top := ClientHeight div 2 - Panel18.Height div 2;
  Panel18.Left := ClientWidth div 2 - Panel18.Width div 2;


  Panel40.Top := ClientHeight div 2 - Panel40.Height div 2;
  Panel40.Left := ClientWidth div 2 - Panel40.Width div 2;
end;

procedure TForm1.Image11Click(Sender: TObject);
begin
SelectOutLine(image11 , panel25,panel26,panel27,panel28,panel29,colorinv);
inventselected := 'palacence'
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
  SelectOutLine(image12 , panel25,panel26,panel27,panel28,panel29,colorinv);
  inventselected:='empti'
end;

procedure TForm1.Image13Click(Sender: TObject);
begin
SelectOutLine(image13 , panel25,panel26,panel27,panel28,panel29,colorinv);
inventselected:='palka'
end;

procedure TForm1.Image14Click(Sender: TObject);
begin
  SelectOutLine(image14 , panel25,panel26,panel27,panel28,panel29,colorinv);
  inventselected:='iphone'
end;

procedure TForm1.Image15Click(Sender: TObject);
begin
  SelectOutLine(image15 , panel25,panel26,panel27,panel28,panel29,colorinv);
  inventselected:='kub'
end;

procedure TForm1.Image16Click(Sender: TObject);
begin
  SelectOutLine(image16 , panel25,panel26,panel27,panel28,panel29,colorinv);
  inventselected:='malware'
end;

procedure TForm1.Label10Click(Sender: TObject);
begin
  doorDialogStatus := label10.Caption;
  dialogDoors(doorDialogStatus,movement, scrollbox1, form1, label10, label11, label12,backmessage,DoorsDialogFirstUse,'tap');
end;

procedure TForm1.Label10MouseEnter(Sender: TObject);
begin
Label10.Font.Color := clYellow;
end;

procedure TForm1.Label10MouseLeave(Sender: TObject);
begin
Label10.Font.Color := clWhite;
end;

procedure TForm1.Label11Click(Sender: TObject);
begin
  doorDialogStatus := label11.Caption;
  dialogDoors(doorDialogStatus,movement, scrollbox1, form1, label10, label11, label12,backmessage,DoorsDialogFirstUse,'tap');
end;

procedure TForm1.Label11MouseEnter(Sender: TObject);
begin
Label11.Font.Color := clYellow;
end;

procedure TForm1.Label11MouseLeave(Sender: TObject);
begin
Label11.Font.Color := clWhite;
end;

procedure TForm1.Label12Click(Sender: TObject);
begin
  doorDialogStatus := label12.Caption;
  dialogDoors(doorDialogStatus,movement, scrollbox1, form1, label10, label11, label12,backmessage,DoorsDialogFirstUse,'tap');
end;

procedure TForm1.Label12MouseEnter(Sender: TObject);
begin
Label12.Font.Color := clYellow;
end;

procedure TForm1.Label12MouseLeave(Sender: TObject);
begin
Label12.Font.Color := clWhite;
end;



//==============================================================================
//==============================================================================
//==                                                                          ==
//==                 START START START START START START START                ==
//==                                                                          ==
//==============================================================================
//==============================================================================



procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
ExitingTheProgram(form2)
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  ScrollBox1.VertScrollBar.Position := 0;


  Panels := CreatePanelArray(
  [Panel6,Panel7,Panel8,Panel9,Panel10,Panel11,Panel12,Panel13,Panel14,Panel15,
  Panel16,Panel17,panel24]);

  CamPanels := [panel2,panel3,panel4,panel5];

  MovePanels := CreatePanelArray(
  [DP1,Panel20,panel23,panel31,panel32,panel33,panel34,panel35,panel37,panel53]);

  MoveImages := CreateImageArray(
  [image1, image11, image12, image13, image14, image15, image16,image17]);

  invCell :=
  [panel25,panel26,panel27,panel28,panel29];

  DiePanels :=
  [DP1];

  images :=
  [Image3,Image4,Image5,Image6,Image7,image8,image9,image10];


  Speeddef := 1;
  Speedmod := 2;
  truecod := '19840';
  Movement := True;
  Self.DoubleBuffered := True;
  Panel1.BringToFront;

  //INVENT START
  ItemCount := 0;
  panel18.BringToFront;
  colorinv.left := panel25.left - 3;
  colorinv.top := panel25.top - 3;
  //INVENT END

  GroupBox1.Visible := False;
  PlayerPic := Image4;
  PlayerPic.Visible := True;
  panel18.Visible := False;
  Form1.Constraints.MinWidth := 400;
  Form1.Constraints.MinHeight := 300;
  Form1.Constraints.MaxWidth := 800;
  Form1.Constraints.MaxHeight := 600;


  movepanelsCount := length(movepanels);


  //chat
  scroller.Top := scrollbox1.Height;
  scroller.Left := scrollbox1.Width;
  scroller.Height := 1;

  label10.Height:=25; label11.Height:=25; label12.Height:=25;
  label10.Width:=300; label11.Width:=300; label12.Width:=300;
  label10.Left:=10; label11.Left:=10; label12.Left:=10;
  label10.Top:=scrollbox1.Top+scrollbox1.Height+5;
  label11.Top:=Label10.Top+Label10.Height;
  label12.Top:=Label11.Top+Label11.Height;
  panel40.Height:=Label12.Top+label12.Height+5;



      for var ii in images do
      ii.BringToFront;

end;

function Tform1.CreatePanelArray(const Panels: array of TPanel): TArray<Tpanel>;
var
  i: Integer;
begin
  SetLength(Result, Length(Panels));
  for i := 0 to High(Panels) do
    Result[i] := Panels[i];
end;


function Tform1.CreateImageArray(const Images: array of TImage): TArray<TImage>;
var
  i: Integer;
begin
  SetLength(Result, Length(Images));
  for i := 0 to High(Images) do
    Result[i] := Images[i];
end;

procedure TForm1.Timer1Timer(Sender: TObject);
  var
    CanMove: Boolean;
    NewLeft, NewTop: Integer;
  begin

    UpdatePlayerImage();


    if Movement = False then
    begin
      KeyWPressed := False;
      KeySPressed := False;
      KeyAPressed := False;
      KeyDPressed := False;
      KeySpacePressed := False;
      KeyShiftPressed := False;
    end;

    if KeyShiftPressed then
      Speed := Speedmod else Speed := Speeddef;



    PlayerPic.Left := Panel1.Left - 35;
    PlayerPic.Top := Panel1.Top - 35;

    if KeyEPressed then                          //------E---PRESS
    begin
      NewTop := Panel1.Top - Speed;
      NewLeft := Panel1.Left - Speed;
       addToInventoryGUI(panel32,image15,'kub' ,panel1,invcell,moveimages,inventory,itemcount,movement,self);
       addToInventoryGUI(panel31,image14,'iphon12' ,panel1,invcell,moveimages,inventory,itemcount,movement,self);
       addToInventoryGUI(panel33,image16,'malwer' ,panel1,invcell,moveimages,inventory,itemcount,movement,self);
       addToInventoryGUI(panel34,image13,'palka' ,panel1,invcell,moveimages,inventory,itemcount,movement,self);
       addToInventoryGUI(panel35,image12,'epomti' ,panel1,invcell,moveimages,inventory,itemcount,movement,self);
       addToInventoryGUI(panel37,image11,'polotence' ,panel1,invcell,moveimages,inventory,itemcount,movement,self);

      if Peresek([Panel20],panel18,panel1,movement,200) then //cod door
      atifka(form1,'Дверь','первый раз встретиться с дверью',$0062B0FF,'?');

      if Peresek([panel53],panel40,panel1,movement,200) then //door dialog
      dialogDoors(doorDialogStatus,movement, scrollbox1, form1, label10, label11, label12,backmessage,DoorsDialogFirstUse,'PressE');
       // if trigger(panel53,newleft,newtop,panel1) then
    end;


    MegaUltimateProcedureForMove(
    form1,//форма
    panel1,//main панель
    speed, //скорость
    panels, DiePanels, CamPanels, movePanels,moveImages,//[стены][смерть стены][для камеры][для движения][для img]
    KeyAPressed,KeyWPressed,KeySPressed,KeyDPressed); // AWSD

  end;


//----------------------------------------------------------CODE
procedure TForm1.Button10Click(Sender: TObject);
begin
  ActiveControl:=nil;
  if length(panel22.Caption) < 5 then
  panel22.Caption := PAnel22.Caption + '1';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
ActiveControl:=nil;
 if length(panel22.Caption) < 5 then
 panel22.Caption := PAnel22.Caption + '2';
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
ActiveControl:=nil;
  if length(panel22.Caption) < 5 then
 panel22.Caption := PAnel22.Caption + '3';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
ActiveControl:=nil;
if length(panel22.Caption) < 5 then
 panel22.Caption := PAnel22.Caption + '4';
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
ActiveControl:=nil;
if length(panel22.Caption) < 5 then
 panel22.Caption := PAnel22.Caption + '5';
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
ActiveControl:=nil;
if length(panel22.Caption) < 5 then
 panel22.Caption := PAnel22.Caption + '6';
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
ActiveControl:=nil;
if length(panel22.Caption) < 5 then
 panel22.Caption := PAnel22.Caption + '7';
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
ActiveControl:=nil;
if length(panel22.Caption) < 5 then
 panel22.Caption := PAnel22.Caption + '8';
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
ActiveControl:=nil;
if length(panel22.Caption) < 5 then
 panel22.Caption := PAnel22.Caption + '9';
end;

procedure TForm1.Button19Click(Sender: TObject);
var i : Tbutton;
begin
ActiveControl:=nil;
panel22.Caption := '';
panel22.Color := clGray;
for i in [button10,button11,button12,button13,button14,button15,button16,button17,button18,button20,button21] do
i.Enabled := true;
end;

procedure TForm1.Button1Click(Sender: TObject);//--------------ENTER
  begin
    ActiveControl:=nil;
    Image2.Visible := False;
    GroupBox1.Visible := False;
    Movement := True;
  end;


procedure TForm1.Button20Click(Sender: TObject);
begin
ActiveControl:=nil;
if length(panel22.Caption) < 5 then
panel22.Caption := PAnel22.Caption + '0';
end;

procedure TForm1.Button21Click(Sender: TObject);//------------    (->)
  var
  i : Tbutton;
begin
ActiveControl:=nil;
if panel22.Caption = Truecod then
  begin
    panel22.Color := $0080FF80;
    gavocod := truecod;
    for i in [button10,button11,button12,button13,button14,button15,button16,button17,button18,button19,button20,button21] do
    i.Enabled := FAlse;
    panel23.Color := cllime;
    panel24.Top := -2000;

  end
else
  begin
    panel22.Color := clRed;
    for i in [button10,button11,button12,button13,button14,button15,button16,button17,button18,button20,button21] do
    i.Enabled := FAlse;
  end;
end;



procedure TForm1.Button22Click(Sender: TObject);
begin
  swichWindow(form2);
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
swichWindow(form2);
ActiveControl:=nil;
end;

procedure TForm1.Button2Click(Sender: TObject);//---------------exit
begin
  Form2.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);   // settings button
begin
  TakeMeBackForSettings := form1;
  swichWindow(form6);
  ActiveControl:=nil;
end;


//-----------------------------------------------PLAYER IMAGES
procedure TForm1.UpdatePlayerImage;
var
  i: TImage;
  AnyKeyPressed: Boolean;
begin
  // Проверяем, нажата ли хотя бы одна кнопка
  AnyKeyPressed := KeyDPressed or KeyWPressed or KeyAPressed or KeySPressed;

  // Если ни одна кнопка не нажата, ничего не меняем
  if not AnyKeyPressed then
    Exit;

  // Скрыть все изображения
  for i in Images do
    i.Visible := False;

  // Проверяем каждое сочетание клавиш
  if (KeyDPressed = False) and (KeyWPressed = True) and (KeyAPressed = False) and (KeySPressed = False) then
  begin
    Image4.Visible := True;
    PlayerPic := Image4;  // W
  end
  else if (KeyDPressed = True) and (KeyWPressed = False) and (KeyAPressed = False) and (KeySPressed = False) then
  begin
    Image5.Visible := True;
    PlayerPic := Image5;  // D
  end
  else if (KeyDPressed = False) and (KeyWPressed = False) and (KeyAPressed = False) and (KeySPressed = True) then
  begin
    Image3.Visible := True;
    PlayerPic := Image3;  // S
  end
  else if (KeyDPressed = False) and (KeyWPressed = False) and (KeyAPressed = True) and (KeySPressed = False) then
  begin
    Image6.Visible := True;
    PlayerPic := Image6;  // A
  end


  else if (KeyDPressed = False) and (KeyWPressed = True) and (KeyAPressed = True) and (KeySPressed = False) then
  begin
    Image9.Visible := True;
    PlayerPic := Image9; // AW
  end
  else if (KeyDPressed = True) and (KeyWPressed = True) and (KeyAPressed = False) and (KeySPressed = False) then
  begin
    Image8.Visible := True;
    PlayerPic := Image8; // DW
  end
  else if (KeyDPressed = False) and (KeyWPressed = False) and (KeyAPressed = True) and (KeySPressed = True) then
  begin
    Image7.Visible := True;
    PlayerPic := Image7; //SA
  end
  else if (KeyDPressed = True) and (KeyWPressed = False) and (KeyAPressed = False) and (KeySPressed = True) then
  begin
    Image10.Visible := True;
    PlayerPic := Image10; //SD
  end

  else if (KeyDPressed = False) and (KeyWPressed = True) and (KeyAPressed = False) and (KeySPressed = True) then
  begin
    Image3.Visible := True;
    PlayerPic := Image3; //WS
  end
  else if (KeyDPressed = True) and (KeyWPressed = False) and (KeyAPressed = True) and (KeySPressed = False) then
  begin
    Image3.Visible := True;
    PlayerPic := Image3; //AD
  end

  // wow
  else if (KeyDPressed = True) and (KeyWPressed = False) and (KeyAPressed = True) and (KeySPressed = True) then
  begin
    Image3.Visible := True;
    PlayerPic := Image3; // ASD
  end
  else if (KeyDPressed = False) and (KeyWPressed = True) and (KeyAPressed = True) and (KeySPressed = True) then
  begin
    Image9.Visible := True;
    PlayerPic := Image9; // ASW
  end
  else if (KeyDPressed = True) and (KeyWPressed = True) and (KeyAPressed = False) and (KeySPressed = True) then
  begin
    Image8.Visible := True;
    PlayerPic := Image8; //WSD
  end
  else if (KeyDPressed = True) and (KeyWPressed = True) and (KeyAPressed = True) and (KeySPressed = False) then
  begin
    Image4.Visible := True;
    PlayerPic := Image4; //WDA
  end;
end;


procedure TForm1.Button8Click(Sender: TObject);//--------mini reset button
begin
ResetGame;
end;


procedure TForm1.Panel25Click(Sender: TObject);
begin
  colorinv.left := panel25.left - 3;
  inventselected := '';
end;

procedure TForm1.Panel26Click(Sender: TObject);
begin
  colorinv.left := panel26.left - 3;
  inventselected := '';
end;

procedure TForm1.Panel27Click(Sender: TObject);
begin
  colorinv.left := panel27.left - 3;
  inventselected := '';
end;

procedure TForm1.Panel28Click(Sender: TObject);
begin
  colorinv.left := panel28.left - 3;
  inventselected := '';
end;

procedure TForm1.Panel29Click(Sender: TObject);
begin
  colorinv.left := panel29.left - 3;
  inventselected := '';
end;



//createNPC(panel41,form1,npcCount,panels,movepanelsCount);

end.


