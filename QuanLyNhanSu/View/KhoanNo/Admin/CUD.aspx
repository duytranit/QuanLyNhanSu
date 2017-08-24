<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.KhoanNo.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="KNForm" Src="~/View/KhoanNo/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="KNForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KNForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>KÊ KHAI CÁC KHOẢN NỢ</h2>
            <hr />
            <p style="text-align: center;">
                Các khoản nợ gồm: Các khoản phải trả, giá trị các tài sản quản lý hộ, giữ hộ có tổng giá trị từ 50 triệu đồng trở lên
            </p>
            <Partial:KNForm ID="KNForm" runat="server" />
        </div>
    </div>
</asp:Content>
