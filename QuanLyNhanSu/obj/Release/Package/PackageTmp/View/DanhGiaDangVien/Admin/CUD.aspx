<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.DanhGiaDangVien.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="DGDVForm" Src="~/View/DanhGiaDangVien/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="DGDVForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DGDVForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>PHIẾU ĐÁNH GIÁ VÀ PHÂN LOẠI LAO ĐỘNG</h2>
            <hr />
            <div class="rbButtons">
                <asp:LinkButton ID="btExport" runat="server" Text="Xuất file word" CssClass="btn btn-default" Visible="false" OnClick="btExport_Click"></asp:LinkButton>
            </div>
            <Partial:DGDVForm ID="DGDVForm" runat="server" />          
        </div>
    </div>
</asp:Content>
