program PDV;

uses
  Vcl.Forms,
  pdv.view.main in 'src\view\pdv.view.main.pas' {Form1},
  pdv.database.factory in 'src\database\pdv.database.factory.pas',
  pdv.database.contract in 'src\database\pdv.database.contract.pas',
  pdv.database.drivers.mssql in 'src\database\drivers\pdv.database.drivers.mssql.pas' {MSSQLProvider: TDataModule},
  pdv.database.config in 'src\database\pdv.database.config.pas',
  pdv.repository.vendas in 'src\repository\vendas\pdv.repository.vendas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TMSSQLProvider, MSSQLProvider);
  Application.Run;
end.
