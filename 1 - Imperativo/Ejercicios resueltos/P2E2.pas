program P2E2;

type
    lista = ^ nodo;

    nodo = record
        dato: Integer;
        psig: lista;
    end;

procedure cargarLista(var l: lista);
    var
        n: lista;
        num: Integer;
    begin
        WriteLn('Ingrese un numero');
        ReadLn(num);
        if (num <> 0) then begin
            cargarLista(l);
            new(n);
            n^.dato:= num;
            n^.psig:= l;
            l:= n;
        end;
    end;

procedure imprimirDigitos(i: Integer);
    var
        num: Integer;
    begin
        if (i <> 0) then begin
            num:= i mod 10;
            imprimirDigitos(i div 10);
            Write(num, ' ');
        end;
    end;

procedure recorrerLista(var l: lista);
    var
        aux: lista;
    begin
        aux:= l;
        while (aux <> nil) do begin
            imprimirDigitos(aux^.dato);
            aux:= aux^.psig;
            WriteLn('');
        end;
    end;

var
    l: lista;

begin
    l:= nil;
    cargarLista(l);
    recorrerLista(l);
end.