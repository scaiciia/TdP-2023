program P4E2;

type

    prestamo = record
        nroSocio: Integer;
        dia: Integer;
        mes: Integer;
        cantDias: Integer;
    end;

    datos1 = record
        ISBN: Integer;
        datosPrestamo: prestamo;
    end;

    arbol1 = ^ nodo1;

    nodo1 = record
        dato: datos1;
        HI: arbol1;
        HD: arbol1;
    end;

    lista = ^ nodoLista;

    nodoLista = record
        dato: prestamo;
        psig: lista
    end;

    datos2 = record
        ISBN: Integer;
        prestamos: lista;
    end;

    arbol2 = ^ nodo2;

    nodo2 = record
        dato: datos2;
        HI: arbol2;
        HD: arbol2;
    end;

procedure agregar1(var a: arbol1; ISBN: Integer; aux: prestamo);
    var
        n: arbol1;
    begin
        if (a = nil) then begin
            new(n);
            n^.dato.ISBN:= ISBN;
            n^.dato.datosPrestamo:= aux;
            n^.HI:= nil;
            n^.HD:= nil;
            a:= n;
        end else begin
            if (ISBN < a^.dato.ISBN) then
                agregar1(a^.HI, ISBN, aux)
            else
                agregar1(a^.HD, ISBN, aux);
        end;
    end;

procedure cargarLista(var l: lista; aux: prestamo);
    var
        n: lista;
    begin
        new(n);
        n^.dato:= aux;
        n^.psig:= l;
        l:= n;
    end;

procedure agregar2(var a: arbol2; ISBN: Integer; aux: prestamo);
    var
        n: arbol2;
    begin
        if (a = nil) then begin
            new (n);
            n^.dato.ISBN:= ISBN;
            cargarLista(n^.dato.prestamos, aux);
            n^.HI:= nil;
            n^.HD:= nil;
            a:= n;
        end else begin
            if (a^.dato.ISBN = ISBN) then
                cargarLista(a^.dato.prestamos, aux)
            else begin
                if (a^.dato.ISBN > ISBN) then
                    agregar2(a^.HI, ISBN, aux)
                else
                    agregar2(a^.HD, ISBN, aux);
            end;
        end;
    end;

procedure cargarArboles(var a1: arbol1; var a2: arbol2);
    var
        aux: prestamo;
        ISBN: Integer;
    begin
        WriteLn('Ingrese el codigo ISBN');
        ReadLn(ISBN);
        while (ISBN <> -1) do begin
            WriteLn('Ingrese numero de socio');
            ReadLn(aux.nroSocio);
            WriteLn('Ingrese dia del prestamo');
            ReadLn(aux.dia);
            WriteLn('Ingrese el mes del prestamo');
            ReadLn(aux.mes);
            WriteLn('Ingrese la cantidad de dias prestado');
            ReadLn(aux.cantDias);
            agregar1(a1, ISBN, aux);
            agregar2(a2, ISBN, aux2);
            WriteLn('Ingrese el codigo ISBN');
            ReadLn(ISBN);
        end;
    end;

function ISBNMasGrande(a: arbol1): Integer;
    begin
        ISBNMasGrande:= a^.dato.ISBN;
        if (a^.HD <> nil) then
            ISBNMasGrande:= ISBNMasGrande(a^.HD);
    end;

function ISBNMasChico(a: arbol2): Integer;
    begin
        ISBNMasChico:= a^.dato.ISBN;
        if (a^.HI <> nil) then
            ISBNMasChico:= ISBNMasChico(a^.HI);
    end;



var
    a1: arbol1;
    a2: arbol2;

begin
    a1:= nil;
    a2:= nil;
    cargarArboles(a1, a2);
  
end.