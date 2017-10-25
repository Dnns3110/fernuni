program Maximum(input, output);
{ Berechnet den Maximalen Wert einer eigegebenen Zahlenfolge. }

  var 
  Eingabe,
  Maximum : integer;

begin
  writeln('Bitte geben Sie eine folge von Zahlen ein. Eine 0 beendet die Eingabe. ');
  readln(Eingabe);

  { Sollte direkt eine 0 Eingegeben werden erscheint nur die Ausgabe 
'Leere Eingabefolge'. }
  if Eingabe = 0 then
    writeln('Leere Eingabefolge!')
  else 
  begin
    { Initialisieren des Maximums auf die erste Eingabe. }
    Maximum := Eingabe;
    repeat
      { Nur wenn der eingegebene Wert größer als das bisherige Maximum ist, muss das Maximum geändert werden. }
      if Eingabe > Maximum then
        Maximum := Eingabe;

      readln(Eingabe);
    until Eingabe = 0;

   writeln(Maximum);
  end;
end.