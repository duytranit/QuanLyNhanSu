<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_TDNNRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.TrinhDoNgoaiNgu.Form._TDNNRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgNgoaiNgu" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemDataBound="rgNgoaiNgu_ItemDataBound"
    OnItemCreated="rgNgoaiNgu_ItemCreated"
    OnNeedDataSource="rgNgoaiNgu_NeedDataSource"
    OnPageIndexChanged="rgNgoaiNgu_PageIndexChanged"
    OnPageSizeChanged="rgNgoaiNgu_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Trình độ ngoại ngữ" DataTextField="TDNNTen"
                DataNavigateUrlFields="TDNNID" DataNavigateUrlFormatString="~/TrinhDoNgoaiNgu/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="TDNNChungChi" HeaderText="Bằng cấp">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchTDNNChungChi" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("TDNNChungChi").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_TDNNChungChi">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Chứng chỉ" Value="Chứng chỉ" />
                            <telerik:RadComboBoxItem Text="Hình thức khác" Value="Hình thức khác" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_TDNNChungChi" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_TDNNChungChi(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("TDNNChungChi", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TDNNTiengDanToc" HeaderText="Chứng chỉ">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchTDNNTiengDanToc" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("TDNNTiengDanToc").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_TDNNTiengDanToc">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Tiếng dân tộc" Value="Tiếng dân tộc" />
                            <telerik:RadComboBoxItem Text="Tiếng quốc ngữ" Value="Tiếng quốc ngữ" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_TDNNTiengDanToc" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_TDNNTiengDanToc(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("TDNNTiengDanToc", args.get_item().get_value(), "EqualTo");
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