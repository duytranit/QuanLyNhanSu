<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_DGLDRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.DanhGiaLaoDong.Form._DGLDRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgDGLD" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgDGLD_ItemCreated"
    OnItemDataBound="rgDGLD_ItemDataBound"
    OnNeedDataSource="rgDGLD_NeedDataSource"
    OnPageIndexChanged="rgDGLD_PageIndexChanged"
    OnPageSizeChanged="rgDGLD_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Năm đánh giá" DataTextField="DGLDNam"
                DataNavigateUrlFields="DGLDID" DataNavigateUrlFormatString="~/DanhGiaLaoDong/{0}"
                CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Chức danh nghề nghiệp" DataField="DGLDChucDanh"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Đơn vị công tác" DataField="DGLDDonVi"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="DGLDPhanLoai" HeaderText="Phân loại đánh giá">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchPhanLoai" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("DGLDPhanLoai").CurrentFilterValue %>'
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
                                tableView.filter("DGLDPhanLoai", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>