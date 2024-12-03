with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure gcd is
    a, b, c : Integer;
begin
    Put("Podaj pierwszą liczbę: ");
    Get(a);
    Put("Podaj drugą liczbę: ");
    Get(b);

    if a = 0 and b = 0 then
        Put_Line("Error!");
    else
        a := abs(a);
        b := abs(b);

        while b /= 0 loop
            c := a mod b;
            a := b;
            b := c;
        end loop;

        Put_Line("Największy wspólny dzielnik to " & a'Image);
    end if;
end gcd;