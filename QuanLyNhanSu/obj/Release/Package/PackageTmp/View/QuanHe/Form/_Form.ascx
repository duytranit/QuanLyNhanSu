<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.QuanHe.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table class="rbTable">
    <tr>
        <td class="rbTableCellLabel">
            Quan hệ gia đình:
        </td>
        <td>
            <asp:RadioButtonList ID="RadioButtonListBenVo" runat="server" RepeatDirection="Horizontal"
                CssClass="rbRadioButtonList">
                <asp:ListItem Text="Bên ruột" Value="False" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Bên vợ(chồng)" Value="True"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Họ và tên:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxTen" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Họ và tên" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTen" ControlToValidate="RadTextBoxTen" runat="server" Display="Dynamic"
                ErrorMessage="Nhập họ và tên" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Giới tính:
        </td>
        <td>
            <asp:RadioButtonList ID="RadioButtonListGioiTinh" runat="server" RepeatDirection="Horizontal"
                CssClass="rbRadioButtonList">
                <asp:ListItem Text="Nam" Value="True" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Nữ" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Mối quan hệ:
        </td>
        <td>
            <telerik:RadComboBox ID="cbbQuanHe" runat="server" CssClass="rbRadTextBox" Filter="Contains"></telerik:RadComboBox>
            <asp:RequiredFieldValidator ID="rfvMoiQuanHe" runat="server" ControlToValidate="cbbQuanHe" Display="Dynamic"
                ErrorMessage="Chọn mối quan hệ" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Ngày sinh:
        </td>
        <td>
            <telerik:RadDatePicker ID="RadDatePickerNgaySinh" runat="server" Culture="vi-VN" MinDate="1900-01-01"
                CssClass="rbRadTextBox" DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red"
                DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvNgaySinh" runat="server" ControlToValidate="RadDatePickerNgaySinh" Display="Dynamic"
                ErrorMessage="Nhập ngày tháng năm sinh" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNgaySinh" runat="server" ControlToValidate="RadDatePickerNgaySinh" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày tháng năm sinh có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Hộ khẩu:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxHoKhau" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hộ khẩu" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Nơi ở:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxNoiO" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Nơi ở" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </td>
    </tr>
</table>

<p class="rbButtons">
    <asp:LinkButton ID="ButtonCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="ButtonDelete_Click"
                OnClientClick="return confirm('Bạn có muốn xóa quan hệ gia đình này không?')"></asp:LinkButton>
    <asp:LinkButton ID="ButtonBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="ButtonBack_Click"></asp:LinkButton>
</p>