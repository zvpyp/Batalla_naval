unit Tablero;

{-----------------------------------------------}

interface

uses Global;

type
t_tablero = array[1..N, 1..N] of boolean; // true: hay barco

// Retorna un tablero vacío.
function CrearTablero(): t_tablero;

// Suma un barco a la coordenada x,y.
procedure SumarBarco(var tablero : t_tablero; casilla : t_casilla);

// Elimina un barco de la coordenada x,y.
procedure BorrarBarco(var tablero : t_tablero; casilla : t_casilla);

// Retorna verdadero si hay un barco en la coordenada x,y.
function HayBarco(tablero : t_tablero; casilla : t_casilla): boolean;

// Retorna verdadero si el tablero está vacío.
function TableroVacio(tablero : t_tablero): boolean;

// Escribe el tablero en pantalla.
procedure EscribirTablero(tablero : t_tablero);

{-----------------------------------------------}

implementation

function CrearTablero(): t_tablero;
var
i : 1..N;
j : 1..N;
begin
    for i := 1 to N do
    begin
        for j := 1 to N do
            CrearTablero[i, j] := false;
    end;
end;

procedure SumarBarco(var tablero : t_tablero; casilla : t_casilla);
begin
    tablero[casilla.x,casilla.y] := true;
end;

procedure BorrarBarco(var tablero : t_tablero; casilla : t_casilla);
begin
    tablero[casilla.x,casilla.y] := false;
end;

function HayBarco(tablero : t_tablero; casilla : t_casilla): boolean;
begin
    HayBarco := false;
    if tablero[casilla.x,casilla.y] then
        HayBarco := true;
end;

function TableroVacio(tablero : t_tablero): boolean;
var
i : 1..N;
j : 1..N;
begin
    TableroVacio := true;
    for i := 1 to N do
    begin
        for j := 1 to N do
        begin
            if tablero[i, j] then
                TableroVacio := false; 
        end;
    end;
end;

procedure EscribirTablero(tablero : t_tablero);
var
i : 1..N;
j : 1..N;
val : char;
begin
    for j := 1 to N do
        begin
            for i := 1 to N do
                begin
                    val := '-';
                    if tablero[i, j] then
                        val := 'o';
                    write(val);
                end;
            write(sLineBreak);
        end;
end;

end.