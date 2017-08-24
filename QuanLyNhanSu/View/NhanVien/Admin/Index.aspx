<%@ Page Title="NhanSu" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuanLyNhanSu.View.NhanVien.Admin.Index" %>

<%@ Register TagPrefix="Partial" TagName="NVRadGrid" Src="~/View/NhanVien/Form/_NVRadGrid.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="NVRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="NVRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="RadFilterNhanVien">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadFilterNhanVien" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="RadGridNhanVien">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGridNhanVien" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>DANH SÁCH NHÂN VIÊN</h2>
            <hr />
            <p>
                <asp:LinkButton ID="btNew" runat="server" Text="Tạo mới &raquo;" CssClass="btn btn-default" PostBackUrl="~/NhanSu/TaoMoi"></asp:LinkButton>
                <asp:LinkButton ID="btDonVi" runat="server" Text="Đơn vị &raquo;" CssClass="btn btn-default" PostBackUrl="~/DonVi"></asp:LinkButton>
            </p>
            <p>
                <Partial:NVRadGrid ID="NVRadGrid" runat="server" />
            </p>
        </div>
    </div>
</asp:Content>
