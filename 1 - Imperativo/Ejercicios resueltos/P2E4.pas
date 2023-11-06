program P2E4;

type
    vector = array[1..20] of Integer;

procedure cargarVector(var v: vector; i: Integer);
    var
        num: Integer;
    begin
        num:= random(98) + 1;
        if (i < 20) then begin
            cargarVector(v, i+1);
        end;
        Write(num, ' ');
        v[i]:= num;
    end;

function minimoValor(v: vector; i: Integer): Integer;
    var
        n: Integer;
    begin
        n:= 100;
        if (i < 20) then
            n:= minimoValor(v, i+1);
        if (v[i] < n) then
            n:= v[i];
        minimoValor:= n;
    end;

function sumaValores(v: vector; i: Integer): Integer;
    begin
        sumaValores:= v[i];
        if (i < 20) then
            sumaValores:= sumaValores + sumaValores(v, i+1);
    end;

var
    i, suma, valor: Integer;
    v: vector;

begin
    i:= 1;
    cargarVector(v, i);
    WriteLn('');
    valor:= minimoValor(v, i);
    WriteLn(valor);
    suma:= sumaValores(v, i);
    WriteLn(suma);
end.