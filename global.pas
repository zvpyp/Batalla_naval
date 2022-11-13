unit Global;

{-----------------------------------------------}

interface

const
N = 6; // grilla de 6x6 en el tablero
type 
    t_casilla = record
        x : 1..N;
        y : 1..N;
    end;
    t_columnas = array [1..N] of char;
var 
    columnas : t_columnas;

// Verifica que dos casillas sean las mismas.
function CasillasIguales(casilla1, casilla2 : t_casilla): boolean;

{-----------------------------------------------}

implementation

function CasillasIguales(casilla1, casilla2 : t_casilla): boolean;
begin
    CasillasIguales := false;

    if (casilla1.x = casilla2.x) and (casilla1.y = casilla2.y) then
        CasillasIguales := true;
end;

initialization
begin
    columnas[1] := 'A';
    columnas[2] := 'B';
    columnas[3] := 'C';
    columnas[4] := 'D';
    columnas[5] := 'E';
    columnas[6] := 'F';
end;

end.