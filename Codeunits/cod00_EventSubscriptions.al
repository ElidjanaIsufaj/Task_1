codeunit 50200 "CSD Event Subscriptions"
{


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesInvHeaderInsert', '', true, true)]
    local procedure "Sales-Post_OnBeforeSalesInvHeaderInsert"
    (
        var SalesInvHeader: Record "Sales Invoice Header";
        var SalesHeader: Record "Sales Header";
        CommitIsSuppressed: Boolean;
        var IsHandled: Boolean
    )
    var
        lCustomer: Record Customer;
    begin
        lCustomer.Get(SalesInvHeader."Sell-to Customer No.");
        SalesInvHeader."Group 1" := lCustomer."Group 1";
        SalesInvHeader."Group 2" := lCustomer."Group 2";
        SalesInvHeader."Group 3" := lCustomer."Group 3";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterInsertCrMemoHeader', '', true, true)]
    local procedure "Sales-Post_OnAfterInsertCrMemoHeader"
    (
        var SalesHeader: Record "Sales Header";
        var SalesCrMemoHeader: Record "Sales Cr.Memo Header"
    )
    var
        llCustomer: Record Customer;
    begin
        llCustomer.Get(SalesCrMemoHeader."Sell-to Customer No.");
        SalesCrMemoHeader."Group 1" := llCustomer."Group 1";
        SalesCrMemoHeader."Group 2" := llCustomer."Group 2";
        SalesCrMemoHeader."Group 3" := llCustomer."Group 3";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforePostGenJnlLine', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforePostGenJnlLine"
    (
        var GenJournalLine: Record "Gen. Journal Line";
        Balancing: Boolean
    )
    var
        Customer: Record "Customer";
    begin
        if (GenJournalLine."Account Type" = GenJournalLine."Account Type"::Customer) then begin
            if Customer.get(GenJournalLine."Account No.") then
                GenJournalLine."Group 1" := Customer."Group 1";
            GenJournalLine."Group 2" := Customer."Group 2";
            GenJournalLine."Group 3" := Customer."Group 3";
        end
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCustLedgEntryInsert', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeCustLedgEntryInsert"
    (
        var CustLedgerEntry: Record "Cust. Ledger Entry";
        var GenJournalLine: Record "Gen. Journal Line";
        GLRegister: Record "G/L Register";
        var TempDtldCVLedgEntryBuf: Record "Detailed CV Ledg. Entry Buffer";
        var NextEntryNo: Integer
    )
    begin
        CustLedgerEntry."Group 1" := GenJournalLine."Group 1";
        CustLedgerEntry."Group 2" := GenJournalLine."Group 2";
        CustLedgerEntry."Group 3" := GenJournalLine."Group 3";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldCustLedgEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertDtldCustLedgEntry"
    (
        var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        GenJournalLine: Record "Gen. Journal Line";
        DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"
    )
    begin
        DtldCustLedgEntry."Group 1" := GenJournalLine."Group 1";
        DtldCustLedgEntry."Group 2" := GenJournalLine."Group 2";
        DtldCustLedgEntry."Group 3" := GenJournalLine."Group 3";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchInvHeaderInsert', '', true, true)]
    local procedure "Purch.-Post_OnBeforePurchInvHeaderInsert"
    (
        var PurchInvHeader: Record "Purch. Inv. Header";
        var PurchHeader: Record "Purchase Header";
        CommitIsSupressed: Boolean
    )
    var
        Vendor: Record "Vendor";
    begin
        Vendor.get(PurchInvHeader."Buy-from Vendor No.");
        PurchInvHeader."Group 1" := Vendor."Group 1";
        PurchInvHeader."Group 2" := Vendor."Group 2";
        PurchInvHeader."Group 3" := Vendor."Group 3";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchCrMemoHeaderInsert', '', true, true)]
    local procedure "Purch.-Post_OnBeforePurchCrMemoHeaderInsert"
    (
        var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        var PurchHeader: Record "Purchase Header";
        CommitIsSupressed: Boolean
    )
    var
        Vendor: Record "Vendor";
    begin
        Vendor.get(PurchCrMemoHdr."Buy-from Vendor No.");
        PurchCrMemoHdr."Group 1" := Vendor."Group 1";
        PurchCrMemoHdr."Group 2" := Vendor."Group 2";
        PurchCrMemoHdr."Group 3" := Vendor."Group 3";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostVendOnBeforeInitVendLedgEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnPostVendOnBeforeInitVendLedgEntry"
    (
        var GenJournalLine: Record "Gen. Journal Line";
        var VendLedgEntry: Record "Vendor Ledger Entry";
        var CVLedgerEntryBuffer: Record "CV Ledger Entry Buffer";
        var DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer";
        var VendPostingGr: Record "Vendor Posting Group"
    )
    var
        Vendor: Record "Vendor";
    begin

        if (GenJournalLine."Account Type" = GenJournalLine."Account Type"::Vendor) then begin
            if Vendor.get(GenJournalLine."Account No.") then
                GenJournalLine."Group 1" := Vendor."Group 1";
            GenJournalLine."Group 2" := Vendor."Group 2";
            GenJournalLine."Group 3" := Vendor."Group 3";
        end
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeVendLedgEntryInsert', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeVendLedgEntryInsert"
    (
        var VendorLedgerEntry: Record "Vendor Ledger Entry";
        GenJournalLine: Record "Gen. Journal Line";
        GLRegister: Record "G/L Register"
    )
    begin
        VendorLedgerEntry."Group 1" := GenJournalLine."Group 1";
        VendorLedgerEntry."Group 2" := GenJournalLine."Group 2";
        VendorLedgerEntry."Group 3" := GenJournalLine."Group 3";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldVendLedgEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertDtldVendLedgEntry"
    (
        var DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
        GenJournalLine: Record "Gen. Journal Line";
        DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"
    )
    begin
        DtldVendLedgEntry."Group 1" := GenJournalLine."Group 1";
        DtldVendLedgEntry."Group 2" := GenJournalLine."Group 2";
        DtldVendLedgEntry."Group 3" := GenJournalLine."Group 3";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnPostOnBeforePostedAssemblyHeaderInsert', '', true, true)]
    local procedure "Assembly-Post_OnPostOnBeforePostedAssemblyHeaderInsert"
    (
        AssemblyHeader: Record "Assembly Header";
        var PostedAssemblyHeader: Record "Posted Assembly Header"
    )
    var
        Item: Record Item;
    begin
        if Item.Get(PostedAssemblyHeader."Item No.") then;
        PostedAssemblyHeader."Group 2" := Item."Group 2";
        PostedAssemblyHeader."Group 3" := Item."Group 3";
        PostedAssemblyHeader."Group 4" := Item."Group 4";
        PostedAssemblyHeader."Group 5" := Item."Group 5";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnAfterCreateItemJnlLineFromAssemblyHeader', '', true, true)]
    local procedure "Assembly-Post_OnAfterCreateItemJnlLineFromAssemblyHeader"
    (
        var ItemJournalLine: Record "Item Journal Line";
        AssemblyHeader: Record "Assembly Header"
    )
    var
        Item: Record Item;
    begin
        if Item.Get(ItemJournalLine."Item No.") then;
        ItemJournalLine."Group 2" := Item."Group 2";
        ItemJournalLine."Group 3" := Item."Group 3";
        ItemJournalLine."Group 4" := Item."Group 4";
        ItemJournalLine."Group 5" := Item."Group 5";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure "Item Jnl.-Post Line_OnAfterInitItemLedgEntry"
    (
        var NewItemLedgEntry: Record "Item Ledger Entry";
        var ItemJournalLine: Record "Item Journal Line";
        var ItemLedgEntryNo: Integer
    )
    begin
        NewItemLedgEntry."Group 2" := ItemJournalLine."Group 2";
        NewItemLedgEntry."Group 3" := ItemJournalLine."Group 3";
        NewItemLedgEntry."Group 4" := ItemJournalLine."Group 4";
        NewItemLedgEntry."Group 5" := ItemJournalLine."Group 5";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitValueEntry', '', true, true)]
    local procedure "Item Jnl.-Post Line_OnAfterInitValueEntry"
    (
        var ValueEntry: Record "Value Entry";
        ItemJournalLine: Record "Item Journal Line";
        var ValueEntryNo: Integer;
        ItemLedgEntry: Record "Item Ledger Entry"
    )
    begin
        ValueEntry."Group 2" := ItemJournalLine."Group 2";
        ValueEntry."Group 3" := ItemJournalLine."Group 3";
        ValueEntry."Group 4" := ItemJournalLine."Group 4";
        ValueEntry."Group 5" := ItemJournalLine."Group 5";
    end;



    // [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnBeforeInsertAttachment', '', true, true)]
    // local procedure "Document Attachment_OnBeforeInsertAttachment"
    // (
    //     var DocumentAttachment: Record "Document Attachment";
    // 	var RecRef: RecordRef
    // )
    // begin

    // end;


}

