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
                    //Caption = 'Code';
                    ToolTip = 'Specifies that the Code';
                    ApplicationArea = All;
                    Editable = false;
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
                    trigger OnValidate()
                    begin
                        if Rec."Shelf Life" = 0D then
                            Error('The Shelf Life field is required');
                        if Rec."Shelf Life" < Today then
                            Error('The Shelf Life field cannot be less than today''s date.');
                    end;
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
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MaxCode: Integer;
    begin
        if Rec.FindLast() then begin
            if Evaluate(MaxCode, Rec.Code) then
                Rec.Code := Format(MaxCode + 10, 0, '<Integer>')
            else
                Error('The Code field can only be a number');
        end else
            Rec.Code := '10';
    end;
}
