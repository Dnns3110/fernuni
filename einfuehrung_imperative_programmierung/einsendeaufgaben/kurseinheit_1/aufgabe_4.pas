Program FahrenheitZuCelsius (input, output);
{ Berechnet für eine eingegebene Temperatur auf der Fahrenheitskala die entsprechende Temperatur auf der Celsuisskala. }
  var c, f : real;

begin
  writeln('Geben Sie eine Temperatur in Fahrenheit ein: ');
  readln(f);
  
  {Berechnung der Celsius Temperatur}
  c:= (5*(f-32))/9;
  writeln(c);
end. { FahrenheitZuCelsius }