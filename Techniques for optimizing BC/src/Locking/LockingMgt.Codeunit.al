codeunit 50106 "Locking Mgt."
{
    local procedure TriStateLocking()
    var
        Item: Record Item;
    begin
        Item.FindFirst();

        Item.Description := 'demo desc';
        Item.Modify();

        DoCalculationsWithNewItem();
    end;

    local procedure DoCalculationsWithNewItem()
    var
        Item: Record Item;
    begin
        Item.FindLast();

        //some calculations
    end;
}