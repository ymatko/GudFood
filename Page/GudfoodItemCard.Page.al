page 50101 "Gudfood Item Card"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = "Gudfood Item";
    UsageCategory = Lists;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies that the Code';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Description';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Unit Price';
                }
                field(Type; Rec.Type)
                {
                    Caption = 'Type';
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Type';
                }
                field(Picture; Rec.Picture)
                {
                    Caption = 'Picture';
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Picture';
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    Caption = 'Shelf Life';
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Shelf Life';
                }
            }
            group(Order)
            {
                Caption = 'Order';
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    Caption = 'Qty. Ordered';
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Qty. Ordered';
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    Caption = 'Qty. in Order';
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Qty. in Order';
                }
            }
        }
        area(factboxes)
        {
            part("GudfoodItemImageFactBox"; "Gudfood Item Image")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec."Shelf Life" = 0D then
            Error('The Shelf Life field is required');
        if Rec."Shelf Life" < Today then
            Error('The Shelf Life field cannot be less than today''s date.');
    end;
}
