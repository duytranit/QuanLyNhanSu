using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.KeKhai.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        private int _kekhaiID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                Models.AccountEntity accEntity = new Models.AccountEntity();
                string email = Session["account"].ToString();
                Models.Account account = accEntity.FindByEmail(email);
                if (account == null) //validate đăng nhập
                {
                    this.RedirectToIndex();
                }else if (account.ACCChucNang > 1) // nhân viên
                {
                    if (!account.ACCUpKeKhai)
                        this.RedirectToIndex();
                    else if (this.Page.RouteData.Values["kekhai"] != null)
                        try
                        {
                            _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
                            Models.KeKhaiEntity kkEntity = new Models.KeKhaiEntity();
                            Models.KeKhai kekhai = kkEntity.Find(_kekhaiID);
                            if (kekhai == null)
                                this.RedirectToIndex();
                            else if (kekhai.NVID != account.NVID)
                                this.RedirectToIndex();
                            else
                                pnlContent.Visible = true;
                        }
                        catch
                        {
                            this.RedirectToIndex();
                        }
                    else if (this.Page.RouteData.Values["nhanvien"] != null)
                        try
                        {
                            int nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                            if (nhanvienID != account.NVID)
                                this.RedirectToIndex();
                            else
                            {
                                Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
                                Models.NhanVien nhanvien = nvEntity.Find_NhanVien(nhanvienID);
                                if (nhanvien == null)
                                    this.RedirectToIndex();
                            }                           
                        }
                        catch
                        {
                            this.RedirectToIndex();
                        }
                    else
                        this.RedirectToIndex();
                }
                else if (this.Page.RouteData.Values["kekhai"] != null)
                    try
                    {
                        _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
                        Models.KeKhaiEntity kkEntity = new Models.KeKhaiEntity();
                        Models.KeKhai kekhai = kkEntity.Find(_kekhaiID);
                        if (kekhai == null)
                            this.RedirectToIndex();
                        else
                            pnlContent.Visible = true;
                    }
                    catch
                    {
                        this.RedirectToIndex();
                    }
                else if (this.Page.RouteData.Values["nhanvien"] != null)
                    try
                    {
                        int nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                        Models.NhanVienEntity nvEntity = new Models.NhanVienEntity();
                        Models.NhanVien nhanvien = nvEntity.Find_NhanVien(nhanvienID);
                        if (nhanvien == null)
                            this.RedirectToIndex();
                    }
                    catch
                    {
                        this.RedirectToIndex();
                    }
                else
                    this.RedirectToIndex();
            }
            else
                Response.Redirect("~/");
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/");
        }

        protected void btNhaNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/Nha");
        }

        protected void btDatNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/Dat");
        }

        protected void btTienNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/KeKhaiTien");
        }

        protected void btDongSanNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/KeKhaiDongSan");
        }

        protected void btDaQuiNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/KeKhaiDaQui");
        }

        protected void btTaiSanNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/TaiSanKhac");
        }

        protected void btTaiSanNuocNgoaiNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/TaiSanNuocNgoai");
        }

        protected void btKhoanNoNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/KhoanNo");
        }

        protected void btThuNhapNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/ThuNhap");
        }

        protected void btKeKhaiConNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/KeKhaiCon");
        }

        protected void btGiaiTrinhNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID + "/GiaiTrinh");
        }

        protected void btExportWord_Click(object sender, EventArgs e)
        {
            Helper.ExportHelper exportHelper = new Helper.ExportHelper();
            exportHelper.ExportWordFile("KeKhaiTaiSan", this.Content,false);
        }

        private string Content
        {
            get
            {
                Models.KeKhaiEntity kkEntity = new Models.KeKhaiEntity();
                Models.KeKhai kekhai = kkEntity.Find(_kekhaiID);

                string content = "";

                content += ("<div style=\"font-weight: bold; text-align: center;\">KÊ KHAI TÀI SẢN, THU NHẬP</div>");
                content += ("<div style=\"text-align: center; font-style: italic;\">(Ban hành kèm theo Thông tư số 08/2013/TT-TTCP ngày 31/10/2013 của Thanh tra Chính phủ)</div>");
                content += ("<div style=\"text-align: center;\">NĂM: " + kekhai.KKNam + "</div>");

                content += ("<p>");
                content += ("<b>I. THÔNG TIN CHUNG</b><br/>");
                content += ("</p>");

                content += ("<p>");
                content += ("1. Người kê khai tài sản, thu nhập<br/>");
                content += ("&emsp;- Họ và tên: " + kekhai.NhanVien.NVTen + " - Ngày tháng năm sinh: " + kekhai.NhanVien.NVNgaySinh.ToString("dd/MM/yyyy") + "<br/>");
                content += ("&emsp;- Chức vụ/ chức danh công tác: " + kekhai.KKChucVu + "<br/>");
                content += ("&emsp;- Cơ quan/ đơn vị công tác: " + kekhai.KKCoQuan + "<br/>");
                content += ("&emsp;- Hộ khẩu thường trú: " +  kekhai.KKHoKhau + "<br/>");
                content += ("&emsp;- Chổ ở hiện tại: " + kekhai.KKChoO + "<br/>");
                content += ("</p>");

                content += ("<p>");
                content += ("2. Vợ hoặc chồng của người kê khai tài sản, thu nhập<br/>");
                string vcdob = "";
                if (kekhai.KKVCDOB != DateTime.MinValue)
                    vcdob = Convert.ToDateTime(kekhai.KKVCDOB).ToString("dd/MM/yyyy");
                content += ("&emsp;- Họ và tên: " + kekhai.KKVoChong + " - Ngày tháng năm sinh: " + vcdob + "<br/>");
                content += ("&emsp;- Chức vụ/ chức danh công tác: " + kekhai.KKVCChucVu + "<br/>");
                content += ("&emsp;- Cơ quan/ đơn vị công tác: " + kekhai.KKVCCoQuan + "<br/>");
                content += ("&emsp;- Hộ khẩu thường trú: " + kekhai.KKVCHoKhau + "<br/>");
                content += ("&emsp;- Chổ ở hiện tại: " + kekhai.KKVCChoO + "<br/>");
                content += ("</p>");

                if (kekhai.KeKhaiCons.Count > 0)
                {
                    content += ("<p>");
                    content += ("3. Con chưa thành niên (con đẻ, con nuôi theo quy định của pháp luật)<br/>");
                    int flag = 0;
                    foreach(Models.KeKhaiCon con in kekhai.KeKhaiCons)
                    {
                        flag++;
                        content += ("&emsp;<i>Con thứ " + flag + ":</i><br/>");
                        string kkcDOB = "";
                        if (con.KKCDOB != DateTime.MinValue)
                            kkcDOB = Convert.ToDateTime(con.KKCDOB).ToString("dd/MM/yyyy");
                        content += ("&emsp;- Họ và tên: " + con.KKCTen + "<br/>");
                        content += ("&emsp;- Ngày tháng năm sinh: " + kkcDOB + "<br/>");
                        content += ("&emsp;- Hộ khẩu thường trú: " + con.KKCHoKhau + "<br/>");
                        content += ("&emsp;- Chổ ở hiện tại: " + con.KKCChoO + "<br/>");
                    }
                    content += ("</p>");
                    
                }

                content += ("<p>");
                content += ("<b>II. THÔNG TIN MÔ TẢ VỀ TÀI SẢN</b><br/>");
                content += ("</p>");
                content += ("<p>");
                content += ("1. Nhà ở, công trình xây dựng: <i>(Người kê khai tự mô tả các loại nhà, công trình xây dựng khác do bản thân, vợ hoặc chồng, con chưa thành niên sở hữu hoặc sở hữu một phần).</i><br/>");
                content += ("</p><p>");
                content += ("a) Nhà ở:<br/>");
                                
                if (kekhai.Nhas.Count > 0)
                {
                    int flag = 0;
                    foreach (Models.Nha nha in kekhai.Nhas.Where(x => x.NHAIsNha == true))
                    {
                        flag++;
                        content += ("&emsp;- Nhà thứ " + flag + ": (Địa chỉ tại: " + nha.NHADiaChi + ")<br/>");
                        content += ("&emsp;&emsp;+ Loại nhà: " + nha.NHALoai + " Cấp công trình: " + nha.NHACap + "<br/>");
                        string dientich = "";
                        if (nha.NHADienTich % 1 == 0)
                            dientich = nha.NHADienTich.ToString("#,###");
                        else
                            dientich = nha.NHADienTich.ToString("#,###.##");
                        content += ("&emsp;&emsp;+ Diện tích xây dựng: " + dientich + " m<sup>2</sup><br/>");
                        string giatri = "";
                        if (nha.NHAGiaTri % 1 == 0)
                            giatri = nha.NHAGiaTri.ToString("#,###");
                        else
                            giatri = nha.NHAGiaTri.ToString("#,###.##");
                        content += ("&emsp;&emsp;+ Giá trị: " + giatri + " vnđ<br/>");
                        content += ("&emsp;&emsp;+ Giấy chứng nhận quyền sở hữu: " + nha.NHAQuyenSoHuu + "<br/>");
                        content += ("&emsp;&emsp;+ Thông tin khác (nếu có): " + nha.NHAGhiChu + "<br/>");
                    }
                }
                content += ("</p>");

                content += ("<p>");
                content += ("b) Công trình xây dựng khác:<br/>");
                if (kekhai.Nhas.Count > 0)
                {
                    int flag = 0;
                    foreach(Models.Nha ct in kekhai.Nhas.Where(x => x.NHAIsNha == false))
                    {
                        flag++;
                        content += ("&emsp;- Công trình thứ " + flag + ": (Địa chỉ tại: " + ct.NHADiaChi + ")<br/>");
                        content += ("&emsp;&emsp;+ Loại công trình: " + ct.NHALoai + " Cấp công trình: " + ct.NHACap + "<br/>");
                        string dientich = "";
                        if (ct.NHADienTich % 1 == 0)
                            dientich = ct.NHADienTich.ToString("#,###");
                        else
                            dientich = ct.NHADienTich.ToString("#,###.##");
                        content += ("&emsp;&emsp;+ Diện tích xây dựng: " + dientich + " m<sup>2</sup><br/>");
                        string giatri = "";
                        if (ct.NHAGiaTri % 1 == 0)
                            giatri = ct.NHAGiaTri.ToString("#,###");
                        else
                            giatri = ct.NHAGiaTri.ToString("#,###.##");
                        content += ("&emsp;&emsp;+ Giá trị: " + giatri + " vnđ<br/>");
                        content += ("&emsp;&emsp;+ Giấy chứng nhận quyền sở hữu: " + ct.NHAQuyenSoHuu + "<br/>");
                        content += ("&emsp;&emsp;+ Thông tin khác (nếu có): " + ct.NHAGhiChu + "<br/>");
                    }
                }
                content += ("</p>");

                content += ("<p>");
                content += ("2. Quyền sử dụng đất: <i>(Người kê khai tự mô tả các loại đất do bản thân, vợ hoặc chồng. con chưa thành niên có quyền sử dụng toàn bộ hoặc một phần).</i><br/>");
                
                if (kekhai.Dats.Count > 0)
                {
                    content += ("</p><p>");
                    int flag = 0;
                    foreach (Models.Dat dat in kekhai.Dats)
                    {
                        flag++;
                        content += ("&emsp;- Mảnh đất thứ " + flag + ": <i>(Ghi theo từng lô, khoảnh, khuôn viên).</i><br/>");
                        content += ("&emsp;&emsp;+ Địa chỉ: " + dat.DATDiaChi + "<br/>");
                        string dientich = "";
                        if (dat.DATDienTich % 1 == 0)
                            dientich = dat.DATDienTich.ToString("#,###");
                        else
                            dientich = dat.DATDienTich.ToString("#,###.##");
                        content += ("&emsp;&emsp;+ Diện tích: " + dientich + " m<sup>2</sup><br/>");
                        string giatri = "";
                        if (dat.DATGiaTri % 1 == 0)
                            giatri = dat.DATGiaTri.ToString("#,###");
                        else
                            giatri = dat.DATGiaTri.ToString("#,###.##");
                        content += ("&emsp;&emsp;+ Giá trị: " + giatri + " vnđ<br/>");
                        content += ("&emsp;&emsp;+ Giấy chứng nhần quyền sử dụng: " + dat.DATQuyenSoHuu + "<br/>");
                        content += ("&emsp;&emsp;+ Thông tin khác (nếu có): " + dat.DATGhiChu + "<br/>");
                    }
                }

                content += ("</p><p>");
                content += ("3. Tiền (tiền Việt Nam, ngoại tệ) gồm tiền mặt, tiền cho vay, tiền gửi các cá nhân, tổ chức trong nước, nước ngoài tại Việt Nam mà tổng giá trị quy đổi từ 50 triệu đồng trở lên.<br/>");
                if (kekhai.Tiens.Count > 0)
                {
                    content += ("</p><p>");
                    foreach (Models.Tien tien in kekhai.Tiens)
                    {
                        string soluong = "";
                        if (tien.TIESoLuong % 1 == 0)
                            soluong = tien.TIESoLuong.ToString("#,###");
                        else
                            soluong = tien.TIESoLuong.ToString("#,###.##");
                        content += ("&emsp;- " + tien.TIENoiDung + ": " + soluong + " " + tien.TIETienTe + "<br/>");
                    }
                }

                content += ("</p><p>");
                content += ("4. Ô tô, mô tô, xe gắn máy, xe máy (máy ủi, máy xúc, các loại xe máy khác), tàu thủy, tàu bay, thuyền và những động sản khác mà Nhà nước quản lý (theo quy định của pháp luật phải đăng kí sử dụng và được cấp giấy đăng kí) có tổng giá trị mỗi loại từ 50 triệu đồng trở lên.<br/>");
                content += ("- Ô tô<br/>");
                content += ("- Mô tô<br/>");
                content += ("- Xe gắn máy<br/>");
                content += ("- Xe máy (máy ủi, máy xúc, các loại xe máy khác)<br/>");
                content += ("- Tàu thủy<br/>");
                content += ("- Tàu bay<br/>");
                content += ("- Thuyền<br/>");
                content += ("- Những động sản khác mà Nhà nước quản lý (theo quy định của pháp luật phải đăng ký sử dụng và được cấp giấy đăng ký)<br/>");
                if (kekhai.DongSans.Count > 0)
                {
                    content += ("</p><p>");
                    foreach (Models.DongSan ds in kekhai.DongSans)
                    {
                        string soluong = "";
                        if (ds.DSSoLuong % 1 == 0)
                            soluong = ds.DSSoLuong.ToString("#,###");
                        else
                            soluong = ds.DSSoLuong.ToString("#,###.##");
                        string giatri = "";
                        if (ds.DSGiaTri % 1 == 0)
                            giatri = ds.DSGiaTri.ToString("#,###");
                        else
                            giatri = ds.DSGiaTri.ToString("#,###.##");
                        content += ("&emsp;+ " + ds.DSTen + " (Số lượng: " + soluong + "; Giá trị: " + giatri + " vnđ)<br/>");
                    }
                }

                content += ("</p><p>");
                content += ("5. Kim loại quý, đá quý, cổ phiếu, vốn góp vào các cơ sở kinh doanh, các loại giấy tờ có giá trị chuyển nhượng khác có tổng giá trị quy đổi mỗi loại từ 50 triệu đồng trở lên.<br/>");
                content += ("- Kim loại quý<br/>");
                content += ("- Đá quý<br/>");
                content += ("- Cổ phiếu<br/>");
                content += ("- Vốn góp vào các cơ sở kinh doanh<br/>");
                content += ("- Các loại giấy tờ có giá trị chuyển nhượng khác<br/>");
                if (kekhai.DaQuis.Count > 0)
                {
                    content += ("</p><p>");
                    foreach(Models.DaQui daqui in kekhai.DaQuis)
                    {
                        string soluong = "";
                        if (daqui.DQSoLuong % 1 == 0)
                            soluong = daqui.DQSoLuong.ToString("#,###");
                        else
                            soluong = daqui.DQSoLuong.ToString("#,###.##");
                        string giatri = "";
                        if (daqui.DQGiaTri % 1 == 0)
                            giatri = daqui.DQGiaTri.ToString("#,###");
                        else
                            giatri = daqui.DQGiaTri.ToString("#,###.##");
                        content += ("&emsp;+ " + daqui.DQTen + " (Số lượng: " + soluong + "; Giá trị: " + giatri + " vnđ)<br/>");
                    }
                }

                content += ("</p><p>");
                content += ("6. Các loại tài sản khác mà có giá trị quy đổi mỗi loại từ 50 triệu đồng trở lên <i>(như cây cảnh, bộ bàn ghế, ảnh, đồ mỹ nghệ và các loại tài sản khác)</i>.<br/>");
                if (kekhai.TaiSanKhacs.Count > 0)
                {
                    content += ("</p><p>");
                    foreach (Models.TaiSanKhac tsk in kekhai.TaiSanKhacs)
                    {
                        string soluong = "";
                        if (tsk.TSKSoLuong % 1 == 0)
                            soluong = tsk.TSKSoLuong.ToString("#,###");
                        else
                            soluong = tsk.TSKSoLuong.ToString("#,###.##");
                        string giatri = "";
                        if (tsk.TSKGiaTri % 1 == 0)
                            giatri = tsk.TSKGiaTri.ToString("#,###");
                        else
                            giatri = tsk.TSKGiaTri.ToString("#,###.##");
                        content += ("&emsp;+ " + tsk.TSKTen + " (Số lượng: " + soluong + "; Giá trị: " + giatri + " vnđ)<br/>");
                    }
                }

                content += ("</p><p>");
                content += ("7. Tài sản, tài khoản ở nước ngoài gồm tất cả tài sản quy định từ Khoản 1 đến Khoản 6 nói trên nằm ngoài lãnh thổ Việt Nam.<br/>");
                if (kekhai.TaiSanNuocNgoais.Count > 0)
                {
                    content += ("</p><p>");
                    foreach (Models.TaiSanNuocNgoai ts in kekhai.TaiSanNuocNgoais)
                    {
                        string soluong = "";
                        if (ts.TSNNSoLuong % 1 == 0)
                            soluong = ts.TSNNSoLuong.ToString("#,###");
                        else
                            soluong = ts.TSNNSoLuong.ToString("#,###.##");
                        string giatri = "";
                        if (ts.TSNNGiaTri % 1 == 0)
                            giatri = ts.TSNNGiaTri.ToString("#,###");
                        else
                            giatri = ts.TSNNGiaTri.ToString("#,###.##");
                        content += ("&emsp;+ " + ts.TSNNTen + " (Số lượng: " + soluong + "; Giá trị: " + giatri + " vnđ)<br/>");
                    }
                }

                content += ("</p><p>");
                content += ("8. Các khoản nợ gồm: Các khoản phải trả, giá trị các tài sản quản lý hộ, giữ hộ có tổng giá trị từ 50 triệu đồng trở lên<br/>");
                if (kekhai.KhoanNos.Count > 0)
                {
                    content += ("</p><p>");
                    foreach (Models.KhoanNo kn in kekhai.KhoanNos)
                    {
                        string soluong = "";
                        if (kn.KNSoLuong % 1 == 0)
                            soluong = kn.KNSoLuong.ToString("#,###");
                        else
                            soluong = kn.KNSoLuong.ToString("#,###.##");
                        string giatri = "";
                        if (kn.KNGiaTri % 1 == 0)
                            giatri = kn.KNGiaTri.ToString("#,###");
                        else
                            giatri = kn.KNGiaTri.ToString("#,###.##");
                        content += ("&emsp;+ " + kn.KNTen + " (Số lượng: " + soluong + "; Giá trị: " + giatri + " vnđ)<br/>");
                    }
                }

                content += ("</p><p>");
                content += ("9. Tổng thu nhập trong năm quy đổi thành tiền Việt Nam gồm các khoản lương, phụ cấp, trợ cấp, thưởng, thù lao, cho, tặng, biếu, thừa kế, thu nhập hưởng lợi từ các khoản đầu tư, phát sinh, sáng chế, các khoản thu nhập khác.<br/>");
                if (kekhai.ThuNhaps.Count > 0)
                {
                    content += ("</p><p>");
                    foreach (Models.ThuNhap tn in kekhai.ThuNhaps)
                    {
                        string giatri = "";
                        if (tn.TNTien % 1 == 0)
                            giatri = tn.TNTien.ToString("#,###");
                        else
                            giatri = tn.TNTien.ToString("#,###.##");
                        content += ("&emsp;+ " + tn.TNTen + " (Giá trị: " + giatri + " vnđ)<br/>");
                    }
                }


                content += ("</p>");

                content += ("<p><br/>");
                content += ("<b>III. GIẢI TRÌNH SỰ BIẾN ĐỘNG CỦA TÀI SẢN, THU NHẬP</b><br/>");
                content += ("<table cellspacing=\"0\" style=\"border-spacing: 0; border-width: 1; border-style: solid\">");
                content += ("<tr style=\"font-weight:bold; text-align: center;\">");
                content += ("<td style=\"border-width: 1; border-style: solid\">");
                content += ("Lại tài sản");
                content += ("</td>");
                content += ("<td style=\"border-width: 1; border-style: solid\">");
                content += ("Tăng/giảm");
                content += ("</td>");
                content += ("<td style=\"border-width: 1; border-style: solid\">");
                content += ("Nội dung giải trình nguồn gốc tài sản, thu nhập tăng thêm");
                content += ("</td>");
                content += ("</tr>");
                if (kekhai.GiaiTrinhs.Count > 0)
                    foreach(Models.GiaiTrinh gt in kekhai.GiaiTrinhs)
                    {
                        Models.GiaiTrinhEntity gtEntity = new Models.GiaiTrinhEntity();

                        content += ("<tr>");
                        content += ("<td style=\"border-width: 1; border-style: solid\">");
                        content += (gt.LoaiGiaiTrinh.LGTTenChung);
                        content += ("</td>");
                        content += ("<td style=\"border-width: 1; border-style: solid; text-align: right;\">");
                        content += (gtEntity.ConvertSoLuongVSTang(gt));
                        content += ("</td>");
                        content += ("<td style=\"border-width: 1; border-style: solid\">");
                        content += (gt.GTNoiDung);
                        content += ("</td>");
                        content += ("</tr>");
                    }
                content += ("</table>");
                content += ("</p>");

                content += ("<i>(Người kê khai tự xác định các loại tài sản tăng, giảm trong kỳ kê khai và giải trình sự tăng, giảm của tài sản thuộc sở hữu của bản thân, vợ hoặc chồng, con chưa thành niên).</i><br/>");
                content += ("<br/>");

                content += ("<table style=\"text-align: center; width: 100%;\">");
                content += ("<tr>");
                content += ("<td>");
                content += ("<i>Ngày nhận bản kê khai tài sản, thu nhập</i><br/>Ngày ... tháng ... năm ...<br/><b>Người nhận bản kê khai</b><br/><i>(Ký, ghi rõ họ tên, chức vụ/chức danh)</i>");
                content += ("</td>");
                content += ("<td>");
                content += ("<i>Ngày hoàn thành bản kê khai tài sản, thu nhập</i><br/>Ngày ... tháng ... năm ...<br/><b>Người kê khai tài sản, thu nhập</b><br/><i>(Ký, ghi rõ họ tên)</i>");
                content += ("</td>");
                content += ("</tr>");
                content += ("</table>");

                return content;
            }
        }
    }
}