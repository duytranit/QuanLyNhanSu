<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_TGCTXHRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.ThamGiaCTXH.Form._TGCTXHRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="RadGridThamGiaCTXH" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false" 
    AllowPaging="true" AllowFilteringByColumn="true" AllowSorting="true"
    OnItemDataBound="RadGridThamGiaCTXH_ItemDataBound" 
    OnNeedDataSource="RadGridThamGiaCTXH_NeedDataSource"
    OnPageIndexChanged="RadGridThamGiaCTXH_PageIndexChanged"
    OnPageSizeChanged="RadGridThamGiaCTXH_PageSizeChanged"
    OnItemCreated="RadGridThamGiaCTXH_ItemCreated">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy quá trình tham gia tổ chức chính trị xã hội" PageSize="5">
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="20px" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn DataTextField="TGCTXHTCTen" HeaderText="Tên tổ chức"
                DataNavigateUrlFields="TGCTXHID" DataNavigateUrlFormatString="~/CTXH/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="TGCTXHChucVu" HeaderText="Vị trí phụ trách"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn DataField="TGCTXHTuNgay" HeaderText="Từ ngày" DataFormatString="{0:dd/MM/yyyy}"
                AllowFiltering="false" AllowSorting="false">                
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
            <telerik:GridDateTimeColumn DataField="TGCTXHDenNgay" HeaderText="Đến ngày" DataFormatString="{0:dd/MM/yyyy}"
                AllowFiltering="false" AllowSorting="false">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridDateTimeColumn>
            <telerik:GridBoundColumn DataField="TGCTXHNoiDung" Display="false"></telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
    <PagerStyle PagerTextFormat="{4} {5} số tổ chức tham gia trên {1} trang " PageSizeLabelText="Số tổ chức tham gia" />
</telerik:RadGrid>