program P3E1;

type
    socio = record
        id: Integer;
        nom: String;
        edad: Integer;
    end;

    arbol = ^ nodo;

    nodo = record
        dato: socio;
        HI: arbol;
        HD: arbol;
    end;

procedure agregar(var a: arbol; dato: socio);
    var
        n: arbol;
    begin
        if (a = nil) then begin
            new(n);
            n^.dato:= dato;
            n^.HI:= nil;
            n^.HD:= nil;
            a:= n;
        end else begin
            if (dato.id < a^.dato.id) then
                agregar(a^.HI, dato)
            else
                agregar(a^.HD, dato);
        end;
    end;

procedure cargarArbol(var a: arbol);
    var
        aux: socio;
    begin
        WriteLn('Ingrese el numero de socio');
        ReadLn(aux.id);
        while (aux.id <> 0) do begin
            WriteLn('Ingrese nombre del socio');
            ReadLn(aux.nom);
            WriteLn('Ingrese la edad del socio');
            ReadLn(aux.edad);
            agregar(a, aux);
            WriteLn('Ingrese el numero de socio');
            ReadLn(aux.id);
        end;
    end;

function socioMasGrande(a: arbol): Integer;
    begin
        if (a^.HD = nil) then
            socioMasGrande:= a^.dato.id
        else
            socioMasGrande:= socioMasGrande(a^.HD);
    end;

function socioMasChico(a: arbol): Integer;
    begin
        if (a^.HI = nil) then
            socioMasChico:= a^.dato.id
        else
            socioMasChico:= socioMasChico(a^.HI);
    end;

function mayorEdad(a: arbol): Integer;
    var
        edad: Integer;
    begin
        mayorEdad:= a^.dato.edad;
        if (a^.HI <> nil) then begin
            edad:= mayorEdad(a^.HI);
            if (a^.dato.edad < edad) then
              mayorEdad:= edad;
        end;
        if (a^.HD <> nil) then begin
            edad:= mayorEdad(a^.HD);
            if (a^.dato.edad < edad) then
                mayorEdad:= edad
        end;
    end;

procedure cumpleanios(var a: arbol);
    begin
        if (a^.HI <> nil) then
            cumpleanios(a^.HI);
        if (a^.HD <> nil) then
            cumpleanios(a^.HD);
        a^.dato.edad:= a^.dato.edad + 1;
    end;

function existeID(a: arbol; id: Integer): Boolean;
    begin
        existeID:= False;
        if (a^.dato.id = id) then
            existeID:= True
        else begin
            if ((a^.dato.id > id) and (a^.HI <> nil)) then
                existeID:= existeID(a^.HI, id)
            else if (a^.HD <> nil) then
                existeID:= existeID(a^.HD, id);
        end;
    end;

function existeNom(a: arbol; nom: String): Boolean;
    begin
        existeNom:= False;
        if (a^.dato.nom = nom) then
            existeNom:= True
        else begin
            if (a^.HI <> nil) then
                existeNom:= existeNom(a^.HI, nom);
            if ((a^.HD <> nil) and (existeNom = False)) then
                existeNom:= existeNom(a^.HD, nom);
        end;
    end;

function cantSocios(a: arbol): Integer;
    begin
        cantSocios:= 1;
        if (a^.HI <> nil) then
            cantSocios:= cantSocios + cantSocios(a^.HI);
        if (a^.HD <> nil) then
            cantSocios:= cantSocios + cantSocios(a^.HD);
    end;

procedure recorrerArbol(a: arbol; var suma,cant: Integer);
    begin
        if (a^.HI <> nil) then
            recorrerArbol(a^.HI, suma, cant);
        if (a^.HD <> nil) then
            recorrerArbol(a^.HD, suma, cant);
        suma:= suma + a^.dato.edad;
        cant:= cant + 1;
    end;

function calcularPromedio(a: arbol): Real;
    var
        suma, cant: Integer;
    begin
        suma:= 0;
        cant:= 0;
        recorrerArbol(a, cant, suma);
        calcularPromedio:= suma / cant;
    end;

function sumarEdad(a: arbol): Integer;
    begin
        sumarEdad:= 0;
        if (a^.HI <> nil) then
            sumarEdad:= sumarEdad + sumarEdad(a^.HI);
        if (a^.HD <> nil) then
            sumarEdad:= sumarEdad + sumarEdad(a^.HD);
        sumarEdad:= sumarEdad + a^.dato.edad;
    end;

function cantEntreIDs(a: arbol; id1, id2: Integer): Integer;
    begin
        cantEntreIDs:= 0;
        if (a^.HI <> nil) then
            cantEntreIDs:= cantEntreIDs + cantEntreIDs(a^.HI, id1, id2);
        if (a^.HD <> nil) then
            cantEntreIDs:= cantEntreIDs + cantEntreIDs(a^.HD, id1, id2);
        if ((a^.dato.id > id1) and (a^.dato.id < id2)) then
            cantEntreIDs:= cantEntreIDs + 1;
    end;

procedure sociosOrdenCreciente(a: arbol);
    begin
        if (a^.HI <> nil) then
            sociosOrdenCreciente(a^.HI);
        WriteLn(a^.dato.id);
        if (a^.HD <> nil) then
            sociosOrdenCreciente(a^.HD);
    end;

procedure sociosParOrdenDecreciente(a: arbol);
    begin
        if (a^.HD <> nil) then
            sociosParOrdenDecreciente(a^.HD);
        if (a^.dato.id mod 2 = 0) then
            WriteLn(a^.dato.id);
        if (a^.HI <> nil) then
            sociosParOrdenDecreciente(a^.HI);
    end;

var
    a: arbol;
    id, id1, id2: Integer;
    nom: String;

begin
    a:= nil;
    cargarArbol(a);
    socioMasGrande(a);
    socioMasChico(a);
    mayorEdad(a);
    cumpleanios(a);
    WriteLn('Ingrese el ID de socio a buscar');
    ReadLn(id);
    WriteLn(existeID(a, id));
    WriteLn('Ingrese un nombre a buscar');
    ReadLn(nom);
    WriteLn(existeNom(a, nom));
    WriteLn(cantSocios(a));
    WriteLn(calcularPromedio(a));
    WriteLn(sumarEdad(a));
    WriteLn('Ingrese el primer ID');
    ReadLn(id1);
    WriteLn('Ingrese el segundo ID');
    ReadLn(id2);
    WriteLn(cantEntreIDs(a, id1, id2));
    sociosOrdenCreciente(a);
    sociosParOrdenDecreciente(a);
end.