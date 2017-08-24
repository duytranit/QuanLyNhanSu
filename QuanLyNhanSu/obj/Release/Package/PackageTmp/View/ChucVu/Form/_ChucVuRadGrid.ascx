<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_ChucVuRadGrid.ascx.cs" Inherits="QuanLyNhanSu.View.ChucVu.Form._ChucVuRadGrid" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdateInitiatorPanelsOnly="true">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadGridChucVu">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadGridChucVu" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>

<telerik:RadGrid ID="RadGridChucVu" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    OnItemDataBound="RadGridChucVu_ItemDataBound"
    OnNeedDataSource="RadGridChucVu_NeedDataSource"
    OnPageIndexChanged="RadGridChucVu_PageIndexChanged"
    OnPageSizeChanged="RadGridChucVu_PageSizeChanged">
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView NoMasterRecordsText="Không tìm thấy chức vụ" PageSize="5">
        <Columns>
            <telerik:GridTemplateColumn UniqueName="STTColumn" HeaderText="STT" AllowFiltering="false" AllowSorting="false">
                <ItemTemplate>
                    <asp:Label ID="LabelSTT" runat="server"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="50px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridTemplateColumn>
            <telerik:GridHyperLinkColumn DataTextField="CVTen" HeaderText="Vị trí việc làm"
                AllowFiltering="false" AllowSorting="false"
                DataNavigateUrlFields="CVID" DataNavigateUrlFormatString="~/ChucVu/{0}">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true"/>
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="CVSoLuongNV" HeaderText="Số lượng nhân sự đảm nhận"
                AllowFiltering="false" AllowSorting="false">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="200px" />
                <ItemStyle HorizontalAlign="Center" />
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
    <PagerStyle PagerTextFormat="{4} {5} số chức vụ trên {1} trang " PageSizeLabelText="Số chức vụ" />
</telerik:RadGrid>