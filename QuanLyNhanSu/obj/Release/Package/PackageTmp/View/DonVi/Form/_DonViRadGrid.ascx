<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_DonViRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.DonVi.Form._DonViRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="RadGridDonVi" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false" 
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemDataBound="RadGridDonVi_ItemDataBound" 
    OnNeedDataSource="RadGridDonVi_NeedDataSource"
    OnPageIndexChanged="RadGridDonVi_PageIndexChanged" 
    OnPageSizeChanged="RadGridDonVi_PageSizeChanged"
    OnItemCreated="RadGridDonVi_ItemCreated">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy đơn vị" PageSize="20">
        <CommandItemSettings AddNewRecordText="Thêm đơn vị" RefreshText="Tải lại" />
        <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn DataTextField="DVTen" HeaderText="Đơn vị"
                AllowFiltering="true" AllowSorting="true" ShowSortIcon="true"
                FilterControlWidth="100%" AutoPostBackOnFilter="true" 
                ShowFilterIcon="false" CurrentFilterFunction="Contains"
                DataNavigateUrlFields="DVID" DataNavigateUrlFormatString="~/DonVi/{0}">
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="DVTrucThuoc" HeaderText="Trực thuộc đơn vị"
                CurrentFilterFunction="Contains" ShowFilterIcon="false"
                AutoPostBackOnFilter="true" FilterControlWidth="100%"
                ShowSortIcon="true">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DVBienChe" HeaderText="Số biên chế"
                CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" FilterControlWidth="100%"
                ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Số điện thoại" DataField="DVSDT"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" FilterControlWidth="100%"
                ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DVTrangThai" HeaderText="Trạng thái">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchTrangThai" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("DVTrangThai").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_TrangThai">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Kích hoạt" Value="Kích hoạt" />
                            <telerik:RadComboBoxItem Text="Khóa" Value="Khóa" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_TrangThai" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_TrangThai(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("DVTrangThai", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
