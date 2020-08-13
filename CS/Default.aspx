<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<br />
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="AccessDataSource1" KeyFieldName="CategoryID" Width="903px" OnHtmlRowCreated="ASPxGridView1_HtmlRowCreated" OnCellEditorInitialize="ASPxGridView1_CellEditorInitialize">
            <Columns>
                <dxwgv:GridViewDataTextColumn Caption="#" VisibleIndex="0">
                    <DataItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <dxe:ASPxHyperLink ID="btnEdit" runat="server" Text="Edit"></dxe:ASPxHyperLink>
                                </td>
                            </tr>
                        </table>
                    </DataItemTemplate>
                    <EditItemTemplate>
                         <table>
                            <tr>
                                <td>
                                    <dxe:ASPxHyperLink ID="btnUpdate" runat="server" Text="Update" NavigateUrl="javascript:grid.UpdateEdit();"></dxe:ASPxHyperLink>
                                </td>
                                <td>
                                     <dxe:ASPxHyperLink ID="btnCancel" runat="server" Text="Cancel" NavigateUrl="javascript:grid.CancelEdit();"></dxe:ASPxHyperLink>
                                </td>
                            </tr>
                        </table>

                    </EditItemTemplate>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataComboBoxColumn FieldName="CategoryName" VisibleIndex="2">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dxe:ListEditItem Text="Enable" Value="0">
                            </dxe:ListEditItem>
                            <dxe:ListEditItem Text="Disable" Value="1">
                            </dxe:ListEditItem>
                        </Items>
                    </PropertiesComboBox>
                </dxwgv:GridViewDataComboBoxColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <SettingsEditing Mode="Inline" />
        </dxwgv:ASPxGridView>
        <br />
        <br />
        &nbsp;</div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>
    </form>
</body>
</html>

