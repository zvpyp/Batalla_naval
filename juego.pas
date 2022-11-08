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
jugando : boolean;
begin
    // Limpia el menú de la pantalla
    clrscr;

    // Inicializa el tablero de juego.
    tablero := CrearTablero();

    //TODO: Inicilizar barcos.

    // Loop de juego.
    jugando := true;

    //TODO: agregar barcos.

    //TODO:
    //while jugando do
    //begin

    end;
end;

end.