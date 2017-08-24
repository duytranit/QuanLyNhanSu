﻿<%@ Page Title="KhenThuong" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.KhenThuong.Admin.CUD" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="KTForm" Src="~/View/KhenThuong/Form/_Form.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="KTForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KTForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>QUYẾT ĐỊNH KHEN THƯỞNG</h2>
            <hr />
            <Partial:KTForm ID="KTForm" runat="server" />          
        </div>
    </div>
</asp:Content>