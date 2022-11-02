unit Menu;

{-----------------------------------------------}

interface

uses crt;

// Muestra el menú de opciones. Retorna la opción elegida.
function MenuPrincipal(): char;

// Muestra un menú de cambio de color. Cambiar el color de la pantalla.
procedure CambiarColor();

// Devuelve las configuraciones del sistema al predeterminado y limpia la pantalla.
procedure Salir();

{-----------------------------------------------}

implementation

// mostrar el menú de opciones. Retorna la opción elegida.
function MenuPrincipal(): char;
begin
    MenuPrincipal := '0';

    while (MenuPrincipal < '1') OR (MenuPrincipal > '3') do
    begin
        writeln('1 - Jugar');
        writeln('2 - Cambiar Tema');
        writeln('3 - Salir');

        MenuPrincipal := ReadKey();
        clrscr;
    end;
end;

procedure CambiarColor();
var
opt : char;
color_letra : byte;
color_fondo : byte;
begin
    opt := '0';

    while (opt < '1') OR (opt > '5') do
    begin
        writeln('1 - Predeterminado');
        writeln('2 - Invertido');
        writeln('3 - Suave');
        writeln('4 - Rosa');
        writeln('5 - Naturaleza');

        opt := ReadKey();
        clrscr;
    end;

    case opt of
    '1': begin 
            color_letra := 15;
            color_fondo := 0;
        end;
    '2': begin 
            color_letra := 0;
            color_fondo := 15;
        end;
    '3': begin 
            color_letra := 7;
            color_fondo := 3;
        end;
    '4': begin 
            color_letra := 15;
            color_fondo := 12;
        end;
    '5': begin 
            color_letra := 11;
            color_fondo := 2;
        end;
    end;

    TextColor(color_letra);
    TextBackground(color_fondo);
    clrscr;
end;

procedure Salir();
begin
    // Devolver al tema original
    TextColor(15);
    TextBackground(0);
    clrscr;
end;
end.