program P2E5;

type
    vector = array[1..20] of Integer;

procedure cargarVector(var v: vector);
    var
        i: Integer;
    begin
        for i:= 1 to 20 do begin
            v[i]:= i * 2;
            Write(v[i], ' ');
        end;
    end;

procedure busquedaDicotomica(v: vector; ini, fin, dato: Integer; var pos: Integer);
    var 
        aux, k: Integer;
    begin 
        if (ini = fin)then begin 
            if (v[ini] = dato) then 
                pos:= ini 
        else 
            pos:= -1; 
        end else begin 
            aux:= (fin - ini + 1) div 2;
            if (v[aux] = dato ) then 
                pos:= aux 
            else begin 
                if (dato < v[aux]) then 
                    busquedaDicotomica(v, ini, fin - aux, dato, pos)
                else 
                    busquedaDicotomica(v, ini + aux, fin, dato, pos);
            end; 
        end; 
    end;

var
    v: vector;
    ini, fin, dato, pos: Integer;

begin
    cargarVector(v);
    WriteLn('');
    WriteLn('Ingrese el numero a buscar');
    ReadLn(dato);
    busquedaDicotomica(v, 1, 20, dato, pos);
    WriteLn(pos);
end.