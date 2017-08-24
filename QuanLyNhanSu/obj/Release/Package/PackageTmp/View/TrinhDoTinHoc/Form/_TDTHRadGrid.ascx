<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_TDTHRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.TrinhDoTinHoc.Form._TDTHRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgTrinhDoTinHoc" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgTrinhDoTinHoc_ItemCreated"
    OnItemDataBound="rgTrinhDoTinHoc_ItemDataBound"
    OnNeedDataSource="rgTrinhDoTinHoc_NeedDataSource"
    OnPageIndexChanged="rgTrinhDoTinHoc_PageIndexChanged"
    OnPageSizeChanged="rgTrinhDoTinHoc_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Trình độ tin học" DataTextField="TDTHTen"
                DataNavigateUrlFields="TDTHID" DataNavigateUrlFormatString="~/TrinhDoTinHoc/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="TDTHChungChi" HeaderText="Bằng cấp">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchTDTHChungChi" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("TDTHChungChi").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_TDTHChungChi">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Chứng chỉ" Value="Chứng chỉ" />
                            <telerik:RadComboBoxItem Text="Hình thức khác" Value="Hình thức khác" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_TDTHChungChi" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_TDTHChungChi(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("TDTHChungChi", args.get_item().get_value(), "EqualTo");
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