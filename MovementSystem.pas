unit MovementSystem;

interface
uses
  Winapi.Windows,Winapi.Messages,System.SysUtils,System.Variants,System.Classes,
  Vcl.Graphics,Vcl.Controls,Vcl.Forms,Vcl.Dialogs,Vcl.StdCtrls,Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,Vcl.Imaging.GIFImg,Winapi.ShellAPI,System.SyncObjs,
  Vcl.Imaging.jpeg,System.IniFiles,System.Threading,VCL.Styles,Vcl.ComCtrls,
  //mm proc
  NPC,proced;


//  procedure CheckCollisionsNew(
//  form: Tform;
//  NewLeft, NewTop: Integer;
//  panel1: Tpanel;
//  var CanMove: Boolean;
//  var NewCam: Boolean;
//  speed: integer;
//  BamPanels, DiePanels, CamPanels: array of Tpanel);

  procedure MegaUltimateProcedureForMove(
  form: Tform;
  var panel1: Tpanel;
  speed: integer;
  var BamPanels, DiePanels, CamPanels, movePanels: array of Tpanel;
  var moveImages: array of Timage;
  a,w,s,d: boolean);


implementation
procedure CheckCollisionsNew(
  form: Tform;
  NewLeft, NewTop: Integer;
  panel1: Tpanel;
  var CanMove: Boolean;
  var NewCam: Boolean;
  speed: integer;
  BamPanels, DiePanels, CamPanels: array of Tpanel);
var
  Panel: TPanel;
begin

    CanMove := True;
    NewCam := True;

    if NewTop < Speed then
      CanMove := False
    else if NewTop + Panel1.Height > form.ClientHeight - Speed then
      CanMove := False
    else if NewLeft < Speed then
      CanMove := False
    else if NewLeft + Panel1.Width > form.ClientWidth - Speed then
      CanMove := False;

    for Panel in BamPanels do
    begin
         if (NewLeft + Panel1.Width > Panel.Left) and (NewLeft < Panel.Left + Panel.Width) and
         (NewTop + Panel1.Height > Panel.Top) and (NewTop < Panel.Top + Panel.Height) then
      begin
        CanMove := False;
        Break;
      end;
    end;

    for Panel in DiePanels do
    begin
      if (NewLeft + Panel1.Width > Panel.Left) and (NewLeft < Panel.Left + Panel.Width) and
         (NewTop + Panel1.Height > Panel.Top) and (NewTop < Panel.Top + Panel.Height) then
      begin
          ResetGame();
      end;
    end;

  for Panel in CamPanels do
  begin
    if (NewLeft + Panel1.Width > Panel.Left) and (NewLeft < Panel.Left + Panel.Width) and
       (NewTop + Panel1.Height > Panel.Top) and (NewTop < Panel.Top + Panel.Height) then
    begin
      NewCam := False;
      Break;
    end;
  end;

end;



procedure MegaUltimateProcedureForMove(
  form: Tform;
  var panel1: Tpanel;
  speed: integer;
  var BamPanels, DiePanels, CamPanels, movePanels: array of Tpanel;
  var moveImages: array of Timage;
  a,w,s,d: boolean);
var
  NewTop, NewLeft: integer;
  canMove, newcam:boolean;
begin
  if w then
    begin
      NewTop := Panel1.Top - Speed;
      CheckCollisionsNew(form,panel1.Left,NewTop,panel1,canMove,newcam,speed,
      bampanels,diePanels,campanels);
      if CanMove and NewCam then
        Panel1.Top := NewTop;

      if (NewCam = false) and (canmove) then
        begin
          for var ppc in Moveimages do
          ppc.Top := ppc.Top + Speed;
          for var Panel in BamPanels do
          Panel.Top := Panel.Top + Speed;
          for var Panel in MovePanels do
          Panel.Top := Panel.Top + Speed;
        end;
    end;


    if s then
    begin
      NewTop := Panel1.Top + Speed;
      CheckCollisionsNew(Form,panel1.Left,NewTop,panel1,canMove,newcam,speed,
      bampanels,diePanels,campanels);
      if CanMove and NewCam then
        Panel1.Top := NewTop;

      if (NewCam = false) and (canmove) then
        begin
          for var ppc in Moveimages do
          ppc.Top := ppc.Top - Speed;
          for var Panel in bamPanels do
          Panel.Top := Panel.Top - Speed;
          for var Panel in MovePanels do
          Panel.Top := Panel.Top - Speed;
        end;
    end;


    if a then
    begin
      NewLeft := Panel1.Left - Speed;
      CheckCollisionsNew(Form,NewLeft,panel1.Top,panel1,canMove,newcam,speed,
      bampanels,diePanels,campanels);
      if CanMove and NewCam then
        Panel1.Left := NewLeft;

    if (NewCam = false) and (canmove) then
        begin
          for var ppc in Moveimages do
          ppc.left := ppc.left + Speed;
          for var Panel in bamPanels do
          Panel.Left := Panel.Left + Speed;
          for var Panel in MovePanels do
          Panel.Left := Panel.Left + Speed;
        end;
    end;


    if d then
    begin
      NewLeft := Panel1.Left + Speed;
      CheckCollisionsNew(Form,newleft,panel1.Top,panel1,canMove,newcam,speed,
      bampanels,diePanels,campanels);
      if CanMove and NewCam then
        Panel1.Left := NewLeft;

    if (NewCam = false) and (canmove) then
        begin
          for var ppc in Moveimages do
          ppc.left := ppc.left - Speed;
          for var Panel in bamPanels do
          Panel.Left := Panel.Left - Speed;
          for var Panel in MovePanels do
          Panel.Left := Panel.Left - Speed;
        end;
    end;
end;

end.
