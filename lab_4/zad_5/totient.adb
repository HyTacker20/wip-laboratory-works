with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Totient is

    function GCD(X, Y : Positive) return Positive is
        A, B, C : Natural;
    begin
        A := X;
        B := Y;

        while B /= 0 loop
            C := A mod B;
            A := B;
            B := C;
        end loop;

        return Positive(A);
    end GCD;

    function Totient(N : Positive) return Positive is
        Count : Natural := 0;
    begin
        for I in 1 .. N loop
            if GCD(I, N) = 1 then
                Count := Count + 1;
            end if;
        end loop;

        return Positive(Count);
    end Totient;

    function Faster_Totient(N : Positive) return Positive is
        Count   : Natural := N;
        Temp_N  : Natural := N;
        I       : Natural := 2;
        Sqrt_N  : Natural := Natural(Sqrt(Float(N)));
    begin
        while I <= Sqrt_N loop
            if Temp_N mod I = 0 then
                while Temp_N mod I = 0 loop
                    Temp_N := Temp_N / I;
                end loop;
                Count := Count - (Count / I);
            end if;
            I := I + 1;
        end loop;

        if Temp_N > 1 then
            Count := Count - (Count / Temp_N);
        end if;

        return Positive(Count);
    end Faster_Totient;

end Totient;
