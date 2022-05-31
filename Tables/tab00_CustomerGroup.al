table 50200 "CSD Customer Group"
{
    DataClassification = ToBeClassified;
    Caption = 'Customer Group';
    LookupPageId = "CSD Customer Group List";
    DrillDownPageId = "CSD Customer Group List";

    fields
    {
        field(10; "Type"; Enum Type)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(20; Code; Code[50])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(30; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(40; "Parent Category"; Code[50])
        {
            Caption = 'Parent Category';
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const("Group 2")) "CSD Customer Group".Code where(Type = const("Group 1"))
            else
            if (Type = const("Group 3")) "CSD Customer Group".Code where(Type = const("Group 2"));
        }
    }

    keys
    {
        key(PK; Type, Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}