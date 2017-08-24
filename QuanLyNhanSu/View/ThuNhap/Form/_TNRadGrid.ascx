<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_TNRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.ThuNhap.Form._TNRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgThuNhap" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgThuNhap_ItemCreated"
    OnItemDataBound="rgThuNhap_ItemDataBound"
    OnNeedDataSource="rgThuNhap_NeedDataSource"
    OnPageIndexChanged="rgThuNhap_PageIndexChanged"
    OnPageSizeChanged="rgThuNhap_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Thu nhập" DataTextField="TNTen"
                DataNavigateUrlFields="TNID" DataNavigateUrlFormatString="~/ThuNhap/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Số tiền" DataField="TNTien"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>