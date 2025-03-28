program Project1;



{$R *.dres}

uses
  Vcl.Forms,
  Level1 in 'Level1.pas' {Form1},
  proced in 'proced.pas',
  NPC in 'NPC.pas',
  MainMenuFile in 'MainMenuFile.pas' {Form2},
  titriEND in 'titriEND.pas' {Form3},
  MovementSystem in 'MovementSystem.pas',
  Level2 in 'Level2.pas' {Form4},
  AtifkaLab in 'AtifkaLab.pas' {Form5},
  settingsPas in 'settingsPas.pas' {Form6},
  SwichLevels in 'SwichLevels.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
