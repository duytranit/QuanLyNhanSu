<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.DonVi.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table class="rbTable">
    <tr>
        <td class="rbTableCellLabel">
            Trực thuộc:
        </td>
        <td>
            <telerik:RadDropDownTree ID="ddtTrucThuoc" runat="server" EnableFiltering="true" Width="400px"
                FilterSettings-EmptyMessage="Nhập tên đơn vị" FilterSettings-Filter="Contains"
                DefaultMessage="Trực thuộc đơn vị" ToolTip="Chọn đơn vị trực thuộc" DropDownSettings-CloseDropDownOnSelection="true">
            </telerik:RadDropDownTree>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Tên đơn vị:
        </td>
        <td>
            <telerik:RadTextBox ID="txtTen" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Tên đơn vị" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"  ></telerik:RadTextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTen"
                ErrorMessage="Nhập tên đơn vị" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Địa chỉ:
        </td>
        <td>
            <telerik:RadTextBox ID="txtDiaChi" runat="server" TextMode="MultiLine" Rows="2" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Địa chỉ" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Số điện thoại:
        </td>
        <td>
            <telerik:RadTextBox ID="txtSDT" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Số điệnt thoại" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RegularExpressionValidator ID="revSDT" runat="server" ControlToValidate="txtSDT" Display="Dynamic" 
                ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[\.| |\-]{0,1}|^[0-9]{3}[\.|\-| ]?)?[0-9]{3}(\.|\-| )?[0-9]{4}$" 
                ErrorMessage="Số điện thoại không đúng" ForeColor="Red" Font-Italic="true"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Số biên chế được giao:
        </td>
        <td>
            <telerik:RadTextBox ID="txtBienChe" runat="server" WrapperCssClass="rbRadTextBox" Text="5"
                EmptyMessage="Số biên chế" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
<EmptyMessageStyle Resize="None" BorderColor="Red" Font-Italic="True"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBienChe"
                ErrorMessage="Nhập số biên chế" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator runat="server" ControlToValidate="txtBienChe" Type="Integer" Operator="DataTypeCheck"
                ErrorMessage="Số biên chế không đúng" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Trạng thái:
        </td>
        <td>
            <asp:RadioButtonList ID="rblTrangThai" runat="server" RepeatDirection="Horizontal" CssClass="rbRadioButtonList">
                <asp:ListItem Text="Kích hoạt" Value="True" Selected="True" ></asp:ListItem>
                <asp:ListItem Text="Khóa" Value="False"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>        
    <tr>
        <td class="rbTableCellLabel">
            Chức năng, nhiệm vụ:
        </td>
        <td>
            <telerik:RadTextBox ID="txtChucNang" runat="server" WrapperCssClass="rbRadTextBox" TextMode="MultiLine" Rows="3"
                EmptyMessage="Chức năng, nhiệm vụ" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
        </td>
    </tr>
</table>

<p class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" OnClick="btCreate_Click" CssClass="btn btn-default"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" OnClick="btUpdate_Click" CssClass="btn btn-default"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" OnClick="btDelete_Click" CssClass="btn btn-default"
        OnClientClick="return confirm('Mọi thông tin liên quan đến đơn vị này sẽ bị xóa theo.\nBạn có muốn xóa thông tin đơn vị này không ?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" PostBackUrl="~/DonVi"></asp:LinkButton>
</p>