unit pdv.view.main;

interface

uses
  pdv.database.config,
  pdv.database.factory,
  pdv.repository.vendas,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    FlowPanel1: TFlowPanel;
    Panel2: TPanel;
    edtCodBarras: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  factory: TFactory;
  config: TConfig;
  repository: TRepositoryVendas;
begin
  config.HostName := 'localhost';
  config.Port := 1433;
  config.Username := 'sa';
  config.Password := '1234';
  config.Database := 'DB';
  config.Provider := prMSSQL;

  factory := TFactory.Create(config);
  repository := TRepositoryVendas.Create(factory.Provider);
  repository
    .GetVendaByID(1);
end;

end.
