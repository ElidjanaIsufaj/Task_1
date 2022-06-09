tableextension 50203 "CustLedgerEntryExt" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50200; "Group 1"; Code[50])
        {
            Caption = 'Group 1';
            // FieldClass = FlowField;
            // CalcFormula = Lookup("Customer"."Group 1" where("No." = Field("Customer No.")));
        }
        field(50201; "Group 2"; Code[50])
        {
            Caption = 'Group 2';
            // FieldClass = FlowField;
            // CalcFormula = Lookup("Customer"."Group 2" where("No." = Field("Customer No.")));
        }
        field(50202; "Group 3"; Code[50])
        {
            Caption = 'Group 3';
            // FieldClass = FlowField;
            // CalcFormula = Lookup("Customer"."Group 3" where("No." = Field("Customer No.")));
        }
    }

    var
        myInt: Integer;
}