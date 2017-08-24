<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.KeKhaiCon.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="KKCForm" Src="~/View/KeKhaiCon/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="KKCForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KKCForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>Con chưa thành niên (con đẻ, con nuôi theo quy định của pháp luật)</h2>
            <hr />
            <Partial:KKCForm ID="KKCForm" runat="server" />
        </div>
    </div>
</asp:Content>
