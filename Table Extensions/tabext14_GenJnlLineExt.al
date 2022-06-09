tableextension 50214 "GenJnlLineExt" extends "Gen. Journal Line"
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