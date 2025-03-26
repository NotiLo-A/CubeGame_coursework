unit settingsPas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure swapSettingPanel(obj: Tpanel);
  end;

var
  Form6: TForm6;
  AllMenuButtonPanels: array of Tpanel;

implementation

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
begin
  AllMenuButtonPanels := [];
end;

procedure Tform6.swapSettingPanel(obj: Tpanel);
begin
  for var mkoop in AllMenuButtonPanels do mkoop.Left := -10;
  obj.Left := 3;

end;

end.
