<%@ Page Title="KKTS" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="CUD.aspx.cs" Inherits="QuanLyNhanSu.View.KeKhai.Admin.CUD" %>

<%@ Register TagPrefix="Partial" TagName="KKForm" Src="~/View/KeKhai/Form/_Form.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="Partial" TagName="NHARadGrid" Src="~/View/Nha/Form/_NHARadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="DATRadGrid" Src="~/View/Dat/Form/_DatRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="TIERadGrid" Src="~/View/Tien/Form/_TIERadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="DSRadGrid" Src="~/View/DongSan/Form/_DSRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="DQRadGrid" Src="~/View/DaQui/Form/_DQRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="TSRadGrid" Src="~/View/TaiSanKhac/Form/_TSRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="TSNNRadGrid" Src="~/View/TaiSanNuocNgoai/Form/_TSNNRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="KNRadGrid" Src="~/View/KhoanNo/Form/_KNRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="TNRadGrid" Src="~/View/ThuNhap/Form/_TNRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="KKCRadGrid" Src="~/View/KeKhaiCon/Form/_KKCRadGrid.ascx" %>
<%@ Register TagPrefix="Partial" TagName="GTRadGrid" Src="~/View/GiaiTrinh/Form/_GTRadGrid.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="KKCRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KKCRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="KKForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KKForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="NHARadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="NHARadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="DATRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DATRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="TIERadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TIERadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="DSRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DSRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="DQRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="DQRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="TSRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TSRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="TSNNRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TSNNRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="KNRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="KNRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="TNRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="TNRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="GTRadGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GTRadGrid" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="row rb-row">
        <div class="col-md-4 col-md-4-full-width">
            <h2>KÊ KHAI TÀI SẢN, THU NHẬP</h2>
            <p style="text-align:center;">
                <i>(Ban hành kèm theo Thông tư số 08/2013/TT-TTCP ngày 31/10/2013 của Thanh tra Chính phủ)</i>
            </p>            
            <hr />
            <Partial:KKForm ID="KKForm" runat="server" />

            <asp:Panel ID="pnlContent" runat="server" Visible="false">                
                <b>Con chưa thành niên (con đẻ, con nuôi theo quy định của pháp luật):</b> |
                <asp:LinkButton ID="btKeKhaiConNew" runat="server" Text="Thêm mới" OnClick="btKeKhaiConNew_Click"></asp:LinkButton> |
                <asp:LinkButton ID="btExportWord" runat="server" Text="Xuất file word" OnClick="btExportWord_Click"></asp:LinkButton>
                <br />
                <Partial:KKCRadGrid ID="KKCRadGrid" runat="server" />
                <br />

                <b>I. Nhà ở, công trình xây dựng:</b> |
                <asp:LinkButton ID="btNhaNew" runat="server" Text="Thêm mới" OnClick="btNhaNew_Click"></asp:LinkButton>
                <br />
                <i>Người kê khai tự mô tả các loại nhà, công trình xây dựng khác do bản thân, vợ hoặc chồng, con chưa thành niên sở hữu hoặc sở hữu một phần.</i>
                <Partial:NHARadGrid ID="NHARadGrid" runat="server" />
                <br />

                <b>II. Quyền sử dụng đất: </b>|
                <asp:LinkButton ID="btDatNew" runat="server" Text="Thêm mới" OnClick="btDatNew_Click"></asp:LinkButton>
                <br />
                <i>Người kê khai tự mô tả các loại đất do bản thân, vợ hoặc chồng. con chưa thành niên có quyền sử dụng toàn bộ hoặc một phần.</i>
                <Partial:DATRadGrid ID="DATRadGrid" runat="server" />
                <br />

                <b>III. Tiền:</b> |
                <asp:LinkButton ID="btTienNew" runat="server" Text="Thêm mới" OnClick="btTienNew_Click"></asp:LinkButton>
                <br />
                <i>Tiền (tiền Việt Nam, ngoại tệ) gồm tiền mặt, tiền cho vay, tiền gửi các cá nhân, tổ chức trong nước, nước ngoài tại Việt Nam mà tổng giá trị quy đổi từ 50 triệu đồng trở lên.</i>
                <Partial:TIERadGrid ID="TIERadGrid" runat="server" />
                <br />

                <b>IV. Động sản:</b> |
                <asp:LinkButton ID="btDongSanNew" runat="server" Text="Thêm mới" OnClick="btDongSanNew_Click"></asp:LinkButton>
                <br />
                <p style="text-align: center; font-style: italic;">
                    Ô tô, mô tô, xe gắn máy, xe máy (máy ủi, máy xúc, các loại xe máy khác), tàu thủy, tàu bay, thuyền và những 
                động sản khác mà Nhà nước quản lý (theo quy định của pháp luật phải đăng kí sử dụng và được cấp giấy đăng kí) 
                có tổng giá trị mỗi loại từ 50 triệu đồng trở lên.                
                </p>
                <ul style="font-style: italic;">
                    <li>Ô tô</li>
                    <li>Mô tô</li>
                    <li>Xe gắn máy</li>
                    <li>Xe máy (máy ủi, máy xúc, các loại xe máy khác)</li>
                    <li>Tàu thủy</li>
                    <li>Tàu bay</li>
                    <li>Thuyền</li>
                    <li>Những động sản khác mà Nhà nước quản lý (theo quy định của pháp luật phải đăng ký sử dụng và được cấp giấy đăng ký)</li>
                </ul>
                <Partial:DSRadGrid ID="DSRadGrid" runat="server" />
                <br />

                <b>V. Đá quí:</b> |
                <asp:LinkButton ID="btDaQuiNew" runat="server" Text="Thêm mới" OnClick="btDaQuiNew_Click"></asp:LinkButton>
                <br />
                <p style="text-align: center; font-style: italic;">
                    Kim loại quý, đá quý, cổ phiếu, vốn góp vào các cơ sở kinh doanh, các loại giấy tờ có giá trị chuyển nhượng khác có tổng giá trị quy đổi mỗi loại từ 50 triệu đồng trở lên.
                </p>
                <ul style="font-style: italic;">
                    <li>Kim loại quý</li>
                    <li>Đá quý</li>
                    <li>Cổ phiếu</li>
                    <li>Vốn góp vào các cơ sở kinh doanh</li>
                    <li>Các loại giấy tờ có giá trị chuyển nhượng khác</li>
                </ul>
                <Partial:DQRadGrid ID="DQRadGrid" runat="server" />
                <br />

                <b>VI. Tài sản khác:</b> |
                <asp:LinkButton ID="btTaiSanNew" runat="server" Text="Thêm mới" OnClick="btTaiSanNew_Click"></asp:LinkButton>
                <br />
                <p style="text-align: center; font-style: italic;">
                    Các loại tài sản khác mà có giá trị quy đổi mỗi loại từ 50 triệu đồng trở lên (như cây cảnh, bộ bàn ghế, ảnh, đồ mỹ nghệ và các loại tài sản khác).
                </p>
                <Partial:TSRadGrid ID="TSRadGrid" runat="server" />
                <br />

                <b>VII. Tài sản, tài khoản ở nước ngoài:</b> |
                <asp:LinkButton ID="btTaiSanNuocNgoaiNew" runat="server" Text="Thêm mới" OnClick="btTaiSanNuocNgoaiNew_Click"></asp:LinkButton>
                <br />
                <p style="text-align: center; font-style: italic;">
                    Tài sản, tài khoản ở nước ngoài gồm tất cả tài sản quy định từ Khoản 1 đến Khoản 6 nói trên nằm ngoài lãnh thổ Việt Nam.
                </p>
                <Partial:TSNNRadGrid ID="TSNNRadGrid" runat="server" />
                <br />

                <b>VIII. Các khoản nợ:</b> |
                <asp:LinkButton ID="btKhoanNoNew" runat="server" Text="Thêm mới" OnClick="btKhoanNoNew_Click"></asp:LinkButton>
                <br />
                <p style="text-align: center; font-style: italic;">
                    Các khoản nợ gồm: Các khoản phải trả, giá trị các tài sản quản lý hộ, giữ hộ có tổng giá trị từ 50 triệu đồng trở lên
                </p>
                <Partial:KNRadGrid ID="KNRadGrid" runat="server" />
                <br />

                <b>IX. Tổng thu nhập năm:</b> |
                <asp:LinkButton ID="btThuNhapNew" runat="server" Text="Thêm mới" OnClick="btThuNhapNew_Click"></asp:LinkButton>
                <br />
                <p style="text-align: center; font-style: italic;">
                    Tổng thu nhập trong năm quy đổi thành tiền Việt Nam gồm các khoản lương, phụ cấp, trợ cấp, thưởng, thù lao, cho, tặng, biếu, thừa kế, thu nhập hưởng lợi từ các khoản đầu tư, phát sinh, sáng chế, các khoản thu nhập khác.
                </p>
                <Partial:TNRadGrid ID="TNRadGrid" runat="server" />
                <br />

                <b>X. Giải trình sự biến động của tài sản, thu nhập:</b> |
                <asp:LinkButton ID="btGiaiTrinhNew" runat="server" Text="Thêm mới" OnClick="btGiaiTrinhNew_Click"></asp:LinkButton>
                <br />
                <Partial:GTRadGrid ID="GTRadGrid" runat="server" />
            </asp:Panel>


        </div>
    </div>
</asp:Content>
