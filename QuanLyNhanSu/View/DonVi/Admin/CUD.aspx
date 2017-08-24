<%@ Page Title="DonVi" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.DonVi.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="CUDForm" Src="~/View/DonVi/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="CUDForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="CUDForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>THÔNG TIN ĐƠN VỊ</h2>
            <hr />
            <Partial:CUDForm ID="CUDForm" runat="server" />          
        </div>
    </div>
</asp:Content>
