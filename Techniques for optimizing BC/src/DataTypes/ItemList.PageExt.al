pageextension 50100 "Item List Ext." extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(ExportItems)
            {
                Caption = 'Export Items';
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()
                var
                    DataTypes: Codeunit "Data Types";
                begin
                    DataTypes.TextBuilder();
                end;
            }
        }
    }
}