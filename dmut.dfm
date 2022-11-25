object DM: TDM
  OldCreateOrder = False
  Left = 424
  Top = 329
  Height = 221
  Width = 215
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 80
    Top = 88
  end
end
