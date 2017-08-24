<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_ACCForm.ascx.cs" Inherits="QuanLyNhanSu.View.Account.Form._ACCForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Email:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtEmail" runat="server" WrapperCssClass="rbRadTextBox" Enabled="false"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Mật khẩu:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPassword" runat="server" WrapperCssClass="rbRadTextBox" TextMode="Password"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btUpdate" runat="server" Text="Cập nhật" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btLogout" runat="server" Text="Đăng xuất" CssClass="btn btn-default" PostBackUrl="~/"></asp:LinkButton>
</div>