<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.KeKhai.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<p style="text-align:center; margin-top: 20px; font-weight: bold;">
    1. Người kê khai tài sản, thu nhập
</p>
<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Năm kê khai:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNam" runat="server" WrapperCssClass="rbRadTextBox"
                MaxLength="4" EmptyMessage="Năm kê khai" EmptyMessageStyle-BorderColor="Red"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNam" runat="server" ControlToValidate="txtNam" Display="Dynamic"
                ErrorMessage="Nhập năm kê khai tài sản" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNam" runat="server" ControlToValidate="txtNam" Display="Dynamic" Type="Integer"
                Operator="DataTypeCheck" ErrorMessage="Năm kê khai có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ngày kê khai:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkNgayKeKhai" runat="server" CssClass="rbRadTextBox"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvNgayKeKhai" runat="server" ControlToValidate="dpkNgayKeKhai" Display="Dynamic"
                ErrorMessage="Nhập ngày kê khai" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNgayKeKhai" runat="server" ControlToValidate="dpkNgayKeKhai" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày kê khai có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ngày nhập:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkNgayNhap" runat="server" CssClass="rbRadTextBox"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvNgayNhap" runat="server" ControlToValidate="dpkNgayNhap" Display="Dynamic"
                ErrorMessage="Nhập ngày nhập kê khai" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNgayNhap" runat="server" ControlToValidate="dpkNgayNhap" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày nhập kê khai có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chức vụ/ chức danh công tác:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtChucVu" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chức vụ" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvChucVu" runat="server" ControlToValidate="txtChucVu" Display="Dynamic"
                ErrorMessage="Nhập chức vụ" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Cơ quan/ đơn vị công tác:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtCoQuan" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Cơ quan" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvCoQuan" runat="server" ControlToValidate="txtCoQuan" Display="Dynamic"
                ErrorMessage="Nhập cơ quan/ đơn vị công tác" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hộ khẩu thường trú:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtHoKhau" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hộ khẩu thường trú" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvHoKhau" runat="server" ControlToValidate="txtHoKhau" Display="Dynamic"
                ErrorMessage="Nhập hộ khẩu thường trú" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chỗ ở hiện tại:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtChoO" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chỗ ở hiện tại" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvChoO" runat="server" ControlToValidate="txtChoO" Display="Dynamic"
                ErrorMessage="Nhập chỗ ở hiện tại" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<p style="text-align:center; margin-top: 20px; font-weight: bold;">
    2. Vợ hoặc chồng của người kê khai tài sản, thu nhập:
</p>
<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Họ và tên:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtVoChong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Họ và tên" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvVoChong" runat="server" ControlToValidate="txtVoChong" Display="Dynamic"
                ErrorMessage="Nhập họ và tên" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ngày tháng năm sinh:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkVCDOB" runat="server" CssClass="rbRadTextBox"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvVCDOB" runat="server" ControlToValidate="dpkVCDOB" Display="Dynamic"
                ErrorMessage="Nhập ngày tháng năm sinh" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvVCDOB" runat="server" ControlToValidate="dpkVCDOB" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày tháng năm sinh có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chức vụ/ chức danh công tác:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtVCChucVu" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chức vụ" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Cơ quan/ đơn vị công tác:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtVCCoQuan" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Cơ quan" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hộ khẩu thường trú:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtVCHoKhau" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hộ khẩu thường trú" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chỗ ở hiện tại:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtVCChoO" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chỗ ở hiện tại"  EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm ('Bạn có muốn xóa kê khai này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>
