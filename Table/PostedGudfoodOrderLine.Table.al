table 50104 "Posted Gudfood Order Line"
{
    Caption = 'Posted Gudfood Order Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Gudfood Order Header"."Sell-to Customer No.");

        }
        field(4; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = CustomerContent;
        }
        field(5; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = "Gudfood Item";
        }
        field(6; "Item Type"; Enum "Type of meal")
        {
            Caption = 'Item Type';
            FieldClass = FlowField;
            CalcFormula = Lookup("Gudfood Item".Type where(Code = field("Item No.")));
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            trigger OnLookup()
            begin
                if Quantity < 0 then
                    Error('The value cannot be less than 0');
            end;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        GudfoodOrderHeader: Record "Posted Gudfood Order Header";
        Item: Record "Gudfood Item";
        TotalQty: Decimal;
    begin
        if GudfoodOrderHeader.Get("Order No.") then
            Rec."Date Created" := GudfoodOrderHeader."Date Created";
        if Item.Get("Item No.") then begin
            Rec.Description := Item.Description;
            Rec."Unit Price" := Item."Unit Price";
        end;
        Rec.Amount := Rec.Quantity * Rec."Unit Price";
    end;

    trigger OnModify()
    var
        GudfoodOrderHeader: Record "Posted Gudfood Order Header";
        Item: Record "Gudfood Item";
        TotalQty: Decimal;
    begin
        if GudfoodOrderHeader.Get("Order No.") then
            Rec."Date Created" := GudfoodOrderHeader."Date Created";
        if Item.Get("Item No.") then begin
            Rec.Description := Item.Description;
            Rec."Unit Price" := Item."Unit Price";
        end;
        Rec.Amount := Rec.Quantity * Rec."Unit Price";
    end;
}
