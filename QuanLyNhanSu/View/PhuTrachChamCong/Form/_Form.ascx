<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.PhuTrachChamCong.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table class="rbTable">
    <tr>
        <td class="rbTableCellLabel">
            Tài khoản:
        </td>
        <td>
            <telerik:RadComboBox ID="cbbAccount" runat="server" 
                EmptyMessage="Chọn tài khoản" Filter="Contains"></telerik:RadComboBox>
            <asp:RequiredFieldValidator ID="rfvAccount" runat="server" ControlToValidate="cbbAccount" Display="Dynamic"
                ErrorMessage="Nhập tài khoản" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Đơn vị:
        </td>
        <td>
            <telerik:RadDropDownTree ID="ddtDonVi" runat="server" FilterSettings-EmptyMessage="Đơn vị" FilterSettings-Filter="Contains"
                FilterSettings-Highlight="Matches" DropDownSettings-AutoWidth="Enabled" DropDownSettings-CloseDropDownOnSelection="true"></telerik:RadDropDownTree>
            <asp:RequiredFieldValidator ID="rfvDonVi" runat="server" ControlToValidate="ddtDonVi" Display="Dynamic"
                ErrorMessage="Nhập đơn vị" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Trạng thái:
        </td>
        <td>
            <asp:RadioButtonList ID="rblTrangThai" runat="server" CssClass="rbRadioButtonList" RepeatDirection="Horizontal">
                <asp:ListItem  Text="Kích hoạt" Value="True" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Khóa" Value="False"></asp:ListItem>
            </asp:RadioButtonList>            
        </td>
    </tr>
</table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa phân công phụ trách chấm công này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" PostBackUrl="~/PhuTrachChamCong"></asp:LinkButton>
</div>