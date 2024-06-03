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
                    trigger OnValidate()
                    var
                        Customer: Record Customer;
                    begin
                        if Rec."Sell-to Customer No." <> '' then begin
                            Customer.Get(Rec."Sell-to Customer No.");
                            Rec."Sell-to Customer Name" := Customer.Name;
                            CopySellToCustomerNoToLines();
                        end else begin
                            Rec."Sell-to Customer Name" := '';
                        end;
                        CurrPage.Update();
                    end;
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
                    Editable = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    Editable = false;
                }

            }
            part(GudfoodOrderLines; "Gudfood Order Subpage")
            {
                SubPageLink = "Order No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }
    local procedure CopySellToCustomerNoToLines()
    var
        GudfoodOrderLine: Record "Gudfood Order Line";
    begin
        if Rec."No." = '' then
            exit;

        GudfoodOrderLine.SetRange("Order No.", Rec."No.");
        if GudfoodOrderLine.FindSet() then begin
            repeat
                GudfoodOrderLine."Sell-to Customer No." := Rec."Sell-to Customer No.";
                GudfoodOrderLine.Modify();
            until GudfoodOrderLine.Next() = 0;
        end;
    end;
}
