<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.Nha.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel"></asp:TableCell>
        <asp:TableCell>
            <asp:RadioButtonList ID="rblNhaO" runat="server" RepeatDirection="Horizontal" CssClass="rbRadioButtonList">
                <asp:ListItem Text="Nhà ở" Value="True" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Công trình xây dựng khác" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Địa chỉ tại:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtDiaChi" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Địa chỉ" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvDiaChi" runat="server" ControlToValidate="txtDiaChi" Display="Dynamic"
                ErrorMessage="Nhập địa chỉ nhà" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Loại nhà:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtLoaiNha" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Nhập loại nhà" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvLoaiNha" runat="server" ControlToValidate="txtLoaiNha" Display="Dynamic"
                ErrorMessage="Nhập loại nhà" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Cấp công trình:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtCap" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Cấp công trình" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvCap" runat="server" ControlToValidate="txtCap" Display="Dynamic"
                ErrorMessage="Nhập cấp công trình" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Diện tích xây dựng (m<sup>2</sup>):
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtDienTich" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Diện tích xây dựng" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvDienTich" runat="server" ControlToValidate="txtDienTich" Display="Dynamic"
                ErrorMessage="Nhập diện tích xây dựng" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvDienTich" runat="server" ControlToValidate="txtDienTich" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Diện tích xây dựng có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Giá trị (vnđ):
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtGiaTri" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Giá trị" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvGiaTri" runat="server" ControlToValidate="txtGiaTri" Display="Dynamic"
                ErrorMessage="Nhập giá trị của nhà" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvGiaTri" runat="server" ControlToValidate="txtGiaTri" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Giá trị nhà có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Giấy chứng nhận quyền sở hữu:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtQuyenSoHuu" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Giấy chứng nhận quyền sở hữu" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvQuyenSoHuu" runat="server" ControlToValidate="txtQuyenSoHuu" Display="Dynamic"
                ErrorMessage="Nhập giấy chứng nhận quyền sở hữu" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Thông tin khác (nếu có):
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtGhiChu" runat="server" WrapperCssClass="rbRadTextBox" TextMode="MultiLine" Rows="3"
                EmptyMessage="Thông tin khác" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCrete" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCrete_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa kê khai tài sản về nhà này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>