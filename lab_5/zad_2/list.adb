with Ada.Text_IO; use Ada.Text_IO;


package body list is

   function isEmpty (l : ListT) return Boolean is
   begin
      return l.first = null;
   end isEmpty;

   function Pop (l : in out ListT) return Integer is
      n : NodePtr := l.first;
      e : Integer := n.elem;
   begin
      l.first := n.next;
      if l.first = null then
         l.last := null;
      end if;
      Free (n);
      l.length := l.length - 1;
      return e;
   end Pop;

   procedure Push (l : in out ListT; e : Integer) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      n.next := l.first;
      l.first := n;
      if l.last = null then
         l.last := n;
      end if;
      l.length := l.length + 1;
   end Push;

   procedure Append (l : in out ListT; e : Integer) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      if l.first = null then
         l.first := n;
      else
         l.last.next := n;
      end if;
      l.last := n;
      l.length := l.length + 1;
   end Append;

   function Get (l : ListT; i : Integer) return Integer is
      n : NodePtr := l.first;
   begin
      if i < 1 or i > l.length then
         raise Constraint_Error with "Bad index!";
      end if;
      for k in 1 .. i - 1 loop
         n := n.next;
      end loop;
      return n.elem;
   end Get;

   procedure Put (l : in out ListT; i : Integer; e : Integer) is
      n : NodePtr := l.first;
   begin
      if i < 1 or i > l.length then
         raise Constraint_Error with "Bad index!";
      end if;
      for k in 1 .. i - 1 loop
         n := n.next;
      end loop;
      n.elem := e;
   end Put;

   procedure Insert (l : in out ListT; i : Integer; e : Integer) is
      n : NodePtr := new Node;
      current : NodePtr := l.first;
      prev : NodePtr := null;
   begin
      if i < 1 or i > l.length + 1 then
         raise Constraint_Error with "Bad index!";
      end if;

      n.elem := e;

      if i = 1 then
         Push (l, e);
      elsif i = l.length + 1 then
         Append (l, e);
      else
         for k in 1 .. i - 1 loop
            prev := current;
            current := current.next;
         end loop;
         prev.next := n;
         n.next := current;
         l.length := l.length + 1;
      end if;
   end Insert;

   procedure Delete (l : in out ListT; i : Integer) is
      current : NodePtr := l.first;
      prev : NodePtr := null;
   begin
      if i < 1 or i > l.length then
         raise Constraint_Error with "Bad index!";
      end if;

      if i = 1 then
         declare
            temp : Integer := Pop(l);
         begin
            null;
         end;
      else
         for k in 1 .. i - 1 loop
            prev := current;
            current := current.next;
         end loop;
         prev.next := current.next;
         if current = l.last then
            l.last := prev;
         end if;
         Free (current);
         l.length := l.length - 1;
      end if;
   end Delete;

   procedure Print (l : ListT) is
      n : NodePtr := l.first;
   begin
      Put_Line("");
      while n /= null loop
         Put_Line(n.elem'Image & " ");
         n := n.next;
      end loop;
      Put_Line("(" & l.length'Image & ")");
   end Print;

   procedure Clean (l : in out ListT) is
   begin
      while not isEmpty (l) loop
         declare
            temp : Integer := Pop(l);
         begin
            null;
         end;
      end loop;
   end Clean;

   function Length (l : ListT) return Integer is
   begin
      return l.length;
   end Length;

end list;
