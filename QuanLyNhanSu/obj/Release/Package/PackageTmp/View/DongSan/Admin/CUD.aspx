<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.DongSan.Admin.CUD" %>
<%@ Register TagPrefix="Partial" TagName="DSForm" Src="~/View/DongSan/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="DSForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DSForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>KÊ KHAI ĐỘNG SẢN</h2>
            <hr />
            <p style="text-align: center;">
                Ô tô, mô tô, xe gắn máy, xe máy (máy ủi, máy xúc, các loại xe máy khác), tàu thủy, tàu bay, thuyền và những 
                động sản khác mà Nhà nước quản lý (theo quy định của pháp luật phải đăng kí sử dụng và được cấp giấy đăng kí) 
                có tổng giá trị mỗi loại từ 50 triệu đồng trở lên.                
            </p>
            <ul>
                <li>Ô tô</li>
                <li>Mô tô</li>
                <li>Xe gắn máy</li>
                <li>Xe máy (máy ủi, máy xúc, các loại xe máy khác)</li>
                <li>Tàu thủy</li>
                <li>Tàu bay</li>
                <li>Thuyền</li>
                <li>Những động sản khác mà Nhà nước quản lý (theo quy định của pháp luật phải đăng ký sử dụng và được cấp giấy đăng ký)</li>
            </ul>
            <Partial:DSForm ID="DSForm" runat="server" />
        </div>
    </div>
</asp:Content>
