with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Prime_Functions;

procedure Main is
    Command : String(1..2);
    Number  : Natural;
    Result  : Natural;
    IsPrime : Boolean;
begin
    if Argument_Count < 2 then
        Put_Line("Error: Invalid input!");
        return;
    end if;

    Command := Argument(1)(1..2);
    Number := Integer'Value(Argument(2));

    if Command = "pn" then
        Result := Prime_Functions.Prime_Numbers(Number);
        Put_Line(Result'Image);
    elsif Command = "ip" then
        IsPrime := Prime_Functions.Is_Prime(Number);
        if IsPrime then
            Put_Line("true");
        else
            Put_Line("false");
        end if;
    elsif Command = "pr" then
        Result := Prime_Functions.Prime(Number);
        Put_Line(Result'Image);
    else
        Put_Line("Error: Unknown command!");
    end if;
end Main;
