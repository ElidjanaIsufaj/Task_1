pageextension 50213 "ItemListExt" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("Group 2"; Rec."Group 2")
            {
                ApplicationArea = All;
            }
            field("Group 3"; Rec."Group 3")
            {
                ApplicationArea = All;
            }
            field("Group 4"; Rec."Group 4")
            {
                ApplicationArea = All;
            }
            field("Group 5"; Rec."Group 5")
            {
                ApplicationArea = All;
            }
        }
    }


    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}