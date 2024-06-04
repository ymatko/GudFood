table 50101 "Gudfood Order Header"
{
    Caption = 'Gudfood Order Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            Editable = false;
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Gudfoof Order No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(3; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            DataClassification = CustomerContent;
        }
        field(4; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(5; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
            DataClassification = CustomerContent;
        }
        field(6; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; "Total Qty"; Decimal)
        {
            Caption = 'Total Qty';
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }
        field(8; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Amount where("Order No." = field("No.")));
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Gudfoof Order No.");
            NoSeriesMgt.InitSeries(SalesSetup."Gudfoof Order No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        Rec."Date Created" := Today;
    end;

    trigger OnDelete()
    var
        PostedGudfoodOrderHeader: Record "Posted Gudfood Order Header";
        PostedGudfoodOrderLine: Record "Posted Gudfood Order Line";
        GudfoodOrderLine: Record "Gudfood Order Line";
        NoseriesMgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        PostedGudfoodOrderHeader.Init();
        SalesSetup.Get();
        SalesSetup.TestField("Posted Gudfoof Order No.");
        NoseriesMgt.InitSeries(SalesSetup."Posted Gudfoof Order No.", '', Rec."Order Date", "Posting No.", "No. Series");
        PostedGudfoodOrderHeader.TransferFields(Rec);
        PostedGudfoodOrderHeader."Posting Date" := Today();
        PostedGudfoodOrderHeader."Posting No." := Rec."Posting No.";
        PostedGudfoodOrderHeader.Insert();

        GudfoodOrderLine.SetRange("Order No.", Rec."No.");
        if GudfoodOrderLine.FindSet() then
            repeat
                PostedGudfoodOrderLine.Init();
                PostedGudfoodOrderLine.TransferFields(GudfoodOrderLine);
                PostedGudfoodOrderLine."Line No." := GudfoodOrderLine."Line No.";
                PostedGudfoodOrderLine.Insert();
            until GudfoodOrderLine.Next() = 0;
        GudfoodOrderLine.DeleteAll(true);

        Message('Posted');
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}