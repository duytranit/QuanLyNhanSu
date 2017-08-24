<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_CCForm.ascx.cs" Inherits="QuanLyNhanSu.View.ChamCong.Form._CCForm" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table class="rbTable">
    <tr>
        <td class="rbTableCellLabel">
            Đơn vị:
        </td>
        <td>
            <asp:Label ID="lblDonVi" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Họ và tên nhân viên:
        </td>
        <td>
            <asp:Label ID="lblNhanVien" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Chấm công ngày:
        </td>
        <td>
            <asp:Label ID="lblNgayThang" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="rbTableCellLabel">
            Chấm công:
        </td>
        <td>
            <asp:RadioButtonList ID="rblLoaiChamCong" runat="server" CssClass="rbRadioButtonList"></asp:RadioButtonList>
        </td>
    </tr>
</table>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" PostBackUrl="~/ChamCong"></asp:LinkButton>
</div>