unit fixitemwidththre;

interface

uses
  Classes;

type
  TFixitemwidth = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation
 uses glbut;
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TFixitemwidth.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TFixitemwidth }

procedure TFixitemwidth.Execute;
begin
  { Place thread code here }
  if breaked=true then
     self.Terminate;
    MakeDBGridColumnsAutoFixItsWidth_thre(_dbgrid);
end;

end.
