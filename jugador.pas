unit Jugador;

{-----------------------------------------------}

interface

uses Global, sysutils, crt;

// Pide un input valido al jugador y lo retorna en forma de casilla.
function LeerCasilla(): t_casilla;

// Muestra un mensaje de barco hundido al jugador.
procedure MensajeHundido();

// Muestra el mensaje de ganador.
procedure MensajeGanador();

// Muestra el mensaje de perdedor.
procedure MensajePerdedor();

{-----------------------------------------------}

implementation

// convierte una letra en el número correspondido.
function EnumerarLetra(letra : shortstring): byte;
var
i : 1..N;
begin
    letra := upcase(letra);

    for i := 1 to N do
    begin
        if letra = columnas[i] then
            EnumerarLetra := i;
    end;
end;

function LeerCasilla(): t_casilla;
var
input : string;
columna_valida : boolean;
fila_valida : boolean;
begin
    columna_valida := false;
    fila_valida := false;

    repeat
        readln(input);
        input := lowercase(input);

        columna_valida := (copy(input, 1, 1) >= 'a') and (copy(input, 1, 1) <= 'f');
        fila_valida := (copy(input, 2, 1) >= '1') and (copy(input, 2, 1) <= '6');
    until fila_valida and columna_valida and (length(input) = 2);

    LeerCasilla.x := EnumerarLetra(input[1]);
    LeerCasilla.y := StrToInt(copy(input, 2, 1));
end;

procedure MensajeHundido();
var
i : 1..10;
begin
    clrscr;

    for i := 1 to 10 do
    begin
        gotoxy(10, i+3);
        writeln('BARCO HUNDIDO');
        delay(50);
    end;

    for i := 1 to 10 do
    begin
        gotoxy(10, i+3);
        writeln('             ');
        delay(50);
    end;

    clrscr;
end;

procedure MensajeGanador();
var
i : 3..13;
begin
    clrscr;
    for i := 3 to 13 do
    begin
        gotoxy(i*2, i);
        write('¡HAS GANADO!');
        delay(100);
    end;
    clrscr;

    for i := 3 to 13 do
    begin
        gotoxy((16-i), i);
        write('¡HAS GANADO!');
        delay(100);
    end;
    clrscr;

    for i := 3 to 13 do
    begin
        gotoxy(13, i);
        write('¡HAS GANADO!');
        delay(100);
    end;
    clrscr;
end;

procedure MensajePerdedor();
var
i : 3..13;
j : 3..13;
begin
    clrscr;
    for j := 3 to 13 do
    begin
        for i := 3 to 13 do
        begin
            if (j mod 2) = 0 then
                gotoxy((16-i),j)
            else
                gotoxy(i,j);
            write('PERDISTE');
            delay(20);
            clrscr;
        end;
    end;
end;

end.