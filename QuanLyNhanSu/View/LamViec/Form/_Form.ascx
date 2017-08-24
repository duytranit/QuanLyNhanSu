<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.LamViec.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Đơn vị:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownTree ID="ddtDonVi" runat="server" CssClass="rbRadTextBox" EnableFiltering="true" DefaultMessage="Đơn vị công tác"
                FilterSettings-EmptyMessage="Tên đơn vị" FilterSettings-Filter="Contains" FilterSettings-Highlight="Matches" DropDownSettings-CloseDropDownOnSelection="true"></telerik:RadDropDownTree>
            <asp:RequiredFieldValidator ID="rfvDonVi" runat="server" ControlToValidate="ddtDonVi" Display="Dynamic"
                ErrorMessage="Chọn đơn vị" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chức vụ:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadComboBox ID="cbbChucVu" runat="server" CssClass="rbRadTextBox" Filter="Contains"></telerik:RadComboBox>
            <asp:RequiredFieldValidator ID="rfvChucVu" runat="server" ControlToValidate="cbbChucVu" Display="Dynamic"
                ErrorMessage="Chọn chức vụ" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Làm việc từ ngày:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkTuNgay" runat="server" Culture="vi-VN" CssClass="rbRadTextBox"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" 
                DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvTuNgay" runat="server" ControlToValidate="dpkTuNgay" Display="Dynamic"
                ErrorMessage="Nhập ngày bắt đầu làm việc" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvTuNgay" runat="server" ControlToValidate="dpkTuNgay" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày bắt đầu làm việc có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
            <asp:CompareValidator ID="cpvTuNgay_DenNgay" runat="server" ControlToValidate="dpkTuNgay" Display="Dynamic" ControlToCompare="dpkDenNgay" Type="Date"
                Operator="LessThan" ErrorMessage="Ngày bắt đầu công tác phải trước ngày kết thúc công tác" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Làm việc đến ngày:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkDenNgay" runat="server" Culture="vi-VN" CssClass="rbRadTextBox"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:CompareValidator ID="cpvDenNgay" runat="server" ControlToValidate="dpkDenNgay" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày kết thúc làm việc có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
            <asp:CompareValidator ID="cpvDenNgay_TuNgay" runat="server" ControlToValidate="dpkDenNgay" Display="Dynamic" ControlToCompare="dpkTuNgay" Type="Date"
                Operator="GreaterThan" ErrorMessage="Ngày kết thúc làm việc phải sau ngày bắt đầu" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Số hợp đồng:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtSoHopDong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage=".../..../HĐLĐ" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hợp đồng ngày:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkNgayHopDong" runat="server" Calendar-Culture="vi-VN"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:CompareValidator ID="cpvNgayHopDong" runat="server" ControlToValidate="dpkNgayHopDong" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày hợp đồng có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hệ số lương:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadComboBox ID="cbbHeSoLuong" runat="server" CssClass="rbRadTextBox"
                EmptyMessage="Hệ số lương" Filter="Contains">
                <ItemTemplate>
                    -
                    <b>Hệ số: <%# DataBinder.Eval(Container.DataItem, "HSLHeSo") %></b>
                    (
                    <i>
                        <%# DataBinder.Eval(Container.DataItem, "NGTen") %> | 
                        <%# DataBinder.Eval(Container.DataItem, "BLTen") %>
                    </i>
                    )
                </ItemTemplate>
            </telerik:RadComboBox>
            <asp:RequiredFieldValidator ID="rfvHeSoLuong" runat="server" ControlToValidate="cbbHeSoLuong" Display="Dynamic"
                ErrorMessage="Nhập hệ số lương" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Lương cơ bản:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtLuongCoBan" runat="server" WrapperCssClass="rbRadTextBox" Text="1300000"
                EmptyMessage="Lương cơ bản" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvLuongCoBan" runat="server" ControlToValidate="txtLuongCoBan" Display="Dynamic"
                ErrorMessage="Nhập lương cơ bản" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvLuongCoBan" runat="server" ControlToValidate="txtLuongCoBan" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Lương cơ bản có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Số ngày phép:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtSoNgayPhep" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Số ngày phép" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvSoNgayPhep" runat="server" ControlToValidate="txtSoNgayPhep" Display="Dynamic"
                ErrorMessage="Nhập số ngày phép" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvSoNgayPhep" runat="server" ControlToValidate="txtSoNgayPhep" Display="Dynamic" Type="Integer"
                Operator="DataTypeCheck" ErrorMessage="Số ngày phép có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
            <asp:RangeValidator ID="rangvSoNgayPhep" runat="server" ControlToValidate="txtSoNgayPhep" Display="Dynamic" Type="Integer"
                MinimumValue="1" MaximumValue="365" ErrorMessage="Số ngày phép có giá trị từ 1-365 ngày" ForeColor="Red" Font-Italic="true"></asp:RangeValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Nhiệm vụ được phân công:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNgheNghiep" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Nhiệm vụ" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNgheNghiep" runat="server" ControlToValidate="txtNgheNghiep"
                ErrorMessage="Nhập nhiệm vụ được phân công" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Phụ cấp chức vụ:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPhuCapChucVu" runat="server" WrapperCssClass="rbRadTextBox" Text="0"
                EmptyMessage="Phụ cấp chức vụ" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvPhuCapChucVu" runat="server" ControlToValidate="txtPhuCapChucVu" Display="Dynamic"
                ErrorMessage="Nhập phụ cấp chức vụ" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvPhuCapChucVu" runat="server" ControlToValidate="txtPhuCapChucVu" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Phụ cấp chức vụ có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Phục cấp công vụ:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPhuCapCongVu" runat="server" WrapperCssClass="rbRadTextBox" Text="0"
                EmptyMessage="Phụ cấp công vụ" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvPhuCapCongVu" runat="server" ControlToValidate="txtPhuCapCongVu" Display="Dynamic"
                ErrorMessage="Nhập phụ cấp công vụ" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvPhuCapCongVu" runat="server" ControlToValidate="txtPhuCapCongVu" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Phụ cấp công vụ có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Phụ cấp kiêm nhiệm:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPhuCapKiemNhiem" runat="server" WrapperCssClass="rbRadTextBox" Text="0"
                EmptyMessage="Phụ cấp kiêm nhiệm" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvPhuCapKiemNhiem" runat="server" ControlToValidate="txtPhuCapKiemNhiem" Display="Dynamic"
                ErrorMessage="Nhập phụ cấp kiêm nhiệm" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvPhuCapKiemNhiem" runat="server" ControlToValidate="txtPhuCapKiemNhiem" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Phụ cấp kiêm nhiệm có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>    
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Phụ cấp nghề nghiệp:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPhuCapNghe" runat="server" WrapperCssClass="rbRadTextBox" Text="0"
                EmptyMessage="Phụ cấp nghề nghiệp" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvPhuCapNghe" runat="server" ControlToValidate="txtPhuCapNghe" Display="Dynamic"
                ErrorMessage="Nhập phụ cấp nghề nghiệp" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvPhuCapNghe" runat="server" ControlToValidate="txtPhuCapNghe" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Phụ cấp nghề nghiệp có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Phụ cấp thâm niên:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPhuCapThamNien" runat="server" WrapperCssClass="rbRadTextBox" Text="0"
                EmptyMessage="Phụ cấp thâm niên" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvPhuCapThamNien" runat="server" ControlToValidate="txtPhuCapThamNien" Display="Dynamic"
                ErrorMessage="Nhập phụ cấp thâm niên" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvPhuCapThamNien" runat="server" ControlToValidate="txtPhuCapThamNien" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Phụ cấp thâm niên có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Phụ cấp vượt khung:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPhuCapVuotKhung" runat="server" WrapperCssClass="rbRadTextBox" Text="0"
                EmptyMessage="Phụ cấp vượt khung" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvPhuCapVuotKhung" runat="server" ControlToValidate="txtPhuCapVuotKhung" Display="Dynamic"
                ErrorMessage="Phụ cấp vượt khung có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvPhuCapVuotKhung" runat="server" ControlToValidate="txtPhuCapVuotKhung" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Phụ cấp vượt khung có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Phụ cấp độc hại:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPhuCapDocHai" runat="server" WrapperCssClass="rbRadTextBox" Text="0"
                EmptyMessage="Phụ cấp độc hại" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvPhuCapDocHai" runat="server" ControlToValidate="txtPhuCapDocHai" Display="Dynamic"
                ErrorMessage="Phụ cấp độc hại có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Tỷ lệ hưởng lương (%):
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtTyLe" runat="server" WrapperCssClass="rbRadTextBox" Text="100"
                EmptyMessage="Tỷ lệ %" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTyLe" runat="server" ControlToValidate="txtTyLe" Display="Dynamic"
                ErrorMessage="Nhập tỷ lệ hưởng lương" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvTyLe" runat="server" ControlToValidate="txtTyLe" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Tỷ lệ hưởng lương có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa thông tin việc làm này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>