<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.KhoanNo.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Khoản nợ:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtTen" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Khoản nợ" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTen" runat="server" ControlToValidate="txtTen" Display="Dynamic"
                ErrorMessage="Nhập khoản nợ" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Số lượng:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtSoLuong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Số lượng" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic"
                ErrorMessage="Nhập số lượng" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Số lượng các khoản nợ có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Giá trị:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtGiaTri" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Giá trị" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvGiaTri" runat="server" ControlToValidate="txtGiaTri" Display="Dynamic"
                ErrorMessage="Nhập giá trị của khoản nợ" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvGiaTri" runat="server" ControlToValidate="txtGiaTri" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Khoản nợ có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa kê khai khoản nợ này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>