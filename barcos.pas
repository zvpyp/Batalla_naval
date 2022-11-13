unit barcos;

{-----------------------------------------------}
interface

uses Global, Barco, Tablero;

type
t_barcos = array [1..4] of t_barco;

// Crea un array de barcos aleatorios. Los coloca sobre un tablero.
function CrearBarcos(var tablero: t_tablero): t_barcos;

// Escribe los barcos contenidos en el array de barcos.
procedure EscribirBarcos(barcos : t_barcos);

implementation
{-----------------------------------------------}

// Genera una casilla aleatoria.
function RandCasilla(): t_casilla;
begin
    Randomize;
    RandCasilla.x := random(N) + 1;
    RandCasilla.y := random(N) + 1;
end;

function CrearBarcos(var tablero: t_tablero): t_barcos;
var
i : 1..4;
j : 1..4;
pos_inicial : t_casilla;
disposicion : 1..2;
begin
    CrearBarcos[1] := CrearBarco(1);
    CrearBarcos[2] := CrearBarco(2);
    CrearBarcos[3] := CrearBarco(2);
    CrearBarcos[4] := CrearBarco(3);

    for i := 1 to 4 do
    begin
        // Elige una casilla inicial. Repite hasta ser una casilla válida.
        repeat
            pos_inicial := RandCasilla();
        until (DisponibleHorizontal(CrearBarcos[i], pos_inicial, tablero)) or (DisponibleVertical(CrearBarcos[i], pos_inicial, tablero));

        // 1 : horizontal; 2 : vertical. Si una no está disponible, elige la otra.
        disposicion := random(2) + 1;

        if (disposicion = 1) and (not DisponibleHorizontal(CrearBarcos[i], pos_inicial, tablero)) then
            disposicion := 2
        else
            begin
            if (disposicion = 2) and (not DisponibleVertical(CrearBarcos[i], pos_inicial, tablero)) then
                disposicion := 1;
            end;
        
        // Asigna las casillas al barco
        AsignarCasillas(CrearBarcos[i], pos_inicial, disposicion);
        
        // Suma el barco al tablero
        for j := 1 to CrearBarcos[i].vidas do
        begin
            MarcarCasilla(tablero, CrearBarcos[i].casillas[j]);
        end;

    end;
end;

procedure EscribirBarcos(barcos : t_barcos);
var
i : 1..4;
begin
    for i := 1 to 4 do
        EscribirBarco(barcos[i]);
end;

end.