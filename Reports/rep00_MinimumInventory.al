report 50200 "ITS Minimum Inventory"
{
    UsageCategory = Administration;
    Caption = 'Minimum Inventory';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Items.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(Item_No; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Base_Unit_of_Measure; "Base Unit of Measure")
            {
                IncludeCaption = true;
            }
            column(Safety_Stock_Quantity; "Safety Stock Quantity")
            {
                IncludeCaption = true;
            }
            column(Inventory; "Inventory")
            {
                IncludeCaption = true;
            }
            column(Difference; Difference)
            {
                IncludeCaption = true;
            }
        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {
    //                     ApplicationArea = All;

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }
    labels
    {
        ReportCaption = 'Raporti Minimum Inventari';
    }
}