<%@ Page Title="TaiKhoan" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.Account.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="ACCForm" Src="~/View/Account/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">    
    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>QUẢN LÝ TÀI KHOẢN</h2>
            <hr />
            <Partial:ACCForm ID="ACCForm" runat="server" />          
        </div>
    </div>
</asp:Content>
