<%@ Page Title="CongTac" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.LamViec.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="LVForm" Src="~/View/LamViec/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="LVForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="LVForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>THÔNG TIN CÔNG TÁC</h2>
            <hr />
            <Partial:LVForm ID="LVForm" runat="server" />          
        </div>
    </div>
</asp:Content>
