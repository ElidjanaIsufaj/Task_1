pageextension 50208 "PostedPurchaseInvoiceExt" extends "Posted Purchase Invoices"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Group 1"; Rec."Group 1")
            {
                ApplicationArea = All;
            }
            field("Group 2"; Rec."Group 2")
            {
                ApplicationArea = All;
            }
            field("Group 3"; Rec."Group 3")
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