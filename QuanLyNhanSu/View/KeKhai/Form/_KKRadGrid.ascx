<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_KKRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.KeKhai.Form._KKRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadGrid ID="rgKeKhai" runat="server" AutoGenerateColumns="false" EnableLinqExpressions="false"
    AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true"
    OnItemCreated="rgKeKhai_ItemCreated"
    OnItemDataBound="rgKeKhai_ItemDataBound"
    OnNeedDataSource="rgKeKhai_NeedDataSource"
    OnPageIndexChanged="rgKeKhai_PageIndexChanged"
    OnPageSizeChanged="rgKeKhai_PageSizeChanged">
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
            <telerik:GridHyperLinkColumn HeaderText="Năm kê khai" DataTextField="KKNam"
                DataNavigateUrlFields="KKID" DataNavigateUrlFormatString="~/KeKhai/{0}"
                CurrentFilterFunction="EqualTo" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true">
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn HeaderText="Cơ quan/ đơn vị công tác" DataField="KKCoQuan"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn HeaderText="Chức vụ/ chức danh công tác" DataField="KKChucVu"
                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
                ShowFilterIcon="false" ShowSortIcon="true"></telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>