<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_DGVCRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.DanhGiaVienChuc.Form._DGVCRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgDGVC" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgDGVC_ItemCreated"
    OnItemDataBound="rgDGVC_ItemDataBound"
    OnNeedDataSource="rgDGVC_NeedDataSource"
    OnPageIndexChanged="rgDGVC_PageIndexChanged"
    OnPageSizeChanged="rgDGVC_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Năm đánh giá" DataTextField="DGVCNam"
                DataNavigateUrlFields="DGVCID" DataNavigateUrlFormatString="~/DanhGiaVienChuc/{0}"
                CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Chức danh nghề nghiệp" DataField="DGVCChucDanh"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Đơn vị công tác" DataField="DGVCDonVi"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DGVCPhanLoai" HeaderText="Phân loại đánh giá">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchPhanLoai" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("DGVCPhanLoai").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_PhanLoai">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Hoàn thành suất sắc nhiệm vụ" Value="Hoàn thành xuất sắc nhiệm vụ" />
                            <telerik:RadComboBoxItem Text="Hoàn thành tốt nhiệm vụ" Value="Hoàn thành tốt nhiệm vụ" />
                            <telerik:RadComboBoxItem Text="Hoàn thành nhiệm vụ" Value="Hoàn thành nhiệm vụ" />
                            <telerik:RadComboBoxItem Text="Không hoàn thành nhhiệm vụ" Value="Không hoàn thành nhiệm vụ" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_PhanLoai" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_PhanLoai(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("DGVCPhanLoai", args.get_item().get_value(), "EqualTo");
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