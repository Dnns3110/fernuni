program BerechneMuenzen(input, output);
{ Berechnet für einen eingegebenen Geldbetrag in Cent die Verteilung dieses Betrages auf die derzeit gültigen Euromünzen, sodass man möglichst wenige Münzen benötigt. }

  const
  MIN = 1;
  MAX = 99;

  var 
  Betrag,
  Anzahl50,
  Anzahl20,
  Anzahl10, 
  Anzahl5,
  Anzahl2,
  Anzahl1 : integer;

begin
 writeln('Bitte geben Sie einen Geldbetrag in Euro ein. ', 
         'Der Betrag muss zwischen 1ct und 99ct liegt. ');
  readln(Betrag);
  
  if (Betrag < MIN) or (Betrag > MAX) then
    writeln('Der eingegebene Betrag liegt nicht zwischen 1ct und 99ct.')
  else 
  begin
    { Anzahl der 50 Cent Münzen berechnen }
    Anzahl50 := Betrag div 50;
    Betrag := Betrag mod 50;

    { Anzahl der 20 Cent Münzen berechnen }
    Anzahl20 := Betrag div 20;
    Betrag := Betrag mod 20;


    { Anzahl der 10 Cent Münzen berechnen }
    Anzahl10 := Betrag div 10;
    Betrag := Betrag mod 10;


    { Anzahl der 5 Cent Münzen berechnen }
    Anzahl5 := Betrag div 5;
    Betrag := Betrag mod 5;


    { Anzahl der 2 Cent Münzen berechnen }
    Anzahl2 := Betrag div 2;
    Betrag := Betrag mod 2;


    { Anzahl der 1 Cent Münzen ist der restliche Betrag }
    Anzahl1 := Betrag;

   writeln(Anzahl50, Anzahl20, Anzahl10, Anzahl5, Anzahl2, Anzahl1)
  end; { if (Betrag <= 0) or (Betrag > 99) }
end. { BerechneMuenzen }