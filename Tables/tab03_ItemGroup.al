table 50202 "CSD Item Group"
{
    DataClassification = ToBeClassified;
    Caption = 'Item Group';
    LookupPageId = "CSD Item Group List";
    DrillDownPageId = "CSD Item Group List";

    fields
    {
        field(1; Type; Enum "CSD Item Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Type';
            // trigger OnValidate()
            // begin
            //     if (Type = Type::"Group 2") then BEGIN
            //         if ("Parent Category" <> '') then
            //             Error(Text00);
            //     end;
            // end;
        }
        field(2; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(3; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(4; "Parent Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Parent Category';
            TableRelation = if (Type = const("Group 2")) "Item Category".Code
            else
            if (Type = const("Group 3")) "CSD Item Group".Code where(Type = const("Group 2"))
            else
            if (Type = const("Group 4")) "CSD Item Group".Code where(Type = const("Group 3"))
            else
            if (Type = const("Group 5")) "CSD Item Group".Code where(Type = const("Group 4"));
            trigger OnValidate()
            begin
                if ((Type = Type::"Group 2") or (Type = Type::"Group 3") or (Type = Type::"Group 4") or (Type = Type::"Group 5")) then BEGIN
                    if ("Parent Category" = '') then
                        Error(Text01);
                end
            end;
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
        Text00: Label 'Ju nuk mund te insertoni nje kategori prind per tipin "Group 1"';
        Text01: Label 'Kategoria Prind nuk mund te jete bosh';

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