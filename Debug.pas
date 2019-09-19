unit Debug;

interface
uses IniFiles, SysUtils, Parser;

var
  // 0 - выводить все сообщения
  // ...
  // 5 - не выводить ничего
  DebugLevel: integer;
  LangFile: TIniFile;

procedure InitDebug;
procedure DebugMessage(msg: integer; level: integer); overload;
procedure DebugMessage(msg: integer; level, dec: integer); overload;
procedure DebugMessageSystem(msg: string; level: integer);
function DebugGetOptionString(OptionName: string):string;
function DebugGetOptionBoolean(OptionName: string):boolean;
function ShowTime(t: TDateTime):string;

implementation

const
  TabLength = 8;

procedure InitDebug;
begin
  if LangFile = nil then
    LangFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\language.ini');
  DebugLevel := LangFile.ReadInteger('DebugOptions','DebugLevel',0);
end;

procedure DebugMessage(msg: integer; level: integer); overload;
var
  i: integer;
  s: string;
begin
  if level >= DebugLevel then begin
    s := '['+FileList[CurrentFile].FileName+']['+IntToStr(CurrentLine)+','+IntToStr(CurrentPosition-1)+'] ';
    for I := 0 to (length(s) div TabLength + 1) * TabLength - length(s) - 1 do
      s := s + ' ';
    Writeln(s + LangFile.ReadString('DebugStrings','Message'+IntToHex(msg, 4),'Message'+IntToHex(msg, 4)));
  end;
end;

procedure DebugMessage(msg: integer; level, dec: integer); overload;
var
  i: integer;
  s: string;
begin
  if level >= DebugLevel then begin
    s := '['+FileList[CurrentFile].FileName+']['+IntToStr(CurrentLine)+','+IntToStr(CurrentPosition)+'] ';
    for I := 0 to (length(s) div TabLength + 1) * TabLength - length(s) - 1 do
      s := s + ' ';
    Writeln(s + LangFile.ReadString('DebugStrings','Message'+IntToHex(msg, 4),'Message'+IntToHex(msg, 4)));
  end;
end;

procedure DebugMessageSystem(msg: string; level: integer);
var
  i: integer;
  s: string;
begin
  if level >= DebugLevel then begin
    s := '['+FileList[CurrentFile].FileName+']['+IntToStr(CurrentLine)+','+IntToStr(CurrentPosition-1)+'] ';
    for I := 0 to (length(s) div TabLength + 1) * TabLength - length(s) - 1 do
      s := s + ' ';
    Writeln(s + '>>> '+msg);
  end;
end;

function DebugGetOptionString(OptionName: string):string;
begin
  Result := LangFile.ReadString('DebugOptions', OptionName, '');
end;

function DebugGetOptionBoolean(OptionName: string):boolean;
begin
  Result := LangFile.ReadBool('DebugOptions', OptionName, false);
end;

function ShowTime(t: TDateTime):string;
const
  ms = 1/24/60/60/1000;
var
  m: integer;
begin
  m := round(t/ms);
  if (m < 2*1000) then begin
    Result := IntToStr(m) + ' ms';
  end else if (m < 2*1000*60) then begin
    Result := IntToStr(round(m/1000)) + ' s';
  end else begin
    Result := IntToStr(round(m/1000/60)) + ' m';
  end;
end;

end.
