page 50100 "Gudfood Item List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item List';
    PageType = List;
    SourceTable = "Gudfood Item";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ApplicationArea = All;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part("GudfoodItemImageFactBox"; "Gudfood Item Image")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("View")
            {
                Caption = 'View';
                Image = ViewCheck;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    PreviewOrderPage: Page "Gudfood Item Card";
                begin
                    if Rec.Get(Rec.Code) then begin
                        PreviewOrderPage.SetRecord(Rec);
                        PreviewOrderPage.Run();
                    end;
                end;
            }
            action("Add")
            {
                Caption = 'Add';
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    NewItemPage: Page "Gudfood Item Card";
                    NewItem: Record "Gudfood Item";
                begin
                    NewItem.Init();
                    NewItem.Insert(true);
                    NewItemPage.SetRecord(NewItem);
                    NewItemPage.Run();
                end;
            }
            action("Delete")
            {
                Caption = 'Delete';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    Item: Record "Gudfood Item";
                begin
                    if Rec.Get(Rec.Code) then begin
                        Item.Copy(Rec);
                        Item.Delete(true);
                    end;
                end;
            }
        }
    }
}
