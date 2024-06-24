table 50105 "Car Total"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Car No."; Integer)
        {
            Caption = 'Car No.';
            DataClassification = CustomerContent;
        }
        field(3; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Demo".Amount where("Car No." = field("Car No.")));
        }

        field(4; "Total Amount 2"; Decimal)
        {
            Caption = 'Total Amount 2';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Demo"."Amount 2" where("Car No. 2" = field("Car No.")));
        }
        field(6; "Car Name"; Text[50])
        {
            Caption = 'Car Name';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
}