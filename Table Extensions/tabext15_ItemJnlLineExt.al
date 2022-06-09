tableextension 50215 "ItemJnlLineExt" extends "Item Journal Line"
{
    fields
    {
        field(50200; "Group 2"; Code[50])
        {
            Caption = 'Group 2';
        }
        field(50201; "Group 3"; Code[50])
        {
            Caption = 'Group 3';
        }
        field(50202; "Group 4"; Code[50])
        {
            Caption = 'Group 4';
        }
        field(50203; "Group 5"; Code[50])
        {
            Caption = 'Group 5';
        }
    }

    var
        myInt: Integer;
}