<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.ChucVu.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table style="width: 100%;">
    <tr>
        <td style="width: 200px;">
            Vị trí việc làm:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxChucVuTen" runat="server" Width="380px"
                EmptyMessage="Vị trí việc làm" ToolTip="Nhập vị trí việc làm"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ControlToValidate="RadTextBoxChucVuTen" runat="server"
                ToolTip="Nhập vị trí việc làm mới">
                <asp:Image runat="server" ImageUrl="~/Images/Error.jpg" Height="20px" Width="20px" />
            </asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
<p class="rbButtons">
    <asp:LinkButton ID="ButtonCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClientClick="return confirm('Bạn có muốn xóa vị trí việc làm này không?')"
                OnClick="ButtonDelete_Click"></asp:LinkButton>
    <asp:LinkButton runat="server" Text="Trở về" CssClass="btn btn-default" PostBackUrl="~/ChucVu"></asp:LinkButton>
</p>