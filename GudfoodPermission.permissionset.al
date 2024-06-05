permissionset 50100 GudfoodPermission
{
    Assignable = true;
    Permissions = tabledata "Gudfood Item"=RIMD,
        tabledata "Gudfood Order Header"=RIMD,
        tabledata "Gudfood Order Line"=RIMD,
        tabledata "Posted Gudfood Order Header"=RIMD,
        tabledata "Posted Gudfood Order Line"=RIMD,
        table "Gudfood Item"=X,
        table "Gudfood Order Header"=X,
        table "Gudfood Order Line"=X,
        table "Posted Gudfood Order Header"=X,
        table "Posted Gudfood Order Line"=X,
        report "Gudfood Order Report"=X,
        xmlport "Export Gudfood Order"=X,
        page "Gudfood Item Card"=X,
        page "Gudfood Item Image"=X,
        page "Gudfood Item List"=X,
        page "Gudfood Order"=X,
        page "Gudfood Order List"=X,
        page "Gudfood Order Subpage"=X,
        page "Gudfood Role Center"=X,
        page "Posted Gudfood Order"=X,
        page "Posted Gudfood Order List"=X,
        page "Posted Gudfood Order Subpage"=X;
}