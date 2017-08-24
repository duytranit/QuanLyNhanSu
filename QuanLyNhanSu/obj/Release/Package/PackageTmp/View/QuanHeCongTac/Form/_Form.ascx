<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.QuanHeCongTac.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<table class="rbTable">
    <tr>
        <td class="rbTableCellLabel">
            Từ ngày:
        </td>
        <td>
            <telerik:RadDatePicker ID="RadDatePickerTuNgay" runat="server" CssClass="rbRadTextBox" Culture="vi-VN" MinDate="01/01/1900"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="RadDatePickerTuNgay" Display="Dynamic"
                ErrorMessage="Nhập ngày bắt đầu công tác" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvTuNgay" runat="server" ControlToValidate="RadDatePickerTuNgay" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày bắt đầu công tác có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Đến ngày:
        </td>
        <td>
            <telerik:RadDatePicker ID="RadDatePickerDenNgay" runat="server" CssClass="rbRadTextBox" Culture="vi-VN" 
                MinDate="01/01/1900" DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:CompareValidator ID="cpvDenNgay" runat="server" ControlToValidate="RadDatePickerDenNgay" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày kết thúc công tác có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
            <asp:CompareValidator runat="server" ControlToValidate="RadDatePickerDenNgay" ControlToCompare="RadDatePickerTuNgay" Display="Dynamic" Type="Date" Operator="GreaterThan"
                ErrorMessage="Ngày kết thúc công tác phải sau ngày bắt đầu công tác" ForeColor="Red" Font-Italic="true">
            </asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Đơn vị công tác:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxDonVi" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Đơn vị công tác" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvDonVi" runat="server" ControlToValidate="RadTextBoxDonVi" Display="Dynamic"
                ErrorMessage="Nhập đơn vị công tác" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Chức vụ:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxChucVu" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Vị trí công tác" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Chức năng, nhiệm vụ:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxNgheNghiep" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chức năng, nhiệm vụ" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNgheNghiep" runat="server" ControlToValidate="RadTextBoxNgheNghiep" Display="Dynamic"
                ErrorMessage="Nhập chức năng, nhiệm vụ công tác" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Ghi chú
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxGhiChu" runat="server" TextMode="MultiLine" Rows="3" 
                WrapperCssClass="rbRadTextBox" EmptyMessage="Ghi chú" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </td>
    </tr>
</table>
<p class="rbButtons">
    <asp:LinkButton ID="ButtonCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonCreate_Click" />
    <asp:LinkButton ID="ButtonUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonUpdate_Click" />
    <asp:LinkButton ID="ButtonDelete" runat="server" Text="Xóa" CssClass="btn btn-default" 
        OnClientClick="return confirm('Bạn có muốn xóa quá trình công tác này không?')" OnClick="ButtonDelete_Click" />
    <asp:LinkButton ID="ButtonBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="ButtonBack_Click"></asp:LinkButton>
</p>