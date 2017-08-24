<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_DatRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.Dat.Form._DatRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<telerik:RadGrid ID="RadGridDat" runat="server" AutoGenerateColumns="false" AllowPaging="true" 
    OnItemCreated="RadGridDat_ItemCreated"
    OnItemDataBound="RadGridDat_ItemDataBound"
    OnNeedDataSource="RadGridDat_NeedDataSource"
    OnPageIndexChanged="RadGridDat_PageIndexChanged"
    OnPageSizeChanged="RadGridDat_PageSizeChanged"
    AllowFilteringByColumn="true" AllowSorting="true" ShowStatusBar="true" EnableLinqExpressions="false">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy kê khai đất ở" PageSize="5">
        <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn DataTextField="DATDiaChi" HeaderText="Địa chỉ"
                DataNavigateUrlFields="DATID" DataNavigateUrlFormatString="~/Dat/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true">
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="DATDienTich" HeaderText="Diện tích (m<sup>2</sup>)"
                AllowFiltering="false" AllowSorting="false">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DATGiaTri" HeaderText="Giá trị (vnđ)" DataFormatString="{0:#,###}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
    <PagerStyle PagerTextFormat="{4} {5} số kê khai trên {1} trang " PageSizeLabelText="Số kê khai" />
</telerik:RadGrid>