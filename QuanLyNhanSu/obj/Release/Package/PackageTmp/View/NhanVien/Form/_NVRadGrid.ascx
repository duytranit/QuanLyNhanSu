<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_NVRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.NhanVien.Form._NVRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="filterDiv">
    <telerik:RadFilter runat="server" ID="RadFilterNhanVien"
        OnExpressionItemCreated="RadFilterNhanVien_ExpressionItemCreated"
        FilterContainerID="RadGridNhanVien" ShowApplyButton="false"
        Culture="vi-VN">
        <FieldEditors>
            <telerik:RadFilterDropDownEditor FieldName="NVLamViecChucVu" DisplayName="Chức vụ" DefaultFilterFunction="Contains"
                DataTextField="CVTen" DataValueField="CVTen" />
            <telerik:RadFilterDropDownEditor FieldName="NVTGCTXH" DisplayName="Tổ chức CTXH" DefaultFilterFunction="Contains"
                DataTextField="CTXHTen" DataValueField="CTXHTen" />
        </FieldEditors>
    </telerik:RadFilter>
</div>

<telerik:RadGrid ID="RadGridNhanVien" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false" 
    AllowPaging="true" AllowFilteringByColumn="true" AllowSorting="true" ShowStatusBar="true"
    OnItemDataBound="RadGridNhanVien_ItemDataBound" 
    OnNeedDataSource="RadGridNhanVien_NeedDataSource"
    OnPageIndexChanged="RadGridNhanVien_PageIndexChanged" 
    OnPageSizeChanged="RadGridNhanVien_PageSizeChanged"
    OnItemCommand="RadGridNhanVien_ItemCommand"
    OnItemCreated="RadGridNhanVien_ItemCreated">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy nhân viên" PageSize="10"
        CommandItemDisplay="Top" 
        RetrieveDataTypeFromFirstItem="true"
        DataKeyNames="NVID">
        <CommandItemTemplate>
            <telerik:RadToolBar runat="server" ID="RadToolBar1" AutoPostBack="true">
                <Items>
                    <telerik:RadToolBarButton Text="Áp dụng bộ lọc" CommandName="FilterRadGrid" 
                  ImageUrl="<%#GetFilterIcon() %>" ImagePosition="Right"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </CommandItemTemplate>
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="20px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridImageColumn HeaderText="Hình" DataType="System.String" DataImageUrlFields="NVHinh" AllowFiltering="false"
                DataImageUrlFormatString="/Uploads/Images/NhanVien/{0}" AlternateText="Customer image" DataAlternateTextField="NVTen"
                ImageAlign="Middle" ImageHeight="50px" ImageWidth="50px">
                <HeaderStyle Width="60px" Font-Bold="true" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridImageColumn>
            <telerik:GridHyperLinkColumn DataTextField="NVTen" HeaderText="Nhân viên"
                DataNavigateUrlFields="NVID" DataNavigateUrlFormatString="~/NhanSu/{0}"
                AllowFiltering="true" FilterControlWidth="100%" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                FilterControlToolTip="Nhập tên nhân viên (bỏ trống để chọn hết) cần tìm >> enter"
                CurrentFilterFunction="Contains">
                <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="NVTuoi" HeaderText="Tuổi" UniqueName="NVTuoi"
                HeaderStyle-Width="150px" SortExpression="NVTuoi">
                <FilterTemplate>
                    <div style="float: left; padding: 5px 5px 0 0">
                        0
                    </div>
                    <telerik:RadSlider runat="server" ID="RadSliderNVTuoi" IsSelectionRangeEnabled="true"
                        Style="float: left" MinimumValue="0" MaximumValue="100" SmallChange="1" ShowDecreaseHandle="false"
                        ShowIncreaseHandle="false" Width="110px" SelectionStart='<%# startSlider %>'
                        SelectionEnd='<%# endSlider %>' OnClientValueChanged="ClientValueChanged" OnClientSlideStart="ClientSlideStart"
                        OnClientSlideEnd="NVTuoiRangeChanged" />
                    <div style="padding: 5px 0 0 5px">
                        100
                    </div>
                    <telerik:RadScriptBlock ID="RadScriptBlockNVTuoi" runat="server">
                        <script type="text/javascript">
                            function NVTuoiRangeChanged(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");

                                var startValue = sender.get_selectionStart();
                                var endValue = sender.get_selectionEnd();

                                tableView.filter("NVTuoi", startValue + " " + endValue, "Between");
                            }
                            function ClientValueChanged(sender, args) {
                                var tooltip = $find("<%= RadToolTip1.ClientID %>");

                                if (!tooltip.isVisible()) {
                                    var activeHandle = sender.get_activeHandle();
                                    if (!activeHandle) return;

                                    tooltip.set_targetControl(activeHandle);
                                    tooltip.show();
                                }
                                else {
                                    tooltip.updateLocation();
                                }

                                tooltip.set_text(args.get_newValue());
                            }
                            function ClientSlideStart(sender, args) {
                                var tooltip = $find("<%= RadToolTip1.ClientID %>");
                                tooltip.hide();
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NVGioiTinh" HeaderText="Giới tính">
                <FilterTemplate>
                    <telerik:RadComboBox ID="rcbSearchGioiTinh" AppendDataBoundItems="true" Width="100%"
                        SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("NVGioiTinh").CurrentFilterValue %>'
                        runat="server" OnClientSelectedIndexChanged="TitleIndexChanged_GioiTinh">
                        <Items>
                            <telerik:RadComboBoxItem Text="Tất cả" />
                            <telerik:RadComboBoxItem Text="Nam" Value="Nam" />
                            <telerik:RadComboBoxItem Text="Nữ" Value="Nữ" />
                        </Items>
                    </telerik:RadComboBox>
                    <telerik:RadScriptBlock ID="TitleIndexChanged_GioiTinh" runat="server">
                        <script type="text/javascript">
                            function TitleIndexChanged_GioiTinh(sender, args) {
                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                tableView.filter("NVGioiTinh", args.get_item().get_value(), "EqualTo");
                            }
                        </script>
                    </telerik:RadScriptBlock>
                </FilterTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="100px"/>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Quê quán" DataField="NVQueQuan"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" FilterControlWidth="100%" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
            </telerik:GridBoundColumn>
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
            <telerik:GridBoundColumn HeaderText="Đơn vị công tác" DataField="DVTen"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" FilterControlWidth="100%" ShowSortIcon="true">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Công tác từ ngày" DataField="NVLamViecTuNgay"
                AllowFiltering="false">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>            
            <telerik:GridBoundColumn DataField="NVTGCTXH" Display="false"></telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
    <PagerStyle PagerTextFormat="{4} {5} số nhân sự trên {1} trang " PageSizeLabelText="Số nhân sự" />
</telerik:RadGrid>

<telerik:RadToolTip ID="RadToolTip1" runat="server" OffsetY="3" Position="TopCenter"
    ShowCallout="false" Height="20px" ShowEvent="fromcode" />

<asp:SqlDataSource ID="SqlDataSourceChucVu" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM [ChucVus] ORDER BY [CVTen]"></asp:SqlDataSource>