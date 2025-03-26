unit Config;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Imaging.GIFImg, Winapi.ShellAPI,Vcl.Imaging.jpeg;

procedure StartConfig;

type
TForm1 = class(TForm);

implementation
  Procedure Startconfig;
  begin

  end;

//
//procedure newMassage(
//   MassageArray: array of Tpanel;
//   TextInMassageArray: array of Tlabel;
//   TextInMassageVarirtiArray: array of String;
//   leftOrRightArray: array of string;
//   AnswerLabelArray: array of TLabel;
//   answersArray: array of String;
//   var answercount: integer;
//   var dialogCount: integer;
//   //f
//   ScrolBox:Tscrollbox);
//  begin
//    var Panel_or_Nil:Tpanel;
//
//    if dialogcount < length(massageArray) then
//    begin
//      MassageArray[dialogcount].Visible := True;
//      if TextInMassageVarirtiArray[dialogcount] <> '' then
//      TextInMassageArray[dialogcount].Caption := TextInMassageVarirtiArray[dialogcount];
//
//      if (answersArray[answercount] <> '') and (answersArray[answercount + 1] <> '') and (answersArray[answercount + 2] <> '') then
//      for var i :=  1 to 3 do
//      begin
//        AnswerLabelArray[i].Caption := answersArray[answercount];
//        inc(answercount);
//      end;
//
//      if dialogCount >= 1 then
//      Panel_or_Nil := MassageArray[dialogCount - 1]
//      else
//      Panel_or_Nil := nil;
//
//      AdjustPanelToLabel(
//      MassageArray[dialogCount],
//      TextInMassageArray[dialogCount],
//      Panel_or_Nil,
//      leftOrRightArray[dialogCount],
//      ScrolBox);
//
//      inc(dialogcount);
//    end;
//  end;

end.
