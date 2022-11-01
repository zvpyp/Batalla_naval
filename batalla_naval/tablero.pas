unit Tablero;

{-----------------------------------------------}

interface

// Retorna un tablero vacío
function crear_tablero(): t_tablero;

// Suma un barco a la coordenada x,y
procedure SumarBarco(var tablero : t_tablero; x : byte; y : byte);

// Elimina un barco de la coordenada x,y
procedure BorrarBarco(var tablero : t_tablero; x : byte; y : byte);

// Retorna verdadero si hay un barco en la coordenada x,y
function HayBarco(var tablero : t_tablero; x : byte; y : byte): boolean;

// Retorna verdadero si el tablero está vacío
function TableroVacio(tablero : t_tablero): boolean;

{-----------------------------------------------}

implementation

const
N = 6; // grilla de 6x6 en el tablero

type
t_tablero := array[1..N, 1..N] of boolean; // true: hay barco

function CrearTablero(): t_tablero;
var
i : 1..N;
j : 1..N;
begin
    for i := 1 to N do
    begin
        for j := 1 to N do
            crear_tablero[i, j] := false;
    end;
end;

procedure SumarBarco(var tablero : t_tablero; x : byte; y : byte);
begin
    tablero[x,y] := true;
end;

procedure BorrarBarco(var tablero : t_tablero; x : byte; y : byte);
begin
    tablero[x,y] := false;
end;

function HayBarco(tablero : t_tablero; x : byte; y : byte): boolean;
begin
    HayBarco := false;
    if tablero[x,y] then
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

end.