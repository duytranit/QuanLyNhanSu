<%@ Page Title="TrangChu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QuanLyNhanSu._Default" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <div style="text-align:center; width: 100%;">
            <marquee>
                <img src="Images/QD05.png" height="130"/>
            </marquee>            
            <h2>LỜI NÓI ĐẦU</h2>
        </div>                
        <p class="lead">Phần mềm Quản Lý Nhân Sự là ứng dụng quản lý nhân sự được phát triển bởi Trung tâm Quản lý quỹ đất Bến Tre. Phần mềm cung cấp các chức năng:</p>
        <div style="float: left; margin-right: 40px;">
            <img src="Images/EmployeeManagement.png" height="250" />
        </div>
        <ul>
            <li>Quản lý tài khoản nhân viên</li>
            <li>Quản lý nhân sự, đơn vị</li>
            <li>Đánh giá, kiểm điểm công chức, viên chức, người lao động và đảng viên</li>
            <li>Kê khai tài sản</li>
            <li>Báo cáo thống kê</li>
        </ul>
        <br />
        <p style="text-align:justify;">
            Mọi thắc mắc vui lòng liên hệ <b>Trung tâm Phát triển quỹ đất Tỉnh Bến Tre</b> tại địa chỉ số 82, đường Hùng Vương, phường 2, thành phố Bến Tre, tỉnh Bến Tre;
            số điện thoại: 0753545392.
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Khuyến nghị:</h2>
            <p>Các gói phần mềm khuyến nghị đính kèm để dùng với phần mềm Quản lý nhân sự:</p>
            <ul>
                <li>
                    <asp:LinkButton ID="btFirefox" runat="server" Text="Mozilla Firefox" PostBackUrl="https://www.mozilla.org/en-US/firefox/new/"></asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="btLibreOffice" runat="server" Text="Libre Office" PostBackUrl="http://www.libreoffice.org/"></asp:LinkButton>
                </li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Đăng nhập</h2>
            <table style="margin-bottom: 10px;">
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtEmail" runat="server"></telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Mật khẩu:
                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtPassword" runat="server" TextMode="Password"></telerik:RadTextBox>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="btLogin" runat="server" Text="Đăng nhập &raquo;" CssClass="btn btn-default" OnClick="btLogin_Click"></asp:LinkButton>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Hôm nay:</h2>
            <telerik:RadCalendar ID="cldHomNay" runat="server" Culture="vi-VN" CultureInfo="vi-VN"></telerik:RadCalendar>
        </div>
    </div>

</asp:Content>
