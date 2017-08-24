<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.HeSoLuong.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<table>
    <tr>
        <td style="width: 150px;">
            Ngạch:
        </td>
        <td>
            <asp:DropDownList ID="DropDownListNgach" runat="server" Width="150px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Bậc:
        </td>
        <td>
            <asp:DropDownList ID="DropDownListBac" runat="server" Width="150px"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            Hệ số lương:
        </td>
        <td>
            <telerik:RadTextBox ID="RadTextBoxHeSoLuong" runat="server" Width="150px"></telerik:RadTextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="RadTextBoxHeSoLuong" Display="Dynamic">
                <asp:Image runat="server" ImageUrl="~/Images/Error.jpg" Height="20px" Width="20px" ToolTip="Nhập giá trị hệ số lương" />
            </asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ControlToValidate="RadTextBoxHeSoLuong" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck">
                <asp:Image runat="server" ImageUrl="~/Images/Error.jpg" Height="20px" Width="20px" ToolTip="Giá trị không thích hợp" />
            </asp:CompareValidator>
            <asp:RangeValidator runat="server" ControlToValidate="RadTextBoxHeSoLuong" Display="Dynamic" Type="Double"
                MinimumValue="0" MaximumValue="10">
                <asp:Image runat="server" ImageUrl="~/Images/Error.jpg" Height="20px" Width="20px" ToolTip="Giá trị trong khoảng từ 0 đến 10" />
            </asp:RangeValidator>
        </td>
    </tr>
</table>

<p class="rbButtons">
    <asp:LinkButton ID="ButtonCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="ButtonUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="ButtonDelete" runat="server" Text="Xóa" CssClass="btn btn-default"
        OnClientClick="return confirm('Bạn có muốn xóa hệ số này không?')" OnClick="ButtonDelete_Click"></asp:LinkButton>
    <a href="<%= ResolveClientUrl("~/HeSoLuong") %>" class="btn btn-default ">Trở về</a>
</p>