Program Mloc;

{$mode objfpc}{$H+}

Uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainForm, shortcutHelpForm, uSettingsForm;

{$R *.res}

Begin
  if Application.HasOption('h', 'help') then begin
    // TODO - vypsání helpu
    Halt;
  end;

  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainSearchForm, MainSearchForm);

  if Application.HasOption('p', 'path') then begin
    MainSearchForm.Path := Application.GetOptionValue('p', 'path');
  End;

  if Application.HasOption('t', 'tag') then begin
    MainSearchForm.Tag := Application.GetOptionValue('t', 'tag');
    MainSearchForm.SearchEditChange(MainSearchForm.SearchEdit);
  End;

  if Application.HasOption('s', 'search') then begin
    MainSearchForm.SearchEdit.Text := Application.GetOptionValue('s', 'search');
  End;
  Application.CreateForm(TsettingsForm, settingsForm);
  Application.Run;
End.

