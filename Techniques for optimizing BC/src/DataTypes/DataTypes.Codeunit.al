codeunit 50100 "Data Types"
{
    procedure TextBuilder()
    var
        TextBuilder: TextBuilder;
        Item: Record Item;
        ItemsText: Text;
    begin
        TextBuilder.AppendLine('Item No.' + ',' + 'Item Description');

        if Item.FindSet() then
            repeat
                TextBuilder.AppendLine(Item."No." + ',' + Item.Description);
            until Item.Next() = 0;

        ItemsText := TextBuilder.ToText();

        ExportItemsFile(ItemsText);
    end;

    local procedure ExportItemsFile(ItemsText: Text)
    var
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;
        InStream: InStream;
        FileName: Text;
    begin
        TempBlob.CreateOutStream(OutStream);
        OutStream.WriteText(ItemsText);
        TempBlob.CreateInStream(InStream);

        FileName := Format(CurrentDateTime()) + '.txt';
        DownloadFromStream(InStream, '', '', '', FileName);
    end;
}