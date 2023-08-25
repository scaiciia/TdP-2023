program P0E2;

type

    propiedades = record
        codigo: Integer;
        tipo: String;
        precio: Real;
    end;

    puntero = ^nodo;

    nodo = record
        prop: propiedades;
        psig: puntero;
    end;

    zona = array[1..5] of puntero;

    estrucRta = record
        cod: Integer;
        tipo: String
    end;

    punteroRta = ^nodoRta;

    nodoRta = record
        dato: estrucRta;
        psig: punteroRta;
    end;

procedure ingresarPropiedad (var l: puntero; aux: propiedades);
    var
        n, ant, act: puntero;
    begin
        new(n);
        n^.prop:= aux;
        act:= l;
        if ((l = nil) or (l^.prop.tipo > n^.prop.tipo)) then begin
            n^.psig:= l;
            l:= n;
            end
        else begin
            while ((act^.prop.tipo <= n^.prop.tipo) and (act <> nil)) do begin
                ant:= act;
                act:= act^.psig;
            end;
            n^.psig:= act;
            ant^.psig:= n;
        end;
    end;

procedure cargarPropiedades (var z: zona);
    var
        precioM2, m2: Real;
        i: Integer;
        aux: propiedades;
    begin
        WriteLn('Ingrese el precio x M2 de la propiedad');
        ReadLn(precioM2);
        while (precioM2 <> -1) do begin
            WriteLn('Ingrese codigo de la propiedad');
            ReadLn(aux.codigo);
            WriteLn('Ingrese el tipo de propiedad');
            ReadLn(aux.tipo);
            WriteLn('Ingrese la cantidad de m2 de la propiedad');
            ReadLn(m2);
            aux.precio:= precioM2 * m2;
            WriteLn('Ingrese la zona de la propiedad');
            ReadLn(i);
            ingresarPropiedad(z[i], aux);
            WriteLn('Ingrese el precio x M2 de la propiedad');
            ReadLn(precioM2);
        end;
    end;

procedure buscarPropiedades (var z: zona; var rta: punteroRta; i: Integer; tipo: String);
    var
        aux: puntero;
        n, auxRta: punteroRta;
    begin
        aux:= z[i];
        while (aux <> nil) do begin
            if (aux^.prop.tipo = tipo) then begin
                new(n);
                n^.dato.cod:= aux^.prop.codigo;
                n^.dato.tipo:= tipo;
                n^.psig:= rta;
                rta:= n;
                if (aux^.psig^.prop.tipo> tipo) then
                    Break;
            end;
            aux:= aux^.psig;
        end;
    end;

var
    z: zona;
    rta: punteroRta;
    i: Integer;
    tipo: String;

begin
    cargarPropiedades(z);
    WriteLn('Ingrese en que zona buscar');
    ReadLn(i);
    WriteLn('Ingrese el tipo de propiedad a buscar');
    ReadLn(tipo);
    buscarPropiedades(z, rta, i, tipo);
end.