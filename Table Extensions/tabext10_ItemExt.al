tableextension 50210 "ItemExt" extends "Item"
{
    fields
    {
        field(50200; "Group 2"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Group 2';
            TableRelation = "CSD Item Group".Code where(Type = const("Group 2"), "Parent Category" = field("Item Category Code"));
        }
        field(50201; "Group 3"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Group 3';
            TableRelation = "CSD Item Group".Code where(Type = const("Group 3"), "Parent Category" = field("Group 2"));
        }
        field(50202; "Group 4"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Group 4';
            TableRelation = "CSD Item Group".Code where(Type = const("Group 4"), "Parent Category" = field("Group 3"));
        }
        field(50203; "Group 5"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Group 5';
            TableRelation = "CSD Item Group".Code where(Type = const("Group 5"), "Parent Category" = field("Group 4"));
        }
        field(50204; "Difference"; Decimal)
        {
            Caption = 'Difference';
            DataClassification = ToBeClassified;
            // Editable = false;

        }
    }

    var
        myInt: Integer;
}