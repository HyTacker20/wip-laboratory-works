with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Mastermind is
   Length : constant Integer := 4;
   Digits_Count : constant Integer := 6;
   type Code_Type is array (1 .. Length) of Integer;
   type Code_Array is array (1 .. Digits_Count ** Length) of Code_Type;
   type Possible_Array is array (1 .. Digits_Count ** Length) of Boolean;

   procedure Print_Code(C : Code_Type) is
   begin
      for I in C'Range loop
         Put(Integer'Image(C(I)) & " ");
      end loop;
      New_Line;
   end Print_Code;

   procedure Check_Code(Guess, Secret : Code_Type; Correct_Positions, Correct_Digits : in out Integer) is
      Used_Secret : array (1 .. Length) of Boolean := (others => False);
      Used_Guess  : array (1 .. Length) of Boolean := (others => False);
   begin
      Correct_Positions := 0;
      Correct_Digits := 0;
      for I in 1 .. Length loop
         if Guess(I) = Secret(I) then
            Correct_Positions := Correct_Positions + 1;
            Used_Secret(I) := True;
            Used_Guess(I) := True;
         end if;
      end loop;
      for I in 1 .. Length loop
         if not Used_Guess(I) then
            for J in 1 .. Length loop
               if not Used_Secret(J) and then Guess(I) = Secret(J) then
                  Correct_Digits := Correct_Digits + 1;
                  Used_Secret(J) := True;
                  exit;
               end if;
            end loop;
         end if;
      end loop;
   end Check_Code;

   function Generate_All_Codes return Code_Array is
      All_Codes : Code_Array;
      Index : Integer := 1;
   begin
      for A in 1 .. Digits_Count loop
         for B in 1 .. Digits_Count loop
            for C in 1 .. Digits_Count loop
               for D in 1 .. Digits_Count loop
                  All_Codes(Index) := (A, B, C, D);
                  Index := Index + 1;
               end loop;
            end loop;
         end loop;
      end loop;
      return All_Codes;
   end Generate_All_Codes;

   function Check_If_Possible(Guess, Candidate : Code_Type; Current_Positions, Current_Digits : Integer) return Boolean is
      Checked_Positions, Checked_Digits : Integer;
   begin
      Check_Code(Guess, Candidate, Checked_Positions, Checked_Digits);
      return Checked_Positions = Current_Positions and Checked_Digits = Current_Digits;
   end Check_If_Possible;

   All_Codes : Code_Array := Generate_All_Codes;
   Possible : Possible_Array := (others => True);
   Guess_Count : Integer := 0;
   Max_Guesses : constant Integer := 8;

begin
   while Guess_Count < Max_Guesses loop
      declare
         Guess_Index : Integer := -1;
         Correct_Positions, Correct_Digits : Integer;
      begin
         for I in Possible'Range loop
            if Possible(I) then
               Guess_Index := I;
               exit;
            end if;
         end loop;

         if Guess_Index = -1 then
            Put_Line("Oszukujesz!");
            return;
         end if;

         Guess_Count := Guess_Count + 1;
         Put(Integer'Image(Guess_Count) & ": ");
         Print_Code(All_Codes(Guess_Index));

         Put("Na swoim miejscu: ");
         Get(Correct_Positions);
         Put("Nie na swoim miejscu: ");
         Get(Correct_Digits);

         if Correct_Positions = Length then
            Put_Line("Wygralem.");
            return;
         end if;

         for I in Possible'Range loop
            if Possible(I) and then not Check_If_Possible(All_Codes(Guess_Index), All_Codes(I), Correct_Positions, Correct_Digits) then
               Possible(I) := False;
            end if;
         end loop;
      end;
   end loop;

   Put_Line("Nie zgadlem kodu w " & Integer'Image(Max_Guesses) & " probach :(");
end Mastermind;
