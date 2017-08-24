﻿<%@ Page Title="DanhGia" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.DanhGia.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="DGForm" Src="~/View/DanhGia/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="DGForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DGForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>ĐÁNH GIÁ NHÂN VIÊN</h2>
            <hr />
            <Partial:DGForm ID="DGForm" runat="server" />          
        </div>
    </div>
</asp:Content>