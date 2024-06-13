namespace GudFood.GudFood;

report 50101 "Gudfood Order Report To Excel"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order Report To Excel';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = "Gudfood Order Report To Excel";

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

            }
            column(Total_Amount; "Total Amount")
            {
            }
        }
    }
    rendering
    {
        layout("Gudfood Order Report To Excel")
        {
            Type = Excel;
            LayoutFile = './Gudfood_Orders.xlsx';
            Caption = 'Gudfood Order Report To Excel';
        }
    }
}
