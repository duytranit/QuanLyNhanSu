<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_DSRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.DongSan.Form._DSRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgDongSan" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgDongSan_ItemCreated"
    OnItemDataBound="rgDongSan_ItemDataBound"
    OnNeedDataSource="rgDongSan_NeedDataSource"
    OnPageIndexChanged="rgDongSan_PageIndexChanged"
    OnPageSizeChanged="rgDongSan_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Tài sản" DataTextField="DSTen"
                DataNavigateUrlFields="DSID" DataNavigateUrlFormatString="~/KeKhaiDongSan/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Số lượng" DataField="DSSoLuong"
                AllowFiltering="false" ShowSortIcon="true" DataFormatString="{0:#,###.##}">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Giá trị (vnđ)" DataField="DSGiaTri"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>