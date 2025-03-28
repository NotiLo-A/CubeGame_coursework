unit SwichLevels;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm7 = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Panel6: TPanel;
    Panel2: TPanel;
    Panel7: TPanel;
    Image1: TImage;
    Image2: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Panel8: TPanel;
    Panel4: TPanel;
    Image4: TImage;
    Panel9: TPanel;
    Panel5: TPanel;
    Image5: TImage;
    Panel10: TPanel;
    Button1: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel6MouseLeave(Sender: TObject);
    procedure Panel6MouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
uses proced, MainMenuFile, Level1;
{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
begin
swichWindow(form2);
end;

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
ExitingTheProgram(form2)
end;



procedure TForm7.Panel6Click(Sender: TObject);
begin
  // Освобождаем память, если форма была создана
  FreeAndNil(Form1);

  // Создаем новую инстанцию Form2
  Application.CreateForm(TForm1, Form1);

  swichWindow(form1);
end;

procedure TForm7.Panel6MouseEnter(Sender: TObject);
begin
panel6.Color := clCream;
end;

procedure TForm7.Panel6MouseLeave(Sender: TObject);
begin
panel6.Color := $009EE494;
end;

end.
