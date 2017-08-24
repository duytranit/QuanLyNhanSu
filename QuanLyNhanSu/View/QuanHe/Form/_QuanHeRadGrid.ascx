<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_QuanHeRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.QuanHe.Form._QuanHeRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="RadGridQuanHe" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    AllowFilteringByColumn ="true" AllowSorting="true"
    EnableLinqExpressions="false"
    OnItemDataBound="RadGridQuanHe_ItemDataBound"
    OnNeedDataSource="RadGridQuanHe_NeedDataSource"
    OnPageIndexChanged="RadGridQuanHe_PageIndexChanged"
    OnPageSizeChanged="RadGridQuanHe_PageSizeChanged"
    OnItemCreated="RadGridQuanHe_ItemCreated">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy quan hệ" PageSize="5">
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn DataTextField="QHTen" HeaderText="Họ và tên"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true"
                DataNavigateUrlFields="QHID" DataNavigateUrlFormatString="~/QuanHe/{0}">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="LQHTen" HeaderText="Mối quan hệ"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                FilterControlWidth="100%" ShowFilterIcon="false" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridTemplateColumn UniqueName="QHBenVo" DataField="QHBenVo" HeaderText="Bên ruột/vợ(chồng)">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Convert.ToBoolean(Eval("QHBenVo")) == true ? "Bên vợ(chồng)" : "Bên ruột" %>'></asp:Label>
                </ItemTemplate>
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchGioiTinh" Height="100px" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("QHBenVo").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_BenVo">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Bên ruột" Value="False" />
                            <telerik:RadComboBoxItem Text="Bên vợ-chồng" Value="True" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_BenVo" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_BenVo(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("QHBenVo", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="200px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn DataField="QHNgaySinh" HeaderText="Ngày sinh"
                AllowFiltering="false" AllowSorting="false" DataFormatString="{0:dd/MM/yyyy}">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QHGioiTinh" HeaderText="Giới tính">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchQHGioiTinh" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("QHGioiTinh").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_QHGioiTinh">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Nam" Value="Nam" />
                            <telerik:RadComboBoxItem Text="Nữ" Value="Nữ" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_QHGioiTinh" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_QHGioiTinh(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("QHGioiTinh", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px"/>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QHHoKhau" Display="false"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="QHNoiO" Display="false"></telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn UniqueName="chbQHBenVo" DataField="QHBenVo" Display="false"></telerik:GridCheckBoxColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>