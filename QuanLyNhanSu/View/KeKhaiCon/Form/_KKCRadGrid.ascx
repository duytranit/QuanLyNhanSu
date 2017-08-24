<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_KKCRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.KeKhaiCon.Form._KKCRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgKeKhaiCon" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgKeKhaiCon_ItemCreated"
    OnItemDataBound="rgKeKhaiCon_ItemDataBound"
    OnNeedDataSource="rgKeKhaiCon_NeedDataSource"
    OnPageIndexChanged="rgKeKhaiCon_PageIndexChanged"
    OnPageSizeChanged="rgKeKhaiCon_PageSizeChanged">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy dữ liệu phù hợp" PageSize="10">
        <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
        <Columns>
            <telerik:GridTemplateColumn HeaderText="STT" AllowFiltering="false">
                <ItemTemplate>
                    <asp:Label ID="lblSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn HeaderText="Họ và tên" DataTextField="KKCTen"
                DataNavigateUrlFields="KKCID" DataNavigateUrlFormatString="~/KeKhaiCon/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Ngày tháng năm sinh" DataField="KKCDOB"
                AllowFiltering="false" AllowSorting="true" DataFormatString="{0:dd/MM/yyyy}">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Hộ khẩu thường trú" DataField="KKCHoKhau"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Chổ ở hiện tại" DataField="KKCChoO"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>