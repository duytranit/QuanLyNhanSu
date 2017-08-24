<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_CSRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.ChinhSach.Form._CSRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgChinhSach" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgChinhSach_ItemCreated"
    OnItemDataBound="rgChinhSach_ItemDataBound"
    OnNeedDataSource="rgChinhSach_NeedDataSource"
    OnPageIndexChanged="rgChinhSach_PageIndexChanged"
    OnPageSizeChanged="rgChinhSach_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Chính sách" DataTextField="CSTen"
                DataNavigateUrlFields="CSID" DataNavigateUrlFormatString="~/ChinhSach/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridDateTimeColumn HeaderText="Ngày tháng" DataField="CSNgay" DataFormatString="{0:dd/MM/yyyy}" AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>