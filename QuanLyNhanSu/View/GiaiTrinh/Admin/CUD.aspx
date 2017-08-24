<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.GiaiTrinh.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="GTForm" Src="~/View/GiaiTrinh/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="GTForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GTForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>GIẢI TRÌNH SỰ BIẾN ĐỘNG CỦA TÀI SẢN, THU NHẬP</h2>
            <hr />
            <Partial:GTForm ID="GTForm" runat="server" />
        </div>
    </div>
</asp:Content>
