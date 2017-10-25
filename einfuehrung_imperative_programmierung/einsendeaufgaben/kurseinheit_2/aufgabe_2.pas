program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit 
  integer-Zahlen ein; beide Felder werden in einem weiteren Feld
  sortiert zusammengefuegt; das Ergebnis wird ausgegeben; ist 
  die Eingabe unsortiert, so ist das Ergebnisfeld undefiniert }
  const
  FELDLAENGE1 = 5;
  FELDLAENGE2 = 8;
  ERGEBNISFELDLAENGE = 13; { FELDLAENGE1 + FELDLAENGE2 }
        
  type
  tFeld1 = array [1..FELDLAENGE1] of integer;
  tFeld2 = array [1..FELDLAENGE2] of integer;
  tErgebnisFeld = array [1..ERGEBNISFELDLAENGE] of integer;

  var
  Feld1 : tFeld1;
  Feld2 : tFeld2;
  ErgebnisFeld : tErgebnisFeld;
  i : integer;
  j : integer;
  k : integer;
begin
  { sortierte Felder einlesen }
  writeln ('Bitte', FELDLAENGE1:2, ' Werte des ersten Feldes ',
                                         'sortiert eingeben!');
  for i := 1 to FELDLAENGE1 do
    readln (Feld1[i]);
  writeln ('Bitte', FELDLAENGE2:2, ' Werte des zweiten Feldes ',
           'sortiert eingeben!');
  for j := 1 to FELDLAENGE2 do
    readln (Feld2[j]);

  { Verschmelzungsprozess beginnen }



  { Hier beginnt mein eingesandter Code!!!!}
{ Initialisierung der Laufvariablen mit 1, dem Anfangswert der Arrays. }
i := 1;
j := 1;
k := 1;

repeat
  {Prüfen, ob einer der Indizes i, j schon größer ist als die zugehörige Feldlänge. Dann muss nur noch der Inhalt des anderen Arrays an Ergebnisfeld angehängt werden. }
  if (i > FELDLAENGE1) or ( j > FELDLAENGE2) then
  begin
    if i > FELDLAENGE1 then
    begin
      ErgebnisFeld[k] := Feld2[j];
      j := j + 1;
    end
    else
    begin
      ErgebnisFeld[k] := Feld1[i];
      i := i + 1;
    end
  end
  else
  begin
    { Den kleineren der Werte dem Ergebnisfeld zuweisen und den entsprechenden Index inkrementieren. }
    if Feld1[i] < Feld2[j] then 
    begin
      ErgebnisFeld[k] := Feld1[i];
      i := i + 1;
    end
    else
    begin
      ErgebnisFeld[k] := Feld2[j];
      j := j + 1;
    end
  end;

  { Der Index k muss in jedem Fall inkrementiert werden, um keine Werte des Ergebnisfeldes zu überschreiben. }
  k := k + 1;

until k > ERGEBNISFELDLAENGE;
  { Hier endet mein eingesandter Code!!!!}



  writeln ('Das Ergebnisfeld ist:');
  for k := 1 to ERGEBNISFELDLAENGE do
    write (ErgebnisFeld[k], ' ');
  writeln
end.