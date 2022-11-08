unit Barco;

{-----------------------------------------------}

interface

uses Global, Tablero;

type 
    t_barco = record
        vidas := 1..4;
        casillas := array 1..4 of t_casilla;
    end;

// Retorna un registro barco, con un tamaño y vidas según el argumento.
function CrearBarco(vidas : byte);

// Retorna verdadero si el barco está hundido.
function BarcoHundido(barco : t_barco): boolean;

// Cambia las casillas del barco para que concuerden con la posición.
// dirección es de tipo carácter, y posee dos valores:
// 1 - horizontal hacia la derecha
// 2 - vertical hacia abajo
procedure AsignarCasillas(var barco : t_barco, pos_inicial : t_casilla, direccion : byte);

// Retorna verdadero si el barco ocupa la casilla en el argumento.
function OcupaCasilla(barco: t_barco; casilla : t_casilla): boolean;

// Quita una vida al barco.
procedure QuitarVida(var barco : t_barco);

// Retorna verdadero si el barco puede colocarse horizontalmente dada una casilla inicial.
function DisponibleHorizontal(barco: t_barco, pos_inicial : t_casilla): boolean;

// Retorna verdadero si el barco puede colocarse verticalmente dada una casilla inicial.
function DisponibleVertical(barco: t_barco, pos_inicial : t_casilla): boolean;

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

procedure AsignarCasillas(var barco : t_barco, pos_inicial : t_casilla, direccion : byte);
var 
i : 1..4;
pos : t_casilla;
begin
    barco.casillas[1] := pos_inicial;

    for i := 2 to barco.vidas do
        begin
            pos.x := pos_inicial.x;
            pos.y := pos_inicial.y;
            if direccion = 2 then
                begin
                    pos.y := pos.y + (i - 1); 
                end
            else
                if direccion = 1 then
                    begin
                        pos.x := pos.x + (i - 1);
                    end;
            end;

            barco.casillas[i] := pos;
        end;
end;

function OcupaCasilla(barco: t_barco; casilla : t_casilla): boolean;
var
i : 1..4;
begin
    OcupaCasilla := false;

    for i := 1 to 4 do
        begin
            if barco.casillas[i] = casilla then
                OcupaCasilla := true;
        end;
end;

procedure QuitarVida(var barco : t_barco);
begin
    barco.vidas := barco.vidas - 1;
end;

function DisponibleHorizontal(barco: t_barco, pos_inicial : t_casilla): boolean;
begin
    DisponibleHorizontal := false;
    if (pos_inicial.x <= (N - barco.vidas + 1)) then
        DisponibleHorizontal := true;
end;

function DisponibleVertical(barco: t_barco, pos_inicial : t_casilla): boolean;
begin
    DisponibleVertical := false;
    if (pos_inicial.y <= (N - barco.vidas + 1)) then
        DisponibleVertical := true;
end;

end.