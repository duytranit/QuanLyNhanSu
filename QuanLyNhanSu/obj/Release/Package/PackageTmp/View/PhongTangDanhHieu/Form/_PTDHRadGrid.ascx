<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_PTDHRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.PhongTangDanhHieu.Form._PTDHRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgDanhHieu" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgDanhHieu_ItemCreated"
    OnItemDataBound="rgDanhHieu_ItemDataBound"
    OnNeedDataSource="rgDanhHieu_NeedDataSource"
    OnPageIndexChanged="rgDanhHieu_PageIndexChanged"
    OnPageSizeChanged="rgDanhHieu_PageSizeChanged">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy dữ liệu phù hợp"  PageSize="10">
        <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
        <Columns>
            <telerik:GridTemplateColumn HeaderText="STT" AllowFiltering="false">
                <ItemTemplate>
                    <asp:Label ID="lblSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn HeaderText="Danh hiệu" DataTextField="PTDHTen"
                DataNavigateUrlFields="PTDHID" DataNavigateUrlFormatString="~/PhongTangDanhHieu/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Hội đồng" DataField="PTDHHoiDong"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn HeaderText="Ngày tháng" DataField="PTDHNgay" DataFormatString="{0:dd/MM/yyyy}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>