program progressbarDP;

uses
  Forms,
  progressbarU in 'progressbarU.pas' {ProgressBarFm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '���ڵ�½...';
  Application.CreateForm(TProgressBarFm, ProgressBarFm);
  Application.Run;
end.
