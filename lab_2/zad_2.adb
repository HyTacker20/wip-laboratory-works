with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure gcd is
    function euklid_algorytm(x: in Integer; y: in Integer) return Integer is
        a, b, c: Integer;
    begin
        a:= x;
        b:= y;
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

        end if;
        return a;
    end euklid_algorytm;

a, b, result: Integer;    
begin
    Put("Podaj pierwszą liczbę: ");
    Get(a);
    Put("Podaj drugą liczbę: ");
    Get(b);

    result := euklid_algorytm(a, b);
    Put_Line("Największy wspólny dzielnik to " & result'Image);

end gcd;