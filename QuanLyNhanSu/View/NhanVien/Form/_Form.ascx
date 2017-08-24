<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.NhanVien.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table class="rbTable">
    <tr>
        <td>
            <table class="rbTable">
                <tr>
                    <td class="rbTableCellLabel">Họ và tên khai sinh:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBoxTen" runat="server" EmptyMessage="Họ và tên" WrapperCssClass="rbRadTextBox"
                            ToolTip="Nhập họ và tên khai sinh" EmptyMessageStyle-BorderColor="Red">
                        </telerik:RadTextBox><br />
                        <asp:RequiredFieldValidator ControlToValidate="RadTextBoxTen" runat="server" Display="Dynamic"
                            ErrorMessage="Nhập họ và tên nhân viên" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="rbTableCellLabel">Tên gọi khác:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="RadTextBoxTenKhac" runat="server" EmptyMessage="(nếu có)" WrapperCssClass="rbRadTextBox"
                            ToolTip="Nhập vào đây tên gọi khác (nếu có)">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="rbTableCellLabel">Ngày sinh:
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="RadDatePickerNgaySinh" runat="server" Culture="vi-VN" CssClass="rbRadTextBox"
                            DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-Font-Italic="true" DateInput-EmptyMessageStyle-BorderColor="Red">
                        </telerik:RadDatePicker>
                        <br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="RadDatePickerNgaySinh" Display="Dynamic"
                            ErrorMessage="Nhập ngày tháng năm sinh" ForeColor="Red" Font-Italic="true">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ControlToValidate="RadDatePickerNgaySinh" Display="Dynamic" Type="Date"
                            Operator="DataTypeCheck" ErrorMessage="Ngày tháng năm sinh có giá trị không thích hợp" ForeColor="Red" Font-Italic="true">
                        </asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="rbTableCellLabel">Giới tính:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonGioiTinh" runat="server" RepeatDirection="Horizontal"
                            CssClass="rbRadioButtonList">
                            <asp:ListItem Text="Nam" Value="True" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Nữ" Value="False"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 30%;">
            <asp:Image ID="ImageIMG" runat="server" ImageUrl="~/Uploads/Images/NhanVien/DefaultUser.png" Width="100px" Height="100px" />
            <asp:FileUpload ID="FileUploadImage" runat="server" />
            <asp:CheckBox ID="CheckBoxUseImage" runat="server" Text="Dùm hình mặc định" CssClass="rbCheckBox" />
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorFileUploadImage" runat="server"
                ValidationExpression="^.+(.jpg|.jpeg|.png|.gif)$" ControlToValidate="FileUploadImage"
                ErrorMessage="Hình ảnh không thích hợp" CssClass="errorsMessage"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>
<div style="width: 100%; text-align: center;">
    <marquee style="width: 50%;">
        <strong><== THÔNG TIN LIÊN QUAN ==></strong>
    </marquee>
</div>
<asp:Table ID="tblNhanVien" runat="server" CssClass="rbTable" Style="margin-top: 20px;">
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">Nơi sinh:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxNoiSinh" runat="server" TextMode="MultiLine" Rows="2" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Nơi sinh">
            </telerik:RadTextBox>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">Quê quán:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxQueQuan" runat="server" TextMode="MultiLine" Rows="2" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Quê quán">
            </telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">Hộ khẩu thường trú:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxHoKhau" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hộ khẩu" EmptyMessageStyle-Font-Italic="true" TextMode="MultiLine" Rows="2"
                ToolTip="Nhập hộ khẩu thường trú" EmptyMessageStyle-BorderColor="Red">
            </telerik:RadTextBox><br />
            <asp:RequiredFieldValidator ControlToValidate="RadTextBoxHoKhau" runat="server" Display="Dynamic"
                ErrorMessage="Nhập hộ khẩu thường trú" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">Nơi ở hiện nay:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxNoiO" runat="server" WrapperCssClass="rbRadTextBox" ToolTip="Nơi ở hiện nay"
                TextMode="MultiLine" Rows="2"
                EmptyMessage="Địa chỉ nơi ở" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox><br />
            <asp:RequiredFieldValidator ControlToValidate="RadTextBoxNoiO" runat="server" Display="Dynamic"
                ErrorMessage="Nhập địa chỉ nơi ở" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">Dân tộc:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadComboBox ID="cbbDanToc" runat="server" CssClass="rbRadTextBox"
                EmptyMessage="Dân tộc" Filter="Contains">
            </telerik:RadComboBox>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">Tôn giáo:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadComboBox ID="cbbTonGiao" runat="server" CssClass="rbRadTextBox"
                EmptyMessage="Tôn giáo" Filter="Contains">
            </telerik:RadComboBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">Sổ bảo hiểm xã hội</asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtBHXH" runat="server" WrapperCssClass="rbRadTextBox" MaxLength="10"
                EmptyMessage="Sổ BHXH" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox><br />
            <asp:RegularExpressionValidator ID="revBHXH" ControlToValidate="RadTextBoxCMND" runat="server"
                ValidationExpression="^\d{0,10}" Display="Dynamic"
                ErrorMessage="Số sổ bảo hiểm xã hội không đúng" ForeColor="Red" Font-Italic="true">
            </asp:RegularExpressionValidator>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">Trình độ giáo dục phổ thông:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownList ID="RadDropDownListGiaoDucPhoThong" runat="server"
                CssClass="rbRadTextBox" DefaultMessage="Đã tốt nghiệp lớp mấy/thuộc hệ nào?"
                ToolTip="Chọn trình độ giáo dục phổ thông">
            </telerik:RadDropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">Trình độ chuyên môn cao nhất:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownList ID="RadDropDownListChuyenMon" runat="server"
                CssClass="rbRadTextBox" DefaultMessage="Chọn chuyên môn" ToolTip="Chọn trình độc chuyên môn cao nhất">
            </telerik:RadDropDownList>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">
            Ngành đào tạo:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxNganh" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Ngành đào tạo" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">Lý luận chính trị:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownList ID="RadDropDownListLyLuanChinhTri" runat="server" CssClass="rbRadTextBox"
                DefaultMessage="Lý luận chính trị" ToolTip="Chọn lý luận chính trị">
            </telerik:RadDropDownList>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">Quản lý nhà nước:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownList ID="RadDropDownListQuanLyNhaNuoc" runat="server" CssClass="rbRadTextBox"
                DefaultMessage="Chọn quản lý nhà nước" ToolTip="Chọn quản lý nhà nước">
            </telerik:RadDropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">Tình trạng sức khỏe:
        </asp:TableCell>
        <asp:TableCell>
            <asp:RadioButtonList ID="rblSucKhoe" runat="server" RepeatDirection="Horizontal" CssClass="rbRadioButtonList">
                <asp:ListItem Text="Tốt" Value="Tốt" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Xấu" Value="Xấu"></asp:ListItem>
            </asp:RadioButtonList>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">
            Nhóm máu:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownList ID="RadDropDownListNhomMau" runat="server" CssClass="rbRadTextBox"
                DefaultMessage="Nhóm máu" ToolTip="Chọn nhóm máu">
            </telerik:RadDropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">
            Chiều cao (mét):
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxChieuCao" runat="server" WrapperCssClass="rbRadTextBox" MaxLength="4"
                EmptyMessage="Chiều cao" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox><br />
            <asp:CompareValidator ID="cpvChieuCao" runat="server" ControlToValidate="RadTextBoxChieuCao" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Chiều cao có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
            <asp:RangeValidator ID="rngvChieuCao" runat="server" ControlToValidate="RadTextBoxChieuCao" Display="Dynamic" Type="Double"
                MinimumValue="0" MaximumValue="3" ErrorMessage="Chiều cao có giá trị từ 0-3 mét" ForeColor="Red" Font-Italic="true"></asp:RangeValidator>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">
            Cân nặng (kilôgram):
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxCanNang" runat="server" EmptyMessage="Cân nặng" MaxLength="6"
                ToolTip="Nhập cân nặng" WrapperCssClass="rbRadTextBox">
            </telerik:RadTextBox><br />
            <asp:CompareValidator ID="cpvCanNang" runat="server" ControlToValidate="RadTextBoxCanNang"  Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Cân nặng có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
            <asp:RangeValidator ID="rngvCanNang" runat="server" ControlToValidate="RadTextBoxCanNang" Display="Dynamic" Type="Double"
                MinimumValue="10" MaximumValue="1000" ErrorMessage="Cân nặng có giá trị từ 10-1000kg" ForeColor="Red" Font-Italic="true"></asp:RangeValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="AlignRightCell">
            Số chứng minh nhân dân:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="RadTextBoxCMND" runat="server" WrapperCssClass="rbRadTextBox" MaxLength="9"
                ToolTip="Nhập chứng minh nhân dân" EmptyMessage="___-___-___" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox><br />
            <asp:RegularExpressionValidator ControlToValidate="RadTextBoxCMND" runat="server"
                ValidationExpression="^\d{9}" Display="Dynamic"
                ErrorMessage="Số chứng minh nhân dân không đúng" ForeColor="Red" Font-Italic="true">
            </asp:RegularExpressionValidator>
        </asp:TableCell>
        <asp:TableCell CssClass="AlignRightCell">
            Ngày cấp:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="RadDatePickerCMNDNgayCap" runat="server" MinDate="01/01/1800 00:00:00" Culture="vi-VN"
                CssClass="rbRadTextBox" DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-Font-Italic="true">
            </telerik:RadDatePicker>
            <br />
            <asp:CompareValidator runat="server" ControlToValidate="RadDatePickerCMNDNgayCap" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày cấp chứng minh nhân dân có giá trị không thích hợp">
            </asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<p class="rbButtons">
    <asp:LinkButton ID="ButtonCreate" runat="server" Text="Hoàn tất" OnClick="ButtonCreate_Click" CssClass="btn btn-default"></asp:LinkButton>
    <asp:LinkButton ID="ButtonUpdate" runat="server" Text="Hoàn tất" OnClick="ButtonUpdate_Click" CssClass="btn btn-default" />
    <asp:LinkButton ID="ButtonDelete" runat="server" Text="Xóa" OnClientClick="return confirm('Bạn có muốn xóa nhân viên này không?')" OnClick="ButtonDelete_Click" CssClass="btn btn-default" />
    <asp:LinkButton ID="ButtonBack" runat="server" Text="Trở về" CssClass="btn btn-default" PostBackUrl="~/NhanSu"></asp:LinkButton>
</p>
