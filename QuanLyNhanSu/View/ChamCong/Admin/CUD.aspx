<%@ Page Title="ChamCong" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.ChamCong.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="CCForm" Src="~/View/ChamCong/Form/_CCForm.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting>
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="CCForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>CHẤM CÔNG NHÂN VIÊN</h2>
            <hr />
            <p>
                <Partial:CCForm ID="CCForm" runat="server" />       
            </p>            
        </div>
    </div>
</asp:Content>
