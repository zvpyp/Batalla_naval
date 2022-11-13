unit Juego;

{-----------------------------------------------}

interface

uses tablero, barcos, barco, crt;

// Inicia el juego de la batalla naval.
procedure Jugar();

{-----------------------------------------------}

implementation

procedure Jugar();
var
tablero : t_tablero;
barcos : t_barcos;
jugando : boolean;
begin
    // Limpia el menú de la pantalla.
    clrscr;

    // Inicializa el tablero de juego.
    tablero := CrearTablero();

    // Iniciliza barcos en el tablero.
    barcos := CrearBarcos(tablero);

    // Loop de juego.
    jugando := true;

    EscribirBarcos(barcos);
    //EscribirTablero(tablero);

    //TODO:
    //while jugando do
    //begin

    end;
end.