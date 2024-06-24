page 50105 "Car Totals Without Index"
{
    Caption = 'Car Totals Without Index';
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
                field("Total Amount 2"; Rec."Total Amount 2")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(InsertDemoData)
            {
                Caption = 'Insert Demo Data';
                ApplicationArea = All;

                trigger OnAction()
                var
                    DemoHelper: Codeunit "Demo Helper";
                begin
                    DemoHelper.InsertDemos();
                end;
            }

            action(InsertCarTotals)
            {
                Caption = 'Insert Car Totals';
                ApplicationArea = All;

                trigger OnAction()
                var
                    DemoHelper: Codeunit "Demo Helper";
                begin
                    DemoHelper.InsertTotals();
                end;
            }
        }
    }
}