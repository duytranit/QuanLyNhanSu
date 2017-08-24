<%@ Page Title="CongTac" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="TangLuong.aspx.cs" Inherits="QuanLyNhanSu.View.LamViec.Admin.TangLuong" %>
<%@ Register TagPrefix="Partial" TagName="LVTLRadGrid" Src="~/View/LamViec/Form/_LVTLRadGrid.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="LVTLRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="LVTLRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>DANH SÁCH TĂNG LƯƠNG</h2>
            <hr />
            <Partial:LVTLRadGrid ID="LVTLRadGrid" runat="server" />
        </div>
    </div>
</asp:Content>