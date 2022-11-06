unit Global;

interface

const
N = 6; // grilla de 6x6 en el tablero
type 
    t_casilla = record
        x := 1..N;
        y := 1..N;
    end;

end.