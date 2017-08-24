﻿<%@ Page Title="QTDT" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.QuaTrinhDaoTao.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="CUDForm" Src="~/View/QuaTrinhDaoTao/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="CUDForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="CUDForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>QUÁ TRÌNH ĐÀO TẠO <asp:Label ID="lblNhanVien" runat="server"></asp:Label></h2>
            <hr />
            <Partial:CUDForm ID="CUDForm" runat="server" />          
        </div>
    </div>
</asp:Content>
