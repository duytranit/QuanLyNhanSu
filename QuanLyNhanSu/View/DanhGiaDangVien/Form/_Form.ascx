<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_Form.ascx.cs" Inherits="QuanLyNhanSu.View.DanhGiaDangVien.Form._Form" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Table runat="server" CssClass="rbTable" HorizontalAlign="Center">
    <asp:TableRow>
        <asp:TableCell HorizontalAlign="Center">
            ĐẢNG BỘ<br/>
            SỞ TÀI NGUYÊN VÀ MÔI TRƯỜNG BẾN TRE
        </asp:TableCell>
        <asp:TableCell VerticalAlign="Middle" HorizontalAlign="Center">
            <b><u>ĐẢNG CỘNG SẢN VIỆT NAM</u></b>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell HorizontalAlign="Center">
            <b>
                CHI BỘ<br/>
                TRUNG TÂM PHÁT TRIỂN QUỸ ĐẤT
            </b>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<br />
<p style="width: 100%; text-align: center;">
    <b>BẢN KIỂM ĐIỂM ĐẢNG VIÊN VÀ TỰ NHẬN XÉT,<br />
        ĐÁNH GIÁ CÔNG CHỨC, VIÊN CHỨC NĂM 
    </b>
    <telerik:RadTextBox ID="txtNam" runat="server" MaxLength="4"
        EmptyMessage="Năm đánh giá" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
    </telerik:RadTextBox><br />
    <asp:RequiredFieldValidator ID="rfvNam" runat="server" ControlToValidate="txtNam" Display="Dynamic"
        ErrorMessage="Nhập năm đánh giá" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cpvNam" runat="server" ControlToValidate="txtNam" Display="Dynamic" Type="Integer"
        Operator="DataTypeCheck" ErrorMessage="Năm đánh giá có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
</p>
<asp:Table runat="server" CssClass="rbTable">
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Tôi tên là:
            <b><asp:Label ID="lblTen" runat="server"></asp:Label></b>
        </asp:TableCell>
        <asp:TableCell>
            Sinh ngày:
            <asp:Label ID="lblDOB" runat="server"></asp:Label>   
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chức vụ Đảng:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtChucVuDang" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chức vụ Đảng" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvChucVuDang" runat="server" ControlToValidate="txtChucVuDang" Display="Dynamic"
                ErrorMessage="Nhập chức vụ Đảng" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chức vụ Chính quyền, Đoàn thể:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtChucVuChinhQuyen" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chức vụ Chính quyền, Đoàn thể" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvChuVuChinhQuyen" runat="server" ControlToValidate="txtChucVuChinhQuyen" Display="Dynamic"
                ErrorMessage="Nhập chức vụ Chính quyền, Đoàn thể" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Đơn vị công tác:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtDonVi" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Đơn vị công tác" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvDonVi" runat="server" ControlToValidate="txtDonVi" Display="Dynamic"
                ErrorMessage="Nhập đơn vị công tác" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Chi bộ sinh hoạt:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtChiBo" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Chi bộ" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvChiBo" runat="server" ControlToValidate="txtChiBo" Display="Dynamic"
                ErrorMessage="Nhập chi bộ sinh hoạt" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hạng chức danh nghề nghiệp:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtHangChucDanh" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hạng chức danh" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvHangChucDanh" runat="server" ControlToValidate="txtHangChucDanh" Display="Dynamic"
                ErrorMessage="Nhập hạng chức danh" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Bậc lương:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtBac" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Bậc lương" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvBac" runat="server" ControlToValidate="txtBac" Display="Dynamic"
                ErrorMessage="Nhập bậc lương" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvBac" runat="server" ControlToValidate="txtBac" Display="Dynamic" Type="Integer"
                Operator="DataTypeCheck" ErrorMessage="Bậc lương có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow>
        <asp:TableCell CssClass="rbTableCellLabel">
            Hệ số lương:
        </asp:TableCell>
        <asp:TableCell>
            <telerik:RadTextBox ID="txtHeSoLuong" runat="server" WrapperCssClass="rbRadTextBox"
                EmptyMessage="Hệ số lương" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true">
            </telerik:RadTextBox>
            <asp:RequiredFieldValidator ID="rfvHeSoLuong" runat="server" ControlToValidate="txtHeSoLuong" Display="Dynamic"
                ErrorMessage="Nhập hệ số lương" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cpvHeSoLuong" runat="server" ControlToValidate="txtHeSoLuong" Display="Dynamic" Type="Double"
                Operator="DataTypeCheck" ErrorMessage="Hệ số lương có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>

<b>I. Ưu điểm:</b><br />
<b><i>1) Đảng viên không giữ chức vụ lãnh đạo, quản lý.</i></b>
<ul>
    <li>
        <p style="text-align:justify;">Tư tưởng chính trị: việc chấp hành đường lối, chủ trương, chính sách của Đảng và pháp luật của Nhà nước.</p>
        
    </li>
    <li>
        <p style="text-align:justify;">Phẩm chất đạo đức, lối sống, tác phong và lề lối làm việc, kết quả thực hiện Chỉ thị 03 của Bộ Chính trị về tiếp tục học tập và làm theo tấm gương đạo đức Hồ Chí Minh chủ đề năm 2016.</p>        
    </li>
    <li>
        <p style="text-align:justify;">Thực hiện chức trách, nhiệm vụ, tinh thần trách nhiệm trong công tác, kết quả thực hiện nhiệm vụ được giao.</p>        
    </li>
    <li>
        <p style="text-align:justify;">Ý thức tổ chức kỷ luật: Việc chấp hành phân công của tổ chức, Quy định về những điều đảng viên không được làm và việc chấp hành, tuân thủ các nội quy, quy chế của địa phương, cơ quan, đơn vị; thực hiện chế độ sinh hoạt đảng và các nguyên tắc xây đựng đảng; giữ mối liên hệ với cấp ủy cơ sở và gương mẫu thực hiện nghĩa vụ công dân nơi cư trú.</p>        
    </li>
</ul>
<p style="text-align:justify"><i>* Đối với đảng viên là công chức:</i> Khi kiểm điểm về thực hiện chức trách, nhiệm vụ cần đánh giá về năng lực, trình độ, chuyên môn, nghiệp vụ; đi sâu làm rõ về khối lượng, chất lượng, tiến độ và kết quả thực hiện nhiệm vụ được giao; tinh thần trách nhiệm và hiệu quả công tác phối hợp với đồng nghiệp, cơ quan, tổ chức có liên quan trong quá trình thực hiện nhiệm vụ, công vụ; ý thức, thái độ phụ vụ, giao tiếp ứng xử với nhân dân trong thực hiện nhiệm vụ, công vụ; việc phòng, chống các hành vi cửa quyền, hách dịch, gây khó khăn, phiền hà, tiêu cực, tham những, tham ô, lãng phí; việc giữ gìn đoàn kết nội bộ, thực hiện quy chế dân chủ ở cơ quan, đơn vị; trách nhiệm của công chức trong thực hiện công tác dân vận chính quyền; trong tham gia xây dựng các tổ chức trong hệ thống chính trị ở địa phương, cơ quan, đơn vị.</p>
<p style="text-align:justify"><i>* Đối với đảng viên là viên chức, người lao động:</i> Khi kiểm điểm về thực hiện chức trách, nhiệm vụ cần nêu kết quản thực hiện công việc hoặc nhiệm vụ theo hợp đồng làm việc hoặc hợp đồng lao động đã ký kết; việc thực hiện quy định về đạo đức nghề nghiệp; tinh thần trách nhiệm, thái độ phục vụ nhân dân, tinh thần hợp tác với đồng nghiệp và việc thực hiện quy tắc ứng xử của viên chức; việc thực hiện các nghĩa vụ khác của viên chức, người lao động.</p>
<p style="text-align:justify"><b><i>2) Đảng viên giữ chức vụ lãnh đạo, quản lý:</i></b> Ngoài những nội dung nêu tại khoản (1) còn phải kiểm điểm sâu các nội dung sau:</p>
<ul>
    <li>
        <p style="text-align:justify">Việc lãnh đạo, chỉ đạo, diều hành các cơ quan, tổ chức, đơn vị hoặc ngành, lĩnh vực phụ trách thể hiện ở khối lượng, chất lượng, tiến độ và kết quả thực hiện nhiệm vụ hoàn thành bao nhiêu % nhiệm vụ theo chương trình, kế hoạch công tác năm.</p>
    </li>
    <li>
        <p style="text-align:justify">Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao lãnh đạo, quản lý, tổ chức, điều hành; năng lực lãnh đạo, quản lý; việc quy tụ, đoàn kết, duy trì kỷ luật, kỷ cương trong cơ quan, tổ chức, đơn vị không để xảy ra các vụ việc vi phạm kỷ luật, vi phạm pháp luật phải xử lý trong phạm vi quản lý; việc quản lý sử dụng tài sản, tài chính của đơn vị, trách nhiệm của người đứng đầu trong thực hiện chi tiêu nội bộ cơ quan; khả năng tập họp, xây dựng cơ quan, tổ chức, đơn vị, đoàn kết thống nhất không để xảy ra đơn thư khiếu nại, tố cáo; thái độ công tâm, khách quan và sự tín nhiệm của cán bộ, đảng viên, quần chúng.</p>
    </li>
    <li>
        <p style="text-align:justify">Việc lãnh đạo,chỉ đạo cải cách hành chính; kế hoạch tinh giản biên chế, cải cách chế độ công vụ, công chức đạt kết quả ra sao, có tác động trực tiếp nâng cao hiệu lực, hiểu quả hoạt động của cơ quan, tổ chức, đơn vị hoặc của ngành, lĩnh vực được giao phụ trách chưa?</p>
    </li>
    <li>
        <p style="text-align:justify">Ý thức trách nhiệm của người đứng đầu trong thực hiện nhiệm vụ; tu dưỡng đạo đức, lối sống, ý thức nêu gương của bản thân và gia đình, việc thực hiện Luật cán bộ, công chức, viên chức quy định những điều cán bộ, công chức, viên chức không được làm.</p>
    </li>
    <li>
        <p style="text-align:justify">Việc triển khai và thực hiện cơ chế tự chủ, tự chịu trách nhiệm đối với đơn vị sự nghiệp công lập theo quy định của pháp luật <i>(danh cho viên chức lãnh đạo, quản lý)</i>.</p>
    </li>
    <li>
        <p style="text-align:justify">Tham gia cùng tập thể trong lãnh đạo và tổ chức thực hiện các nhiệm vụ chính trị và công tác tổ chức, cán bộ của địa phương, cơ quan, đơn vị; làm rõ trách nhiệm cá nhân đối với những hạn chế, khuyết điểm của tập thể.</p>
    </li>
</ul>
<telerik:RadTextBox ID="txtUuDiem" runat="server" Width="100%" TextMode="MultiLine" Rows="10"
    EmptyMessage="Ưu điểm" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
<asp:RequiredFieldValidator ID="rfvUuDiem" runat="server" ControlToValidate="txtUuDiem" Display="Dynamic"
    ErrorMessage="Nhập ưu điểm" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
<p style="text-align:justify; font-weight: bold; font-style: italic">* Kết quả khắc phục, sửa chữa yếu kém, khuyết điểm theo Nghị quyết Trung Ương 4 (khóa XI) và những vấn đề mớ;i phát sinh</p>
<telerik:RadTextBox ID="txtKetQuaKhacPhuc" runat="server" Width="100%" TextMode="MultiLine" Rows="10"
    EmptyMessage="Kết quả khắc phục,sửa chữa yếu kém, khuyết điểm" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
<p style="font-weight: bold;">II. Khuyết điểm, hạn chế và nguyên nhân</p>
<telerik:RadTextBox ID="txtKhuyetDiem" runat="server" Width="100%" TextMode="MultiLine" Rows="10"
    EmptyMessage="Khuyết điểm, hạn chế và nguyên nhân" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
<p style="font-weight: bold;">III. Phương hướng, biện pháp khắc phục, sửa chữa yếu kém, khuyết điểm trong thời gian tới</p>
<telerik:RadTextBox ID="txtPhuongHuong" runat="server" Width="100%" TextMode="MultiLine" Rows="10"
    EmptyMessage="Phương hướng, biện pháp khaswsc phục, sửa chữa yếu kém, khuyết điểm trong thời gian tới" EmptyMessageStyle-BorderColor="Red" EmptyMessageStyle-Font-Italic="true"></telerik:RadTextBox>
<p style="font-weight: bold;">IV. Tự đánh giá về công chức, viên chức, người lao động và chất lượng đảng viên</p>
<ul>
    <li>
        <p style="text-align: justify"><i>Về công chức, viên chức, người lao động:</i> Đánh giá theo 1 trong 4 mức sau: Hoàn thành xuất sắc nhiệm vụ; hoàn thành tốt nhiệm vụ; hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực; không hoàn thành nhiệm vụ.</p>
    </li>
    <li>
        <p style="text-align: justify"><i>Về đảng viên:</i> Đánh giá theo 1 trong 4 mức sau: đảng viên hoàn thành xuất sắc nhiệm vụ; đảng viên hoàn thành tốt nhiệm vụ; đảng viên hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực; đảng viên không hoàn thành nhiệm vụ.</p>
    </li>
</ul>
<telerik:RadDropDownList ID="ddlDanhGia" runat="server">
    <Items>
        <telerik:DropDownListItem Text="Hoàn thành xuất sắc nhiệm vụ" Value="Hoàn thành xuất sắc nhiệm vụ" />
        <telerik:DropDownListItem Text="Hoàn thành tốt nhiệm vụ" Value="Hoàn thành tốt nhiệm vụ" />
        <telerik:DropDownListItem Text="Hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực" Value="Hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực" />
        <telerik:DropDownListItem Text="Không hoàn thành nhiệm vụ" Value="Không hoàn thành nhiệm vụ" />
        <telerik:DropDownListItem Text="Đảng viên hoàn thành xuất sắc nhiệm vụ" Value="Đảng viên hoàn thành xuất sắc nhiệm vụ" />
        <telerik:DropDownListItem Text="Đảng viên hoàn thành tốt nhiệm vụ" Value="Đảng viên hoàn thành tốt nhiệm vụ" />
        <telerik:DropDownListItem Text="Đảng viên hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực" Value="Đảng viên hoàn thành nhiệm vụ nhưng còn hạn chế về năng lực" />
        <telerik:DropDownListItem Text="Đảng viên không hoàn thành nhiệm vụ" Value="Đảng viên không hoàn thành nhiệm vụ" />
    </Items>
</telerik:RadDropDownList>
<asp:RequiredFieldValidator ID="rfvDanhGia" runat="server" ControlToValidate="ddlDanhGia" Display="Dynamic"
    ErrorMessage="Nhập đánh giá"  ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
<telerik:RadDatePicker ID="dpkNgayThang" runat="server" Culture="vi-VN"
                DateInput-EmptyMessage="dd/MM/yyyy" DateInput-EmptyMessageStyle-BorderColor="Red" DateInput-EmptyMessageStyle-Font-Italic="true"></telerik:RadDatePicker>
<asp:RequiredFieldValidator ID="rfvNgayThang" runat="server" ControlToValidate="dpkNgayThang" Display="Dynamic"
    ErrorMessage="Nhập ngày tháng kiểm điểm, đánh giá" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
<asp:CompareValidator ID="cpvNgayThang" runat="server" ControlToValidate="dpkNgayThang" Display="Dynamic" Type="Date"
    Operator="DataTypeCheck" ErrorMessage="Ngày tháng kiểm điểm, đánh giá có giá trị không thích hợp" ForeColor="Red" Font-Italic="true"></asp:CompareValidator>

<div class="rbButtons">
    <asp:LinkButton ID="btCreate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btCreate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btUpdate" runat="server" Text="Hoàn tất" CssClass="btn btn-default" OnClick="btUpdate_Click"></asp:LinkButton>
    <asp:LinkButton ID="btDelete" runat="server" Text="Xóa" CssClass="btn btn-default" OnClick="btDelete_Click"
        OnClientClick="return confirm('Bạn có muốn xóa bản kiểm điểm này không?')"></asp:LinkButton>
    <asp:LinkButton ID="btBack" runat="server" Text="Trở về" CssClass="btn btn-default" OnClick="btBack_Click"></asp:LinkButton>
</div>