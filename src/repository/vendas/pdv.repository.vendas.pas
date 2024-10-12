unit pdv.repository.vendas;

interface

uses
  DB,
  System.Generics.Collections,
  Classes,
  SysUtils,
  pdv.database.contract,
  pdv.database.factory;

type
  TVenda = class
  private
    FID: Integer;
  public
    property ID: Integer read FID write FID;
  end;

  TQuery = class(TInterfacedObject, IQuery)
  private
    FSchemaName: String;
    FSelectedFields: TStringList;
    FTableName: String;
    FWhereSession: TStringList;
    FRawSQL: TStringList;
  public
    constructor Create;
    destructor Destroy;
    function New: IQuery;
    function WithSchema(const ASchemaName: String): IQuery;
    function Select(AField: String): IQuery; overload;
    function Select(AFields: TList<String>): IQuery; overload;
    function From(const ATableName: String): IQuery;
    function Where(const AFieldName: String; const AValue: Variant): IQuery; overload;
    function Where(AFunc: TWhereParams): IQuery; overload;
    function AndWhere(const AFieldName: String; const AValue: Variant): IQuery;
    function OrWhere(const AFieldName: String; const AValue: Variant): IQuery;
    function WhereIn(const AFieldName: String; const AValues: TList<Variant>): IQuery;
    function Execute: IQuery;
    function RawSQL: String;
  end;

  TRepositoryVendas = class
  private
    FProvider: IProvider;
    procedure DataToVenda(const ADataSet: TDataSet; var AVenda: TVenda);
  public
    constructor Create(AProvider: IProvider);
    function GetVendaByID(AID: Integer): TVenda;
  end;

implementation

{ TRepositoryVendas }

constructor TRepositoryVendas.Create(AProvider: IProvider);
begin
  FProvider := AProvider;
end;

function TRepositoryVendas.GetVendaByID(AID: Integer): TVenda;
var
  dataset: TDataSet;
  venda: TVenda;
  query: TQuery;
  fields: TList<String>;
begin
  fields := TList<String>.Create();
  fields.Add('ID');
  fields.Add('Valor');
  
  query
    .New
    .WithSchema('dbo')
    .Select(fields)
    .From('Vendas')
    .Where(
      function (Q: IQuery): IQuery
      begin
        Result := Q.Where('Valor', 1).AndWhere('ID', 1);
      end
    );
  dataset :=
    FProvider
      .ExecSQL(query)
      .DataSet;

  venda := TVenda.Create();
  DataToVenda(dataset, venda);
  Result := venda;
end;

procedure TRepositoryVendas.DataToVenda(const ADataSet: TDataSet; var AVenda: TVenda);
begin
  AVenda.ID := ADataSet.FieldByName('ID').AsInteger
end;

{ TQuery }

function TQuery.AndWhere(const AFieldName: String;
  const AValue: Variant): IQuery;
begin
  Result := Self;
end;

constructor TQuery.Create;
begin
  FSelectedFields := TStringList.Create();
  FWhereSession := TStringList.Create();
  FRawSQL := TStringList.Create();
end;

destructor TQuery.Destroy;
begin
  FSelectedFields.Free();
  FWhereSession.Free();
  FRawSQL.Free();
end;

function TQuery.Execute: IQuery;
begin
  FRawSQL.Clear();
  FRawSQL.Add('SELECT ');
  FRawSQL.Add(FSelectedFields.Text);
end;

function TQuery.From(const ATableName: String): IQuery;
begin
  Result := Self;
end;

function TQuery.New: IQuery;
begin
  Result := TQuery.Create();
end;

function TQuery.OrWhere(const AFieldName: String;
  const AValue: Variant): IQuery;
begin
  Result := Self;
end;

function TQuery.RawSQL: String;
begin
  Result := FRawSQL.Text;
end;

function TQuery.Select(AFields: TList<String>): IQuery;
var
  field: string;
  I: Integer;
begin
  Result := Self;
  FSelectedFields.Clear();

  for I := 0 to AFields.Count -1 do
  begin
    field := AFields[I];
    if I > 0 then
      field := ', ' + field;
    FSelectedFields.Add(field);
  end;
end;

function TQuery.Select(AField: String): IQuery;
begin
  Result := Self;
end;

function TQuery.Where(const AFieldName: String; const AValue: Variant): IQuery;
begin
  Result := Self;
  if FWhereSession.Count > 0 then
    raise Exception.Create('Use another Where statement');
  FWhereSession.Add('WHERE ' + Trim(AFieldName) + ' ' + String(AValue));
end;

function TQuery.Where(AFunc: TWhereParams): IQuery;
begin
  Result := Self;
end;

function TQuery.WhereIn(const AFieldName: String; const AValues: TList<Variant>): IQuery;
begin
  Result := Self;
end;

function TQuery.WithSchema(const ASchemaName: String): IQuery;
begin
  Result := Self;
  FSchemaName := ASchemaName;
end;

end.
