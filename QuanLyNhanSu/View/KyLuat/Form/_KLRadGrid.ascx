<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_KLRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.KyLuat.Form._KLRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgKyLuat" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgKyLuat_ItemCreated"
    OnItemDataBound="rgKyLuat_ItemDataBound"
    OnNeedDataSource="rgKyLuat_NeedDataSource"
    OnPageIndexChanged="rgKyLuat_PageIndexChanged"
    OnPageSizeChanged="rgKyLuat_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Kỷ luật" DataTextField="KLNoiDung"
                DataNavigateUrlFields="KLID" DataNavigateUrlFormatString="~/KyLuat/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Hội đồng kỷ luật" DataField="KLCap"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn HeaderText="Ngày tháng" DataField="KLNgay"
                AllowFiltering="false" DataFormatString="{0:dd/MM/yyyy}">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>