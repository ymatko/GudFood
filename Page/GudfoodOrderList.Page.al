page 50105 "Gudfood Order List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order List';
    PageType = List;
    SourceTable = "Gudfood Order Header";
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
            action("Add")
            {
                Caption = 'Add';
                Image = Add;
                ApplicationArea = All;

                trigger OnAction()
                var
                    NewOrderPage: Page "Gudfood Order";
                    NewOrder: Record "Gudfood Order Header";
                begin
                    NewOrder.Init();
                    NewOrder.Insert(true);
                    NewOrderPage.SetRecord(NewOrder);
                    NewOrderPage.Run();
                end;
            }
            action("Edit")
            {
                Caption = 'Edit';
                Image = Edit;
                ApplicationArea = All;

                trigger OnAction()
                var
                    EditOrderPage: Page "Gudfood Order";
                begin
                    if Rec.Get(Rec."No.") then begin
                        EditOrderPage.SetRecord(Rec);
                        EditOrderPage.Run();
                    end;
                end;
            }

        }
    }
}
