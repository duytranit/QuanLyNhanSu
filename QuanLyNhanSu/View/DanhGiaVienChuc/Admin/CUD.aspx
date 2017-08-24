<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.DanhGiaVienChuc.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="DGVCForm" Src="~/View/DanhGiaVienChuc/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="DGLDForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DGLDForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>PHIẾU ĐÁNH GIÁ VÀ PHÂN LOẠI VIÊN CHỨC</h2>
            <hr />
            <div class="rbButtons">
                <asp:LinkButton ID="btExport" runat="server" Text="Xuất file word" CssClass="btn btn-default" OnClick="btExport_Click" Visible="false"></asp:LinkButton>
            </div>
            <Partial:DGVCForm ID="DGVCForm" runat="server" />          
        </div>
    </div>
</asp:Content>
