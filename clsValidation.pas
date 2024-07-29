unit clsValidation;

interface

type
  TValidate = class(TObject)

public

  function validWord(sWord : String; iLength : Integer) : Boolean;
  function validWordNoLength(sWord : String) : Boolean;
  function digitsOnly(sNum : String; iNumDigits : Integer) : Boolean;
  function digitsOnlyNoLength(sNum : String) : Boolean;

  end;

implementation

{ TValidate }


// Validates a number: Digits only and checks number of digits
function TValidate.digitsOnly(sNum: String; iNumDigits : Integer): Boolean;
var
  bValid : Boolean;
  I : Integer;

begin
  bValid := TRUE;

  for I := 1 to Length(sNum) do
  begin

    if not (sNum[I] in ['0'..'9']) then
    begin
      bValid := FALSE;
    end;

  end;

  Result := bValid AND (Length(sNum) = iNumDigits);
end;

// Validates a number: Digits only; length of number is ignored
function TValidate.digitsOnlyNoLength(sNum: String): Boolean;
var
  bValid : Boolean;
  I : Integer;

begin
  bValid := TRUE;

  for I := 1 to Length(sNum) do
  begin

    if not (sNum[i] in ['0'..'9']) then
    begin
      bValid := FALSE;
    end;

  end;

  Result := bValid;
end;

// Validates a word for letters only and checks the length of the word
function TValidate.validWord(sWord: String; iLength: Integer): Boolean;
var
  bValid : Boolean;
  I : Integer;

begin

  bValid := TRUE;

  for i := 1 to Length(sWord) do
  begin

    if not (sWord[i] in ['A'..'Z', 'a'..'z']) then
    begin
        bValid := FALSE;
    end;

  end;

  Result := bValid AND (Length(sWord) = iLength);

end;

// Validates a word - letters only - ignores the length of the word
function TValidate.validWordNoLength(sWord: String): Boolean;
var
  bValid : Boolean;
  i : Integer;
begin
  bValid := TRUE;

  for i := 1 to Length(sWord) do
  begin

    if not (sWord[i] in ['A'..'Z', 'a'..'z']) then
    begin
        bValid := FALSE;
    end;

  end;

  Result := bValid;
end;

end.
