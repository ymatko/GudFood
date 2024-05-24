pageextension 50100 "Sales & Receivables Page Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("Gudfood No."; Rec."Gudfood No.")
            {
                Caption = 'Gudfood Item No.';
                ApplicationArea = All;
            }
        }
    }
}
