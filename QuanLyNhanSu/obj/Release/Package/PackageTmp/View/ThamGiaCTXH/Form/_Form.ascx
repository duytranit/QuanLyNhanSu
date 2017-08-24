<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.ThamGiaCTXH.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Tổ chức chính trị-xã hội:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownList ID="RadDropDownListCTXH" runat="server" CssClass="rbRadTextBox"
                ToolTip="Chọn tổ chức chính trị-xã hội tham gia"></telerik:RadDropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Vị trí phụ trách:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxChucVu" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Vị trí phụ trách"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Từ ngày:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="RadDatePickerTuNgay" runat="server" CssClass="rbRadTextBox"
                Culture="vi-VN" Calendar-CultureInfo="vi-VN"
                DateInput-EmptyMessage="Ngày/Tháng/Năm" ToolTip="Chọn ngày tham gia tổ chức chính trị-xã hội"></telerik:RadDatePicker>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Đến ngày:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="RadDatePickerDenNgay" runat="server" CssClass="rbRadTextBox"
                Culture="vi-Vn" Calendar-CultureInfo="vi-VN"
                DateInput-EmptyMessage="Ngày/Tháng/Năm" ToolTip="Chọn ngày kết thúc tham gia tổ chức chính trị-xã hội"></telerik:RadDatePicker>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Nội dung:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxNoiDung" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Làm việc gì trong tổ chức" TextMode="MultiLine" Rows="3"
                ToolTip="Nhập nội dung làm việc trong tổ chức"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<p class="rbButtons">
    <asp:LinkButton ID="ButtonCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="ButtonDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa quá trình tham gia tổ chức chính trị xã hội này không ?')"></asp:LinkButton>
    <asp:LinkButton ID="ButtonBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="ButtonBack_Click"></asp:LinkButton>
</p>