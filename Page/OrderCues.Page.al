namespace GudFood.GudFood;

page 50113 "Order Cues"
{
    ApplicationArea = All;
    Caption = 'Order Cues';
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            cuegroup(Group1)
            {
                Caption = 'Orders';
                CuegroupLayout = Wide;
                field(Order; OrderCount)
                {
                    Caption = 'Orders';
                    ToolTip = 'Orders';
                    ApplicationArea = All;
                    DrillDownPageId = "Gudfood Order List";
                    Editable = false;
                    DrillDown = true;

                }
                field(POstedOrder; PostedOrderCount)
                {
                    Caption = 'Posted Orders';
                    ToolTip = 'Posted Orders';
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        OrderCount := GetCountOfOrders();
        PostedOrderCount := GetCountOfPostedOrders();
    end;

    local procedure GetCountOfOrders(): Integer
    var
        Orders: Record "Gudfood Order Header";
    begin
        if Orders.FindSet() then
            exit(Orders.Count)
        else
            exit(0);
    end;

    local procedure GetCountOfPostedOrders(): Integer
    var
        Orders: Record "Posted Gudfood Order Header";
    begin
        if Orders.FindSet() then
            exit(Orders.Count)
        else
            exit(0);
    end;

    var
        OrderCount: Integer;
        PostedOrderCount: Integer;
}
