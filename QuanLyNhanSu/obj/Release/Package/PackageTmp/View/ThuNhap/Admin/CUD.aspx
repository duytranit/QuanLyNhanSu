<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.ThuNhap.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="TNForm" Src="~/View/ThuNhap/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="TNForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TNForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>KÊ KHAI THU NHẬP TRONG NĂM</h2>
            <hr />
            <p style="text-align: center;">
                Tổng thu nhập trong năm quy đổi thành tiền Việt Nam gồm các khoản lương, phụ cấp, trợ cấp, thưởng, thù lao, cho, tặng, biếu, thừa kế, thu nhập hưởng lợi từ các khoản đầu tư, phát sinh, sáng chế, các khoản thu nhập khác.
            </p>
            <Partial:TNForm ID="TNForm" runat="server" />
        </div>
    </div>
</asp:Content>
