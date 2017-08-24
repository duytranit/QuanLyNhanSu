<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_DGRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.DanhGia.Form._DGRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgDanhGia" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgDanhGia_ItemCreated"
    OnItemDataBound="rgDanhGia_ItemDataBound"
    OnNeedDataSource="rgDanhGia_NeedDataSource"
    OnPageIndexChanged="rgDanhGia_PageIndexChanged"
    OnPageSizeChanged="rgDanhGia_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Đánh giá" DataTextField="DGNoiDung"
                DataNavigateUrlFields="DGID" DataNavigateUrlFormatString="~/DanhGia/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridDateTimeColumn HeaderText="Ngày tháng" DataField="DGNgay" DataFormatString="{0:dd/MM/yyyy}" AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>