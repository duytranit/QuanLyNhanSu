<%@ Page Title="DanhHieu" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.PhongTangDanhHieu.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="PTDHForm" Src="~/View/PhongTangDanhHieu/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="PTDHForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="PTDHForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>DANH HIỆU ĐƯỢC PHONG TẶNG</h2>
            <hr />
            <Partial:PTDHForm ID="PTDHForm" runat="server" />          
        </div>
    </div>
</asp:Content>
