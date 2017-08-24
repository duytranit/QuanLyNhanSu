<%@ Page Title="TaiKhoan" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="LoginAccount.aspx.cs" Inherits="QuanLyNhanSu.View.Account.Admin.LoginAccount" %>
<%@ Register TagPrefix="Partial" TagName="ACCForm" Src="~/View/Account/Form/_ACCForm.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>QUẢN LÝ TÀI KHOẢN</h2>
            <hr />
            <Partial:ACCForm ID="ACCForm" runat="server" />          
        </div>
    </div>
</asp:Content>
