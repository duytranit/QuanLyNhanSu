<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.GiaiTrinh.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Loại tài sản:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadComboBox ID="cbbLoaiGiaiTrinh" runat="server" CssClass="rbRadTextBox"
                EmptyMessage="Loại tài sản" Filter="Contains"></telerik:RadComboBox>
            <asp:RequiredFieldValidator ID="rfvLoaiGiaiTrinh" runat="server" ControlToValidate="cbbLoaiGiaiTrinh" Display="Dynamic"
                ErrorMessage="Chọn loại tài sản" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">            
        </asp:TableCell>
        <asp:TableCell>
            <asp:RadioButtonList ID="rblTang" runat="server" CssClass="rbRadioButtonList" RepeatDirection="Horizontal">
                <asp:ListItem Text="Tăng" Value="True" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Giảm" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
            <telerik:RadTextBox ID="txtSoLuong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Số lượng tăng/giảm" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic"
                ErrorMessage="Nhập số lượng tăng/giảm" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Số lượng tăng/giảm có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Nội dung giải trình nguồn gốc tài sản, thu nhập tăng thêm:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtNoiDung" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Nội dung giải trình" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa giải trình này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>