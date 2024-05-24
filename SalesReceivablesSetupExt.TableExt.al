tableextension 50100 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Gudfood No."; Code[20])
        {
            Caption = 'Series of numbers for Gudfood';
            DataClassification = CustomerContent;
        }
    }
}
