<%@ Page Title="ChamCong" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="QuanLyNhanSu.View.ChamCong.Admin.ThongKe" %>
<%@ Register TagPrefix="Partial" TagName="TKCCTable" Src="~/View/ChamCong/Form/_TKCCTable.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting>
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TKCCTable" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>THỐNG KÊ CHẤM CÔNG NHÂN VIÊN</h2>
            <hr />
            <div>
                <asp:LinkButton ID="btChamCong" runat="server" Text="Chấm công" CssClass="btn btn-default" PostBackUrl="~/ChamCong"></asp:LinkButton>
                <asp:LinkButton ID="btPhuTrachChamCong" runat="server" Text="Phụ trách chấm công" CssClass="btn btn-default" PostBackUrl="~/PhuTrachChamCong"></asp:LinkButton>
                <asp:LinkButton ID="btBaoCao" runat="server" Text="Xuất file báo cáo" CssClass="btn btn-default" OnClick="btBaoCao_Click"></asp:LinkButton>
            </div>
            <p>
                <Partial:TKCCTable ID="TKCCTable" runat="server" />       
            </p>            
        </div>
    </div>
</asp:Content>
