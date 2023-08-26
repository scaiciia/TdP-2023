program P0E3;

type
    precioStock = record
        precio: Real;
        stock: Integer;
    end;

    tabla = array[1..1000] of precioStock;

    producto = record
        cod: Integer;
        cant: Integer;
        precio: Real;
    end;

    pDetalle = ^nodoDetalle;

    nodoDetalle = record
        dato: producto;
        psig: pDetalle;
    end;

    ticket = record
        cod: Integer;
        detalle: pDetalle;
        total: Real;
    end;

    pTicket = ^nodoTicket;

    nodoTicket = record
        dato: ticket;
        psig: pticket;
    end;

procedure inicializar (var t: tabla);
    var
        i: Integer;
    begin
        for i:= 1 to 1000 do begin
            WriteLn ('Ingrese el precio del codigo ', i);
            ReadLn(t[i].precio);
            WriteLn ('Ingrese el stock del codigo ', i);
            ReadLn(t[i].stock);
        end;
    end;

procedure ingresarProducto (var detalle: pDetalle; var total: Real; t: tabla);
    var
        aux: producto;
        n: pDetalle;
    begin
        WriteLn('Ingrese la cantidad vendida');
        ReadLn(aux.cant);
        while (aux.cant <> 0) do begin
            WriteLn('Ingrese el codigo del producto');
            ReadLn(aux.cod);
            if (t[aux.cod].stock < aux.cant) then
                aux.cant:= t[aux.cod].stock;
            if (aux.cant <> 0) then begin
                aux.precio:= t[aux.cod].precio;
                new(n);
                n^.dato:= aux;
                n^.psig:= detalle;
                detalle:= n;
                total:= total + (aux.cant * aux.precio);
            end;
            WriteLn('Ingrese la cantidad vendida');
            ReadLn(aux.cant);
        end;
    end;

procedure ingresarVenta (var ventas: pTicket; t: tabla);
    var
        aux: ticket;
        n: pticket;
    begin
        WriteLn('Ingrese el codigo de venta');
        ReadLn(aux.cod);
        while (aux.cod <> -1) do begin
            aux.detalle:= nil;
            aux.total:= 0;
            ingresarProducto(aux.detalle, aux.total, t);
            new(n);
            n^.dato:= aux;
            n^.psig:= ventas;
            ventas:= n;
            WriteLn('Ingrese el codigo de venta');
            ReadLn(aux.cod);
        end;
    end;

function cantVendidas (var ventas: pTicket; cod: Integer): Integer;
    var
        aux: pTicket;
        auxDetalle: pDetalle;
        suma: Integer;
    begin
        suma:= 0;
        aux:= ventas;
        while (aux <> Nil) do begin
            auxDetalle:= aux^.dato.detalle;
            while (auxDetalle <> Nil) do begin
                if (aux^.dato.cod = cod) then begin
                    suma:= suma + auxDetalle^.dato.cant;
                    Break;
                end;
                auxDetalle:= auxDetalle^.psig;
            end;
            aux:= aux^.psig;
        end;
        cantVendidas:= suma;
    end;

var
    t: tabla;
    ventas: pTicket;
    cod: Integer;
begin
    inicializar(t);
    ingresarVenta(ventas, t);
    WriteLn ('Ingrese el codigo a buscar');
    ReadLn(cod);
    WriteLn ('La cantidad vendida del codigo ', cod, 'es: ', cantVendidas(ventas, cod));
end.