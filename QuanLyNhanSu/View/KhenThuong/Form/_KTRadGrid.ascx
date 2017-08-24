<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_KTRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.KhenThuong.Form._KTRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgKhenThuong" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgKhenThuong_ItemCreated"
    OnItemDataBound="rgKhenThuong_ItemDataBound"
    OnNeedDataSource="rgKhenThuong_NeedDataSource"
    OnPageIndexChanged="rgKhenThuong_PageIndexChanged"
    OnPageSizeChanged="rgKhenThuong_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Khen thưởng" DataTextField="KTNoiDung"
                DataNavigateUrlFields="KTID" DataNavigateUrlFormatString="~/KhenThuong/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Cấp quyết định" DataField="KTCapQuyetDinh"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn HeaderText="Ngày tháng" DataField="KTNgay" DataFormatString="{0:dd/MM/yyyy}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>