<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.DaQui.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="DQForm" Src="~/View/DaQui/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="DQForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DQForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>KÊ KHAI ĐỘNG SẢN</h2>
            <hr />
            <p style="text-align: center;">
                Kim loại quý, đá quý, cổ phiếu, vốn góp vào các cơ sở kinh doanh, các loại giấy tờ có giá trị chuyển nhượng khác có tổng giá trị quy đổi mỗi loại từ 50 triệu đồng trở lên.            
            </p>
            <ul>
                <li>Kim loại quý</li>
                <li>Đá quý</li>
                <li>Cổ phiếu</li>
                <li>Vốn góp vào các cơ sở kinh doanh</li>
                <li>Các loại giấy tờ có giá trị chuyển nhượng khác</li>
            </ul>
            <Partial:DQForm ID="DQForm" runat="server" />
        </div>
    </div>
</asp:Content>
