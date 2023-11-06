program P1E1;

const
    df = 50;

type

    venta = record
        dia: Integer;
        cod: Integer;
        cant: integer;
    end;

    ventas = array[1..df] of venta;

    ventaPar = record
        cod: Integer;
        cant: Integer;
    end;

    ventasPar = array[1..df] of ventaPar;

procedure cargaVector(var v: ventas; var dl: Integer);
    var
        aux: venta;
    begin
        randomize;
        WriteLn('Ingrese el día de venta');
        ReadLn(aux.dia);
        while ((aux.dia <> 0) and (dl < df)) do begin
            aux.cod:= random(15) + 1;
            while True do begin
                WriteLn('Ingrese la cantidad vendida (Maximo 99)');
                ReadLn(aux.cant);
                if (aux.cant <= 99) then
                    Break
                else
                    WriteLn('El valor supera el maximo permitido');
            end;
            v[dl + 1]:= aux;
            dl:= dl + 1;
        end;
    end;

procedure ordenar(var v: ventas; dl: Integer);
    var
        i, j, pos: Integer;
        aux: venta;
    begin
        for i:= 1 to dl -1 do begin
            pos:= i;
            for j:= i + 1 to dl do begin
                if (v[j].cod < v[pos].cod) then
                    pos:= j;
                aux:= v[pos];
                v[pos]:= v[i];
                v[i]:= aux;
            end;
        end;
    end;

procedure eliminarEntre(var v: ventas; var dl: Integer; cod1, cod2: Integer);
    var
        i, j: Integer;
    begin
        for i:= 1 to dl do begin
            if ((v[i].cod >= cod1) and (v[i].cod <= cod2)) then begin
                for j:= i to dl do begin
                    v[j]:= v[j + 1];
                    dl:= dl - 1;
                end;
            end;
        end;
    end;

procedure codigoPar(var vPar: ventasPar; var dlPar: Integer; v: ventas; dl: Integer);
    var
        i: Integer;
        aux: ventaPar;
    begin
        for i:= 1 to dl do begin
            if (vPar[dlPar].cod = v[i].cod) then
                vPar[dlPar].cant:= vPar[dlPar].cant + v[i].cant
            else
                if (v[i].cod mod 2 = 0) then begin
                    aux.cod:= v[i].cod;
                    aux.cant:= v[i].cant;
                    dlPar:= dlPar + 1;
                    vPar[dlPar]:= aux;
                end;
        end;
    end;

procedure imprimir(v: ventas; dl: Integer);
    var
        i: Integer;
    begin
        for i:= 1 to dl do begin
            WriteLn('Dia: ', v[i].dia);
            WriteLn('Codigo del producto: ', v[i].cod);
            WriteLn('Cantidad vendida: ', v[i].cant)
        end;
    end;

procedure imprimirPar(v: ventasPar; dl: Integer);
    var
        i: Integer;
    begin
        for i:= 1 to dl do begin
            WriteLn('Codigo: ', v[i].cod);
            WriteLn('Cantidad total vendida: ', v[i].cant);
        end;
    end;

var
    v: ventas;
    vPar: ventasPar;
    dl, dlPar, cod1, cod2: Integer;

begin
    dl:= 0;
    dlPar:= 0;
    cargaVector(v, dl);
    imprimir(v, dl);
    ordenar(v, dl);
    imprimir(v, dl);
    WriteLn('Ingrese el primer codigo');
    ReadLn(cod1);
    WriteLn('Ingrese el segundo codigo');
    ReadLn(cod2);
    eliminarEntre(v, dl, cod1, cod2);
    imprimir(v, dl);
    codigoPar(vPar, dlPar, v, dl);
    imprimirPar(vPar, dlPar);
end.