program P2E3;

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
        num:= random(99);
        if (num <> 0) then begin
            cargarLista(l);
            new(n);
            n^.dato:= num;
            n^.psig:= l;
            l:= n;
        end;
    end;

function valorMinimo(l: lista): Integer;
    var
        num: Integer;
    begin
        num:= 100;
        if (l <> nil) then begin
            num:= valorMinimo(l^.psig);
            if (l^.dato < num) then
                num:= l^.dato;
        end;
        valorMinimo:= num;
    end;

function valorMaximo(l: lista): Integer;
    var
        num: Integer;
    begin
        num:= -1;
        if (l <> nil) then begin
            num:= valorMaximo(l^.psig);
            if (l^.dato > num) then
                num:= l^.dato;
        end;
        valorMaximo:= num;
    end;

function existeValor(l: lista; num: Integer): Boolean;
    var
        valor: Boolean;
    begin
        valor:= False;
        if (l <> nil) then begin
            valor:= existeValor(l^.psig, num);
            if (valor = False) then begin
                if (l^.dato = num) then
                    valor:= True;
            end;
        end;
        existeValor:= valor;
    end;

var
    l: lista;
    valor: Integer;

begin
    randomize;
    l:= nil;
    cargarLista(l);
    WriteLn(valorMinimo(l));
    WriteLn(valorMaximo(l));
    WriteLn('Ingrese un valor a buscar');
    ReadLn(valor);
    WriteLn(existeValor(l, valor));
end.