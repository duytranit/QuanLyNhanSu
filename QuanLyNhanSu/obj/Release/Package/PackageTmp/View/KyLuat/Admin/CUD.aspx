<%@ Page Title="KyLuat" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.KyLuat.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="KLForm" Src="~/View/KyLuat/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="KLForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KLForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>QUYẾT ĐỊNH KỶ LUẬT</h2>
            <hr />
            <Partial:KLForm ID="KLForm" runat="server" />          
        </div>
    </div>
</asp:Content>
