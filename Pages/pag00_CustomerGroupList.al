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
            action(Email)
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    EmailItem: Record "Email Item" Temporary;
                    Customer: Record Customer;
                    RecRef: RecordRef;
                    OutStr: OutStream;
                begin
                    EmailItem."Send to" := 'eisufaj@itechsolutions.al';
                    EmailItem.Subject := 'Hello';
                    EmailItem.Validate("Plaintext Formatted", false);

                    Customer.SetRange("No.", Rec.Code);
                end;
            }
        }
    }
}