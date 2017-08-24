<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.TaiSanNuocNgoai.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="TSNNForm" Src="~/View/TaiSanNuocNgoai/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="TSNNForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TSNNForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>KÊ KHAI TÀI SẢN - TÀI SẢN GỞI NƯỚC NGOÀI</h2>
            <hr />
            <p style="text-align: center;">
                Tài sản, tài khoản ở nước ngoài gồm tất cả tài sản quy định từ Khoản 1 đến Khoản 6 nói trên nằm ngoài lãnh thổ Việt Nam.
            </p>
            <Partial:TSNNForm ID="TSNNForm" runat="server" />
        </div>
    </div>
</asp:Content>
