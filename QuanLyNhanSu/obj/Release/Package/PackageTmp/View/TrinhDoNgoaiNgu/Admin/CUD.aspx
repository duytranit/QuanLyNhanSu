<%@ Page Title="TDNN" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.TrinhDoNgoaiNgu.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="TDNNForm" Src="~/View/TrinhDoNgoaiNgu/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="TDNNForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TDNNForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>TRÌNH ĐỘ NGOẠI NGỮ</h2>
            <hr />
            <Partial:TDNNForm ID="TDNNForm" runat="server" />          
        </div>
    </div>
</asp:Content>
