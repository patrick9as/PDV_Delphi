program PDV;

uses
  Vcl.Forms,
  pdv.view.main in 'src\view\pdv.view.main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
