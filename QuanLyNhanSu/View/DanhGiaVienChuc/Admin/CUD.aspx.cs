using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.DanhGiaVienChuc.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        private int _danhgiaID;
        private Models.DanhGiaVienChucEntity _dgEntity = new Models.DanhGiaVienChucEntity();
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
                            Models.DanhGiaVienChucEntity dgEntity = new Models.DanhGiaVienChucEntity();
                            Models.DanhGiaVienChuc danhgia = dgEntity.Find(danhgiaID);
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
                        Models.DanhGiaVienChucEntity dgEntity = new Models.DanhGiaVienChucEntity();
                        Models.DanhGiaVienChuc danhgia = dgEntity.Find(danhgiaID);
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
                        int nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"] != null);
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
            exportHelper.ExportWordFile("DanhGiaPhanLoai", this.Content, false);
        }

        private string Content
        {
            get
            {
                Models.DanhGiaVienChuc danhgia = _dgEntity.Find(_danhgiaID);

                string content = "";

                content += ("<table style=\"width: 100%; text-align: center; font-size: 10pt;\">" +
                    "<tr>" +
                    "<td>SỞ TÀI NGUYÊN VÀ MÔI TRƯỜNG BẾN TRE</td>" +
                    "<td style=\"font-weight: bold;\">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td style=\"font-weight: bold;\">TRUNG TÂM PHÁT TRIỂN QUỸ ĐẤT</td>" +
                    "<td style=\"font-weight: bold;\">Độc lập - Tự do - Hạnh phú</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td style=\"text-align: center;\"><hr style=\"width: 50%;\"/></td>" +
                    "<td style=\"text-align: center;\"><hr style=\"width: 50%;\"/></td>" +
                    "</tr>"
                    + "</table>");

                content += ("<br/>");

                content += ("<pre style=\"font-weight: bold; text-align: center;\">" +
                    "PHIẾU ĐÁNH GIÁ VÀ PHÂN LOẠI VIÊN CHỨC <br/>" +
                    "Năm " + danhgia.DGVCNam +
                    "</pre>");

                content += ("<pre>" +
                    "&emsp;&emsp;- Họ và tên: " + danhgia.NhanVien.NVTen + "<br/>" +
                    "&emsp;&emsp;- Chức danh nghề nghiệp: " + danhgia.DGVCChucDanh + "<br/>" +
                    "&emsp;&emsp;- Đơn vị công tác: " + danhgia.DGVCDonVi + "<br/>" +
                    "&emsp;&emsp;- Hạng chức danh nghề nghiệp: " + danhgia.DGVCNgheNghiep + "; Bậc: " + danhgia.DGVCBac + "; Hệ số lương: " + danhgia.DGVCHeSoLuong +
                    "</pre>");

                content += ("<pre><b>&emsp;&emsp;I. TỰ ĐÁNH GIÁ KẾT QUẢ CÔNG TÁC, TU DƯỠNG, RÈN LUYỆN CỦA VIÊN CHỨC:</b></pre>");

                content += ("<pre>&emsp;&emsp;1- Kết quả thực hiện công việc hoặc nhiệm vụ hợp đồng làm việc đã ký kết:<br/>&emsp;&emsp;" + danhgia.DGVCKetQua + "</pre>");

                content += ("<pre>&emsp;&emsp;2- Việc thực hiện quy định về đạo đức nghề nghiệp:<br/>&emsp;&emsp;" + danhgia.DGVCDaoDuc + "</pre>");

                content += ("<pre>&emsp;&emsp;3- Tinh thần trách nhiệm, thái độ phục vụ nhân dân, tinh thần hợp tác với đồng nghiệp và việc thực hiện quy tắc ứng xử của viên chức:<br/>&emsp;&emsp;" + danhgia.DGVCTrachNhiem + "</pre>");

                content += ("<pre>&emsp;&emsp;4- Việc thực hiện các nghĩa vụ khác của viên chức:<br/>&emsp;&emsp;" + danhgia.DGVCNghiaVu + "</pre>");

                content += ("<pre>&emsp;&emsp;<b>II. TỰ ĐÁNH GIÁ, PHẬN LOẠI CỦA VIÊN CHỨC:</b></pre>");

                content += ("<pre>&emsp;&emsp;1- Đánh giá ưu khuyết điểm:<br/>&emsp;&emsp;" + danhgia.DGVCUuDiem + "</pre>");

                content += ("<pre>&emsp;&emsp;2- Phân loại đánh giá:<br/>" +
                    "&emsp;&emsp;<i>(Phân loại đánh giá theo 1 trong 4 mức sau: hoàn thành xuất sắc nhiệm vụ; hoàn thành tốt nhiệm vụ; hoàn thành nhiệm vụ; không hoàn thành nhiệm vụ)</i><br/>&emsp;&emsp;" + danhgia.DGVCPhanLoai + "</pre>");

                content += ("<table>" +
                    "<tr>" +
                    "<td style=\"text-align: center; width: 60%;\">" +
                    "<b>Ý kiến của tập thể đơn vị và lãnh đạo<br/>trực tiếp quản lý<br/></b>" + danhgia.DGVCYKien + "<br/>" +
                    "Thống nhất mức hoàn thành nhiệm vụ: " + danhgia.DGVCThongNhat + "<br/>" +
                    "Ngày ... tháng ... năm ...<br/><b>Thủ trưởng trực tiếp đánh giá</b>" +
                    "</td>" +
                    "<td style=\"text-align: center;\">" +
                    "Ngày " + danhgia.DGVCNgay.Day + " tháng " + danhgia.DGVCNgay.Month + " năm " + danhgia.DGVCNgay.Year + "<br/>" +
                    "<b>Viên chức tự đánh giá</b><br/><i>(ký, ghi rõ họ tên)</i>" +
                    "</td>" +
                    "</tr>" +
                    "</table>");

                return content;
            }
        }
    }
}