with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use  Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

with list; use list;

procedure Lab_5 is
   l : ListT;
   r : Integer;
   command : Unbounded_String;
   continue : Boolean := True;
begin
   while continue loop
      Put ("Command: ");
      Get_Line (command);
      if command = "pop" then
         if not isEmpty (l) then
            r := Pop (l);
            Put_Line ("Result: " & r'Image);
         else
            Put_Line ("Error - stack is empty!");
         end if;
      elsif command = "push" then
         Put ("Value: ");
         Get (r);
         Skip_Line;
         Push (l, r);
         Put_Line ("Result: OK");
      elsif command = "append" then
         Put ("Value: ");
         Get (r);
         Skip_Line;
         Append (l, r);
         Put_Line ("Result: OK");
      elsif command = "print" then
         Put ("Result: ");
         Print (l);
      elsif command = "length" then
         r := Length (l);
         Put_Line ("Result: " & r'Image);
      elsif command = "exit" then
         continue := False;

      elsif command = "get" then
         Put ("Index: ");
         Get (r);
         begin
            Put_Line ("Result: " & Get (l, r)'Image);
         exception
            when Constraint_Error =>
               Put_Line ("Error - bad index!");
         end;

      elsif command = "put" then
         Put ("Index: ");
         Get (r);
         Put ("Value: ");
         declare
            v : Integer;
         begin
            Get (v);
            Put (l, r, v);
            Put_Line ("Result: OK");
         exception
            when Constraint_Error =>
               Put_Line ("Error - bad index!");
               Skip_Line;
         end;

      elsif command = "insert" then
         Put ("Index: ");
         Get (r);
         Put ("Value: ");
         declare
            v : Integer;
         begin
            Get (v);
            Insert (l, r, v);
            Put_Line ("Result: OK");
         exception
            when Constraint_Error =>
               Put_Line ("Error - bad index!");
               Skip_Line;
         end;

      elsif command = "delete" then
         Put ("Index: ");
         Get (r);
         begin
            Delete (l, r);
            Put_Line ("Result: OK");
         exception
            when Constraint_Error =>
               Put_Line("Error - bad index!");
               Skip_Line;
         end;

      elsif command = "clean" then
         Clean (l);
         Put_Line ("Result: OK");

      else
         Put_Line ("Unknown command!");
      end if;
   end loop;
end Lab_5;
