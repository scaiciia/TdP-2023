{ Implementar un programa que procese la información de los alumnos de la Facultad de Informática.
a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de 
todos los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso, 
cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada 
una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno 11111, el cual debe procesarse.
b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número de alumno 
y promedio de cada alumno.
c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de 
materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo 
puede diseñarse una solución modularizada que requiera la menor cantidad de cambios? }

program P0E1;

type
    materias = array[1..36] of real;

    matAlum = record
        mat: materias;
        dl: Integer;
    end;

    alumno = record
        apellido: String;
        numAlumn: Integer;
        anio: Integer;
        notas: matAlum;
    end;

    puntero = ^nodo;

    nodo = record
        dato: alumno;
        psig: puntero;
    end;

    promedio = record
        numAlumn: Integer;
        prom: Real;
    end;

    punteroProm = ^nodoProm;

    nodoProm = record
        dato: promedio;
        psig: punteroProm;
    end;

procedure cargarNotas (var notas: matAlum);
    var
        rta: Char;
    begin
        WriteLn('Hay una materia aprobada? (S/N)');
        ReadLn(rta);
        while ((rta = 'S') and (notas.dl <= 36)) do begin
            notas.dl:= notas.dl + 1;
            WriteLn('Ingrese la nota de la materia');
            ReadLn(notas.mat[notas.dl]);
            WriteLn('Hay una materia aprobada? (S/N)');
            ReadLn(rta);
        end;
    end;

procedure cargarLista(var l: puntero);
    var
        aux: alumno;
        n: puntero;
    begin
        repeat
            WriteLn('Ingrese el numero de alumno');
            ReadLn(aux.numAlumn);
            WriteLn('Ingrese el apellido del alumno');
            ReadLn(aux.apellido);
            WriteLn('Ingrese el año de ingreso');
            ReadLn(aux.anio);
            aux.notas.dl:= 0;
            cargarNotas(aux.notas);
            new(n);
            n^.dato:= aux;
            n^.psig:= l;
            l:= n;
        until (aux.numAlumn = 11111);
    end;

function calcularPromedio (var notas: matAlum): Real;
    var
        i: Integer;
        suma: Real;
        res: Real;
    begin
        suma:= 0;
        for i:= 1 to notas.dl do
            suma:= suma + notas.mat[i];
        res:= suma / notas.dl;
        calcularPromedio:= res;
    end;

procedure listaPromedios (var l: puntero; var lProm: punteroProm);
    var
        aux: puntero;
        auxProm: promedio;
        n: punteroProm;
    begin
        aux:= l;
        while (aux <> nil) do begin
            auxProm.numAlumn:= aux^.dato.numAlumn;
            auxProm.prom:= calcularPromedio(aux^.dato.notas);
            new(n);
            n^.dato:= auxProm;
            n^.psig:= lProm;
            lProm:= n;
            aux:= aux^.psig;
        end;
    end;

var
    l: puntero;
    lProm: punteroProm;
begin
    cargarLista(l);
    listaPromedios(l, lProm);
    WriteLn('OK');
end.