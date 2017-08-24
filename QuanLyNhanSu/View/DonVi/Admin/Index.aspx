<%@ Page Title="DonVi" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuanLyNhanSu.View.DonVi.Admin.Index" %>

<%@ Register TagPrefix="Partial" TagName="DonViRadGrid" Src="~/View/DonVi/Form/_DonViRadGrid.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="DonViRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DonViRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>


    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>DANH SÁCH ĐƠN VỊ</h2>
            <hr />
            <p>
                <asp:LinkButton ID="btNew" runat="server" Text="Tạo mới &raquo;" CssClass="btn btn-default" PostBackUrl="~/DonVi/TaoMoi"></asp:LinkButton>
                <asp:LinkButton ID="btNhanSu" runat="server" Text="Nhân sự &raquo;" CssClass="btn btn-default" PostBackUrl="~/NhanSu"></asp:LinkButton>
            </p>
            <p>
                <Partial:DonViRadGrid ID="DonViRadGrid" runat="server" />
            </p>
        </div>
    </div>
</asp:Content>
