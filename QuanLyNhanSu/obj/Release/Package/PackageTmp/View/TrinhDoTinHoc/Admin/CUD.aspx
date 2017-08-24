<%@ Page Title="TDTH" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.TrinhDoTinHoc.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="TDTHForm" Src="~/View/TrinhDoTinHoc/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="TDTHForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TDTHForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>TRÌNH ĐỘ TIN HỌC</h2>
            <hr />
            <Partial:TDTHForm ID="TDTHForm" runat="server" />          
        </div>
    </div>
</asp:Content>
