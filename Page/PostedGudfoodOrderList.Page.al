page 50106 "Posted Gudfood Order List"
{
    ApplicationArea = All;
    Caption = 'Posted Gudfood Order List';
    PageType = List;
    SourceTable = "Posted Gudfood Order Header";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies that the No.';
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                    ToolTip = 'Specifies that the Sell-to Customer No.';
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                    ToolTip = 'Specifies that the Sell-to Customer Name';
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    Caption = 'Order Date';
                    ToolTip = 'Specifies that the Order Date';
                    ApplicationArea = All;
                }
                field("Posting No."; Rec."Posting No.")
                {
                    Caption = 'Posting No.';
                    ToolTip = 'Specifies that the Posting No.';
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Caption = 'Date Created';
                    ToolTip = 'Specifies that the Date Created';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Date Posted';
                    ToolTip = 'Specifies that the Date Posted';
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    Caption = 'Total Qty';
                    ToolTip = 'Specifies that the Total Qty';
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    Caption = 'Total Amount';
                    ToolTip = 'Specifies that the Total Amount';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action("View")
            {
                Caption = 'View';
                Image = ViewCheck;
                ApplicationArea = All;

                trigger OnAction()
                var
                    PreviewOrderPage: Page "Posted Gudfood Order";
                begin
                    if Rec.Get(Rec."No.") then begin
                        PreviewOrderPage.SetRecord(Rec);
                        PreviewOrderPage.Editable(false);
                        PreviewOrderPage.Run();
                    end;
                end;
            }
            action("Delete")
            {
                Caption = 'Delete';
                Image = Delete;
                ApplicationArea = All;

                trigger OnAction()
                var
                    DeleteOrder: Record "Posted Gudfood Order Header";
                begin
                    if Rec.Get(Rec."No.") then begin
                        DeleteOrder.Copy(Rec);
                        DeleteOrder.Delete(true);
                    end;
                end;
            }
        }
    }
}
