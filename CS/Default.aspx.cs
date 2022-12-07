using DevExpress.Web;
using System;
using System.Collections.Generic;


public partial class _Default : System.Web.UI.Page {

    protected void Page_Load(object sender, EventArgs e) {
        
    }
    protected void ASPxCallbackPanel1_Callback(object source, DevExpress.Web.CallbackEventArgsBase e) {
    }
    protected void ASPxGridView1_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e) {
        ASPxGridView gridView =  ((ASPxGridView)sender);
        if (e.RowType == GridViewRowType.Data) {
            ASPxHyperLink hyperlink = ((ASPxHyperLink)gridView.FindRowCellTemplateControl(e.VisibleIndex, null, "btnEdit"));
            hyperlink.Visible = true;
            hyperlink.NavigateUrl=string.Format("javascript:grid.StartEditRow('{0}');", e.VisibleIndex);
        }
        else
            if (e.RowType == GridViewRowType.InlineEdit) {
                GridViewDataColumn column = (GridViewDataColumn)gridView.Columns["#"];
                ASPxHyperLink hyperlink = (ASPxHyperLink)gridView.FindEditRowCellTemplateControl(column, "btnUpdate");
                hyperlink.ClientInstanceName = "btnUpdate_" + e.VisibleIndex.ToString();
            }
    }
    protected void ASPxGridView1_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e) {
        if (e.Column.FieldName == "CategoryName") {
            ASPxComboBox combo = (ASPxComboBox)e.Editor;
            combo.ClientSideEvents.SelectedIndexChanged = string.Format("function(s,e) {{{0}.SetEnabled(s.GetValue() == 0); }}", "btnUpdate_" + e.VisibleIndex.ToString());
        }
    }
}
