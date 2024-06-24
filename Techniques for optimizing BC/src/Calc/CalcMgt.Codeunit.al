codeunit 50104 "Calc Mgt."
{
    procedure UsingCalcFields()
    var
        Customer: Record Customer;
    begin
        Customer.FindSet();
        repeat
            Customer.CalcFields(Balance);
        //business logic with Balance
        until Customer.Next() = 0;
    end;

    procedure UsingSetAutoCalcFields()
    var
        Customer: Record Customer;
    begin
        Customer.SetAutoCalcFields(Balance);
        Customer.FindSet();
        repeat
        //business logic with Balance
        until Customer.Next() = 0;
    end;

    procedure UsingCalcSums()
    var
        Customer: Record Customer;
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
    begin
        Customer.FindLast();
        DetailedCustLedgEntry.SetRange("Customer No.", Customer."No.");
        DetailedCustLedgEntry.CalcSums(Amount);

        Message(Format(DetailedCustLedgEntry.Amount));
    end;

    procedure WithoutCalcSums()
    var
        Customer: Record Customer;
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        TotalSum: Decimal;
    begin
        Customer.FindLast();
        DetailedCustLedgEntry.SetRange("Customer No.", Customer."No.");
        if DetailedCustLedgEntry.FindSet() then
            repeat
                TotalSum += DetailedCustLedgEntry.Amount;
            until DetailedCustLedgEntry.Next() = 0;

        Message(Format(TotalSum));
    end;
}