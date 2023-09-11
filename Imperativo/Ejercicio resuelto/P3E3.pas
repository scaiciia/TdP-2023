program P3E3;

type

    final = record
        cod: integer;
        nota: Real;
    end;

    lista = ^ nodoLista;

    nodoLista = record
        dato: final;
        psig: lista;
    end;

    alumno = record
        leg: Integer;
        dni: Integer;
        anio: Integer;
        finales: lista;
    end;

    arbol = ^ nodoArbol;

    nodoArbol = record
        dato: alumno;
        HI: arbol;
        HD: arbol;
    end;

procedure cargarLista(var l: lista);
    var
        n: lista;
        aux: final;
    begin
        WriteLn('Ingrese codigo de la materia');
        ReadLn(aux.cod);
        while (aux.cod <> -1) do begin
            WriteLn('Ingrese la nota de la materia');
            ReadLn(aux.nota);
            new(n);
            n^.dato:= aux;
            n^.psig:= l;
            l:= n;
            WriteLn('Ingrese codigo de la materia');
            ReadLn(aux.cod);
        end;
    end;

procedure agregar( var a: arbol; aux: alumno);
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
            if (aux.leg < a^.dato.leg) then
                agregar(a^.HI, aux)
            else
                agregar(a^.HD, aux);
        end;
    end;

procedure cargarArbol(var a: arbol);
    var
        aux: alumno;
    begin
        WriteLn('Ingresa numero de legajo');
        ReadLn(aux.leg);
        while (aux.leg <> 0) do begin
            WriteLn('Ingrese DNI del alumno');
            ReadLn(aux.dni);
            WriteLn('Ingrese el año de ingreso');
            ReadLn(aux.anio);
            aux.finales:= nil;
            cargarLista(aux.finales);
            agregar(a, aux);
            WriteLn('Ingresa numero de legajo');
            ReadLn(aux.leg);
        end;
    end;

procedure obtenerHastaLeg (a: arbol; leg: Integer);
    begin
        if (a^.dato.leg < leg) then begin
            WriteLn('DNI: ', a^.dato.dni);
            WriteLn('Año de ingreso: ', a^.dato.anio);
            if (a^.HI <> nil) then
                obtenerHastaLeg(a^.HI, leg);
            if (a^.HD <> nil) then
                obtenerHastaLeg(a^.HD, leg);
        end;
    end;

function legMasGrande(a: arbol): Integer;
    begin
        legMasGrande:= a^.dato.leg;
        if (a^.HD <> nil) then
            legMasGrande:= legMasGrande(a^.HD);
    end;

function dniMasGrande(a: arbol): Integer;
    var
        dni: Integer;
    begin
        dniMasGrande:= a^.dato.dni;
        if (a^.HI <> nil) then begin
            dni:= dniMasGrande(a^.HI);
            if (dni > dniMasGrande) then
                dniMasGrande:= dni;
        end;
        if (a^.HD <> nil) then begin
            dni:= dniMasGrande(a^.HD);
            if (dni > dniMasGrande) then
                dniMasGrande:= dni;
        end;
    end;

function legImpar(a: arbol): Integer;
    begin
        legImpar:= 0;
        if (a^.HI <> nil) then
            legImpar:= legImpar + legImpar(a^.HI);
        if (a^.HD <> nil) then
            legImpar:= legImpar + legImpar(a^.HD);
        if (a^.dato.leg mod 2 <> 0) then
            legImpar:= legImpar + 1;
    end;

function calcularProm(l: lista): Real;
    var
        cant: Integer;
        suma: Real;
        aux: lista;
    begin
        aux:= l;
        suma:= 0;
        cant:= 0;
        while (aux <> nil) do begin
            cant:= cant + 1;
            suma:= suma + aux^.dato.nota;
            aux:= aux^.psig;
        end;
        calcularProm:= suma / cant;
    end;

procedure mayorPromedio(a: arbol; var leg: Integer; var prom: Real);
    var
        aux: Real;
    begin
        if (a^.HI <> nil) then
            mayorPromedio(a^.HI, leg, prom);
        if (a^.HD <> nil) then
            mayorPromedio(a^.HD, leg, prom);
        aux:= calcularProm(a^.dato.finales);
        if (aux > prom) then begin
            prom:= aux;
            leg:= a^.dato.leg;
        end;
    end;

procedure promediosMayoresA(a: arbol; num: Integer);
    var
        aux: Real;
    begin
        if (a^.HI <> nil) then
            promediosMayoresA(a^.HI, num);
        if (a^.HD <> nil) then
            promediosMayoresA(a^.HD, num);
        aux:= calcularProm(a^.dato.finales);
        if (aux > num) then begin
            WriteLn('Legajo: ', a^.dato.leg);
            WriteLn('Promedio: ', aux);
        end;
    end;

var
    a: arbol;
    leg, num: Integer;
    prom: real;

begin
    cargarArbol(a);
    WriteLn('Ingrese un legajo');
    ReadLn(leg);
    obtenerHastaLeg(a, leg);
    WriteLn('El legajo mas grande es: ', legMasGrande(a));
    WriteLn('El DNI mas grande es: ', dniMasGrande(a));
    WriteLn('La cantidad de alumnos con legajo impar es: ', legImpar(a));
    mayorPromedio(a, leg, prom);
    WriteLn('El alumno con mayor promedio es el alumno con legajo: ', leg, '. Con un promedio de: ', prom);
    WriteLn('Ingrese un numero');
    ReadLn(num);
    promediosMayoresA(a, num);
end.