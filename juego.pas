unit Juego;

{-----------------------------------------------}

interface

uses global, tablero, barcos, barco, jugador, crt;

// Inicia el juego de la batalla naval.
procedure Jugar();

{-----------------------------------------------}

implementation

procedure Jugar();
var
tablero : t_tablero;
tiros : t_tablero;
barcos : t_barcos;
jugando : boolean;
vidas : 0..5; // vidas totales del jugador
casilla_seleccionada : t_casilla;
i : 1..4;
begin
    // Limpia el menú de la pantalla.
    clrscr;

    // Inicializa tablero, tablero de tiros, barcos y vidas.
    tablero := CrearTablero();
    tiros := CrearTablero();
    barcos := CrearBarcos(tablero);
    vidas := 5;

    

    // Loop de juego.
    jugando := true;
    while jugando do
    begin
        // Muestra el tablero de juego con los disparos y aciertos.
        EscribirTablero(tablero, tiros);

        // Muestra las vidas del jugador.
        writeln('Vidas: ', vidas);
        write(sLineBreak);

        // Pide al jugador el input.
        write('¡DISPARE!: ');
        repeat
        casilla_seleccionada := LeerCasilla();
        until not(CasillaMarcada(tiros, casilla_seleccionada));

        // Marca el disparo en el tablero de tiros.
        MarcarCasilla(tiros, casilla_seleccionada);

        // Le quita una vida al barco que posea esa casilla, si existe.
        // Sino le quita una vida al jugador.
        if CasillaMarcada(tablero, casilla_seleccionada) then
        begin
            for i := 1 to 4 do
            begin
                if OcupaCasilla(barcos[i], casilla_seleccionada) then
                begin
                    QuitarVida(barcos[i]);
                    if BarcoHundido(barcos[i]) then
                        MensajeHundido();
                end; 
            end;
        end
        else
        begin
            vidas := vidas - 1;
        end;

        // Verifica si el ganador perdió. Sino, verifica si ganó.
        if vidas = 0 then
            jugando := false
        else
        begin
            jugando := false;
            for i := 1 to 4 do
            begin
                // si existe algun barco con vidas, entonces se sigue jugando.
                if barcos[i].vidas > 0 then
                    jugando := true;
            end;
        end;

        clrscr;
    end;

    if vidas > 0 then
    begin
        MensajeGanador();
    end
    else
    begin
        MensajePerdedor();
    end;

end;
end.