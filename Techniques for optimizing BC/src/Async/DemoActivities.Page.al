page 50102 "Demo Activities"
{
    PageType = CardPart;
    Caption = 'Demo Activities';
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

                field(SalesInvoices; GetValueFromBackgroundTaskResult('Sales Invoices'))
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
                field(SalesCrMemos; GetValueFromBackgroundTaskResult('Sales Credit Memos'))
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

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"Demo Activities Bcg Task");
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Result: Dictionary of [Text, Text])
    begin
        Results := Result;
    end;

    trigger OnPageBackgroundTaskError(BackgroundTaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    begin
        if TaskId = BackgroundTaskId then
            Error('Error: %1', ErrorText);
    end;

    local procedure GetValueFromBackgroundTaskResult(KeyName: Text) Value: Integer
    begin
        if not Results.ContainsKey(KeyName) then
            exit(0);

        if not Evaluate(Value, Results.Get(KeyName), 9) then
            exit(0);
    end;

    var
        Results: Dictionary of [Text, Text];
        TaskId: Integer;
}