with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Zad_2 is

   type Sieve is array (Positive range <>) of Boolean;

   procedure Input_Data(N : out Natural) is
   begin
      Put_Line("Podaj liczbe N (N > 2):");
      Get(N);
      if N <= 2 then
         Put_Line("Error: N musi byc wieksze od 2.");
         raise Constraint_Error;
      end if;
   end Input_Data;

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

   function Count_Primes(S : Sieve) return Natural is
      Count : Natural := 0;
   begin
      for I in S'Range loop
         if S(I) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end Count_Primes;

   procedure Print_Result(S : Sieve; Count : Natural) is
   begin
      Put_Line("Proste liczby (ilość - " & Natural'Image(Count) & "):");
      for I in S'Range loop
         if S(I) then
            Put(Integer'Image(I) & " ");
         end if;
      end loop;
      New_Line;
   end Print_Result;

   N : Natural;

begin
   Input_Data(N);

   declare
      Sieve_Array : Sieve(1 .. N);
   begin
      Fill_Sieve(Sieve_Array);
      Calculate_Sieve(Sieve_Array, N);

      declare
         Count : Natural := Count_Primes(Sieve_Array);
      begin
         Print_Result(Sieve_Array, Count);
      end;
   end;

end Zad_2;
