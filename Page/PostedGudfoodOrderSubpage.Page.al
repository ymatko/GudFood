page 50107 "Posted Gudfood Order Subpage"
{
    ApplicationArea = All;
    Caption = 'Posted Gudfood Order Subpage';
    PageType = ListPart;
    SourceTable = "Posted Gudfood Order Line";
    Editable = false;

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
                    begin
                        CurrPage.Update();
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
        GudfoodOrderLine: Record "Posted Gudfood Order Line";
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
