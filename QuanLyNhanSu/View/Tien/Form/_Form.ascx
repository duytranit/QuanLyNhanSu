<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.Tien.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Tiền:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNoiDung" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Tiền mặt, tiền cho vay, tiền gửi..." EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNoiDung" runat="server" ControlToValidate="txtNoiDung" Display="Dynamic"
                ErrorMessage="Nhập loại tiền" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell  CssClass="rbTableCellLabel">
            Số lượng:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtSoLuong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Số lượng" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic"
                ErrorMessage="Nhập số lượng tiền" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Số lượng tiền có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Đơn vị tiền tệ:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtTienTe" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Tiền tệ" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTienTe" runat="server" ControlToValidate="txtTienTe" Display="Dynamic"
                ErrorMessage="Nhập đơn vị tiền tệ" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa kê khai tiền này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>