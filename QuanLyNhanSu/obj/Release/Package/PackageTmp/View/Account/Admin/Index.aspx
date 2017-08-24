<%@ Page Title="TaiKhoan" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuanLyNhanSu.View.Account.Admin.Index" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="ACCRadGrid" Src="~/View/Account/Form/_ACCRadGrid.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="ACCRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ACCRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>QUẢN LÝ TÀI KHOẢN</h2>
            <hr />
            <p>
                <asp:LinkButton ID="btAccountNew" runat="server" Text="Tạo mới &raquo;" CssClass="btn btn-default" PostBackUrl="~/TaiKhoan/TaoMoi"></asp:LinkButton>
            </p>
            <p>
                <Partial:ACCRadGrid ID="ACCRadGrid" runat="server" />          
            </p>            
        </div>
    </div>
</asp:Content>