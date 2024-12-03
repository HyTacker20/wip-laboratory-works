with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Zad_5 is
    a, b, c, d, x1, x2: Float;
begin
    Put("Podaj współczynnik a: ");
    Get(a);
    Put("Podaj współczynnik b: ");
    Get(b);
    Put("Podaj współczynnik c: ");
    Get(c);

    d := b * b - 4.0 * a * c;

    if d < 0.0 then
        Put_Line("Brak rozwiązań rzeczywistych.");

    elsif d = 0.0 then

        x1 := -b / (2.0 * a);
        Put_Line("Jedno rozwiązanie: " & x1'Image);

    else
        x1 := (-b - Sqrt(d)) / (2.0 * a);
        x2 := (-b + Sqrt(d)) / (2.0 * a);
        Put("Dwa rozwiązania: x1 = " & x1'Image);
        Put(", x2 = " & x2'Image);
        
    end if;

end Zad_5;
