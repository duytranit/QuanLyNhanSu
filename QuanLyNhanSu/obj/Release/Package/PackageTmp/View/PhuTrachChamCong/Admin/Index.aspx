<%@ Page Title="ChamCong" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuanLyNhanSu.View.PhuTrachChamCong.Admin.Index" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="PTCCRadGrid" Src="~/View/PhuTrachChamCong/Form/_PTCCRadGrid.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting>
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="PTCCRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>BẢNG PHÂN CÔNG NHIỆM VỤ CHẤM CÔNG ĐƠN VỊ</h2>
            <hr />
            <div>
                <asp:LinkButton ID="btChamCong" runat="server" Text="Chấm công" CssClass="btn btn-default" PostBackUrl="~/ChamCong"></asp:LinkButton>
                <asp:LinkButton ID="btThongKeChamCong" runat="server" Text="Thống kê chấm công" CssClass="btn btn-default" PostBackUrl="~/ThongKeChamCong"></asp:LinkButton>
            </div>
            <p>
                <asp:LinkButton runat="server" Text="Tạo mới &raquo;" CssClass="btn btn-default" PostBackUrl="~/PhuTrachChamCong/TaoMoi"></asp:LinkButton>
            </p>
            <p>
                <Partial:PTCCRadGrid ID="PTCCRadGrid" runat="server" />          
            </p>            
        </div>
    </div>
</asp:Content>
