with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Zad_5 is
    a, n, result : Integer;
    procedure read(a : out Integer) is
    begin
        Put("Podaj n: ");
        Get(a);
    end read;

    function IsPrime(n : in Integer) return Integer is
        i, s : Integer;
    begin
        if n <= 1 then
            return 0;
        end if;

        if n = 2 then
            return 1;
        end if;

        if n mod 2 = 0 then
            return 0;
        end if;

        i := 3;
        s := Integer(Sqrt(Float(n)));
        while i <= s loop
            if n mod i = 0 then
                return 0;
            else
                i := i + 2;
            end if;
        end loop;

        return 1;
    end IsPrime;

begin
    read(n);
    result := IsPrime(n);

    if result = 1 then
        Put_Line("Pierwsza");
    else
        Put_Line("Nie pierwsza");
    end if;
end Zad_5;
