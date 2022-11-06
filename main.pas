Program BatallaNaval;

uses crt, menu, juego;

var
opt : char;

{ Programa principal }
begin
    // Limpiar pantalla al iniciar.
    clrscr;

    opt := '0';

    // loop principal de juego
    // 1 - Jugar
    // 2 - Cambiar Tema
    // 3 - Salir
    while (opt <> '3') do
    begin
        opt := MenuPrincipal();

        case opt of
            '1': Jugar();
            '2': CambiarColor();
        end;
    end;

    Salir();
end.