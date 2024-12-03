with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Prime_Functions is

    type Sieve is array (Positive range <>) of Boolean;

   procedure Fill_Sieve(S : in out Sieve) is
   begin
      S(1) := False;
      for I in S'Range loop
         if I >= 2 then
            S(I) := True;
         else
            S(I) := False;
         end if;
      end loop;
   end Fill_Sieve;

   procedure Calculate_Sieve(S : in out Sieve; N : Natural) is
      Limit : Positive := Positive(Sqrt(Float(N)));
   begin
      for I in 2 .. Limit loop
         if S(I) then
            for J in I * I .. N loop
               if J mod I = 0 then
                  S(J) := False;
               end if;
            end loop;
         end if;
      end loop;
   end Calculate_Sieve;

    function Prime_Numbers(N : Natural) return Natural is
        Sieve_Array : Sieve(1..N);
        Count : Natural := 0;
    begin
        Fill_Sieve(Sieve_Array);
        Calculate_Sieve(Sieve_Array, N);

        for I in 2..N loop
            if Sieve_Array(I) then
                Count := Count + 1;
            end if;
        end loop;

        return Count;
    end Prime_Numbers;

    function Is_Prime(N : Natural) return Boolean is
    begin
        if N <= 1 then
            return False;
        elsif N = 2 then
            return True;
        elsif N mod 2 = 0 then
            return False;
        else
            for I in 3..Natural(Sqrt(Float(N))) loop
                if N mod I = 0 then
                    return False;
                end if;
            end loop;
        end if;
        return True;
    end Is_Prime;

    function Prime(N : Natural) return Natural is
        Limit : Natural := N * 10;
        Sieve_Array : Sieve(1..Limit);
        Count : Natural := 0;
        I     : Natural := 1;
    begin
        Fill_Sieve(Sieve_Array);
        Calculate_Sieve(Sieve_Array, Limit);

        while Count < N loop
            I := I + 1;
            if Sieve_Array(I) then
                Count := Count + 1;
            end if;
        end loop;

        return I;
    end Prime;

end Prime_Functions;
