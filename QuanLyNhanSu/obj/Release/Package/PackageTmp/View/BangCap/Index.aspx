<%@ Page Title="BangCap" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="QuanLyNhanSu.View.BangCap.Index" %>
<%@ Register TagPrefix="Partial" TagName="NgoaiNguRadGrid" Src="~/View/NgoaiNgu/Form/_NNRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="TinHocRadGrid" Src="~/View/TinHoc/Form/_THRadGrid.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>Quản lý bằng cấp</h2>
            <p>
                <asp:LinkButton runat="server" Text="Bằng cấp ngoại ngữ mới &raquo" PostBackUrl="~/NgoaiNgu/TaoMoi" CssClass="btn btn-default"></asp:LinkButton>
                <asp:LinkButton runat="server" Text="Bằng cấp tin học mới &raquo" PostBackUrl="~/TinHoc/TaoMoi" CssClass="btn btn-default"></asp:LinkButton>
            </p>
            <p>
                <Partial:NgoaiNguRadGrid runat="server" />
            </p>            
            <p>
                <Partial:TinHocRadGrid runat="server" />
            </p>
        </div>
    </div>
</asp:Content>
