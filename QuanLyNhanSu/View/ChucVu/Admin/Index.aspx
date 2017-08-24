<%@ Page Title="ChucVu" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuanLyNhanSu.View.ChucVu.Admin.Index" %>
<%@ Register TagPrefix="Partial" TagName="ChucVuRadGrid" Src="~/View/ChucVu/Form/_ChucVuRadGrid.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>Quản lý chức vụ</h2>
            <p>
                <asp:LinkButton ID="btNew" runat="server" Text="Tạo mới &raquo;" CssClass="btn btn-default" PostBackUrl="~/ChucVu/TaoMoi"></asp:LinkButton>
            </p>
            <p>
                <Partial:ChucVuRadGrid runat="server" />
            </p>            
        </div>
    </div>
</asp:Content>
