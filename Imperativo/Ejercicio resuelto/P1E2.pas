program P1E2;

const
    df = 300;

type
    oficina = record
        cod: Integer;
        DNI: Integer;
        valor: Real;
    end;

    edificio = array[1..300] of oficina;

procedure ingresarDatos(var v: edificio; var dl: Integer);
    var
        aux: oficina;
    begin
        WriteLn('Ingrese un codigo de identificación');
        ReadLn(aux.cod);
        while ((aux.cod <> -1) and (dl <> df)) do begin
            WriteLn('Ingrese DNI del propietario');
            ReadLn(aux.DNI);
            WriteLn('Ingrese el valor de las expensas');
            ReadLn(aux.valor);
            dl:= dl + 1;
            v[dl]:= aux;
            WriteLn('Ingrese un codigo de identificación');
            ReadLn(aux.cod);
        end;
    end;

procedure ordenarInsercion(var v: edificio; dl: Integer);
    var
        i, j: Integer;
        actual: oficina;
    begin
        for i:= 2 to dl do begin
            actual:= v[i];
            j:= i - 1;
            while ((j > 0) and (v[j].cod > actual.cod)) do begin
                v[j+1]:= v[j];
                j:= j - 1;
            end;
            v[j+1]:= actual;
        end;
    end;

procedure ordenarSeleccion(var v: edificio; dl: Integer);
    var
        i, j, pos: Integer;
        aux: oficina;
    begin
        for i:= 1 to dl-1 do begin
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

var
    v: edificio;
    dl: Integer;

begin
    ingresarDatos(v, dl);
    ordenarInsercion(v, dl);
    ordenarSeleccion(v, dl);
end.