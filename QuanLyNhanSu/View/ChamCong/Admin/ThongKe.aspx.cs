using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChamCong.Admin
{
    public partial class ThongKe : System.Web.UI.Page
    {
        private Models.Account _loginACC = new Models.Account();
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["account"].ToString();
            Models.AccountEntity accEntity = new Models.AccountEntity();
            _loginACC = accEntity.FindByEmail(email);
            if (_loginACC.ACCChucNang > 0)
                Response.Redirect("~/");
        }

        protected void btBaoCao_Click(object sender, EventArgs e)
        {
            Helper.ExportHelper exportHelper = new Helper.ExportHelper();
            exportHelper.ExportWordFile("BangChamCong", this.Content, false);
        }

        private string Content
        {
            get
            {
                IEnumerable<Models.LamViec> lamviecs = TKCCTable.LamViecs;
                int namchamcong = TKCCTable.NamChamCong;
                int donvichamcongID = TKCCTable.DonViChamCongID;
                Models.DonViEntity dvEntity = new Models.DonViEntity();
                Models.DonVi donvi = dvEntity.Find_DonVi(donvichamcongID);

                string content = "";

                content += ("<table style=\"width: 100%; text-align: center; font-family: Times New Roman; font-size: 14pt;\">" +
                    "<tr style=\"text-align: center;\">" +
                    "<td>SỞ TÀI NGUYÊN VÀ MÔI TRƯỜNG BẾN TRE<br/>" +
                    "<b>TRUNG TÂM PHÁT TRIỂN QUỸ ĐẤT</b>" +
                    "<hr style=\"width: 30%;\">" +
                    "Số: .../BC-TTPTQĐ" +
                    "</td>" +
                    "<td>" +
                    "<b>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</b><br/>" +
                    "<b>Độc lập - Tự do - Hạnh phúc</b><br/>" +
                    "<hr style=\"width: 30%;\">" +
                    "<i>Bến Tre, ngày ... tháng ... năm " + namchamcong + "</i>" +
                    "</td>" +
                    "</tr>" +
                    "</table><br/>");
                content += ("<p style=\"text-align: center; font-weight: bold; font-size: 14pt\">" +
                    "BÁO CÁO<br/>" +
                    "Thống kê chấm công nhân viên năm " + namchamcong +
                    "</p>");

                content += ("<table cellspacing=\"0\" style=\"border-style: solid; border-width: 1; border-spacing: 0; width: 100%; font-size: 14pt;\">" +
                    "<tr style=\"text-align: center; font-weight: bold;\">" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\" rowspan=\"2\">STT</td>" +
                    "<td style=\"border-style: solid; border-width: 1;\" rowspan=\"2\">Họ và tên</td>" +
                    "<td style=\"border-style: solid; border-width: 1;\" colspan=\"13\">Chấm công</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 100pt;\" rowspan=\"2\">Số ngày phép còn lại</td>" +
                    "</tr>" +
                    "<tr style=\"text-align: center; font-weight: bold;\">" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">+</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">Ô</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">Cô</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">Ts</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">T</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">P</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">-</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">H</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">Nb</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">No</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">N</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">Lđ</td>" +
                    "<td style=\"border-style: solid; border-width: 1; width: 30pt;\">L</td>" +
                    "</tr>");

                int sothutu = 0;
                foreach(Models.LamViec lamviec in lamviecs)
                {
                    sothutu++;
                    content += ("<tr>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + sothutu + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1;\">" + lamviec.NhanVien.NVTen + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 1) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 2) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 3) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 4) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 5) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 6) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 7) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 8) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 9) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 10) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 11) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 12) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoSoLuong_ChamCong(lamviec, 13) + "</td>" +
                        "<td style=\"border-style: solid; border-width: 1; text-align: center;\">" + TKCCTable.SoNgayPhepCongLai(lamviec) + "</td>" +
                        "</tr>");
                }

                content += ("</table>");

                content += ("<br/></br/>");
                content += ("<b><u style=\"font-size: 14pt;\">Ký hiệu chấm công:</u></b><br/>");
                content += ("<table style=\"width: 100%; font-size: 14pt;\">" +
                    "<tr>" +
                    "<td>- Lương thời gian</td>" +
                    "<td style=\"width: 25%;\">+</td>" +
                    "<td>- Hội nghị, học tập</td>" +
                    "<td style=\"width: 25%;\">H</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>- Ốm, điều dưỡng</td>" +
                    "<td>Ô</td>" +
                    "<td>- Nghỉ bù</td>" +
                    "<td>Nb</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>- Con ốm</td>" +
                    "<td>Cô</td>" +
                    "<td>- Nghỉ không lương</td>" +
                    "<td>No</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>- Thai sản</td>" +
                    "<td>Ts</td>" +
                    "<td>- Ngừng việc</td>" +
                    "<td>N</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>- Tai nạn</td>" +
                    "<td>T</td>" +
                    "<td>- Lao động nghĩa vụ</td>" +
                    "<td>Lđ</td>" +
                    "</tr>" +
                    "<tr>" +
                    "<td>- Nghỉ phép</td>" +
                    "<td>P</td>" +
                    "<td>- Lương thời gian (1/2 ngày)</td>" +
                    "<td>-</td>" +
                    "</tr>" +
                    "</table>");

                content += ("<br/>");
                content += ("<table style=\"width: 100%; text-align:center; font-size: 14pt;\">");
                content += ("<tr>" +
                    "<td><b>Người thống kê</b><br/>(Ký, họ tên)<br/><br/><br/><br/><b>" + _loginACC.NhanVien.NVTen + "</b></td>" +
                    "<td><i>Ngày ... tháng ... năm ...</i><br/><b>Thủ trưởng đơn vị<b><br/>(Ký, họ tên)<br/><br/><br/><br/><br/></td>" +
                    "</tr>");
                content += ("</table>");

                return content;
            }
        }
    }
}