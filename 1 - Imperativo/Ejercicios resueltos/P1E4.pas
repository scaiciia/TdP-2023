program P1E4;

type
    producto = record
        codProd: Integer;
        codRubro: Integer;
        precio: Real;
    end;

    puntero = ^nodo;

    nodo = record
        datos: producto;
        psig: puntero;
    end;

    vector = array[1..8] of puntero;

    vector30Prod = array[1..30] of producto;

procedure inicializar(var v:vector; var dl: Integer);
    var
        i: Integer;
    begin
        dl:= 0;
        for i:= 1 to 8 do
            v[i]:= nil;
    end;

procedure cargarDatos(var l: puntero; aux: producto);
    var
        n, ant, act: puntero;
    begin
        new(n);
        n^.datos:= aux;
        act:= l;
        if ((l = nil) or (n^.datos.codProd < act^.datos.codProd)) then begin
            n^.psig:= l;
            l:= n;
        end
        else begin
            while ((act <> nil) and (n^.datos.codProd > act^.datos.codProd)) do begin
                ant:= act;
                act:= act^.psig;
            end;
            n^.psig:= act;
            ant^.psig:= n;
        end;
    end;

procedure ingresarDatos(var v: vector);
    var
        aux: producto;
    begin
        WriteLn('Ingrese el precio del producto');
        ReadLn(aux.precio);
        while (aux.precio <> 0) do begin
            WriteLn('Ingrese el codigo del producto');
            ReadLn(aux.codProd);
            WriteLn('Ingrese el codigo del rubro');
            ReadLn(aux.codRubro);
            cargarDatos(v[aux.codRubro], aux);
            WriteLn('Ingrese el precio del producto');
            ReadLn(aux.precio);
        end;
    end;

procedure codProdXRubro(v: vector);
    var
        aux: puntero;
        i: Integer;
    begin
        for i:= 1 to 8 do begin
            WriteLn('Codigos de producto del Rubro ', i);
            aux:= v[i];
            while (aux <> nil) do
                WriteLn(aux^.datos.codProd);
        end;
    end;

procedure completarVector(var v: vector30Prod; var dl: Integer; var l: puntero);
    var
        aux: puntero;
    begin
        aux:= l;
        while ((aux <> nil) and (dl < 30)) do begin
            dl:= dl + 1;
            v[dl]:= aux^.datos;
            aux:= aux^.psig;
        end;
    end;

procedure ordenarVector(var v: vector30Prod; dl: Integer);
    var
        i, j, pos: Integer;
        aux: producto;
    begin
        for i:= 1 to dl - 1 do begin
            pos:= i;
            for j:= i + 1 to dl do begin
                if (v[j].precio < v[pos].precio) then
                    pos:= j;
                aux:= v[pos];
                v[pos]:= v[i];
                v[i]:= aux;
            end;
        end;
    end;

procedure imprimirVector(v: vector30Prod; dl: Integer);
    var
        i: Integer;
    begin
        WriteLn('Los precios del vector generado son: ');
        for i:= 1 to dl do
            WriteLn('$', v[i].precio);
    end;

function calcularPromedio(v: vector30Prod; dl: Integer): Real;
    var
        i: Integer;
        suma: Real;
    begin
        suma:= 0;
        for i:= 1 to dl do
            suma:= suma + v[i].precio;
        calcularPromedio:= suma / dl;
    end;

var
    v: vector;
    v30Prod: vector30Prod;
    dl: Integer;
    prom: Real;

begin
    inicializar(v, dl);
    ingresarDatos(v);
    codProdXRubro(v);
    completarVector(v30Prod, dl, v[3]);
    ordenarVector(v30Prod, dl);
    imprimirVector(v30Prod, dl);
    prom:= calcularPromedio(v30Prod, dl);
    WriteLn('El promedio de los ', dl, ' productos del Rubro 3 es $', prom);
end.