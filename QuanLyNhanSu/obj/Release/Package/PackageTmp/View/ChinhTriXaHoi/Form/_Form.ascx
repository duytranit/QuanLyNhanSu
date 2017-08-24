<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.ChinhTriXaHoi.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server">
    <asp:TableRow>
        <asp:TableCell>
            Tên tổ chức:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtTen" runat="server"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            Số điện thoại:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtSDT" runat="server"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            Số Fax:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtFax" runat="server"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            Hòm thư điện tử:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtEmail" runat="server"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            Trang thông tin điện tử:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtWebsite" runat="server"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            Địa chỉ:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtDiaChi" runat="server" TextMode="MultiLine"
                Rows="3"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell>
            Giới thiệu:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtGioiThieu" runat="server" TextMode="MultiLine"
                Rows="5"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<p class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default"
        OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default"
        OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default"
        OnClientClick="return confirm('Bạn có muốn xóa tổ chức chính trị xã hội này không?')"
        OnClick="btDelete_Click"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default"
        PostBackUrl="~/CTXH"></asp:LinkButton>
</p>