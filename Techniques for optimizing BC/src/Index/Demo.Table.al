table 50101 "Demo"
{
    Caption = 'Demo';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Description"; Text[500])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Description 2"; Text[500])
        {
            Caption = 'Description 2';
            DataClassification = CustomerContent;
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(5; "Amount 2"; Decimal)
        {
            Caption = 'Amount 2';
            DataClassification = CustomerContent;
        }
        field(8; "Car No."; Integer)
        {
            Caption = 'Car No.';
            DataClassification = CustomerContent;
        }
        field(9; "Car No. 2"; Integer)
        {
            Caption = 'Car No. 2';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key4; "Car No. 2")
        {
        }
        key(Key5; "Car No.")
        {
            IncludedFields = Amount;
        }
    }
}