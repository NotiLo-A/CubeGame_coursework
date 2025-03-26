unit titriEND;

interface

uses
  Winapi.Windows,Winapi.Messages,System.SysUtils,System.Variants,System.Classes,
  Vcl.Graphics,Vcl.Controls,Vcl.Forms,Vcl.Dialogs,Vcl.StdCtrls,Vcl.ExtCtrls,NPC,
  Vcl.Imaging.pngimage,Vcl.Imaging.GIFImg,Winapi.ShellAPI,System.SyncObjs,
  Vcl.Imaging.jpeg,System.IniFiles,System.Threading,VCL.Styles,Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  rab: array of string;
  cc: integer;

implementation
uses
{$MINSTACKSIZE 4194304} // Минимальный размер стека 4 МБ
{$MAXSTACKSIZE 4194304} // Максимальный размер стека 4 МБ
Level1,proced,mainMenufile;
{$R *.dfm}



procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin


image1.left := 0;
image2.left := 0;
image1.top := 0;

  label1.Top := (ClientHeight div 2) - (label1.Height div 2);
  label1.Left := ClientWidth div 2 - label1.Width div 2;

 rab := ['Продюсер','Дизайнер','Художник','Аниматор','Тестировщик','Сценарист',
 'Композитор','Звукорежиссер','Переводчик','Менеджер','Издатель','Директор'];

 cc:= 0;


Form3.Constraints.MaxWidth := 640;
  Form3.Constraints.MaxHeight := 480;
  Form3.Constraints.MinWidth := 640;
  Form3.Constraints.MinHeight := 480;
end;




procedure TForm3.Image1Click(Sender: TObject);
begin
cc:= 0;
swichWindow(form2)
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
image1.Top := image1.Top - 1;

image2.top := image1.Top + image1.Height;
if image1.top = -image2.Height then
image1.Top := 0;

end;

procedure TForm3.Timer2Timer(Sender: TObject);
begin
  Label1.Caption := rab[cc]+':'+#13#10+'Радзевич Д.В.';
  if cc < (length(rab) - 1) then
  begin
  cc := cc + 1;
  // exit
  end;

  if cc = (length(rab) - 1) then
  label1.Caption := 'Спасибо'+#13#10+'за игру :3';


end;



end.
