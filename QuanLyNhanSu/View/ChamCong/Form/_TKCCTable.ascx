<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_TKCCTable.ascx.cs" Inherits="QuanLyNhanSu.View.ChamCong.Form._TKCCTable" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<table>
    <tr>
        <td>
            Đơn vị:
        </td>
        <td style="padding-right: 10px;">
            <telerik:RadDropDownTree ID="ddtDonVi" runat="server" DefaultMessage="Tất cả đơn vị" EnableFiltering="true" DropDownSettings-CloseDropDownOnSelection="true"
                FilterSettings-EmptyMessage="Đơn vị" FilterSettings-Filter="Contains" FilterSettings-FilterTemplate="ByText"
                Font-Italic="true" FilterSettings-Highlight="Matches" Width="400px"></telerik:RadDropDownTree>
        </td>
        <td>
            Năm thống kê:
        </td>
        <td style="padding-right: 10px;">
            <telerik:RadDropDownList ID="ddlNam" runat="server"></telerik:RadDropDownList>
        </td>
        <td>
            <asp:LinkButton ID="btThongKe" runat="server" Text="Thống kê" CssClass="btn btn-default" OnClick="btThongKe_Click"></asp:LinkButton>
        </td>
    </tr>
</table>

<table style="width: 100%; border-style: solid; border-width: thin; margin-top: 20px; margin-bottom: 20px;">
    <tr style="text-align: center; font-weight: bold; background-color: lavender;">
        <td rowspan="2" style="border-style: solid; border-width: thin; width: 40px;">
            STT
        </td>
        <td rowspan="2" style="border-style: solid; border-width: thin;">
            Họ và Tên
        </td>
        <td colspan="13" style="border-style: solid; border-width: thin;">
            Chấm công
        </td>
        <td rowspan="2" style="border-style: solid; border-width: thin; width: 150px;">
            Số ngày phép còn lại
        </td>
    </tr>
    <tr style="text-align: center; font-weight: bold; background-color: lavender;">
        <td style="border-style: solid; border-width: thin; width: 50px;">
            +
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            Ô
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            Cô
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            Ts
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            T
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            P
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            -
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            H
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            Nb
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            No
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            N
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            Lđ
        </td>
        <td style="border-style: solid; border-width: thin; width: 50px;">
            L
        </td>
    </tr>
    <% int flag = 0; %>
    <% foreach(QuanLyNhanSu.Models.LamViec lamviec in _lamviecs) { %>
    <% flag++; %>
    <% decimal songayphepconlai = SoNgayPhepCongLai(lamviec); %>
    <% if (songayphepconlai <= 3)
        { %>
    <tr style="background-color: red; font-style:italic;">
    <%} %>
    <%else
    { %>
    <tr>
    <%} %>
    
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= flag %>
        </td>
        <td style="border-style: solid; border-width: thin;">
            <%= lamviec.NhanVien.NVTen %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 1) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 2) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 3) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 4) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 5) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 6) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 7) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 8) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 9) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 10) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 11) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 12) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= SoSoLuong_ChamCong(lamviec, 13) %>
        </td>
        <td style="text-align: center; border-style: solid; border-width: thin;">
            <%= songayphepconlai.ToString("#.#") %>
        </td>
    </tr>
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