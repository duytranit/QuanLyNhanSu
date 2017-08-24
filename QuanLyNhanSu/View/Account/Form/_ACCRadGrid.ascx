<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_ACCRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.Account.Form._ACCRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI"  TagPrefix="telerik" %>

<telerik:RadGrid ID="rgAccount" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgAccount_ItemCreated"
    OnItemDataBound="rgAccount_ItemDataBound"
    OnNeedDataSource="rgAccount_NeedDataSource"
    OnPageIndexChanged="rgAccount_PageIndexChanged"
    OnPageSizeChanged="rgAccount_PageSizeChanged">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy dữ liệu phù hợp" PageSize="10">
        <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
        <Columns>
            <telerik:GridTemplateColumn HeaderText="STT" AllowFiltering="false">
                <ItemTemplate>
                    <asp:Label ID="lblSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn HeaderText="Email" DataTextField="ACCEmail"
                DataNavigateUrlFields="ACCID" DataNavigateUrlFormatString="~/TaiKhoan/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Họ và tên" DataField="NVTen"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="ACCChucNang" HeaderText="Trạng thái">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchChucNang" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("ACCChucNang").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_ChucNang">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Chức năng quản trị" Value="Chức năng quản trị" />
                            <telerik:RadComboBoxItem Text="Chức năng quản lý" Value="Chức năng quản lý" />
                            <telerik:RadComboBoxItem Text="Chức năng nhân viên" Value="Chức năng nhân viên" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_ChucNang" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_ChucNang(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("ACCChucNang", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="ACCStatus" HeaderText="Trạng thái">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchStatus" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("ACCStatus").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_Status">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Kích hoạt" Value="Kích hoạt" />
                            <telerik:RadComboBoxItem Text="Khóa" Value="Khóa" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_Status" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_Status(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("ACCStatus", args.get_item().get_value(), "EqualTo");
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