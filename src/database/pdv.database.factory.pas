unit pdv.database.factory;

interface

uses
  pdv.database.config,
  pdv.database.drivers.mssql,
  pdv.database.contract;

type
  TFactory = class
  private
    FProvider: IProvider;
  public
    constructor Create(AConfig: TConfig);
    property Provider: IProvider read FProvider write FProvider;
  end;

implementation

{ TDriver }

constructor TFactory.Create(AConfig: TConfig);
begin
  case AConfig.Provider of
    prMSSQL: FProvider := TMSSQLProvider.Create(AConfig);
    prFirebird: ;
    prPostgreSQL: ;
    prSQLite: ;
  end;
end;
end.
