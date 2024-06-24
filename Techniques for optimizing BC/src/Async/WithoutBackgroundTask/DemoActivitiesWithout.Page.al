page 50107 "Demo Activities Without"
{
    PageType = CardPart;
    Caption = 'Demo Activities Without Backgound Task';
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            cuegroup(Control50100)
            {
                Caption = 'Demo';
                ShowCaption = true;

                field(SalesInvoices; SalesInvoiceCount)
                {
                    Caption = 'Sales Invoices';
                    ToolTip = 'Specifies the number of the posted sales invoices.';
                    ApplicationArea = All;
                    AutoFormatType = 11;
                    AutoFormatExpression = '<Precision,0:0><Standard Format,0>';

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Posted Sales Invoices");
                        CurrPage.Update(false);
                    end;
                }
                field(SalesCrMemos; SalesCrMemoCount)
                {
                    Caption = 'Sales Credit Memos';
                    ToolTip = 'Specifies the number of the posted sales credit memos.';
                    ApplicationArea = All;
                    AutoFormatType = 11;
                    AutoFormatExpression = '<Precision,0:0><Standard Format,0>';

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Posted Sales Credit Memos");
                        CurrPage.Update(false);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        DemoWithoutMgt: Codeunit "Demo Without Mgt";
    begin
        SalesInvoiceCount := DemoWithoutMgt.CountSalesInvoices();
        SalesCrMemoCount := DemoWithoutMgt.CountSalesCreditMemos();
    end;

    var
        SalesInvoiceCount: Integer;
        SalesCrMemoCount: Integer;
}