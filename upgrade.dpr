program upgrade;

uses
  Forms,
  upgrede in 'upgrede.pas' {upgradefm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÖÇÄÜÉý¼¶';
  Application.CreateForm(Tupgradefm, upgradefm);
  Application.Run;
end.
