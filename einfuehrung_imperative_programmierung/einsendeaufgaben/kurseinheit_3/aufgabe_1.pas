program testeFeldZweitMax (input, output);
{ testet die Funktion FeldZweitMax }

  const
  FELDGROESSE = 10;

  type
  tIndex = 1..FELDGROESSE;
  tFeld = array [tIndex] of integer;

  var
Feld : tFeld;
i : integer;

function FeldZweitMax(var inFeld : tFeld) : integer;
  { Berechnet die zweitgrößte Zahl im übergebenen Feld. }

    var
    i,
    Max,
    ZweitMax : integer;

  begin
    { Max und ZweitMax initialisieren. }
    if inFeld[1] > inFeld[2] then
    begin
      Max := inFeld[1];
      ZweitMax := inFeld[2]
    end
    else
    begin
      Max := inFeld[2];
      ZweitMax := inFeld[1]
    end; { inFeld[1] > inFeld[2] }

    { Suche nach dem Zweitgrößten Feld. }
    for i := 3 to FELDGROESSE do
    begin
      if inFeld[i] > Max then
      begin 
        ZweitMax := Max;
        Max := inFeld[i]
      end
      else
      begin
        if inFeld[i] > ZweitMax then
          ZweitMax := inFeld[i]
      end { if inFeld[i] > Max }
    end; { for-Schleife }

    { Zuweisung des Rückgabewertes }
    FeldZweitMax := ZweitMax
  end; { FeldZweitMax }


begin { Testprogramm }
    writeln('Bitte geben Sie ', FELDGROESSE, ' Zahlen ein:');
    for i := 1 to FELDGROESSE do
    read (Feld [i]);
  writeln('Die zweitgroesste Zahl ist ', FeldZweitMax (Feld), '.');
end. { testeFeldZweitMax }