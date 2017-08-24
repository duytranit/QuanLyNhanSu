<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_NHARadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.Nha.Form._NHARadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgNha" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgNha_ItemCreated"
    OnItemDataBound="rgNha_ItemDataBound"
    OnNeedDataSource="rgNha_NeedDataSource"
    OnPageIndexChanged="rgNha_PageIndexChanged"
    OnPageSizeChanged="rgNha_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Địa chỉ" DataTextField="NHADiaChi"
                DataNavigateUrlFields="NHAID" DataNavigateUrlFormatString="~/Nha/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Loại nhà" DataField="NHALoai"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Cấp công trình" DataField="NHACap"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Diện tích (m<sup>2</sup>)" DataField="NHADienTich" DataFormatString="{0:#,###.##}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Giá trị (vnđ)" DataField="NHAGiaTri" DataFormatString="{0:#,###}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Quyền chủ sở hữu" DataField="NHAQuyenSoHuu"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NHAIsNha" HeaderText="Loại tài sản">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchNHAIsNha" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("NHAIsNha").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_NHAIsNha">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Nhà ở" Value="Nhà ở" />
                            <telerik:RadComboBoxItem Text="Công trình xây dựng khác" Value="Công trình xây dựng khác" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_NHAIsNha" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_NHAIsNha(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("NHAIsNha", args.get_item().get_value(), "EqualTo");
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