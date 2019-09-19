program NBex;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Parser in 'Parser.pas',
  Debug in 'Debug.pas',
  Compiler in 'Compiler.pas';

var
  cFile: string;

begin
  try
    InitDebug;
    InitParser;
    cFile := 'TestFileParsing.nbex';
    if (ParamCount > 0) then
      cFile := ParamStr(1);
    AddFileToParsing(cFile, ltMain);
    DoParse;
    DoCompile;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
