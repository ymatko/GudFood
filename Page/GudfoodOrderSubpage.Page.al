page 50103 "Gudfood Order Subpage"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order Subpage';
    PageType = ListPart;
    SourceTable = "Gudfood Order Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Order No."; Rec."Order No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                    trigger OnValidate()
                    var
                        Item: Record "Gudfood Item";
                    begin
                        CurrPage.Update();
                        Item.Get(Rec."Item No.");
                        Item."Qty. in Order" += Rec.Quantity;
                        Item.Modify();
                    end;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MaxCode: Integer;
        GudfoodOrderLine: Record "Gudfood Order Line";
    begin
        GudfoodOrderLine.Reset();
        GudfoodOrderLine.SetRange("Order No.", Rec."Order No.");
        if GudfoodOrderLine.FindLast() then begin
            MaxCode := GudfoodOrderLine."Line No.";
            Rec."Line No." := MaxCode + 10000;
        end else
            Rec."Line No." := 10000;
    end;
}
