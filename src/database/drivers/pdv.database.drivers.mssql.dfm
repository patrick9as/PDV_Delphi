object MSSQLProvider: TMSSQLProvider
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 56
    Top = 16
  end
  object FDConnection: TFDConnection
    Left = 88
    Top = 56
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 144
    Top = 88
  end
end
