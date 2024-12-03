with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Zad_8 is

   procedure Read(a : out Integer) is
   begin
      Put_Line("Wpisz n: ");
      Get(a);
   end Read;

   procedure PrimeFactors(n : in out Integer) is  
      potega, i : Integer;
      is_prime : Boolean := True; 
   begin


      Put(n'Image & " = ");  

      potega := 0;
      while n mod 2 = 0 loop
         potega := potega + 1;
         n := n / 2;
      end loop;

      if potega > 0 then
         Put("2");
         if potega > 1 then
            Put("^" & potega'Image);
         end if;
         is_prime := False;
      end if;

      i := 3;
      while i <= Integer(Sqrt(Float(n))) loop
         potega := 0;
         while n mod i = 0 loop
            potega := potega + 1;
            n := n / i;
         end loop;

         if potega > 0 then
            if not is_prime then 
               Put("*");
            end if;
            Put(i'Image);
            if potega > 1 then
               Put("^" & potega'Image);
            end if;
            is_prime := False;
         end if;

         i := i + 2;
      end loop;

      if n > 1 then
         if not is_prime then
            Put("*");
         end if;
         Put(n'Image);
      end if;

      New_Line;
   end PrimeFactors;

   n : Integer;
begin
   Read(n);
   if n = 1 or else n = 0 then
      Put_Line("Nie ma czynnikow pierwszych.");
   else
      PrimeFactors(n);
   end if;
end Zad_8;
