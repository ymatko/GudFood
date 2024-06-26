page 50104 "Gudfood Order"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order';
    PageType = Document;
    SourceTable = "Gudfood Order Header";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    trigger OnValidate()
                    var
                        Customer: Record Customer;
                    begin
                        if Rec."Sell-to Customer No." <> '' then begin
                            Customer.Get(Rec."Sell-to Customer No.");
                            Rec."Sell-to Customer Name" := Customer.Name;
                            CopySellToCustomerNoToLines();
                        end else begin
                            Rec."Sell-to Customer Name" := '';
                        end;
                        CurrPage.Update();
                    end;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Posting No."; Rec."Posting No.")
                {
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    Editable = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    Editable = false;
                }

            }
            part(GudfoodOrderLines; "Gudfood Order Subpage")
            {
                SubPageLink = "Order No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Edit")
            {
                Caption = 'Edit';
                Image = Edit;
                Promoted = true;
                PromotedCategory = Process;
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
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                ToolTip = 'Print the selected order report';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    Report: Report "Gudfood Order Report";
                    Orders: Record "Gudfood Order Header";
                begin
                    Orders.SetFilter("No.", Rec."No.");
                    Report.SetTableView(Orders);
                    Report.Run();
                end;
            }
            action(ExportToXml)
            {
                Caption = 'Export To Xml';
                Image = XMLFile;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OrderXml: XmlPort "Export Gudfood Order";
                    Orders: Record "Gudfood Order Header";
                    OutStr: OutStream;
                    InStr: InStream;
                    FileName: Text;
                begin
                    TempBlob.CreateOutStream(OutStr);
                    Orders.SetFilter("No.", Rec."No.");
                    OrderXml.SetTableView(Orders);
                    OrderXml.SetDestination(OutStr);
                    OrderXml.Export();
                    TempBlob.CreateInStream(InStr);
                    FileName := 'GudfoodOrder_' + Format(Rec."No.") + '.xml';
                    File.DownloadFromStream(InStr, 'Download', '', '', FileName);
                end;
            }
            action(ExportToExcel)
            {
                Caption = 'Export To Ecxel';
                ToolTip = 'Export the selected order report to Excel';
                Image = Excel;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    Report: Report "Gudfood Order Report To Excel";
                    Orders: Record "Gudfood Order Header";
                begin
                    Orders.SetFilter("No.", Rec."No.");
                    Report.SetTableView(Orders);
                    Report.Run();
                end;
            }
        }
    }
    local procedure CopySellToCustomerNoToLines()
    var
        GudfoodOrderLine: Record "Gudfood Order Line";
    begin
        if Rec."No." = '' then
            exit;

        GudfoodOrderLine.SetRange("Order No.", Rec."No.");
        if GudfoodOrderLine.FindSet() then begin
            repeat
                GudfoodOrderLine."Sell-to Customer No." := Rec."Sell-to Customer No.";
                GudfoodOrderLine.Modify();
            until GudfoodOrderLine.Next() = 0;
        end;
    end;
}
