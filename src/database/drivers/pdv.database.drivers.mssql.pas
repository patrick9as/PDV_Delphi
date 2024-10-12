unit pdv.database.drivers.mssql;

interface

uses
  pdv.database.config,
  System.SysUtils, System.Classes,
  pdv.database.contract, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL;

type
  TMSSQLProvider = class(TDataModule, IProvider)
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
  private
    { Private declarations }
    FConnection: TCustomConnection;
    FDataSet: TDataSet;
    FRowsAffected: Integer;
  public
    { Public declarations }
    constructor Create(AConfig: TConfig);
    function Connection: TCustomConnection;
    function DataSet: TDataSet;
    function RowsAffected: Integer;
    function ExecSQL(AQuery: IQuery): IProvider;
  end;

var
  MSSQLProvider: TMSSQLProvider;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TMSSQLProvider }

function TMSSQLProvider.Connection: TCustomConnection;
begin
  Result := FConnection;
end;

function TMSSQLProvider.ExecSQL(AQuery: IQuery): IProvider;
begin
  Result := Self;

  TFDQuery(FDataSet).Close();
  TFDQuery(FDataSet).SQL.Text := AQuery.RawSQL;
  TFDQuery(FDataSet).Open();
end;

function TMSSQLProvider.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

function TMSSQLProvider.RowsAffected: Integer;
begin
  Result := FRowsAffected;
end;

constructor TMSSQLProvider.Create(AConfig: TConfig);
begin
  inherited Create(nil);

  FDConnection.DriverName := 'mssql';
  FDConnection.ConnectionName := AConfig.HostName;
  FDConnection.Params.UserName := AConfig.Username;
  FDConnection.Params.Password := AConfig.Password;
  FDConnection.Params.Database := AConfig.Database;
//  FDConnection(FCustomConnection).Connected := True;
  FConnection := FDConnection;

  FDQuery.Connection := FDConnection;
  FDataSet := FDQuery;
end;

end.
