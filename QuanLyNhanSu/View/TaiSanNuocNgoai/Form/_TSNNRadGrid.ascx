<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_TSNNRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.TaiSanNuocNgoai.Form._TSNNRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgTaiSan" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgTaiSan_ItemCreated"
    OnItemDataBound="rgTaiSan_ItemDataBound"
    OnNeedDataSource="rgTaiSan_NeedDataSource"
    OnPageIndexChanged="rgTaiSan_PageIndexChanged"
    OnPageSizeChanged="rgTaiSan_PageSizeChanged">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy dữ liệu phù hợp" PageSize="10">
        <Columns>
            <telerik:GridTemplateColumn HeaderText="STT" AllowFiltering="false">
                <ItemTemplate>
                    <asp:Label ID="lblSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn HeaderText="Tài sản" DataTextField="TSNNTen"
                DataNavigateUrlFields="TSNNID" DataNavigateUrlFormatString="~/TaiSanNuocNgoai/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Số lượng" DataField="TSNNSoLuong" DataFormatString="{0:#,###.##}"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Giá trị" DataField="TSNNGiaTri"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>