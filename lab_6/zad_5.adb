with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure N_Queens is
   Max : constant Integer := 12;
   type Position_Array is array (1 .. Max) of Integer;
   type Boolean_Array is array (1 .. Max) of Boolean;
   type Boolean_Array_Extended is array (1 .. 2 * Max) of Boolean;

   Position : Position_Array := (others => 0); 
   Bije_Wiersz : Boolean_Array := (others => False); 
   Bije_Przek1 : Boolean_Array_Extended := (others => False); 
   Bije_Przek2 : Boolean_Array_Extended := (others => False); 

   Solution_Count : Integer := 0;

   procedure Print_Solution is
   begin
      for I in 1 .. Max loop
         if Position(I) > 0 then
            Put(Integer'Image(Position(I)) & " ");
         end if;
      end loop;
      New_Line;
   end Print_Solution;


   procedure Ustaw(I : Integer; N : Integer) is
   begin
      for J in 1 .. N loop
         if not (Bije_Wiersz(J) or Bije_Przek1(I + J) or Bije_Przek2(I - J + N)) then
            Position(I) := J;
            Bije_Wiersz(J) := True;
            Bije_Przek1(I + J) := True;
            Bije_Przek2(I - J + N) := True;

            if I < N then
               Ustaw(I + 1, N);
            else
               Print_Solution;
               Solution_Count := Solution_Count + 1;
            end if;

            Position(I) := 0;
            Bije_Wiersz(J) := False;
            Bije_Przek1(I + J) := False;
            Bije_Przek2(I - J + N) := False;
         end if;
      end loop;
   end Ustaw;

   N : Integer;
begin
   Put("Input number of queens: ");
   Get(N);
   if N > 0 and N <= Max then
      Ustaw(1, N);
      Put_Line("Number of solutions: " & Integer'Image(Solution_Count));
   end if;
end N_Queens;
