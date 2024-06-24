codeunit 50101 "Demo Activities Bcg Task"
{
    trigger OnRun()
    begin
        CalculateDemoActivities();
    end;

    local procedure CalculateDemoActivities()
    var
        Result: Dictionary of [Text, Text];
    begin
        Result.Add('Sales Invoices', Format(CountSalesInvoices()));
        Result.Add('Sales Credit Memos', Format(CountSalesCreditMemos()));

        Page.SetBackgroundTaskResult(Result);
    end;

    local procedure CountSalesInvoices(): Integer
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        //Error('Error');
        Sleep(10000);
        SalesInvoiceHeader.SetFilter("Posting Date", '<=%1', Today());
        exit(SalesInvoiceHeader.Count());
    end;

    local procedure CountSalesCreditMemos(): Integer
    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin
        SalesCrMemoHeader.SetFilter("Posting Date", '<=%1', Today());
        exit(SalesCrMemoHeader.Count());
    end;
}