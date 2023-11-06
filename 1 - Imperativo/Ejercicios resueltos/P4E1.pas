program P4E1;

type
    producto = record
        cod: Integer;
        unidades: Integer;
        total: Real;
    end;

    arbol = ^ nodo;

    nodo = record
        dato: producto;
        HI: arbol;
        HD: arbol;
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
            if (a^.dato.cod = aux.cod) then begin
                a^.dato.unidades:= a^.dato.unidades + aux.unidades;
                a^.dato.total:= a^.dato.total + aux.total;
            end else begin
                if (aux.cod < a^.dato.cod) then
                    agregar(a^.HI, aux)
                else
                    agregar(a^.HD, aux);
            end;
        end;
    end;

procedure cargarArbol(var a: arbol);
    var
        cod: Integer;
        precio: Real;
        aux: producto;
    begin
        WriteLn('Ingrese el codigo de venta');
        ReadLn(cod);
        while (cod <> -1) do begin
            WriteLn('Ingrese el codigo del producto');
            ReadLn(aux.cod);
            WriteLn('Ingrese la cantidad de unidades vendidas');
            ReadLn(aux.unidades);
            WriteLn('Ingrese el precio unitario');
            ReadLn(precio);
            aux.total:= aux.unidades * precio;
            agregar(a, aux);
        end;
    end;

procedure imprimir(a: arbol);
    begin
        if (a^.HI <> nil) then
            imprimir(a^.HI);
        WriteLn('Codigo de Producto: ', a^.dato.cod);
        WriteLn('Unidades vendidas: ', a^.dato.unidades);
        WriteLn('Monto total: $', a^.dato.total);
        WriteLn('----------------------------');
        if (a^.HD <> nil) then
            imprimir(a^.HD);
    end;

procedure productoMayorUnidades(a: arbol; var cod, uni: Integer);
    begin
        if (a^.HI <> nil) then
            productoMayorUnidades(a^.HI, cod, uni);
        if (a^.HD <> nil) then
            productoMayorUnidades(a^.HD, cod, uni);
        if (a^.dato.unidades > uni) then begin
            cod:= a^.dato.cod;
            uni:= a^.dato.unidades;
        end;
    end;

function menorACod(a: arbol; cod: Integer): Integer;
    begin
        menorACod:= 0;
        if (a^.HI <> nil) then
            menorACod:= menorACod + menorACod(a, cod);
        if (a^.dato.cod < cod) then begin
            if (a^.HD <> nil) then
                menorACod:= menorACod + menorACod(a^.HD, cod);
            menorACod:= menorACod + 1;
        end;
    end;

function totalEntreCod(a: arbol; cod1, cod2: Integer): Real;
    begin
        totalEntreCod:= 0;
        if ((a^.dato.cod > cod1) and (a^.dato.cod < cod2)) then begin
            if (a^.HI <> nil) then
                totalEntreCod:= totalEntreCod + totalEntreCod(a^.HI, cod1, cod2);
            if (a^.HD <> nil) then
                totalEntreCod:= totalEntreCod + totalEntreCod(a^.HD, cod1, cod2);
            totalEntreCod:= totalEntreCod + a^.dato.total;
        end;
    end;

var
    a: arbol;
    cod, cod2, uni: Integer;

begin
    cargarArbol(a);
    imprimir(a);
    cod:= -1;
    uni:= -1;
    productoMayorUnidades(a, cod, uni);
    WriteLn('El codigo del producto con mayor unidades vendidas es: ', cod);
    WriteLn('Ingrese un codigo de producto');
    ReadLn(cod);
    WriteLn('La cantidad de productos con codigo menor al ingresado es: ', menorACod(a, cod));
    WriteLn('Ingrese un codigo');
    ReadLn(cod);
    WriteLn('Ingrese otro codigo');
    ReadLn(cod2);
    WriteLn('la suma del monto total entre los codigos ingresado es: $', totalEntreCod(a, cod, cod2));
end.