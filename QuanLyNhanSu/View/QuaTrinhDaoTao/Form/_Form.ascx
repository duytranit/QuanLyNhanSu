<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.QuaTrinhDaoTao.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table class="rbTable">
    <tr>
        <td class="rbTableCellLabel">
            Tên trường hoặc cơ sở đào tạo, bồi dưỡng:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxTruong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Tên trường hoặc cơ sở đào tạo, bồi dưỡng" EmptyMessageStyle-BorderColor="Red"
                EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTruong" ControlToValidate="RadTextBoxTruong" runat="server" Display="Dynamic"
                ErrorMessage="Nhập tên trường hoặc cơ sở đào tạo, bồi thường" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Chuyên ngành đào tạo, bồi dưỡng:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxChuyenNganh" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chuyên ngành đào tạo, bồi dưỡng" EmptyMessageStyle-BorderColor="Red" 
                EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvChuyenNganh" runat="server" ControlToValidate="RadTextBoxChuyenNganh" Display="Dynamic"
                ErrorMessage="Nhập chuyên ngành đào tạo, bồi thường" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Từ ngày:
        </td>
        <td>
            <telerik:RadDatePicker ID="RadDatePickerTuNgay" runat="server" Culture="vi-VN" Calendar-Culture="vi-VN"
                CssClass="rbRadTextBox" DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red"
                DateInput-EmptyMessageStyle-Font-Italic="true">
            </telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvTuNgay" ControlToValidate="RadDatePickerTuNgay" runat="server" Display="Dynamic"
                ErrorMessage="Nhập ngày bắt đầu" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvTuNgay" runat="server" ControlToValidate="RadDatePickerTuNgay" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày bắt đầu có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Đến ngày:
        </td>
        <td>
            <telerik:RadDatePicker ID="RadDatePickerDenNgay" runat="server" Culture="vi-VN" CssClass="rbRadTextBox"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red"
                DateInput-EmptyMessageStyle-Font-Italic="true">
            </telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvDenNgay" ControlToValidate="RadDatePickerDenNgay" runat="server" Display="Dynamic"
                ErrorMessage="Nhập ngày kết thúc " ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvDenNgay" runat="server" ControlToValidate="RadDatePickerDenNgay" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày kết thúc có giá trị không thích hợp"
                ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Hình thức đào tạo, bồi dưỡng:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxHinhThuc" runat="server" EmptyMessage="Hình thức đào tạo" WrapperCssClass="rbRadTextBox"
                EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvHinhThuc" runat="server" ControlToValidate="RadTextBoxHinhThuc" Display="Dynamic"
                ErrorMessage="Nhập hình thức đào tạo, bồi dưỡng" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Văn bằng, chứng chỉ:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxVanBang" runat="server" EmptyMessage="Văn bằng, chứng chỉ" WrapperCssClass="rbRadTextBox"
                EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvVanBang" runat="server" ControlToValidate="RadTextBoxVanBang" Display="Dynamic"
                ErrorMessage="Nhập văn bằng, chứng chỉ" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
<p class="rbButtons">
    <asp:LinkButton ID="ButtonCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonDelete" runat="server" Text="Xóa" CssClass="btn btn-default"
                OnClientClick="return confirm('Bạn có muốn xóa quá trình đào tạo này không?')" OnClick="ButtonDelete_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="ButtonBack_Click"></asp:LinkButton>
</p>