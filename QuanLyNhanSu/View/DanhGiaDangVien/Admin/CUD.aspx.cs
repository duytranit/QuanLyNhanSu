using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DanhGiaDangVien.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        private Models.DanhGiaDangVienEntity _dgEntity = new Models.DanhGiaDangVienEntity();
        private int _danhgiaID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                Models.AccountEntity accEntity = new Models.AccountEntity();
                string email = Session["account"].ToString();
                Models.Account account = accEntity.FindByEmail(email);

                if (account == null)
                    this.RedirectToIndex();
                else if (account.ACCChucNang > 1)
                    if (!account.ACCUpDanhGia)
                        this.RedirectToIndex();
                    else if (this.Page.RouteData.Values["danhgia"] != null)
                        try
                        {
                            int danhgiaID = Convert.ToInt32(this.Page.RouteData.Values["danhgia"]);
                            Models.DanhGiaDangVienEntity dgEntity = new Models.DanhGiaDangVienEntity();
                            Models.DanhGiaDangVien danhgia = dgEntity.Find(danhgiaID);
                            if (danhgia == null)
                                this.RedirectToIndex();
                            else if (danhgia.NVID == account.NVID)
                                this.RedirectToIndex();
                            else
                                btExport.Visible = true;
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
                else if (this.Page.RouteData.Values["danhgia"] != null)
                    try
                    {
                        int danhgiaID = Convert.ToInt32(this.Page.RouteData.Values["danhgia"]);
                        Models.DanhGiaDangVienEntity dgEntity = new Models.DanhGiaDangVienEntity();
                        Models.DanhGiaDangVien danhgia = dgEntity.Find(danhgiaID);
                        if (danhgia == null)
                            this.RedirectToIndex();
                        else
                            btExport.Visible = true;
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
                this.RedirectToIndex();
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/");
        }

        protected void btExport_Click(object sender, EventArgs e)
        {
            Helper.ExportHelper exportHelper = new Helper.ExportHelper();
            exportHelper.ExportWordFile("DanhGiaPhanLoai", this.Content, true);
        }

        private string Content
        {
            get
            {
                Models.DanhGiaDangVien danhgia = _dgEntity.Find(_danhgiaID);

                string content = "";

                content += ("<table style=\"width: 100%; text-align: center; font-size: 10pt;\">" +
                    "<tr>" +
                    "<td>ĐẢNG BỘ<br/>SỞ TÀI NGUYÊN VÀ MÔI TRƯỜNG BẾN TRE</td>" +
                    "<td style=\"font-weight: bold;\"><u>ĐẢNG CỘNG SẢN VIỆT NAM</u></td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td style=\"font-weight: bold;\">CHI BỘ<br/>TRUNG TÂM PHÁT TRIỂN QUỸ ĐẤT</td>" +
                    "<td style=\"font-weight: bold;\"></td>" +
                    "</tr>" +
                    "</table>");

                content += ("<br/>");
                content += ("<pre style=\"text-align:center; font-weight:bold;\">BẢN KIỂM ĐIỂM ĐẢNG VIÊN VÀ TỰ NHẬN XÉT,<br/>ĐÁNH GIÁ CÔNG CHỨC, VIÊN CHỨC NĂM " + danhgia.DGDVNam + "</pre>");

                content += ("<br/>");
                content += ("<pre>" +
                    "&emsp;&emsp;Tôi tên là: " + danhgia.NhanVien.NVTen + " - Sinh ngày: " + danhgia.NhanVien.NVNgaySinh.ToString("dd/MM/yyyy") + "<br/>" +
                    "&emsp;&emsp;Chức vụ Đảng: " + danhgia.DGDVChucVuDang + "<br/>" +
                    "&emsp;&emsp;Chức vụ Chính quyền, Đoàn thể: " + danhgia.DGDVChucVuChinhQuyen + "<br/>" +
                    "&emsp;&emsp;Đơn vị công tác: " + danhgia.DGDVDonVi + "<br/>" +
                    "&emsp;&emsp;Chi bộ sinh hoạt: " + danhgia.DGDVChiBo + "<br/>" +
                    "&emsp;&emsp;Hạng chức danh nghề nghiệp: " + danhgia.DGDVHangChucDanh + "; Bậc: " + danhgia.DGDVBac + "; Hệ số lương: " + danhgia.DGDVHeSoLuong + "<br/>" +
                    "&emsp;&emsp;<b>I. Ưu điểm:</b><br/>" +
                    "<div style=\"text-align:justify;\">&emsp;&emsp;" + danhgia.DGDVUuDiem + "</div>" +
                    "<div style=\"text-align:justify; font-weight: bold; font-style: italic;\">&emsp;&emsp;* Kết quả khắc phục, sửa chữa yếu kém, khuyết điểm theo Nghị quyết Trung ương 4 (khóa XI) và những vấn đề mới phát sinh</div>" +
                    "<div style=\"text-align:justify;\">&emsp;&emsp;" + danhgia.DGDVKetQuaKhacPhuc + "</div>" +
                    "&emsp;&emsp;<b>II. Khuyết điểm, hạn chế và nguyên nhân</b><br/>" +
                    "<div style=\"text-align:justify;\">&emsp;&emsp;" + danhgia.DGDVKhuyetDiem + "</div>" +
                    "<div style=\"text-align:justify;\">&emsp;&emsp;<b>III. Phương hướng, biện pháp khắc phục, sửa chữa yếu kém, khuyết điểm trong thời gian tới</b></div>" +
                    "<div style=\"text-align:justify;\">&emsp;&emsp;" + danhgia.DGDVPhuongHuong + "</div>" +
                    "&emsp;&emsp;<b>IV. Tự đánh giá về công chức, viên chức, người lao động và chất lượng đảng viên</b><br/>" +
                    "<div style=\"text-align:justify;\">&emsp;&emsp;" + danhgia.DGDVDanhGia + "</div>" +
                    "</pre>");
                content += ("<table style=\"width: 100%;\">"+
                    "<tr>" +
                    "<td></td>" +
                    "<td style=\"width: 50%; text-align:center\">" +
                    "<i>Bến Tre, Ngày " + danhgia.DGDVNgayThang.Day + " tháng " + danhgia.DGDVNgayThang.Month + " năm " + danhgia.DGDVNgayThang.Year + "</i><br/>" +
                    "<b>NGƯỜI TỰ KIỂM ĐIỂM, ĐÁNH GIÁ</b><br/>" +
                    "<i>(Ký, ghi rõ họ tên)</i>" +
                    "<br/><br/><br/><br/>" +
                    "<b>" + danhgia.NhanVien.NVTen + "</b>" +
                    "</td>" +
                    "</tr>" +
                    "</table>");
                return content;
            }
        }
    }
}