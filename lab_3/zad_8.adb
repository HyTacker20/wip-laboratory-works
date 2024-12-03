with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Zad_8 is
   subtype Sieve_Index is Positive;
   type Sieve is array (Sieve_Index range <>) of Boolean;

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

   N : Natural;
   Upper_Limit : Natural;

begin
   Put("Podaj N: ");
   Get(N);

   if N < 5 then
      Upper_Limit := (N * 2) + 1;
   else
      Upper_Limit := N + (Natural(Float(N) * (Log(Float(N)) + Log(Log(Float(N))))));
   end if;

   declare
      Sieve_Array : Sieve(1 .. Upper_Limit);
   begin
      Fill_Sieve(Sieve_Array);
      Calculate_Sieve(Sieve_Array, Upper_Limit);

      Count : Natural := 0;
      I : Natural := 0;

      while Count < N loop
         I := I + 1;
         if Sieve_Array(I) then
            Count := Count + 1;
         end if;
      end loop;

      Put_Line("The " & Natural'Image(N) & "-th prime number is: " & Natural'Image(I));
   end;

end Zad_8;
