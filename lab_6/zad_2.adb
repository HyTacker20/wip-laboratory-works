with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure N_Queens is
   type Array_Type is array (Positive range <>) of Positive;
   Solution_Count : Integer := 0;

   procedure Swap(A : in out Array_Type; I, J : Integer) is
      Temp : Positive := A(I);
   begin
      A(I) := A(J);
      A(J) := Temp;
   end Swap;

   function Check(A : Positive; Index_A : Integer; B : Positive; Index_B : Integer) return Boolean is
   begin
      return A - Index_A = B - Index_B or else A + Index_A = B + Index_B;
   end Check;

   procedure Generate_Permutation(A : in out Array_Type; Start, N : Integer) is
      Result : Boolean := False;
   begin
      if Start = N then
         for I in 1 .. N loop
            for J in I + 1 .. N loop
               if Check(A(I), I, A(J), J) then
                  Result := True;
               end if;
            end loop;
         end loop;

         if not Result then
            Solution_Count := Solution_Count + 1;
            for I in 1 .. N loop
               Put(A(I)'Img & " ");
            end loop;
            New_Line;
         end if;
      else
         for I in Start .. N loop
            Swap(A, Start, I);
            Generate_Permutation(A, Start + 1, N);
            Swap(A, Start, I);
         end loop;
      end if;
   end Generate_Permutation;

begin
   Put("Input number of queens: ");
   declare
      N : Integer;
   begin
      Get(N);
      declare
         A : Array_Type(1 .. N);
      begin
         for I in A'Range loop
            A(I) := I;
         end loop;

         Generate_Permutation(A, 1, N);
         Put_Line("Number of solutions: " & Solution_Count'Img);
      end;
   end;
end N_Queens;
