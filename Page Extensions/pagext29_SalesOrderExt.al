pageextension 50229 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        // Add changes to page layout here
    }


    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            var
                myInt: Integer;
            begin
                SalesLine.SetFilter("Document No.", Rec."No.");
                SalesLine.SetRange("Document Type", Rec."Document Type");
                if SalesLine.FindSet() then   //duhet bere kjo per te lexuar rekordet
                    repeat
                        if (SalesLine.Type = SalesLine.Type::Item) then begin
                            Item.Get(SalesLine."No.");
                            if (Item.Type = Item.Type::Service) then begin
                                if (SalesLine."Line Discount %" = 1) then
                                    Error(Text00);
                            end;
                        end;
                    until SalesLine.Next() = 0;
            end;
        }
    }

    var
        SalesLine: Record "Sales Line";
        Item: Record Item;
        SalesHeader: Record "Sales Header";
        Text00: Label 'Line Discount % must not be 1';
}