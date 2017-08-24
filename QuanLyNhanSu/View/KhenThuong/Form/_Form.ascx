<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.KhenThuong.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Khen thưởng:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNoiDung" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Khen thưởng" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNoiDung" runat="server" ControlToValidate="txtNoiDung" Display="Dynamic"
                ErrorMessage="Nhập nội dung khen thưởng" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Cấp quyết định:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtCapQuyetDinh" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Cấp quyết định" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvCapQuyetDinh" runat="server" ControlToValidate="txtCapQuyetDinh" Display="Dynamic"
                ErrorMessage="Nhập cấp quyết định khen thưởng" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ngày ký quyết định:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkNgay" runat="server" Culture="vi-VN" CssClass="rbRadTextBox"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvNgay" runat="server" ControlToValidate="dpkNgay" Display="Dynamic"
                ErrorMessage="Nhập ngày ký quyết định khen thưởng" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNgay" runat="server" ControlToValidate="dpkNgay" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày ký quyết định khen thưởng có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hòan tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa khen thưởng này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>