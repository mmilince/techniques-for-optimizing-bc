page 50104 "Car Totals"
{
    Caption = 'Car Totals Included Fields';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Car Total";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Car Name"; Rec."Car Name")
                {
                    ToolTip = 'Specifies the value of the Car Name field.';
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}