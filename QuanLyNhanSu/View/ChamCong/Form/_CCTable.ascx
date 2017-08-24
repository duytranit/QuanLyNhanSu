<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_CCTable.ascx.cs" Inherits="QuanLyNhanSu.View.ChamCong.Form._CCTable" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table>
    <tr>
        <td style="font-weight:bold;">
            BỘ PHẬN:
        </td>
        <td style="padding-left: 10px;">
            <telerik:RadComboBox ID="cbbDonVi" runat="server" Filter="Contains"
                Width="300px"></telerik:RadComboBox>
        </td>
        <td style="font-weight:bold;">
            Ngày chấm công:
        </td>
        <td>
            <telerik:RadDatePicker ID="dpkNgayThang" runat="server" Culture="vi-VN"></telerik:RadDatePicker>
        </td>
    </tr>
    <tr>
        <td style="font-weight: bold;">
            Người chấm công:
        </td>
        <td style="padding-left: 10px;">
            <asp:Label ID="lblNguoiChamCong" runat="server"></asp:Label>
        </td>
        <td>
            <asp:LinkButton ID="btChamCong" runat="server" Text="Chấm công" CssClass="btn btn-default" OnClick="btChamCong_Click"></asp:LinkButton>
        </td>
    </tr>
</table>
<table style="width: 100%; margin-top: 20px; margin-bottom: 20px; border-style: solid; border-width: thin;">
    <tr style="font-weight:bold; text-align: center; background-color: #808080;">
        <td style="border-style: solid; border-width: thin;">
            STT
        </td>
        <td style="border-style: solid; border-width: thin;">
            Họ và tên
        </td>
        <% for (int i = 1; i <= DateTime.DaysInMonth(_ngaychamcong.Year, _ngaychamcong.Month); i++){ %>
        <% DateTime ngay = Convert.ToDateTime(_ngaychamcong.Year + "/" + _ngaychamcong.Month + "/" + i); %>
        <% if (ngay.DayOfWeek.ToString().Equals("Saturday") || ngay.DayOfWeek.ToString().Equals("Sunday"))
            { %>
        <td style="background-color: #ff0000; border-style: solid; border-width: thin;">
        <%}%>
        <% else { %>
        <td style="border-style: solid; border-width: thin;">
        <%} %>
        <% if (i < 10)
            { %>
            <%= "0" + i %>
        <% } %>
        <% else
        { %>
            <%= i %>
        <%} %>
        </td>
        <%} %>
    </tr>
    <% if (_lamviecs != null)
        { %>
    <% int sothutu = 0; %>
    <% foreach (QuanLyNhanSu.Models.LamViec lamviec in _lamviecs)
        { %>
    <% sothutu++; %>
    <tr>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= sothutu %>
        </td>
        <td style="border-style: solid; border-width: thin;">
            <%= lamviec.NhanVien.NVTen %>
        </td>
        <% for (int i = 1; i <= DateTime.DaysInMonth(_ngaychamcong.Year, _ngaychamcong.Month); i++)
            { %>
        <% DateTime ngay = Convert.ToDateTime(_ngaychamcong.Year + "/" + _ngaychamcong.Month + "/" + i); %>
        <% if (ngay.DayOfWeek.ToString().Equals("Saturday") || ngay.DayOfWeek.ToString().Equals("Sunday"))
            { %>
        <td style="background-color: #ff0000; text-align:center; border-style: solid; border-width: thin;">
        <%} %>
        <%else
        { %>
        <td style="text-align: center; border-style: solid; border-width: thin;">
        <%} %>
            <a href="<%= ResolveUrl("~/LamViec/" + lamviec.LVID + "/ChamCong/" + _ngaychamcong.Year + "-" + _ngaychamcong.Month + "-" + i) %>">
                <%= this.ChamCong(Convert.ToDateTime(_ngaychamcong.Year + "-" + _ngaychamcong.Month + "-" + i), lamviec.LVID) %>
            </a>
        </td>
        <%} %>
    </tr>
    <%} %>
    <%} %>
</table>

<b><u>Ký hiệu chấm công:</u></b><br />
<ul>
    <li>
        Lương thời gian: +
    </li>
    <li>
        Ốm, điều dưỡng: Ô
    </li>
    <li>
        Con ốm: Cô
    </li>
    <li>
        Thai sản: Ts
    </li>
    <li>
        Tai nạn: T
    </li>
    <li>
        Nghĩ phép: P
    </li>
    <li>
        Nghĩ phép (1/2 ngày): -
    </li>
    <li>
        Học tập, hội nghị: H
    </li>
    <li>
        Nghỉ bù: Nb
    </li>
    <li>
        Nghỉ không lương: No
    </li>
    <li>
        Ngưng việc N
    </li>
    <li>
        Lao động, nghĩa vụ: Lđ
    </li>
    <li>
        Nghỉ lễ: L
    </li>
</ul>