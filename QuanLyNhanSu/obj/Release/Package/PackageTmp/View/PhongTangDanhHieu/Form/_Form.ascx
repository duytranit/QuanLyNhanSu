<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.PhongTangDanhHieu.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Danh hiệu:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtTen" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Danh hiệu" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTen" runat="server" ControlToValidate="txtTen" Display="Dynamic"
                ErrorMessage="Nhập danh hiệu được phong tặng" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hội đồng xét phong tặng:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtHoiDong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hội đồng phong tặng" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvHoiDong" runat="server" ControlToValidate="txtHoiDong" Display="Dynamic"
                ErrorMessage="Nhập hội đồng phong tặng danh hiệu" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ngày xét phong tặng:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkNgayThang" runat="server" Culture="vi-VN" CssClass="rbRadTextBox" MinDate="1900-01-01"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvNgayThang" runat="server" ControlToValidate="dpkNgayThang" Display="Dynamic"
                ErrorMessage="Nhập ngày tháng xét phong tặng" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNgayThang" runat="server" ControlToValidate="dpkNgayThang" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày tháng xét phong tặng có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa phong tặng danh hiệu này không')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>