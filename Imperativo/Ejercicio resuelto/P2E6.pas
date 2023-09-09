program P2E6;

procedure convertirABinario(num: Integer);
    begin
        if (num < 2) then begin
            Write(num);            
        end else begin
            convertirABinario(num div 2);
            Write(num mod 2);
        end;
    end;

procedure leerNumero();
    var
        num: Integer;
    begin
        WriteLn('Ingrese el numero a convertir (0 para salir)');
        ReadLn(num);
        while (num <> 0) do begin
            Write('Numero en binario: ');
            convertirABinario(num);
            WriteLn('');
            WriteLn('Ingrese el numero a convertir (0 para salir)');
            ReadLn(num);
        end;
    end;

begin
    leerNumero();
end.