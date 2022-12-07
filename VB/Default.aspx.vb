Imports DevExpress.Web
Imports System
Imports System.Collections.Generic


Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Sub ASPxCallbackPanel1_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
    End Sub
    Protected Sub ASPxGridView1_HtmlRowCreated(ByVal sender As Object, ByVal e As ASPxGridViewTableRowEventArgs)
        Dim gridView As ASPxGridView = (DirectCast(sender, ASPxGridView))
        If e.RowType = GridViewRowType.Data Then
            Dim hyperlink As ASPxHyperLink = (CType(gridView.FindRowCellTemplateControl(e.VisibleIndex, Nothing, "btnEdit"), ASPxHyperLink))
            hyperlink.Visible = True
            hyperlink.NavigateUrl=String.Format("javascript:grid.StartEditRow('{0}');", e.VisibleIndex)
        Else
            If e.RowType = GridViewRowType.InlineEdit Then
                Dim column As GridViewDataColumn = CType(gridView.Columns("#"), GridViewDataColumn)
                Dim hyperlink As ASPxHyperLink = CType(gridView.FindEditRowCellTemplateControl(column, "btnUpdate"), ASPxHyperLink)
                hyperlink.ClientInstanceName = "btnUpdate_" & e.VisibleIndex.ToString()
            End If
        End If
    End Sub
    Protected Sub ASPxGridView1_CellEditorInitialize(ByVal sender As Object, ByVal e As ASPxGridViewEditorEventArgs)
        If e.Column.FieldName = "CategoryName" Then
            Dim combo As ASPxComboBox = CType(e.Editor, ASPxComboBox)
            combo.ClientSideEvents.SelectedIndexChanged = String.Format("function(s,e) {{{0}.SetEnabled(s.GetValue() == 0); }}", "btnUpdate_" & e.VisibleIndex.ToString())
        End If
    End Sub
End Class
