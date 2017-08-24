<%@ Page Title="TTCN" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CaNhan.aspx.cs" Inherits="QuanLyNhanSu.View.NhanVien.Admin.CaNhan" %>
<%@ Register TagPrefix="Partial" TagName="CUDForm" Src="~/View/NhanVien/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="LVRadGrid" Src="~/View/LamViec/Form/_LVRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="CTXHRadGrid" Src="~/View/ThamGiaCTXH/Form/_TGCTXHRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="DTRadGrid" Src="~/View/QuaTrinhDaoTao/Form/_QTDTRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="QHRadGrid" Src="~/View/QuanHe/Form/_QuanHeRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="TDNNRadGrid" Src="~/View/TrinhDoNgoaiNgu/Form/_TDNNRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="TDTHRadGrid" Src="~/View/TrinhDoTinHoc/Form/_TDTHRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="PTDHRadGrid" Src="~/View/PhongTangDanhHieu/Form/_PTDHRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="KTRadGrid" Src="~/View/KhenThuong/Form/_KTRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="KLRadGrid" Src="~/View/KyLuat/Form/_KLRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="DGRadGrid" Src="~/View/DanhGia/Form/_DGRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="CSRadGrid" Src="~/View/ChinhSach/Form/_CSRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="KKRadGrid" Src="~/View/KeKhai/Form/_KKRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="DGLDRadGrid" Src="~/View/DanhGiaLaoDong/Form/_DGLDRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="DGVCRadGrid" Src="~/View/DanhGiaVienChuc/Form/_DGVCRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="DGDVRadGrid" Src="~/View/DanhGiaDangVien/Form/_DGDVRadGrid.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="LVRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="LVRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="CTXHRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="CTXHRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="DTRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DTRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="QHRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="QHRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="TDNNRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TDNNRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="TDTHRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TDTHRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="PTDHRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="PTDHRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="KTRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KTRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="KLRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KLRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="DGRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DGRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="CSRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="CSRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="KKRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KKRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="DGLDRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DGLDRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="DGVCRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DGVCRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="DGDVRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DGDVRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>THÔNG TIN CÁ NHÂN</h2>
            <hr />
            <Partial:CUDForm ID="CUDForm" runat="server" />        
            <asp:Panel ID="pnlExtraInforamtion" runat="server">
                <b>I. Quá trình công tác:</b> | <asp:LinkButton ID="btLamViecNew" runat="server" Text="Thêm mới" OnClick="btLamViecNew_Click"></asp:LinkButton>
                <Partial:LVRadGrid ID="LVRadGrid" runat="server"/>
                <br />
                <b>II. Hoạt động chính trị - xã hội:</b> | <asp:LinkButton ID="btCTXHNew" runat="server" Text="Thêm mới" OnClick="btCTXHNew_Click"></asp:LinkButton>
                <Partial:CTXHRadGrid ID="CTXHRadGrid" runat="server" />
                <br />
                <b>III. Quá trình đào tạo - bồi dưỡng:</b> | <asp:LinkButton ID="btDaoTaoNew" runat="server" Text="Thêm mới"  OnClick="btDaoTaoNew_Click"></asp:LinkButton>
                <Partial:DTRadGrid ID="DTRadGrid" runat="server" />
                <br />
                <b>IV. Quan hệ gia đình:</b> | <asp:LinkButton ID="btQuanHeNew" runat="server" Text="Thêm mới" OnClick="btQuanHeNew_Click"></asp:LinkButton>
                <Partial:QHRadGrid ID="QHRadGrid" runat="server" />
                <br />
                <b>V. Trình độ ngoại ngữ:</b> | <asp:LinkButton ID="btNgoaiNguNew" runat="server" Text="Thêm mới" OnClick="btNgoaiNguNew_Click"></asp:LinkButton>
                <Partial:TDNNRadGrid ID="TDNNRadGrid" runat="server" />
                <br />
                <b>VI. Trình độ tin học:</b> | <asp:LinkButton ID="btTinHocNew" runat="server" Text="Thêm mới" OnClick="btTinHocNew_Click"></asp:LinkButton>
                <Partial:TDTHRadGrid ID="TDTHRadGrid" runat="server" />
                <br />
                <b>VII. Phong tặng danh hiệu:</b> | <asp:LinkButton ID="btDanhHieuNew" runat="server" Text="Thêm mới" OnClick="btDanhHieuNew_Click"></asp:LinkButton>
                <Partial:PTDHRadGrid ID="PTDHRadGrid" runat="server" />
                <br />
                <b>VIII. Quyết định khen thưởng:</b> | <asp:LinkButton ID="btKhenThuongNew" runat="server" Text="Thêm mới" OnClick="btKhenThuongNew_Click"></asp:LinkButton>
                <Partial:KTRadGrid ID="KTRadGrid" runat="server" />
                <br />
                <b>IX. Quyết định kỹ luật:</b> | <asp:LinkButton ID="btKyLuatNew" runat="server" Text="Thêm mới" OnClick="btKyLuatNew_Click"></asp:LinkButton>
                <Partial:KLRadGrid ID="KLRadGrid" runat="server" />
                <br />
                <b>X. Đánh giá:</b> | <asp:LinkButton ID="btDanhGiaNew" runat="server" Text="Thêm mới" OnClick="btDanhGiaNew_Click"></asp:LinkButton>
                <Partial:DGRadGrid ID="DGRadGrid" runat="server" />
                <br />
                <b>XI. Chính sách:</b> | <asp:LinkButton ID="btChinhSachNew" runat="server" Text="Thêm mới" OnClick="btChinhSachNew_Click"></asp:LinkButton>
                <Partial:CSRadGrid ID="CSRadGrid" runat="server" />
                <br />
                <b>XII. Kê khai tài sản, thu nhập:</b> | <asp:LinkButton ID="btKeKhaiNew" runat="server" Text="Thêm mới" OnClick="btKeKhaiNew_Click"></asp:LinkButton>
                <Partial:KKRadGrid ID="KKRadGrid" runat="server" />
                <br />
                <b>XIII. Đánh giá và phân loại lao động:</b> | <asp:LinkButton ID="btDanhGiaLaoDongNew" runat="server" Text="Thêm mới" OnClick="btDanhGiaLaoDongNew_Click"></asp:LinkButton>
                <Partial:DGLDRadGrid ID="DGLDRadGrid" runat="server" />
                <br />
                <b>XIV. Đánh giá và phân loại viên chức:</b> | <asp:LinkButton ID="btDanhGiaVienChucNew" runat="server" Text="Thêm mới" OnClick="btDanhGiaVienChucNew_Click"></asp:LinkButton>
                <Partial:DGVCRadGrid ID="DGVCRadGrid" runat="server" />
                <br />
                <b>XV. Bản kiểm điểm đảng viên và tự nhận xét, đánh giá công chức, viên chức:</b> | <asp:LinkButton ID="btDanhGiaDangVienNew" runat="server" Text="Thêm mới" OnClick="btDanhGiaDangVienNew_Click"></asp:LinkButton>
                <Partial:DGDVRadGrid ID="DGDVRadGrid" runat="server" />
            </asp:Panel>
        </div>
    </div>
</asp:Content>
