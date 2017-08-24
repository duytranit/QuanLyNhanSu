<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_TSRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.TaiSanKhac.Form._TSRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgTaiSan" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgTaiSan_ItemCreated"
    OnItemDataBound="rgTaiSan_ItemDataBound"
    OnNeedDataSource="rgTaiSan_NeedDataSource"
    OnPageIndexChanged="rgTaiSan_PageIndexChanged"
    OnPageSizeChanged="rgTaiSan_PageSizeChanged">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoDetailRecordsText="Không tìm thấy dữ liệu phù hợp" PageSize="10">
        <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
        <Columns>
            <telerik:GridTemplateColumn HeaderText="STT" AllowFiltering="false">
                <ItemTemplate>
                    <asp:Label ID="lblSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn HeaderText="Tài sản" DataTextField="TSKTen"
                DataNavigateUrlFields="TSKID" DataNavigateUrlFormatString="~/TaiSanKhac/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Số lượng" DataField="TSKSoLuong" DataFormatString="{0:#,###.##}"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Giá trị (vnđ)" DataField="TSKGiaTri"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>