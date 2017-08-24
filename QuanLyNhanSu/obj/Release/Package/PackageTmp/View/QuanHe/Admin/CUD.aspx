<%@ Page Title="QuanHe" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.QuanHe.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="CUDForm" Src="~/View/QuanHe/Form/_Form.ascx" %>
<%@ Register TagPrefix="Partial" TagName="QHCTRadGrid" Src="~/View/QuanHeCongTac/Form/_CongTacRadGrid.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="CUDForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="CUDForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="QHCTRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="QHCTRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>QUAN HỆ GIA ĐÌNH <asp:Label ID="lblNhanVien" runat="server"></asp:Label></h2>
            <hr />
            <Partial:CUDForm ID="CUDForm" runat="server" />     
            <asp:Panel ID="pnlExtraInformation" runat="server" Visible="false">
                <b>Quá trình công tác:</b> | <asp:LinkButton ID="btCongTacNew" runat="server" Text="Tạo mới" OnClick="btCongTacNew_Click"></asp:LinkButton>
                <Partial:QHCTRadGrid ID="QHCTRadGrid" runat="server" />
            </asp:Panel>     
        </div>
    </div>
</asp:Content>
