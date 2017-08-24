<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_GTRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.GiaiTrinh.Form._GTRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgGiaiTrinh" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgGiaiTrinh_ItemCreated"
    OnItemDataBound="rgGiaiTrinh_ItemDataBound"
    OnNeedDataSource="rgGiaiTrinh_NeedDataSource"
    OnPageIndexChanged="rgGiaiTrinh_PageIndexChanged"
    OnPageSizeChanged="rgGiaiTrinh_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Loại tài sản" DataTextField="LGTTenChung"
                DataNavigateUrlFields="GTID" DataNavigateUrlFormatString="~/GiaiTrinh/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Tăng/Giảm" DataField="GTSoLuong" AllowFiltering="false">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Nội dung giải trình nguồn gốc tài sản, thu nhập tăng thêm" DataField="GTNoiDung"
                AllowFiltering="false" ShowSortIcon="true"></telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>