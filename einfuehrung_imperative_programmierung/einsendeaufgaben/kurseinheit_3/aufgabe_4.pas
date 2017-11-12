program TesteSortiereListe(input, output);
{ testet die Prozedur TesteSortiereListe }
  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             info : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe : tRefListe;

  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }

    var
    AktuellesElement,
    VorherigesElement,
    EndeSortiert,
    AnfangUnsortiert,
    NaechstesUnsortiert : tRefListe;
    Gefunden : boolean;


  begin
    if ioRefListe <> nil then
    begin
      { Initialisierung der Variablen, die das letzte Element des sortierten Teils und den Anfang des unsortierten Teiles zeigen. }
      AnfangUnsortiert := ioRefListe^.next;
      EndeSortiert := ioRefListe;

      { Äußere Schleife, die den unsortierten Teil verschiebt. }
      while AnfangUnsortiert <> nil do
      begin
        { Initialisierung der Laufvariablen für jedes einzusortierende Element. }
        AktuellesElement := ioRefListe;
        NaechstesUnsortiert := AnfangUnsortiert^.next;
        VorherigesElement := nil;
        Gefunden := false;

        { Innere Schleife, die über den sortierten Teil geht, bis die Stelle zum einsortieren gefunden wurde, oder die einzusortierende Zahl größer ist, als das letzte Element des sortierten Teils. }
        while (AktuellesElement <> AnfangUnsortiert) and (Gefunden = false) do
        begin
          { Wurde die Stelle gefunden, an der das erste Element des unsortierten Teils kleiner ist, als die aktuelle Zahl im sortierten Teil, dann wir dieses Element vor das aktuelle Element gesetzt. }
          if AnfangUnsortiert^.info < AktuellesElement^.info then
          begin
            Gefunden := true; { Um den Durchlauf der inneren Schleife vorzeitig zu beenden wird Gefunden auf true gesetzt. }
            EndeSortiert^.next := NaechstesUnsortiert; { Das Letzte Element des sortierten Teiles muss nun auf das nächste Element im unsortierten Teil (oder nil, falls dies das letzte zu sortierende Element war) zeigen. }
            AnfangUnsortiert^.next := AktuellesElement; { Unser zu sortierendes Element muss auf das aktuelle Element zeigen, da dieses das nächstgrößere Element ist. }
            if VorherigesElement = nil then
            { Hier wird das zu sortierende Element an den Anfang der Liste gesetzt, falls es das derzeit kleinste Element ist. }
              ioRefListe := AnfangUnsortiert
            else
            { Ansonsten müssten wir noch das Element, dass vor dem Aktuellen Element kommt auf unser zu sortierendes Element zeigen. }
              VorherigesElement^.next := AnfangUnsortiert
          end
          else
          begin
            { Falls das zu sortierende Element größer ist, als das aktuelle Element, dann müssen das vorherige und aktuelle Element für den nächsten Schleifendurchlauf um eine Stelle weiter geschoben werden. }
            VorherigesElement := AktuellesElement;
            AktuellesElement := AktuellesElement^.next
          end { if AnfangUnsortiert^.info < AktuellesElement^.info }
        end; { while (AktuellesElement <> AnfangUnsortiert) and (Gefunden = false) }

        { Sonderbehandlung für den Fall, dass wir im kompletten sortierten Teil der Liste keine Stelle gefunden haben, an die das zu sortierende Element passt. Dann muss das Ende des sortierten Teils um eine Stelle weiter, auf unser zu sortierendes Element gesetzt werden. }
        if Gefunden = false then
          EndeSortiert := EndeSortiert^.next;

        { Nachdem für das zu sortierende Element die passende Stelle gefunden wurde muss für den nächsten Schleifendurchlauf der äußeren Schleife der Anfang des unsortierten Teils der Liste um eine Stelle weiter geschoben werden (evtl. auf nil, wenn wir am Ende der Liste angekommen sind).}
        AnfangUnsortiert := NaechstesUnsortiert;
      end; { while AnfangUnsortiert <> nil }
    end; { if ioRefListe <> nil }
  end; { SortiereListe }


procedure Anhaengen(    inZahl : tNatZahl;
                    var ioListe : tRefListe);
{ Haengt inZahl an ioListe an }
  var Zeiger : tRefListe;
begin
  Zeiger := ioListe;
  if Zeiger = nil then
  begin
    new(ioListe);
    ioListe^.info := inZahl;
    ioListe^.next := nil;
  end
  else
  begin
    while Zeiger^.next <> nil do
      Zeiger := Zeiger^.next;
    { Jetzt zeigt Zeiger auf das letzte Element }
    new(Zeiger^.next);
    Zeiger := Zeiger^.next;
    Zeiger^.info := inZahl;
    Zeiger^.next := nil;
  end; { if }
end; { Anhaengen }


procedure ListeEinlesen(var outListe:tRefListe);
{ liest eine durch -1 abgeschlossene Folge von Integer-
  Zahlen ein und speichert diese in der linearen Liste RefListe. }
  var
  Liste : tRefListe;
  Zeile : string;
  Zahl, Code : integer;
begin
  Liste := nil;
  read(Zahl);
  
  while Zahl<>-1 do
  begin
    Anhaengen(Zahl, Liste);
    read(Zahl)
  end; { while }
  outListe := Liste
end; { ListeEinlesen }

procedure GibListeAus(inListe : tRefListe);
{ Gibt die Elemente von inListe aus }
  var Zeiger : tRefListe;
begin
  if inListe = nil then 
  begin
    writeln('Liste leer');
  end
  else 
  begin
    Zeiger := inListe;
    while Zeiger <> nil do
    begin
      writeln(Zeiger^.info);
      Zeiger := Zeiger^.next;
    end; { while }    
  end;  
end; { GibListeAus }

begin
  ListeEinlesen(RefListe);
  SortiereListe(RefListe);
  GibListeAus(RefListe)
end. { TesteSortiereListe }