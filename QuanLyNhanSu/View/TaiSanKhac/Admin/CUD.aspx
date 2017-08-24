<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.TaiSanKhac.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="TSForm" Src="~/View/TaiSanKhac/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="TSForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TSForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>KÊ KHAI TÀI SẢN KHÁC</h2>
            <hr />
            <p style="text-align: center;">
                Các loại tài sản khác mà có giá trị quy đổi mỗi loại từ 50 triệu đồng trở lên (như cây cảnh, bộ bàn ghế, ảnh, đồ mỹ nghệ và các loại tài sản khác).
            </p>
            <Partial:TSForm ID="TSForm" runat="server" />
        </div>
    </div>
</asp:Content>
