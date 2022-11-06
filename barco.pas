unit Barco;

{-----------------------------------------------}

interface

uses Global, Tablero;

type 
    t_barco = record
        vidas := 1..4;
        casillas := array 1..4 of t_casilla;
    end;

// Retorna un registro barco, con un tamaño y vidas según el argumento
function CrearBarco(vidas : byte);

// Retorna verdadero si el barco está hundido
function BarcoHundido(barco : t_barco): boolean;

// Cambia las casillas del barco para que concuerden con la posición.
// dirección es de tipo carácter, y posee dos valores:
// h - horizontal hacia la derecha
// v - vertical hacia abajo
procedure AsignarCasillas(var barco : t_barco, pos_inicial : t_casilla, direccion : char);

{-----------------------------------------------}

implementation

function CrearBarco(vidas : byte): t_barco;
begin
    t_barco.vidas := vidas;
end;

function BarcoHundido(barco : t_barco): boolean;
begin
    hundido := false;
    if barco.vidas <= 0 then
        BarcoHundido := true;
end;

procedure AsignarCasillas(var barco : t_barco, pos_inicial : t_casilla, direccion : char);
var 
i : 1..N;
pos : t_casilla;
begin
    barco.casillas[1] := pos_inicial;

    for i := 2 to barco.vidas do
        begin
            pos.x := pos_inicial.x;
            pos.y := pos_inicial.y;
            if direccion = 'v' then
                begin
                    pos.y := pos.y + (i - 1); 
                end
            else
                if direccion = 'h' then
                    begin
                        pos.x := pos.x + (i - 1);
                    end;
            end;

            barco.casillas[i] := pos;
        end;
end;

end.