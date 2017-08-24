<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.Account.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Nhân viên:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDropDownTree ID="ddtNhanVien" runat="server" CssClass="rbRadTextBox" EnableFiltering="true" DefaultMessage="Chọn nhân viên"
                FilterSettings-EmptyMessage="Tên nhân viên" FilterSettings-Filter="Contains" FilterSettings-Highlight="Matches" DropDownSettings-CloseDropDownOnSelection="true"></telerik:RadDropDownTree>
            <asp:RequiredFieldValidator ID="rfvNhanVien" runat="server" ControlToValidate="ddtNhanVien" Display="Dynamic"
                ErrorMessage="Chọn nhân viên" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Email:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtEmail" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Email" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                ErrorMessage="Nhập email" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Mật khẩu:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtPassword" runat="server" WrapperCssClass="rbRadTextBox" TextMode="Password"
                EmptyMessage="Mật khẩu" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chức năng:
        </asp:TableCell>
        <asp:TableCell>
            <asp:RadioButtonList ID="rblChucNang" runat="server" CssClass="rbRadioButtonList" OnSelectedIndexChanged="rblChucNang_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text="Chức năng quản trị" Value="0"></asp:ListItem>
                <asp:ListItem Text="Chức năng quản lý" Value="1"></asp:ListItem>
                <asp:ListItem Text="Chức năng nhân viên" Value="2" Selected="True"></asp:ListItem>
            </asp:RadioButtonList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Quản lý sơ yếu lý lịch cá nhân:
        </asp:TableCell>
        <asp:TableCell>
            <asp:CheckBox ID="cbThongTinCaNhan" runat="server" Text="Cập nhật thông tin cá nhân" /><br />
            <asp:CheckBox ID="cbLyLich" runat="server" Text="Cập nhật thông tin về quan hệ gia đình, quá trình công tác, trình độ giáo dục, ..." /><br />
            <asp:CheckBox ID="cbInLyLich" runat="server" Text="Thêm mới thông tin về quan hệ gia đình, quá trình công tác, trình độ giáo dục, ..." /><br />
            <asp:CheckBox ID="cbInKeKhai" runat="server" Text="Thêm mới kê khai tài sản" /><br />
            <asp:CheckBox ID="cbUpKeKhai" runat="server" Text="Cập nhật thông tin kê khai tài sản" /><br />
            <asp:CheckBox ID="cbInDanhGia" runat="server" Text="Thêm mới đánh giá và phân loại viên chức, người lao động" /><br />
            <asp:CheckBox ID="cbUpDanhGia" runat="server" Text="Cập nhật đánh giá và phân loại viên chức, người lao động" />
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Trạng thái:
        </asp:TableCell>
        <asp:TableCell>
            <asp:RadioButtonList ID="rblTrangThai" runat="server" RepeatDirection="Horizontal" CssClass="rbRadioButtonList">
                <asp:ListItem Text="Kích hoạt" Value="True" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Khóa" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa tài khoản này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" PostBackUrl="~/TaiKhoan"></asp:LinkButton>
</div>
