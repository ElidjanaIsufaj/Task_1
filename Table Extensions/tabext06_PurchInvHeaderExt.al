tableextension 50206 "PurchInvHeaderExt" extends "Purch. Inv. Header"
{
    fields
    {
        field(50200; "Group 1"; Code[50])
        {
            Caption = 'Group 1';
        }
        field(50201; "Group 2"; Code[50])
        {
            Caption = 'Group 2';
        }
        field(50202; "Group 3"; Code[50])
        {
            Caption = 'Group 3';
        }
    }

    var
        myInt: Integer;
}