unit barcos

{-----------------------------------------------}
interface

uses Global, Barco, Tablero;

type
t_barcos = array [1..N] of t_barco;

// Crea un array de barcos aleatorios.
function CrearBarcos(): t_barcos;

implementation
{-----------------------------------------------}

// Genera una casilla aleatoria.
function RandCasilla(): t_casilla;
begin
    Randomize;
    RandCasilla.x := random(N) + 1;
    RandCasilla.y := random(N) + 1;
end;

// TODO: verificar que no haya otro barco en la misma posición. POR FAVOR, AYUDA :(
function CrearBarcos(): t_barcos;
var
i : 1..6;
pos_inicial : t_casilla;
disposicion : 1..2;
begin
    CrearBarcos[1] := CrearBarco(1);
    CrearBarcos[2] := CrearBarco(2);
    CrearBarcos[3] := CrearBarco(2);
    CrearBarcos[4] := CrearBarco(3);
    CrearBarcos[5] := CrearBarco(3);
    CrearBarcos[6] := CrearBarco(4);

    for i : 1 to 6 do
    begin
        // Elige una casilla inicial. Repite hasta ser una casilla válida.
        repeat
            pos_inicial := RandCasilla();
        until (DisponibleHorizontal(CrearBarcos[i], pos_inicial) or DisponibleVertical(CrearBarcos[i]), pos_inicial);

        // 1 : horizontal; 2 : vertical. Si una no está disponible, elige la otra.
        disposicion := random(2) + 1;

        if (disposicion = 1) and (not DisponibleHorizontal(CrearBarcos[i], pos_inicial)) then
            disposicion := 2
        else
            begin
            if (disposicion = 2) and (not DisponibleVertical(CrearBarcos[i], pos_inicial)) then
                disposicion := 1;
            end;
        
        AsignarCasillas(CrearBarcos[i], pos_inicial, disposicion);
        
    end;
end;

end.