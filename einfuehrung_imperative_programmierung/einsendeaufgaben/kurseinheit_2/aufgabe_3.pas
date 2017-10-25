program MatrixSummen (input, output);
{ ueberprueft bei einer Matrix von integer-Zahlen, ob
  jede Spaltensumme groesser ist als die Zeilensumme einer
  angegebenen Zeile }

  const
  ZEILENMAX = 3;
  SPALTENMAX = 4;

  type
  tMatrix = array [1..ZEILENMAX, 1..SPALTENMAX] of integer;

  var
  Matrix : tMatrix;
  ZeilenNr,
  SpaltenNr,
  Eingabe : integer;

  function ZeilenSummeKleiner (var inMatrix : tMatrix;
                                     inZeilenNr : integer) : boolean;
    { ergibt true, falls die Summe aller Elemente mit dem
      uebergebenen Zeilenindex kleiner ist als jede
      Spaltensumme }


      {Hier beginnt mein eingesandter Code!!!!!}
  var 
  SpaltenNr,
  ZeilenNr,
  ZeilenSumme,
  SpaltenSumme : Integer;

begin
  { Prüfe, ob die übergebene Zeilen Nummer gültig ist }
  if (inZeilenNr < 1) or (inZeilenNr > ZEILENMAX) then
    ZeilenSummeKleiner := false
  else 
  begin
  { Berechnen dann die Zeilen Summe. }
    for SpaltenNr := 1 to SPALTENMAX do
      ZeilenSumme := ZeilenSumme + inMatrix[inZeilenNr, SpaltenNr];

    { Initialisierung der Laufvariable SpaltenNr, da für die äußere Schleife eine repeat-Schleife verwendet wird, um vorzeitig abbrechen zu können. }
    SpaltenNr := 1;

    repeat
      { Initialisierung der Spalten Summe auf 0 zu Beginn jedes Schleifendurchlaufs. }
      SpaltenSumme := 0;
      for ZeilenNr := 1 to ZEILENMAX do
        SpaltenSumme := SpaltenSumme + inMatrix[ZeilenNr, SpaltenNr];

      SpaltenNr := SpaltenNr + 1;
    until (ZeilenSumme >= SpaltenSumme) or (SpaltenNr > SPALTENMAX);

    if ZeilenSumme >= SpaltenSumme then
      ZeilenSummeKleiner := false
    else 
      ZeilenSummeKleiner := true
  end
      {Hier endet mein eingesandter Code!!!!!}



      
 end;{ ZeilenSummeKleiner } 

begin { Matrixelemente einlesen } 
  for ZeilenNr := 1 to ZEILENMAX do
    for SpaltenNr := 1 to SPALTENMAX do 
      read (Matrix[ZeilenNr, SpaltenNr]); 
  repeat 
    write ('Welche Zeile soll ueberprueft werden ? (1..', ZEILENMAX, ') (anderes = Ende) '); 
    readln (Eingabe); 
    if (Eingabe > 0) and (Eingabe <= ZEILENMAX) then 
    begin
      ZeilenNr := Eingabe; { hier wird die Funktion ZeilenSummeKleiner aufgerufen } 
      if ZeilenSummeKleiner (Matrix,ZeilenNr) then 
        writeln ('Jede Spaltensumme ist groesser als die ', 'Zeilensumme der ', ZeilenNr, '. Zeile.') 
      else 
        writeln ('Es sind nicht alle Spaltensummen groesser als die ', 'Zeilensumme der ', ZeilenNr, '. Zeile.') 
    end; 
  until (Eingabe <= 0) or (Eingabe > ZEILENMAX)
end. { MatrixSummen } 