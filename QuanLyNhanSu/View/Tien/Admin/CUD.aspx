<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.Tien.Admin.CUD" %>

<%@ Register TagPrefix="Partial" TagName="TIEForm" Src="~/View/Tien/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="TIEForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TIEForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>KÊ KHAI TIỀN</h2>
            <hr />
            <p style="text-align: center;">
                Tiền (tiền Việt Nam, ngoại tệ) gồm tiền mặt, tiền cho vay, tiền gửi các cá nhân, tổ chức trong nước, 
    nước ngoài tại Việt Nam mà tổng giá trị quy đổi từ 50 triệu đồng trở lên.
            </p>
            <Partial:TIEForm ID="TIEForm" runat="server" />
        </div>
    </div>
</asp:Content>
