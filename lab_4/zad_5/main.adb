with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Totient;

procedure Main is
begin
    if Argument_Count = 0 then
        Put_Line("Error: No numbers provided.");
        return;
    end if;

    for I in 1 .. Argument_Count loop
        declare
            Number  : Positive;
            Result  : Positive;
        begin
            Number := Positive'Value(Argument(I));
            
            Result := Totient.Totient(Number);
            Put_Line("Totient(" & Number'Img & " ) = " & Result'Img);
        exception
            when Constraint_Error =>
                Put_Line("Error: Invalid number '" & Argument(I) & "'.");
        end;
    end loop;

    for I in 1 .. Argument_Count loop
        declare
            Number  : Positive;
            Result  : Positive;
        begin
            Number := Positive'Value(Argument(I));

            Result := Totient.Faster_Totient(Number);
            Put_Line("Faster Totient("& Number'Img & " ) = " & Result'Img);
        exception
            when Constraint_Error =>
                Put_Line("Error: Invalid number '" & Argument(I) & "'.");
        end;
    end loop;
end Main;
