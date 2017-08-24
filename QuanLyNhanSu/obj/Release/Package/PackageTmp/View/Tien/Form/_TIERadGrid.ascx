<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_TIERadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.Tien.Form._TIERadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgTien" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgTien_ItemCreated"
    OnItemDataBound="rgTien_ItemDataBound"
    OnNeedDataSource="rgTien_NeedDataSource"
    OnPageIndexChanged="rgTien_PageIndexChanged"
    OnPageSizeChanged="rgTien_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Tiền" DataTextField="TIENoiDung"
                DataNavigateUrlFields="TIEID" DataNavigateUrlFormatString="~/KeKhaiTien/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Số lượng" DataField="TIESoLuong"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Tiền tệ" DataField="TIETienTe"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>