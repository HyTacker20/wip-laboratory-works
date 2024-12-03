with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure zad_8 is
    n, p, original, reversed, remainder : Integer;
begin
    Put("Podaj liczbę n: ");
    Get(n);
    Put("Podaj podstawę p: ");
    Get(p);

    original := n;
    reversed := 0;
    
    while n > 0 loop
        remainder := n mod p;
        reversed := reversed * p + remainder;
        n := n / p;
    end loop;

    Put_Line("Palindrom?");
    if reversed=original then
        Put_Line("Tak!");
    else
        Put_Line("Nie!");
    end if;
    
end zad_8;