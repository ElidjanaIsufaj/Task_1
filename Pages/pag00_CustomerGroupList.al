page 50200 "CSD Customer Group List"
{
    PageType = List;
    CardPageId = "CSD Customer Group Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Customer Group";
    Caption = 'Customer Group List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Parent Category"; Rec."Parent Category")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}