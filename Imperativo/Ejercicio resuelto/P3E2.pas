program P3E2;

type
    producto = record
        cod: Integer;
        fecha: String;
        cant: Integer;
    end;

    arbol = ^ nodo;

    nodo = record
        dato: producto;
        HI: arbol;
        HD: arbol;
    end;

    sumaProd = record
        cod: integer;
        cant: Integer;
    end;

    arbolSuma = ^ nodoSuma;

    nodoSuma = record
        dato: sumaProd;
        HI: arbolSuma;
        HD: arbolSuma;
    end;

procedure agregar(var a: arbol; aux: producto);
    var
        n: arbol;
    begin
        if (a = nil) then begin
            new(n);
            n^.dato:= aux;
            n^.HI:= nil;
            n^.HD:= nil;
            a:= n;
        end else begin
            if (a^.dato.cod > aux.cod) then
                agregar(a^.HI, aux)
            else
                agregar(a^.HD, aux);
        end;
    end;

procedure agregarSuma(var a: arbolSuma; aux: producto);
    var
        n: arbolSuma;
    begin
        if (a = nil) then begin
            new(n);
            n^.dato.cod:= aux.cod;
            n^.dato.cant:= aux.cant;
            n^.HI:= nil;
            n^.HD:= nil;
            a:= n;
        end else begin
            if (a^.dato.cod = aux.cod) then
                a^.dato.cant:= a^.dato.cant + aux.cant
            else 
                if (a^.dato.cod > aux.cod) then
                    agregarSuma(a^.HI, aux)
                else
                    agregarSuma(a^.HD, aux);
        end;
    end;

procedure cargarArbol(var a1: arbol; var a2: arbolSuma);
    var
        aux: producto;
    begin
        WriteLn('Ingrese el codigo del producto');
        ReadLn(aux.cod);
        while (aux.cod <> 0) do begin
            WriteLn('Ingrese la fecha');
            ReadLn(aux.fecha);
            WriteLn('Ingrese la cantidad vendida');
            ReadLn(aux.cant);
            agregar(a1, aux);
            agregarSuma(a2, aux);
            WriteLn('Ingrese el codigo del producto');
            ReadLn(aux.cod);
        end;
    end;

function sumaTotal(a: arbol; cod: Integer): Integer;
    begin
        sumaTotal:= 0;
        if (a^.HI <> nil) then
            if (cod < a^.dato.cod) then
                sumaTotal:= sumaTotal + sumaTotal(a^.HI, cod);
        if (a^.HD <> nil) then
            if (cod >= a^.dato.cod) then
                sumaTotal:= sumaTotal + sumaTotal(a^.HD, cod);
        if (a^.dato.cod = cod) then
            sumaTotal:= sumaTotal + a^.dato.cant;
    end;

function devolverCant(a: arbolSuma; cod: Integer): Integer;
    begin
        devolverCant:= 0;
        if (a^.dato.cod = cod) then
            devolverCant:= a^.dato.cant
        else begin
            if (a^.HI <> nil) then
                devolverCant:= devolverCant(a^.HI, cod);
            if (devolverCant <> 0) then
                if (a^.HD <> nil) then
                    devolverCant:= devolverCant(a^.HD, cod);
        end;
    end;

var
    a: arbol;
    aSuma: arbolSuma;
    cod: Integer;

begin
    a:= nil;
    aSuma:= nil;
    cargarArbol(a, aSuma);
    WriteLn('Ingrese el codigo a buscar');
    ReadLn(cod);
    WriteLn(sumaTotal(a, cod));
    WriteLn(devolverCant(aSuma, cod));
end.