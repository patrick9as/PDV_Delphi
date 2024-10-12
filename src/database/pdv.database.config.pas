unit pdv.database.config;

interface

type
  TProviderKind = (prMSSQL, prFirebird, prPostgreSQL, prSQLite);

  TConfig = record
    HostName: String;
    Port: Integer;
    Username: String;
    Password: String;
    Provider: TProviderKind;
    Database: String;
  end;

implementation

end.
