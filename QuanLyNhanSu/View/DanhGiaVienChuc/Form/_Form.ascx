<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.DanhGiaVienChuc.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ngày tháng năm thực hiện đánh giá:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkNgayThang" runat="server" CssClass="rbRadTextBox" Culture="vi-VN"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvNgayThang" runat="server" ControlToValidate="dpkNgayThang" Display="Dynamic"
                ErrorMessage="Nhập ngày tháng năm thực hiện đánh giá" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNgayThang" runat="server" ControlToValidate="dpkNgayThang" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày tháng năm thực hiện có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Đánh giá và phân loại viên chức năm:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNam" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Năm đánh giá" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"
                MaxLength="4"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNam" runat="server" ControlToValidate="txtNam" Display="Dynamic"
                ErrorMessage="Nhập năm đánh giá và phân loại viên chức" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvNam" runat="server" ControlToValidate="txtNam" Display="Dynamic" Type="Integer"
                Operator="DataTypeCheck" ErrorMessage="Năm đánh giá và phân loại lao động có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Họ và tên:
        </asp:TableCell>
        <asp:TableCell>
            <asp:Label ID="lblHoTen" runat="server"></asp:Label>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chức danh nghề nghiệp:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtChucDanh" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chức danh nghề nghiệp" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvChucDanh" runat="server" ControlToValidate="txtChucDanh" Display="Dynamic"
                ErrorMessage="Nhập chức danh nghề nghiệp" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Đơn vị công tác:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtDonVi" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Đơn vị công tác" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvDonVi" runat="server" ControlToValidate="txtDonVi" Display="Dynamic"
                ErrorMessage="Nhập đơn vị công tác" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hạng chức danh nghề nghiệp:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNgheNghiep" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chức danh nghề nghiệp" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNgheNghiep" runat="server" ControlToValidate="txtNgheNghiep" Display="Dynamic"
                ErrorMessage="Nhập chức danh nghề nghiệp" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Bậc:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtBac" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Bậc" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true" MaxLength="2"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvBac" runat="server" ControlToValidate="txtBac" Display="Dynamic"
                ErrorMessage="Nhập bậc lương" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvBac" runat="server" ControlToValidate="txtBac" Display="Dynamic" Type="Integer"
                Operator="DataTypeCheck" ErrorMessage="Bậc lương có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hệ số lương:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtHeSoLuong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hệ số lương" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvHeSoLuong" runat="server" ControlToValidate="txtHeSoLuong" Display="Dynamic"
                ErrorMessage="Nhập hệ số lương" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvHeSoLuong" runat="server" ControlToValidate="txtHeSoLuong" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Hệ số lương có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell><br /></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
            <b>I. TỰ ĐÁNH GIÁ KẾT QUẢ CÔNG TÁC, TU DƯỠNG, RÈN LUYỆN CỦA VIÊN CHỨC:</b>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Kết quả thực hiện công việc hoặc nhiệm vụ hợp đồng làm việc đã ký kết:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtKetQua" runat="server" WrapperCssClass="rbRadTextBox" TextMode="MultiLine" Rows="5"
                EmptyMessage="Kết quả thực hiện công việc" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvKetQua" runat="server" ControlToValidate="txtKetQua" Display="Dynamic"
                ErrorMessage="Nhập kết quả thực hiện công việc hoặc nhiệm vụ hợp đồng làm việc đã ký kết"
                ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Việc thực hiện quy định về đạo đức nghề nghiệp:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtDaoDuc" runat="server" WrapperCssClass="rbRadTextBox" TextMode="MultiLine" Rows="5"
                EmptyMessage="Đạo đức nghề nghiệp" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvDaoDuc" runat="server" ControlToValidate="txtDaoDuc" Display="Dynamic"
                ErrorMessage="Nhập việc thực hiện quy định về đạo đức nghề nghiệp" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Tinh thần trách nhiệm, thái độ phục vụ nhân dân, tinh thần hợp tác với đồng nghiệp và việc thực hiện quy tắc ứng xử của người viên chức:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtTrachNhiem" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Trách nhiệm, thái độ phục vụ nhân dân ..." EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTrachNhiem" runat="server" ControlToValidate="txtTrachNhiem" Display="Dynamic"
                ErrorMessage="Nhập trách nhiệm, thái độ phục vụ nhân dân, tinh thần hợp tác với đồng nghiệp và việc thực hiện quy tắc ứng xử của viên chức"
                ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Việc thực hiện các nghĩa vụ khác của viên chức:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNghiaVu" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Nghĩa vụ khác" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvNghiaVu" runat="server" ControlToValidate="txtNghiaVu" Display="Dynamic"
                ErrorMessage="Nhập việc thực hiện các nghĩa vụ khác của viên chức" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell><br /></asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
            <b>
                II. TỰ ĐÁNH GIÁ, PHÂN LOẠI CỦA VIÊN CHỨC:
            </b>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Tự đánh giá ưu khuyết điểm:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtUuDiem" runat="server" WrapperCssClass="rbRadTextBox" TextMode="MultiLine" Rows="5"
                EmptyMessage="Ưu khuyết điểm" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvUuDiem" runat="server" ControlToValidate="txtUuDiem" Display="Dynamic"
                ErrorMessage="Nhập đánh giá ưu khuyết điểm" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Phân loại đánh giá:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownList ID="ddlDanhGia" runat="server" CssClass="rbRadTextBox"
                AutoPostBack="true" OnSelectedIndexChanged="ddlDanhGia_SelectedIndexChanged">
                <Items>
                    <telerik:DropDownListItem Text="Hoàn thành xuất sắc nhiệm vụ" Value="Hoàn thành xuất sắc nhiệm vụ" />
                    <telerik:DropDownListItem Text="Hoàn thành tốt nhiệm vụ" Value="Hoàn thành tốt nhiệm vụ" Selected="true" />
                    <telerik:DropDownListItem Text="Hoàn thành nhiệm vụ" Value="Hoàn thành nhiệm vụ" />
                    <telerik:DropDownListItem Text="Không hoàn thành nhiệm vụ" Value="Không hoàn thành nhiệm vụ" />
                </Items>
            </telerik:RadDropDownList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ý kiến của tập thể đơn vị và lãnh đạo trực tiếp quản lý:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtYKien" runat="server" WrapperCssClass="rbRadTextBox" TextMode="MultiLine" Rows="5"
                EmptyMessage="Ý kiến tập thể và lãnh đạo" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Thống nhất mức hoàn thành niệm vụ:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownList ID="ddlThongNhat" runat="server" CssClass="rbRadTextBox">
                <Items>
                    <telerik:DropDownListItem Text="Hoàn thành xuất sắc nhiệm vụ" Value="Hoàn thành xuất sắc nhiệm vụ" />
                    <telerik:DropDownListItem Text="Hoàn thành tốt nhiệm vụ" Value="Hoàn thành tốt nhiệm vụ" Selected="true" />
                    <telerik:DropDownListItem Text="Hoàn thành nhiệm vụ" Value="Hoàn thành nhiệm vụ" />
                    <telerik:DropDownListItem Text="Không hoàn thành nhiệm vụ" Value="Không hoàn thành nhiệm vụ" />
                </Items>
            </telerik:RadDropDownList>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa phiếu đánh giá và phân loại lao động này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>