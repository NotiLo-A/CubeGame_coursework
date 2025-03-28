unit proced;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Imaging.GIFImg, Winapi.ShellAPI,Vcl.Imaging.jpeg,System.Threading;

  type
  TImageArray = TArray<TImage>;


  procedure AdjustPanelToLabel(
//   APanel: TPanel;
//   ALabel: TLabel;
   pAndL: array of TControl;
   var backMessage: Tpanel;
   ScrolBox:Tscrollbox;
   text: string);

  procedure swichWindow(secnd:Tform);

  function Peresek(useoblObj: array of TPanel;
    openobj : Tpanel;
    mainguy: Tpanel;
    var movement : boolean;
    sleeptime : integer): boolean;


  procedure SelectOutLine(image :Timage;
   inv1,inv2,inv3,inv4,inv5 , outline: Tpanel);


  function trigger(EpressObj: array of TPanel;
    NewLeft1, NewTop1: Integer;
    mainguy1: Tpanel): boolean;

    procedure RemoveImageFromArray(var Images: TImageArray;
     ImageToRemove: TImage);

  function addToInventory(
   nameInArray: string;
   upObject: Timage;
   invcell:array of Tpanel;
   MoveImages: TImageArray): boolean;

   procedure AddItemToInventory(ItemName: string;
  var itemCount: integer;
  var Inventory: array of string);

  procedure addToInventoryGUI(useoblObj: array of TPanel;
  upObject: Timage;
  nameInArray: string;
   NewLeft, NewTop: Integer;
   mainguy: Tpanel;

   invcell:array of Tpanel;
   MoveImages: TImageArray;
   var Inventory: array of string;  // Статический массив на 5 элементов
   var ItemCount: Integer;

   var nah1:Tpanel;
   var nah2:boolean;
   var nah3:Tlabel);


function IsItemInInventory(
    ItemName: string;
    itemcount:integer;
    inventory:array of string): Boolean;

procedure DialogDoors(
    var status: string;
    var movement: boolean;
    mainTab: Tscrollbox;
    form: Tform;
    answerLabel1, answerLabel2, answerLabel3: Tlabel;
    var backmessage: Tpanel;
    var FirstUse: boolean;
    HowToactivated: string);


//    procedure createObjs(var Obj:  Tpanel;var objlabel: Tlabel; form: Tform; par: Tscrollbox);

   function CreateRandomComponents(form:Tform; par: Tscrollbox): TArray<TControl>;

   procedure ResetGame;

   procedure atifka(form: Tform; mainText: string; postText:string; colorTab: Tcolor; Znak: string);

   procedure ExitingTheProgram(form2: Tform);

   procedure NewGameButtonMenu(prodoButton: Tlabel; form1: Tform);

 var DynamicArrayS: TArray<string>;
 var DynamicArraySs: TArray<string>;
 var DunamicArrayColorTab: TArray<Tcolor>;
 var DunamicArrayZnak: TArray<string>;
 var TakeMeBackForSettings: Tform;
 var TakeMeBackForAtifka: Tform;

// var DynamicArraySCount: integer = 0;
 var canAtifka: boolean = true;
implementation

function Peresek(useoblObj: array of TPanel;
   openobj : Tpanel;
   mainguy: Tpanel;

   var movement : boolean;
   sleeptime : integer): boolean;

    var Panel: TPanel;
    begin
    Result := False;
        if trigger(useoblobj,mainguy.Left,mainguy.Top,mainguy) then
        begin
          Result := True;
          if openobj.Visible = False then
          begin
            openobj.Visible := True;
            movement := False;
            sleep(sleeptime);
          end
         else
          begin
            movement := True;
            openobj.Visible:=false;
            sleep(sleeptime);
          end;
        end
    end;


procedure addToInventoryGUI(useoblObj: array of TPanel;
   upObject: Timage;
   nameInArray: string;
   NewLeft, NewTop: Integer;
   mainguy: Tpanel;

   invcell:array of Tpanel;
   MoveImages: TImageArray;
   var Inventory: array of string;  // Статический массив на 5 элементов
   var ItemCount: Integer;
      var nah1:Tpanel;
      var nah2:boolean;
      var nah3:Tlabel);
  begin

  var j := 0;
    if trigger(useoblobj,newleft,newtop,mainguy) then
      if not IsItemInInventory(nameinarray,itemcount,inventory) then
        if addToInventory(nameInArray,upObject,invcell,MoveImages) then
      begin
        AddItemToInventory(nameInArray, itemcount, Inventory);
        nah1.Visible := True;
        nah2 := False;
        nah3.Caption := nameinarray;

      end;
  end;

function IsItemInInventory(ItemName: string; itemcount:integer;inventory:array of string): Boolean;
var
  I: Integer;
begin
  Result := False;  // По умолчанию предполагаем, что элемент не найден
  for I := 0 to ItemCount - 1 do
  begin
    if Inventory[I] = ItemName then  // Если элемент найден
    begin
      Result := True;  // Устанавливаем результат в True
      Break;           // Выходим из цикла
    end;
  end;
end;


procedure AddItemToInventory(ItemName: string;
  var itemCount: integer;
  var Inventory: array of string);
  begin
    if ItemCount < 5 then
    begin
      Inventory[ItemCount] := ItemName;  // Добавляем предмет в массив
      Inc(ItemCount);                    // Увеличиваем счетчик
    end;
  end;



procedure SelectOutLine(image :Timage;
   inv1,inv2,inv3,inv4,inv5 , outline: Tpanel);
    begin
      if image.Parent = inv1 then
        outline.Left := inv1.Left - 3
      else if image.Parent = inv2 then
        outline.Left := inv2.Left - 3
      else if image.Parent = inv3 then
        outline.Left := inv3.Left - 3
      else if image.Parent = inv4 then
        outline.Left := inv4.Left - 3
      else if image.Parent = inv5 then
        outline.Left := inv5.Left - 3;
    end;


function addToInventory(
   nameInArray: string;
   upObject: Timage;
   invcell:array of Tpanel;
   MoveImages: TImageArray): boolean;
    begin
    result := False;
       for var i in invcell do
          if i.ControlCount < 1 then
          begin
            RemoveImageFromArray(Moveimages, upobject);
            upobject.Parent := i;
            upobject.Width := 33; upobject.Height := 33;
            upobject.Top := 1; upobject.left := 1;
            result := True;
            exit;
          end;
    end;



procedure RemoveImageFromArray(var Images: TImageArray; ImageToRemove: TImage);
  var
    i, j: Integer;
  begin
    j := 0;
    for i := 0 to High(Images) do
    begin
      if Images[i] <> ImageToRemove then
      begin
        Images[j] := Images[i];
        Inc(j);
      end;
    end;
    SetLength(Images, j); // Теперь это работает, так как Images — динамический массив
  end;


function trigger(EpressObj: array of TPanel;
   NewLeft1, NewTop1: Integer;
   mainguy1: Tpanel): boolean;
    begin
    result := False;
      for var Panel in EpressObj do
        if (NewLeft1 + mainguy1.Width > Panel.Left) and (NewLeft1 < Panel.Left + Panel.Width) and
        (NewTop1 + mainguy1.Height > Panel.Top) and (NewTop1 < Panel.Top + Panel.Height) then
        begin
          result := True;
        exit;
        end;
    end;

procedure AdjustPanelToLabel(
//   APanel: TPanel;                         // рамка
//   ALabel: TLabel;                         // label текста в рамке
   pAndL: array of TControl;
   var backMessage: Tpanel;                // сообщение для наследования
   ScrolBox:Tscrollbox;                    // окружение
   text: string);                          // текст в label
   var
   Alabel: Tlabel;
   Apanel: Tpanel;
  begin
    Alabel := (pAndL[1] as TLabel);
    Apanel := (pAndL[0] as TPanel);


    Alabel.Caption := text;
    Alabel.AutoSize := True;
    alabel.Font.Color := clWhite;
    alabel.Font.Name := 'Fixedsys';
    Apanel.Left := Apanel.Left - 20;





    if Assigned(backMessage) then
      Apanel.Top := backMessage.Top + backMessage.Height + 15
      else
      begin
        Apanel.Top := 4;
        Apanel.Color := $00FF8080;
        Alabel.Top := 2; Alabel.Left := 10;
        Apanel.Height := Alabel.Height + 10;
        Apanel.Width := Alabel.Width + 20;
        Apanel.Left := -8;
        apanel.Height :=  apanel.Height - 3;
        Apanel.Caption := '';
        backmessage := apanel;
        exit;
      end;

    if (backmessage.left + backmessage.Width) < (scrolbox.Width - 20) then
    begin
      //right
      Apanel.Color := $002B70FF;
      Alabel.Top := 2; Alabel.Left := 5;
      Apanel.Height := Alabel.Height + 10;
      Apanel.Width := Alabel.Width + 40;
      Apanel.Left := ScrolBox.Width - Apanel.Width + 5;
    end
    else
    begin
      //left
      Apanel.Color := $00FF8080;
      Alabel.Top := 2; Alabel.Left := 10;
      Apanel.Height := Alabel.Height + 10;
      Apanel.Width := Alabel.Width + 20;
      Apanel.Left := -8;
    end;

    backmessage := apanel;
    apanel.Height :=  apanel.Height - 3;
    ScrolBox.VertScrollBar.Position := ScrolBox.VertScrollBar.Range;
    Apanel.Caption := '';
  end;





procedure DialogDoors(
    var status: string;
    var movement: boolean;
    mainTab: Tscrollbox;
    form: Tform;
    answerLabel1, answerLabel2, answerLabel3: Tlabel;
    var backmessage: Tpanel;
    var FirstUse: boolean;
    HowToactivated: string);


  begin
  if FirstUse <> True then
    begin
    if HowToactivated = 'tap' then
      begin
        if (status = 'HELLO') then
        begin
          AdjustPanelToLabel(CreateRandomComponents(form, mainTab), backmessage, maintab, status);
          AdjustPanelToLabel(CreateRandomComponents(form,mainTab),backmessage,maintab,'и че дальше?');
          answerlabel1.Caption := 'Что дальше?';
          answerlabel2.Caption := 'уйти искать камни';
          answerlabel3.Caption := '....';
        end;

        if (status = '....') then
         begin
          AdjustPanelToLabel(CreateRandomComponents(form,mainTab),backmessage,maintab,status);
          AdjustPanelToLabel(CreateRandomComponents(form,mainTab),backmessage,maintab,'наш план - оырипьивьп');
          answerlabel1.Caption := 'Промолчать';
          answerlabel2.Caption := 'не';
          answerlabel3.Caption := 'HELLO';
        end;

        if (status = 'уйти искать камни') then
        begin
          maintab.Parent.Visible := false;
          movement := True;
          status := 'ужевер';
        end;






      end
      else
      begin

       if (status = 'ужевер') then
        begin
          AdjustPanelToLabel(CreateRandomComponents(form,mainTab),backmessage,maintab,'<вы ушли искать камни>');
          AdjustPanelToLabel(CreateRandomComponents(form,mainTab),backmessage,maintab,'уже вернуля?' + #13#10 + 'принес?');
          answerlabel1.Caption := 'Промолчать';
          answerlabel2.Caption := 'не';
          answerlabel3.Caption := 'HELLO';
          status := 'tap';
        end;



      end;
    end
    else
    begin
      AdjustPanelToLabel(CreateRandomComponents(form,mainTab),backmessage,maintab,'hello?');
      answerlabel1.Caption := 'HELLO';
      answerlabel2.Caption := 'No';
      answerlabel3.Caption := '....';
      FirstUse := False;
    end;
  end;






function CreateRandomComponents(form:Tform; par: Tscrollbox): TArray<TControl>;
  var
    Panel: TPanel;
    LLabel: TLabel;
  begin
    // Создаем объект TPanel с случайным именем
    Panel := TPanel.Create(form);
    Panel.Name := 'Panel' + IntToStr(Random(9999)) + IntToStr(Random(9999)); // Генерация случайного имени
    Panel.Parent := par; // Указываем родительский контейнер (TScrollBox)
    Panel.ParentBackground := False;
    Panel.Left := 100; // Позиция по X
    Panel.Top := 50; // Позиция по Y
    Panel.Width := 150; // Ширина
    Panel.Height := 100; // Высота


    // Создаем объект TLabel с случайным именем
    LLabel := TLabel.Create(form);
    LLabel.Name := 'Label' + IntToStr(Random(9999)) + IntToStr(Random(9999)); // Генерация случайного имени
    LLabel.Parent := Panel;
    LLabel.Left := 100; // Позиция по X
    LLabel.Top := 50; // Позиция по Y
    LLabel.Width := 150; // Ширина
    LLabel.Height := 100; // Высота
    // Возвращаем массив с созданными объектами

    Result := TArray<TControl>.Create(Panel, LLabel);
  end;

procedure swichWindow(secnd:Tform);
  var first:Tform;
  begin
    first:=Screen.ActiveForm;
    secnd.Top := first.Top; secnd.Left := first.Left;
    secnd.Width := first.Width; secnd.Height := first.Height;
    //if kill then first.Close else first.Hide;
    first.Hide;
    secnd.Show;
  end;



procedure ResetGame; //---------------------- RESET
  var
    AppPath: string;
  begin
    AppPath := ParamStr(0); // Путь к текущему исполняемому файлу
    ShellExecute(0, 'open', PChar(AppPath), nil, nil, SW_SHOWNORMAL); // Перезапуск
    sleep(1000);
    Application.Terminate; // Завершение текущего экземпляра
  end;


procedure NewGameButtonMenu(prodoButton: Tlabel; form1: Tform);
begin
   ResetGame;
  prodoButton.Enabled:= true;
  swichWindow(form1);
end;

function Contains(const Arr: TArray<string>; const Value: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(Arr) do
  begin
    if Arr[i] = Value then
    begin
      Result := True;
      Exit;
    end;
  end;
end;


procedure atifka(form: TForm; mainText: string; postText: string; colorTab: Tcolor; Znak: string);
var
  mainPanel, ico: TPanel;
  text, miniText: TLabel;
  StartTime: Cardinal;

begin
if (canAtifka) and (Contains(DynamicArrayS, mainText) = false) then
begin
  canAtifka := false;
  SetLength(DynamicArrayS, Length(DynamicArrayS) + 1);
  DynamicArrayS[High(DynamicArrayS)] := Maintext;

  SetLength(DynamicArraySs, Length(DynamicArraySs) + 1);
  DynamicArraySs[High(DynamicArraySs)] := posttext;

  SetLength(DunamicArrayColorTab, Length(DunamicArrayColorTab) + 1);
  DunamicArrayColorTab[High(DunamicArrayColorTab)] := colorTab;

  SetLength(DunamicArrayZnak, Length(DunamicArrayZnak) + 1);
  DunamicArrayZnak[High(DunamicArrayZnak)] := Znak;



//  inc(DynamicArraySCount);

  // Создаем главную панель
  mainPanel := TPanel.Create(form);
  mainPanel.Name := 'panel' + IntToStr(Random(9999)) + IntToStr(Random(9999));
  mainPanel.Parent := form;
  mainPanel.ParentBackground := False;
  mainPanel.Color := clGray;
  mainPanel.Caption := '';
  mainPanel.Height := 60;          //++++     60
  mainPanel.Width := 190;
  mainPanel.Top := (form.Height - mainPanel.Height) - 45;
  mainPanel.Left := (form.Width - mainPanel.Width) - 20;

  // Создаем панель для иконки
  ico := TPanel.Create(form);
  ico.Name := 'panel' + IntToStr(Random(9999)) + IntToStr(Random(9999));
  ico.Parent := mainPanel;
  ico.ParentBackground := False;
  ico.ParentColor := False;
  ico.Color := colorTab;                //$00D1D1D1
  ico.Caption := Znak;
  ico.Font.Height := -30;
  ico.Height := 54;
  ico.Width := 54;
  ico.Top := 4;
  ico.Left := 4;

  // Создаем основной текст
  text := TLabel.Create(form);
  text.Name := 'label' + IntToStr(Random(9999)) + IntToStr(Random(9999));
  text.Parent := mainPanel;
  text.Caption := mainText;
  text.Font.Color := $009FCFFF;
  text.Font.Name := 'Fixedsys';
  text.Top := ico.Top;
  text.Left := ico.Left + ico.Width + 5;

  // Создаем дополнительный текст
  miniText := TLabel.Create(form);
  miniText.Name := 'label' + IntToStr(Random(9999)) + IntToStr(Random(9999));
  miniText.Parent := mainPanel;
  miniText.Caption := postText;
  miniText.AutoSize := False;
  miniText.WordWrap := True;
  miniText.Font.Color := clWhite;
  miniText.Font.Height := -17;
  miniText.Font.Size := 11;
  miniText.Font.Name := 'Colonna MT';
  miniText.Top := text.Top + text.Height + 2;
  miniText.Left := ico.Left + ico.Width + 5;
  miniText.Width := mainPanel.Width - miniText.Left;
  miniText.Height := mainPanel.Height - miniText.Top;

  // Проверка на слишком длинный текст
//  if miniText.Width > 40 then
//  begin
//    ShowMessage('Слишком длинный текст! Уменьшите длину текста.');
//  end;



  mainpanel.Left := form.Width;
//  StartTime := GetTickCount; // Запоминаем время начала
  while (mainpanel.Left <> ((form.Width - mainPanel.Width) - 18)) do
  begin
    mainpanel.Left := mainpanel.Left - 1;
    Application.ProcessMessages; // Обрабатываем сообщения Windows
    Sleep(10); // Небольшая задержка, чтобы не нагружать процессор
  end;


 StartTime := GetTickCount; // Запоминаем время начала
  while (GetTickCount - StartTime) < 5000 do
  begin
    Application.ProcessMessages; // Обрабатываем сообщения Windows
    Sleep(10); // Небольшая задержка, чтобы не нагружать процессор
  end;

//  StartTime := GetTickCount; // Запоминаем время начала
  while (mainpanel.top < (form.Height + mainpanel.Height))do
  begin
    Application.ProcessMessages; // Обрабатываем сообщения Windows
    mainpanel.Top := mainpanel.Top + 1;
    Sleep(10); // Небольшая задержка, чтобы не нагружать процессор
  end;
  //ShowMessage('Слишком длинный текст! Уменьшите длину текста.');
  // Уничтожаем панель

  ico.Free;
  text.Free;
  minitext.Free;
  mainPanel.Free;
  canAtifka := true;
end;
end;

procedure ExitingTheProgram(form2: Tform);
begin
{ The processes of saving progress should have been described here... but... I'm too lazy :3}
form2.Close;
end;

end.
