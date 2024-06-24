codeunit 50103 "Demo Without Mgt"
{
    procedure CountSalesInvoices(): Integer
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        //Error('Error');
        Sleep(10000);
        SalesInvoiceHeader.SetFilter("Posting Date", '<=%1', Today());
        exit(SalesInvoiceHeader.Count());
    end;

    procedure CountSalesCreditMemos(): Integer
    var
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin
        SalesCrMemoHeader.SetFilter("Posting Date", '<=%1', Today());
        exit(SalesCrMemoHeader.Count());
    end;
}