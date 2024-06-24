pageextension 50101 "Customer List" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(CalcFields)
            {
                Caption = 'Using CalcFields';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    CalcMgt: Codeunit "Calc Mgt.";
                begin
                    CalcMgt.UsingCalcFields();
                end;
            }
            action(SetAutoCalcFields)
            {
                Caption = 'Using SetAutoCalcFields';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    CalcMgt: Codeunit "Calc Mgt.";
                begin
                    CalcMgt.UsingSetAutoCalcFields();
                end;
            }
            action(CalcSums)
            {
                Caption = 'Using CalcSums';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    CalcMgt: Codeunit "Calc Mgt.";
                begin
                    CalcMgt.UsingCalcSums();
                end;
            }
            action(WithoutCalcSums)
            {
                Caption = 'Without CalcSums';
                ApplicationArea = All;
                Image = Calculate;

                trigger OnAction()
                var
                    CalcMgt: Codeunit "Calc Mgt.";
                begin
                    CalcMgt.WithoutCalcSums();
                end;
            }
        }
    }
}