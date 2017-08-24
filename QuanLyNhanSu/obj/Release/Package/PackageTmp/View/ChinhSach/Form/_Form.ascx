<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.ChinhSach.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chính sách:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNoiDung" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chính sách" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNoiDung" runat="server" ControlToValidate="txtNoiDung" Display="Dynamic"
                ErrorMessage="Nhập chính sách" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ngày xét:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkNgay" runat="server" Culture="vi-VN" CssClass="rbRadTextBox"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvNgay" runat="server" ControlToValidate="dpkNgay" Display="Dynamic"
                ErrorMessage="Nhập ngày tháng xét" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNgay" runat="server" ControlToValidate="dpkNgay" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày xét có giá trị khôn thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa chính sách này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>