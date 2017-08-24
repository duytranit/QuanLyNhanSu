<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_HeSoLuongRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.HeSoLuong.Form._HeSoLuongRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdateInitiatorPanelsOnly="true">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadGridHeSoLuong">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadGridHeSoLuong" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadGrid ID="RadGridHeSoLuong" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    AllowFilteringByColumn="true" AllowSorting="true"
    StatusBarSettings-LoadingText="Đang tải..." StatusBarSettings-ReadyText="Hoàn tất"
    EnableLinqExpressions="false"
    OnItemDataBound="RadGridHeSoLuong_ItemDataBound"
    OnNeedDataSource="RadGridHeSoLuong_NeedDataSource"
    OnPageIndexChanged="RadGridHeSoLuong_PageIndexChanged"
    OnPageSizeChanged="RadGridHeSoLuong_PageSizeChanged"
    >
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy hệ số lương" PageSize="5">
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="50px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>       
            <telerik:GridHyperLinkColumn DataTextField="HSLHeSo" HeaderText="Hệ số lương"
                AllowFiltering="false" AllowSorting="false"
                DataNavigateUrlFields="HSLID" DataNavigateUrlFormatString="~/HeSoLuong/{0}">
                <HeaderStyle Font-Bold="true" />
            </telerik:GridHyperLinkColumn>     
            <telerik:GridBoundColumn DataField="HSLNgach" HeaderText="Ngạch"
                AllowFiltering="false" AllowSorting="false">
                <HeaderStyle Font-Bold="true" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="HSLBacLuong" HeaderText="Bậc"
                AllowFiltering="false" AllowSorting="false">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>            
        </Columns>
    </MasterTableView>
    <PagerStyle PagerTextFormat="{4} {5} số hệ số lương trên {1} trang " PageSizeLabelText="Số hệ số lương" />
</telerik:RadGrid>