tableextension 50100 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Gudfood No."; Code[20])
        {
            Caption = 'Series of numbers for Gudfood';
            TableRelation = "No. Series";
        }
        field(50101; "Gudfoof Order No."; Code[20])
        {
            Caption = 'Gudfoof Order No.';
            TableRelation = "No. Series";
        }
        field(50102; "Posted Gudfoof Order No."; Code[20])
        {
            Caption = 'Posted Gudfoof Order No.';
            TableRelation = "No. Series";
        }
    }
}
