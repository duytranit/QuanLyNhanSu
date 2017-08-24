<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.Dat.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table class="rbTable">
    <tr>
        <td class="rbTableCellLabel">
            Địa chỉ:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxDiaChi" runat="server" WrapperCssClass="rbRadTextBox"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvDiaChi" runat="server" ControlToValidate="RadTextBoxDiaChi" Display="Dynamic"
                ErrorMessage="Nhập địa chỉ đất" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Diện tích (m<sup>2</sup>):
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxDienTich" runat="server" WrapperCssClass="rbRadTextBox"></telerik:RadTextBox> 
            <asp:RequiredFieldValidator ID="rfvDienTich" runat="server" ControlToValidate="RadTextBoxDienTich" Display="Dynamic"
                ErrorMessage="Nhập diện tích đất" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvDienTich" runat="server" ControlToValidate="RadTextBoxDienTich" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Diện tích đất có giá trị không thích hợp" ForeColor="Red" Font-Italic="true">
            </asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Giá trị (vnđ):
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxGiaTri" runat="server" WrapperCssClass="rbRadTextBox"></telerik:RadTextBox> 
            <asp:RequiredFieldValidator ID="rfvGiaTri" runat="server" ControlToValidate="RadTextBoxGiaTri" Display="Dynamic"
                ErrorMessage="Nhập giá trị đất" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Giấy chứng nhận quyền sử dụng:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxGiayChungNhan" runat="server" WrapperCssClass="rbRadTextBox"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvGiayChungNhan" runat="server" ControlToValidate="RadTextBoxGiayChungNhan" Display="Dynamic"
                ErrorMessage="Nhập giấy chứng nhận quyền sử dụng đất" ForeColor="Red" Font-Italic="true">
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Thông tin khác:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxThongTinKhac" runat="server" TextMode="MultiLine" Rows="3" WrapperCssClass="rbRadTextBox"
                EmptyMessage="(nếu có)"></telerik:RadTextBox>
        </td>
    </tr>
</table>
<p class="rbButtons">
    <asp:LinkButton ID="ButtonCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClientClick="return confirm('Bạn có muốn xóa kê khai đất này không?')"
                OnClick="ButtonDelete_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="ButtonBack_Click"></asp:LinkButton>
</p>