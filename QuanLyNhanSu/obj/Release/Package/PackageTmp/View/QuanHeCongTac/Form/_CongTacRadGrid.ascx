<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_CongTacRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.QuanHeCongTac.Form._CongTacRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="RadGridQuanHeCongTac" runat="server" AutoGenerateColumns="false" AllowPaging="true" 
    AllowFilteringByColumn="true" AllowSorting="true"
    EnableLinqExpressions="false"
    OnItemDataBound="RadGridQuanHeCongTac_ItemDataBound"
    OnNeedDataSource="RadGridQuanHeCongTac_NeedDataSource"
    OnPageIndexChanged="RadGridQuanHeCongTac_PageIndexChanged"
    OnPageSizeChanged="RadGridQuanHeCongTac_PageSizeChanged"
    OnItemCreated="RadGridQuanHeCongTac_ItemCreated">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy tiểu sử làm việc" PageSize="5">
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn DataTextField="QHCTDonVi" HeaderText="Đơn vị"
                DataNavigateUrlFields="QHCTID" DataNavigateUrlFormatString="~/QuanHeCongTac/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="QHCTChucVu" HeaderText="Chức vụ"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QHCTNgheNghiep" HeaderText="Chức năng, nhiệm vụ"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
            </telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn DataField="QHCTTuNgay" HeaderText="Từ ngày" DataFormatString="{0:dd/MM/yyyy}"
                AllowFiltering="false">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
            <telerik:GridDateTimeColumn DataField="QHCTDenNgay" HeaderText="Đến ngày" DataFormatString="{0:dd/MM/yyyy}"
                AllowFiltering="false">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
    <PagerStyle PagerTextFormat="{4} {5} số việc làm trên {1} trang " PageSizeLabelText="Số việc làm" />
</telerik:RadGrid>