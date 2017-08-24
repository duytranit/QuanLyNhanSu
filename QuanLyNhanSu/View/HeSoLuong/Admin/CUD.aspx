<%@ Page Title="HeSoLuong" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.HeSoLuong.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="CUDForm" Src="~/View/HeSoLuong/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>Quản lý hệ số lương</h2>
            <Partial:CUDForm runat="server" />          
        </div>
    </div>
</asp:Content>
