<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_CTXHRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.ChinhTriXaHoi.Form._CTXHRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdateInitiatorPanelsOnly="true">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadGridCTXH">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadGridCTXH" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadGrid ID="RadGridCTXH" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    AllowFilteringByColumn="true" ShowStatusBar="true" EnableLinqExpressions="false"
    OnItemDataBound="RadGridCTXH_ItemDataBound"
    OnNeedDataSource="RadGridCTXH_NeedDataSource"
    OnPageIndexChanged="RadGridCTXH_PageIndexChanged"
    OnPageSizeChanged="RadGridCTXH_PageSizeChanged">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy tổ chức" PageSize="5">
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn DataTextField="CTXHTen" HeaderText="Tên tổ chức"
                AllowFiltering="true" AllowSorting="true" ShowSortIcon="true"
                FilterControlWidth="100%" AutoPostBackOnFilter="true" ShowFilterIcon="false" CurrentFilterFunction="Contains"
                FilterControlToolTip="Nhập tên tổ chức (bỏ trống để chọn hết) cần tìm >> enter"
                DataNavigateUrlFields="CTXHID" DataNavigateUrlFormatString="~/CTXH/{0}">
                <HeaderStyle Font-Bold="true" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="CTXHDienThoai" HeaderText="Điện thoại"
                AllowFiltering="true" AllowSorting="true" ShowFilterIcon="false" ShowSortIcon="true"
                FilterControlWidth="100%" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                FilterControlToolTip="Nhập số điện thoại (bỏ trống để chọn hết) cần tìm >> enter">
                <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CTXHFax" HeaderText="Fax"
                AllowFiltering="true" AllowSorting="true" ShowFilterIcon="false" ShowSortIcon="true"
                FilterControlWidth="100%" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                FilterControlToolTip="Nhập số fax (bỏ trống để chọn hết) cần tìm >> enter">
                <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CTXHEmail" HeaderText="Email"
                AllowFiltering="true" AllowSorting="true" ShowFilterIcon="false" ShowSortIcon="true"
                FilterControlWidth="100%" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                FilterControlToolTip="Nhập email (bỏ trống để chọn hết) cần tìm >> enter">
                <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CTXHDiaChi" HeaderText="Địa chỉ"
                AllowFiltering="true" AllowSorting="true" ShowFilterIcon="false" ShowSortIcon="true"
                FilterControlWidth="100%" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                FilterControlToolTip="Nhập địa chỉ (bỏ trống để chọn hết) cần tìm >> enter">
                <HeaderStyle Font-Bold="true" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
    <PagerStyle PagerTextFormat="{4} {5} số tổ chức trên {1} trang " PageSizeLabelText="Số tổ chức" />
</telerik:RadGrid>