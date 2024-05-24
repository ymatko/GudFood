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
            field("Gudfoof Order No."; Rec."Gudfoof Order No.")
            {
                Caption = 'Gudfoof Order No.';
                ApplicationArea = All;
            }
            field("Posted Gudfoof Order No."; Rec."Posted Gudfoof Order No.")
            {
                Caption = 'Posted Gudfoof Order No.';
                ApplicationArea = All;
            }
        }
    }
}
