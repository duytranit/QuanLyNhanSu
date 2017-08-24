<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.DaQui.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Tài sản:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtTen" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Tài sản" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTen" runat="server" ControlToValidate="txtTen" Display="Dynamic"
                ErrorMessage="Nhập tài sản" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
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
                ErrorMessage="Nhập số lượng tài sản" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Số lượng tài sản có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
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
                ErrorMessage="Nhập giá trị tài sản" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvGiaTri" runat="server" ControlToValidate="txtGiaTri" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Giá trị tài sản có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa kê khai tài sản này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>