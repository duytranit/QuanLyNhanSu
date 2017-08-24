<%@ Page Title="NhanSu" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.ChinhTriXaHoi.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="CUDForm" Src="~/View/ChinhTriXaHoi/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>Quản lý tổ chức chính trị xã hội</h2>
            <Partial:CUDForm runat="server" />          
        </div>
    </div>
</asp:Content>
