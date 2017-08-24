<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_DGDVRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.DanhGiaDangVien.Form._DGDVRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgDGDV" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgDGDV_ItemCreated"
    OnItemDataBound="rgDGDV_ItemDataBound"
    OnNeedDataSource="rgDGDV_NeedDataSource"
    OnPageIndexChanged="rgDGDV_PageIndexChanged"
    OnPageSizeChanged="rgDGDV_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Năm đánh giá" DataTextField="DGDVNam"
                DataNavigateUrlFields="DGDVID" DataNavigateUrlFormatString="~/DanhGiaDangVien/{0}"
                CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Chức vụ Đảng" DataField="DGDVChucVuDang"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Chức vụ Chính quyền, Đoàn thể" DataField="DGDVChucVuChinhQuyen"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Đơn vị công tác" DataField="DGDVDonVi"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DGDVDanhGia" HeaderText="Phân loại đánh giá">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchDanhGia" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("DGDVDanhGia").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_PhanLoai">
                        <Items>
                            <telerik:RadComboBoxItem Text="Hoàn thành xuất sắc nhiệm vụ" Value="Hoàn thành xuất sắc nhiệm vụ" />
                            <telerik:RadComboBoxItem Text="Hoàn thành tốt nhiệm vụ" Value="Hoàn thành tốt nhiệm vụ" />
                            <telerik:RadComboBoxItem Text="Hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực" Value="Hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực" />
                            <telerik:RadComboBoxItem Text="Không hoàn thành nhiệm vụ" Value="Không hoàn thành nhiệm vụ" />
                            <telerik:RadComboBoxItem Text="Đảng viên hoàn thành xuất sắc nhiệm vụ" Value="Đảng viên hoàn thành xuất sắc nhiệm vụ" />
                            <telerik:RadComboBoxItem Text="Đảng viên hoàn thành tốt nhiệm vụ" Value="Đảng viên hoàn thành tốt nhiệm vụ" />
                            <telerik:RadComboBoxItem Text="Đảng viên hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực" Value="Đảng viên hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực" />
                            <telerik:RadComboBoxItem Text="Đảng viên không hoàn thành nhiệm vụ" Value="Đảng viên không hoàn thành nhiệm vụ" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_DanhGia" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_DanhGia(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("DGDVDanhGia", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>