unit Juego;

{-----------------------------------------------}

interface

uses tablero, crt;

// Inicia el juego de la batalla naval.
procedure Jugar();

{-----------------------------------------------}

implementation

procedure Jugar();
var
tablero : t_tablero;
begin
    // Limpia el menú de la pantalla
    clrscr;

    // inicia el tablero de juego.
    tablero := CrearTablero();

end;

end.