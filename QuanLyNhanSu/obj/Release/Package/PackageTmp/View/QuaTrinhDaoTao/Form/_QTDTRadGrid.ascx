<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_QTDTRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.QuaTrinhDaoTao.Form._QTDTRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<telerik:RadGrid ID="RadGridQuaTrinhDaoTao" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    AllowFilteringByColumn="true" AllowSorting="true"
    StatusBarSettings-LoadingText="Đang tải..." StatusBarSettings-ReadyText="Hoàn tất"
    EnableLinqExpressions="false"
    OnItemDataBound="RadGridQuaTrinhDaoTao_ItemDataBound"
    OnNeedDataSource="RadGridQuaTrinhDaoTao_NeedDataSource"
    OnPageIndexChanged="RadGridQuaTrinhDaoTao_PageIndexChanged"
    OnPageSizeChanged="RadGridQuaTrinhDaoTao_PageSizeChanged"
    OnItemCreated="RadGridQuaTrinhDaoTao_ItemCreated">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy quá trình đào tạo" PageSize="5">
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="10px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn DataTextField="QTDTTruong" HeaderText="Cơ sở đào tạo"
                DataNavigateUrlFields="QTDTID" DataNavigateUrlFormatString="~/QuaTrinhDaoTao/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="QTDTChuyenNganh" HeaderText="Chuyên ngành đào tạo, bồi dưỡng"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QTDTTuNgay" HeaderText="Từ ngày"
                DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}" AllowFiltering="false">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QTDTDenNgay" HeaderText="Đến ngày"
                DataType="System.DateTime" DataFormatString="{0:dd/MM/yyyy}" AllowFiltering="false">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="80px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QTDTHinhThuc" HeaderText="Hình thức đào tạo, bồi dưỡng"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QTDTVanBang" HeaderText="Văn bằng, chứng chỉ"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
    <PagerStyle PagerTextFormat="{4} {5} số đào tạo trên {1} trang " PageSizeLabelText="Số đào tạo" />
</telerik:RadGrid>