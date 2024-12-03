with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Zad_5 is
   function Dwumian_Newtona(N, K : Integer) return Long_Long_Integer is
      type Table_Type is array (Integer range <>, Integer range <>) of Long_Long_Integer;
      Tablica : Table_Type(0 .. N, 0 .. K);
   begin
      for I in 0 .. N loop
         for J in 0 .. K loop
            if J = 0 or else J = I then
               Tablica(I, J) := 1;
            elsif J < I then
               Tablica(I, J) := Tablica(I - 1, J - 1) + Tablica(I - 1, J);
            else
               Tablica(I, J) := 0;
            end if;
         end loop;
      end loop;

      return Tablica(N, K);
   end Dwumian_Newtona;

   N, K : Integer;
   Result : Long_Long_Integer;

begin
   Put("Podaj N: ");
   Get(N);
   Put("Podaj K: ");
   Get(K);

   if N < 0 or else K < 0 or else K > N then
      Put_Line("Error: niepoprawne dane - 0 <= K <= N.");
      return;
   end if;

   Result := Dwumian_Newtona(N, K);

   Put_Line("Dwumian Newtona dla N=" & Integer'Image(N) & " i K=" & Integer'Image(K) & ": " & Long_Long_Integer'Image(Result));
end Zad_5;
