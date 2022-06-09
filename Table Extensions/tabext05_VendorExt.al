tableextension 50205 "VendorExt" extends Vendor
{
    fields
    {
        field(50200; "Group 1"; Code[50])
        {
            Caption = 'Group 1';
            DataClassification = ToBeClassified;
            TableRelation = "CSD Vendor Group".Code where(Type = const("Group 1"));
        }
        field(50201; "Group 2"; Code[50])
        {
            Caption = 'Group 2';
            DataClassification = ToBeClassified;
            TableRelation = "CSD Vendor Group".Code where(Type = const("Group 2"), "Parent Category" = field("Group 1"));
        }
        field(50202; "Group 3"; Code[50])
        {
            Caption = 'Group 3';
            DataClassification = ToBeClassified;
            TableRelation = "CSD Vendor Group".Code where(Type = const("Group 3"), "Parent Category" = field("Group 2"));
        }
    }

    var
        myInt: Integer;
}