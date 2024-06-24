codeunit 50105 "Partial Records Mgt."
{
    procedure FindSetPartial()
    var
        Demo: Record Demo;
    begin
        Demo.SetRange("Car No.", 50);
        Demo.SetLoadFields(Amount);
        if Demo.FindSet() then
            repeat
            //business logic
            until Demo.Next() = 0;
    end;

    procedure FindSetNormal()
    var
        Demo: Record Demo;
    begin
        Demo.SetRange("Car No.", 50);
        if Demo.FindSet() then
            repeat
            //business logic
            until Demo.Next() = 0;
    end;
}