<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_DQRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.DaQui.Form._DQRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgDaQui" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgDaQui_ItemCreated"
    OnItemDataBound="rgDaQui_ItemDataBound"
    OnNeedDataSource="rgDaQui_NeedDataSource"
    OnPageIndexChanged="rgDaQui_PageIndexChanged"
    OnPageSizeChanged="rgDaQui_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Tài sản" DataTextField="DQTen"
                DataNavigateUrlFields="DQID" DataNavigateUrlFormatString="~/KeKhaiDaQui/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Số lượng" DataField="DQSoLuong" DataFormatString="{0:#,###.##}"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Giá trị (vnđ)" DataField="DQGiaTri"
                AllowFiltering="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>