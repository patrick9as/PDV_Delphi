unit pdv.database.contract;

interface

uses
  DB,
  System.Generics.Collections;

type
  IQuery = interface;

  TWhereParams = reference to function(AQuery: IQuery): IQuery;

  IQuery = interface
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
    function Execute(): IQuery;
    function RawSQL: String;
  end;

  IProvider = interface
    function Connection: TCustomConnection;
    function DataSet: TDataSet;
    function RowsAffected: Integer;
    function ExecSQL(AQuery: IQuery): IProvider;
  end;

implementation

end.
