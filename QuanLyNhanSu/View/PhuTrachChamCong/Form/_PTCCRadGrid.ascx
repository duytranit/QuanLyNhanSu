<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_PTCCRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.PhuTrachChamCong.Form._PTCCRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgPhuTrachChamCong" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnNeedDataSource="rgPhuTrachChamCong_NeedDataSource"
    OnPageIndexChanged="rgPhuTrachChamCong_PageIndexChanged"
    OnPageSizeChanged="rgPhuTrachChamCong_PageSizeChanged"
    OnItemDataBound="rgPhuTrachChamCong_ItemDataBound"
    OnItemCreated="rgPhuTrachChamCong_ItemCreated">
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
            <telerik:GridHyperLinkColumn HeaderText="Tài khoản" DataTextField="ACCEmail"
                DataNavigateUrlFields="PTCCID" DataNavigateUrlFormatString="~/PhuTrachChamCong/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Họ và tên" DataField="NVTen"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Đơn vị" DataField="DVTen"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Trạng thái" DataField="PTCCStatus">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchStatus" runat="server" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("PTCCStatus").CurrentFilterValue %>'
                        OnClientSelectedIndexChanged="TitleIndexChanged_Status">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Kích hoạt" Value="Kích hoạt" />
                            <telerik:RadComboBoxItem Text="Khóa" Value="Khóa" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_Status" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_Status(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID%>");
                                tableView.filter("PTCCStatus", args.get_item().get_value(), "Equal to");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle Width="100px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>