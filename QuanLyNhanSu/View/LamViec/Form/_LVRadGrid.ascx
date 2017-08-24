<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_LVRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.LamViec.Form._LVRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadToolTipManager ID="RadToolTipManager1" runat="server"></telerik:RadToolTipManager>


<telerik:RadGrid ID="rgLamViec"  runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgLamViec_ItemCreated"
    OnItemDataBound="rgLamViec_ItemDataBound"
    OnNeedDataSource="rgLamViec_NeedDataSource"
    OnPageIndexChanged="rgLamViec_PageIndexChanged"
    OnPageSizeChanged="rgLamViec_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Đơn vị" DataTextField="DVTen"
                DataNavigateUrlFields="LVID" DataNavigateUrlFormatString="~/LamViec/{0}"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" FilterControlWidth="100%" ShowSortIcon="true"></telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="CVTen" HeaderText="Chức vụ"
                FilterControlAltText="Filter CVTen column" AutoPostBackOnFilter="true"
                UniqueName="CVTen">
                <FilterTemplate>
                    <telerik:RadComboBox ID="RadComboBoxChucVu" EnableVirtualScrolling="true" AppendDataBoundItems="true" Width="100%"
                        DataSourceID="SqlDataSourceChucVu" DataTextField="CVTen" DataValueField="CVTen"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("CVTen").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_CVTen">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả chức vụ" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="RadScriptBlockSearchCVTen" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_CVTen(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("CVTen", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle Font-Bold="true" Width="150px" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Từ ngày" DataField="LVTuNgay" DataFormatString="{0:dd/MM/yyyy}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Đến ngày" DataField="LVDenNgay" DataFormatString="{0:dd/MM/yyyy}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Nhóm ngạch" DataField="NGTen"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Bậc lương" DataField="BLTen"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Hệ số lương" DataField="LVHeSoLuong"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Lương cơ bản" DataField="LVLuongCoBan" DataFormatString="{0:#,###}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Lương PC" DataField="LVLuongPC" DataFormatString="{0:#,###}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Lương thực lãnh" DataField="LVLuongThucLanh" DataFormatString="{0:#,###}"
                AllowFiltering="false">
                <ItemStyle HorizontalAlign="Right" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVNhiemVu" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVPhuCapChucVu" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVPhuCapCongVu" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVPhuCapKiemNhiem" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVPhuCapNghe" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVPhuCapThamNienNghe" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVPhuCapVuotKhung" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVPhuCapDocHai" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LVTyLe" Display="false"></telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

<asp:SqlDataSource ID="SqlDataSourceChucVu" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM [ChucVus] ORDER BY [CVTen]"></asp:SqlDataSource>