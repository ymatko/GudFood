page 50104 "Gudfood Order"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order';
    PageType = Document;
    SourceTable = "Gudfood Order Header";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Posting No."; Rec."Posting No.")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Total Qty"; Rec."Total Qty")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }

            }
            part(GudfoodOrderLines; "Gudfood Order Subpage")
            {
                SubPageLink = "Order No." = field("No.");
            }
        }
    }
}
