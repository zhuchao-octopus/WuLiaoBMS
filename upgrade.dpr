program upgrade;

uses
  Forms,
  upgrede in 'upgrede.pas' {upgradefm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '��������';
  Application.CreateForm(Tupgradefm, upgradefm);
  Application.Run;
end.
