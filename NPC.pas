unit NPC;

interface
uses
  Winapi.Windows,Winapi.Messages,System.SysUtils,System.Variants,System.Classes,
  Vcl.Graphics,Vcl.Controls,Vcl.Forms,Vcl.Dialogs,Vcl.StdCtrls,Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,Vcl.ComCtrls,Vcl.Imaging.GIFImg,Winapi.ShellAPI,
  Vcl.Imaging.jpeg,proced,System.IniFiles,VCL.Styles,System.Threading;

  type
  TPanelArray = TArray<TPanel>;

  procedure createNPC(
  spawnPanel: Tpanel;
  form: Tform;
  var npcCount: integer;
  var movepanels: TPanelArray;
  var count: integer);


implementation

  procedure createNPC(
  spawnPanel: Tpanel;
  form: Tform;
  var npcCount: integer;
  var movepanels: TPanelArray;
  var count: integer);

  var
  npc: Tpanel;
  NewLength: integer;

  begin
    npc := TPanel.Create(form);
    npc.Name := 'NPC' + inttostr(npcCount);
    npc.Parent := form; // Указываем родительский контейнер (TScrollBox)
    npc.ParentBackground := False;
    npc.Width := 25; // Ширина
    npc.Height := 25; // Высота
    npc.Left := spawnPanel.Left; // Позиция по X
    npc.Top := spawnPanel.Top; // Позиция по Y

    npc.Color := clred;
    npc.Caption := inttostr(npcCount);

    NewLength := Length(movepanels) + 1;
    SetLength(movepanels, NewLength);

    movepanels[NewLength - 1] := npc;   // Добавляем новую панель в массив

    inc(npccount);
    inc(count);

//    sleep(500);
  end;




//  procedure MoveOnPoint(
//  movePoint: Tpanel;
//  );
//  begin
//
//  end;



end.
