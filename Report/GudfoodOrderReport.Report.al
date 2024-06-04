report 50100 "Gudfood Order Report"
{
    Caption = 'Gudfood Order Report';
    RDLCLayout = 'GudfoodOrderReport.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Gudfood Order Header"; "Gudfood Order Header")
        {
            column(No_; "No.")
            {
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column("User_ID"; UserID)
            {
            }
            column("Document_Date"; Today)
            {
            }

            dataitem(OrderLine; "Gudfood Order Line")
            {
                DataItemLinkReference = "Gudfood Order Header";
                DataItemLink = "Order No." = field("No.");

                column(Item_No_; "Item No.")
                {
                }
                column(Item_Type; "Item Type")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(Amount; Amount)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    TotalAmount += Amount;
                end;

            }
            column(Total_Amount; "Total Amount")
            {
            }
            trigger OnPreDataItem()
            begin
                TotalAmount := 0;

                if "No." <> '' then
                    SetRange("No.", "Gudfood Order Header"."No.");

                // if OrderLine.FindSet then
                //     repeat
                //         TotalAmount += "Gudfood Order Header"."Total Amount";
                //     until OrderLine.Next() = 0;
            end;

        }
    }
    // requestpage
    // {
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(Group)
    //             {
    //             }
    //         }
    //     }
    // }
    var
        TotalAmount: Decimal;
}

