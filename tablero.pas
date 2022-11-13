unit Tablero;

{-----------------------------------------------}

interface

uses Global, crt;

type
t_tablero = array[1..N, 1..N] of boolean; // true: hay barco

// Retorna un tablero vacío.
function CrearTablero(): t_tablero;

// Setea verdadera una casilla.
procedure MarcarCasilla(var tablero : t_tablero; casilla : t_casilla);

// Setea falsa una casilla.
procedure VaciarCasilla(var tablero : t_tablero; casilla : t_casilla);

// Retorna verdadero si hay un barco en la coordenada x,y.
function CasillaMarcada(tablero : t_tablero; casilla : t_casilla): boolean;

// Retorna verdadero si el tablero está vacío.
function TableroVacio(tablero : t_tablero): boolean;

// Escribe el tablero en pantalla.
procedure EscribirTablero(tablero, tiros : t_tablero);

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

procedure MarcarCasilla(var tablero : t_tablero; casilla : t_casilla);
begin
    tablero[casilla.x,casilla.y] := true;
end;

procedure VaciarCasilla(var tablero : t_tablero; casilla : t_casilla);
begin
    tablero[casilla.x,casilla.y] := false;
end;

function CasillaMarcada(tablero : t_tablero; casilla : t_casilla): boolean;
begin
    CasillaMarcada := false;
    if tablero[casilla.x,casilla.y] then
        CasillaMarcada := true;
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

procedure EscribirTablero(tablero, tiros : t_tablero);
var
i : 1..N;
j : 1..N;
val : char;
begin
    gotoxy(2, 1);
    for i := 1 to N do
        write(columnas[i]);

    for i := 1 to N do
    begin
        gotoxy(1, (1+i));
        write(i);
    end;

    for j := 1 to N do
    begin
        gotoxy(2, (1+j));
        for i := 1 to N do
        begin
            val := '-';
            if tiros[i, j] then
            begin
                if tablero[i, j] then
                    val := 'o'
                else
                    val := 'x';
            end;
            write(val);
        end;
    end;
    write(sLineBreak);
    write(sLineBreak);
end;

end.