<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_KNRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.KhoanNo.Form._KNRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgKhoanNo" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgKhoanNo_ItemCreated"
    OnItemDataBound="rgKhoanNo_ItemDataBound"
    OnNeedDataSource="rgKhoanNo_NeedDataSource"
    OnPageIndexChanged="rgKhoanNo_PageIndexChanged"
    OnPageSizeChanged="rgKhoanNo_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Các khoản nợ" DataTextField="KNTen"
                DataNavigateUrlFields="KNID" DataNavigateUrlFormatString="~/KhoanNo/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Số lượng" DataField="KNSoLuong" DataFormatString="{0:#,###.##}"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Giá trị" DataField="KNGiaTri"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>