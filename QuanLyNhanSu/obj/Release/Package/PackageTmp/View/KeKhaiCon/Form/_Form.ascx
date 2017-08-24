<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.KeKhaiCon.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Họ và tên:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtTen" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Họ và tên" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvTen" runat="server" ControlToValidate="txtTen" Display="Dynamic"
                ErrorMessage="Nhập họ và tên" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Ngày tháng năm sinh:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadDatePicker ID="dpkDOB" runat="server" CssClass="rbRadTextBox" Culture="vi-VN"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
            <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="dpkDOB" Display="Dynamic"
                ErrorMessage="Nhập ngày tháng năm sinh" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvDOB" runat="server" ControlToValidate="dpkDOB" Display="Dynamic" Type="Date"
                Operator="DataTypeCheck" ErrorMessage="Ngày tháng năm sinh có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hộ khẩu thường trú:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtHoKhau" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hộ khẩu thường trú" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvHoKhau" runat="server" ControlToValidate="txtHoKhau" Display="Dynamic"
                ErrorMessage="Nhập hộ khẩu thường trú" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chổ ở hiện tại:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtChoO" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chổ ở" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvChoO" runat="server" ControlToValidate="txtChoO" Display="Dynamic"
                ErrorMessage="Nhập chổ ở" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa thông tin con cái này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>