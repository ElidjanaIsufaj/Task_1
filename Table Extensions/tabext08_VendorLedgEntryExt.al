tableextension 50208 "VendorLedgerEntryExt" extends "Vendor Ledger Entry"
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