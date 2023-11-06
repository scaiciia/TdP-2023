program P1E3;

type
    pelicula = record
        cod_peli: Integer;
        cod_genero: Integer;
        puntaje: Real;
    end;

    lista = ^nodo;

    nodo = record
        dato: pelicula;
        psig: lista;
    end;

    datos = record
        cod: Integer;
        puntaje: Real;
    end;

    vector = array[1..8] of datos;

procedure insertarDatos(var l: lista);
    var
        act, n: lista;
        aux: pelicula;
    begin
        act:= l;
        WriteLn('Ingrese el codigo de la pelicula');
        ReadLn(aux.cod_peli);
        while (aux.cod_peli <> -1) do begin
            WriteLn('Ingrese el codigo de genero');
            ReadLn(aux.cod_genero);
            WriteLn('Ingrese el puntaje promedio otorgado por las criticas');
            WriteLn(aux.puntaje);
            new(n);
            n^.dato:= aux;
            n^.psig:= act^.psig;
            act^.psig:= n;
            act:= act^.psig;
        end;
    end;

procedure generarVector(var l: lista; v: vector);
    var
        aux: lista;
        i: Integer;
    begin
        for i:= 1 to 8 do begin
            v[i].cod:= -1;
            v[i].puntaje:= -1;
        end;
        aux:= l;
        while (aux <> Nil) do begin
            if (aux^.dato.puntaje > v[aux^.dato.cod_genero].puntaje) then begin
                v[aux^.dato.cod_genero].cod:= aux^.dato.cod_peli;
                v[aux^.dato.cod_genero].puntaje:= aux^.dato.puntaje;
            end;
        end;
    end;

procedure ordenarSeleccion(var v: vector);
    var
        i, j, pos: Integer;
        aux: datos;
    begin
        for i:= 1 to 7 do begin
            pos:= i;
            for j:= i + 1 to 8 do begin
                if (v[j].puntaje < v[pos].puntaje) then
                    pos:= j;
                aux:= v[pos];
                v[pos]:= v[i];
                v[i]:= aux;
            end;
        end;
    end;

procedure imprimir(v: vector);
    begin

        WriteLn('El codigo de pelicula con mayor puntaje es: ', v[8].cod);
        WriteLn('El codigo de pelicula con menor puntaje es: ', v[1].cod);
    end;

var
    l: lista;
    v: vector;

begin
    l:= nil;
    insertarDatos(l);
    generarVector(l, v);
    ordenarSeleccion(v);
    imprimir(v);
end.