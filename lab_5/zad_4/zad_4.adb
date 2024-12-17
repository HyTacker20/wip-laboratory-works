with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Find_Zero is
   type Functype is access function (X : Float) return Float;

   procedure Find_Zero (F : Functype; A, B, Eps : Float) is
      Start  : Float := A;
      End_   : Float := B;
      Middle : Float;
      Result : Float;
   begin
      if F(A) * F(B) > 0.0 then
         Put_Line ("ERROR!");
         return;
      end if;

      while abs(End_ - Start) >= Eps loop
         Middle := (Start + End_) / 2.0;

         if F(Middle) = 0.0 then
            Put_Line ("FOUND! " & Float'Image (Middle));
            return;
         elsif F(Start) * F(Middle) < 0.0 then
            End_ := Middle;
         else
            Start := Middle;
         end if;
      end loop;

      Put_Line ("Zero = " & Float'Image ((Start + End_) / 2.0));
   end Find_Zero;

   function Cos_Half (X : Float) return Float is
   begin
      return Cos(X / 2.0);
   end Cos_Half;

begin
   Find_Zero (Cos_Half'Access, 2.0, 4.0, 0.001);
end Find_Zero;