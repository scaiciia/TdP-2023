program P2E1;

type
    vector = array[1..10] of String;

    lista = ^ nodo;

    nodo = record
        dato: Char;
        psig: lista;
    end;

procedure leerCaracteres(var v: vector; var dl: Integer);
    begin
        if (dl = 10) then
            v[dl]:= '.'
        else begin
            writeln('Escriba el caracter');
            ReadLn(v[dl]);
            if (v[dl] <> '.') then begin
                dl:= dl + 1;
                leerCaracteres(v, dl)
            end
        end;
    end;

procedure imprimir(v: vector; dl: Integer);
    var
        i: Integer;
    begin
        for i:= 1 to dl do
            WriteLn(v[i]);
    end;

procedure imprimirRecursivo(v: vector; i: Integer);
    begin
        WriteLn(v[i]);
        if (v[i] <> '.') then
            imprimirRecursivo(v, i+1);
    end;

function leerCaracteresRecursivo(): Integer;
    var
        caracter: Char;
    begin
        leerCaracteresRecursivo:= 1;
        WriteLn('Ingrese un caracter');
        ReadLn(caracter);
        if (caracter <> '.') then
            leerCaracteresRecursivo:= leerCaracteresRecursivo() + 1;    
    end;

procedure listaCaracter(var l: lista);
    var
        caracter: Char;
        n: lista;
    begin
        WriteLn('Ingrese un caracter');
        ReadLn(caracter);
        if (caracter <> '.') then begin
            listaCaracter(l);
        end;
        new(n);
        n^.dato:= caracter;
        n^.psig:= l;
        l:= n;
    end;

procedure leerListaRecursivo(l: lista);
    begin
        if (l <> nil) then begin
            WriteLn(l^.dato);
            leerListaRecursivo(l^.psig);
        end;
    end;

procedure leerListaRecursivoInverso(l: lista);
    begin
        if (l <> nil) then begin
            leerListaRecursivoInverso(l^.psig);
            WriteLn(l^.dato);
        end;
    end;

var
    l: lista;
    v: vector;
    dl, i, cant: Integer;

begin
    l:= nil;
    dl:= 0;
    leerCaracteres(v, dl);
    imprimir(v, dl);
    i:= 1;
    imprimirRecursivo(v, i);
    cant:= leerCaracteresRecursivo();
    listaCaracter(l);
    leerListaRecursivo(l);
    leerListaRecursivoInverso(l);
end.