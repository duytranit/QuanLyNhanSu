<%@ Page Title="HeSoLuong" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuanLyNhanSu.View.HeSoLuong.Admin.Index" %>
<%@ Register TagPrefix="Partial" TagName="HeSoLuongRadGrid" Src="~/View/HeSoLuong/Form/_HeSoLuongRadGrid.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>Quản lý hệ số lương</h2>
            <p>
                <asp:LinkButton ID="btNew" runat="server" Text="Tạo mới &raquo;" CssClass="btn btn-default" PostBackUrl="~/HeSoLuong/TaoMoi"></asp:LinkButton>
            </p>
            <p>
                <Partial:HeSoLuongRadGrid runat="server" />
            </p>            
        </div>
    </div>
</asp:Content>
