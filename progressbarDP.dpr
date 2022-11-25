program progressbarDP;

uses
  Forms,
  progressbarU in 'progressbarU.pas' {ProgressBarFm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÕýÔÚµÇÂ½...';
  Application.CreateForm(TProgressBarFm, ProgressBarFm);
  Application.Run;
end.
