table 50201 "CSD Vendor Group"
{
    DataClassification = ToBeClassified;
    Caption = 'Vendor Group';
    LookupPageId = "CSD Vendor Group List";
    DrillDownPageId = "CSD Vendor Group List";

    fields
    {
        field(10; "Type"; Enum Type)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if (Type = Type::"Group 1") then BEGIN
                    if ("Parent Category" <> '') then
                        Error(Text00);
                end;
            end;
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
            TableRelation = if (Type = const("Group 2")) "CSD Vendor Group".Code where(Type = const("Group 1"))
            else
            if (Type = const("Group 3")) "CSD Vendor Group".Code where(Type = const("Group 2"));
            trigger OnValidate()
            begin
                if (Type = Type::"Group 1") then BEGIN
                    if ("Parent Category" <> '') then
                        Error(Text00);
                end
                else
                    if ((Type = Type::"Group 2") or (Type = Type::"Group 3")) then BEGIN
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