using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChamCong.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        private Models.Account _loginACC = new Models.Account();
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["account"].ToString();
            Models.AccountEntity accEntity = new Models.AccountEntity();
            _loginACC = accEntity.FindByEmail(email);

            if (_loginACC.ACCChucNang > 0 && _loginACC.PhuTrachChamCongs.Where(x => x.PCCCStatus == true).Count() == 0)
                Response.Redirect("~/");
            else if (_loginACC.ACCChucNang > 0)
            {
                btThongKe.Visible = false;
                btPhuTrachChamCong.Visible = false;
            }
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
                IEnumerable<Models.LamViec> lamviecs = CCTable.LamViecs;
                DateTime ngaychamcong = CCTable.NgayChamCong;
                int songaytrongthang = DateTime.DaysInMonth(ngaychamcong.Year, ngaychamcong.Month);
                int donvichamcongID = CCTable.DonViChamCongID;
                Models.DonViEntity dvEntity = new Models.DonViEntity();
                Models.DonVi donvi = dvEntity.Find_DonVi(donvichamcongID);

                string content = "";

                content += ("<table style=\"width: 100%; text-align: center; font-family: Times New Roman; font-size: 12pt;\">" +
                    "<tr>" +
                    "<td>TRUNG TÂM PHÁT TRIỂN QUỸ ĐẤT BẾN TRE<br/>" + 
                    "<b>Bộ phận: " + donvi.DVTen + "</b><br/>" +
                    "<b>Mã đơn vị có quan hệ với ngân sách: 1123886</b></td>" +
                    "<td>Mẫu số: C01a-HD<br/>" +
                    "(Ban hành kèm theo Thông tư số 185/2010/TT-BTC<br>" +
                    "ngày 15 tháng 11 năm 2010 của Bộ Tài Chính)</td>" +
                    "</tr>" +
                    "</table>");
                content += ("<p style=\"text-align: center; font-family: Times New Roman; font-size: 14pt;\"><b>BẢNG CHẤM CÔNG</b><br/>" +
                    "Tháng " + ngaychamcong.Month + " năm " + ngaychamcong.Year + "</p>");
                content += ("<p style=\"font-family: Times New Roman; font-size: 13pt; text-align: right;\">Số: ...............</p>");
                content += ("<table cellspacing=\"0\" style=\"border-style: solid; border-width: 1; border-spacing: 0; width: 100%; font-family: Times New Roman; font-size: 9pt;\">" +
                    "<tr style=\"text-align: center;\">" +
                    "<td rowspan=\"2\" style=\"border-style: solid; border-width: 1; \">STT</td>" +
                    "<td rowspan=\"2\" style=\"border-style: solid; border-width: 1; \">Họ và tên</td>" +
                    "<td colspan=\"" + songaytrongthang + "\" style=\"border-style: solid; border-width: 1; \">Ngày trong tháng</td>" +
                    "<td colspan=\"3\" style=\"font-weight: bold; border-style: solid; border-width: 1;  \">Quy ra công</td>" +
                    "</tr>" +
                    "<tr style=\"text-align: center;\">");

                for(int i = 1; i <= songaytrongthang; i++)
                {
                    content += ("<td style=\"border-style: solid; border-width: 1; width: 50px; \">" + i + "</td>");
                }

                content += ("<td style=\"border-style: solid; border-width: 1; \">Số công hưởng lương thời gian</td>" +
                    "<td style=\"border-style: solid; border-width: 1; \">Số công nghỉ không lương</td>" +
                    "<td style=\"border-style: solid; border-width: 1; \">Số công hưởng BHXH</td>");

                content += ("</tr>" +
                    "<tr style=\"text-align: center;\">" +
                    "<td style=\"border-style: solid; border-width: 1; \">A</td><td style=\"border-style: solid; border-width: 1; \">B</td>");

                int colm = 1;
                for (int i = 1; i <= songaytrongthang; i++)
                {                    
                    content += ("<td style=\"border-style: solid; border-width: 1; \">" + i + "</td>");
                    colm++;
                }

                content += ("<td style=\"border-style: solid; border-width: 1; \">" + colm + "</td><td style=\"border-style: solid; border-width: 1; \">" + (colm++) + "</td><td style=\"border-style: solid; border-width: 1; \">" + (colm++) + "</td>");

                content += ("</tr>");

                int stt = 0;
                foreach(Models.LamViec lamviec in lamviecs)
                {
                    stt++;
                    content += ("<tr>");
                    content += ("<td style=\"text-align:center; border-style: solid; border-width: 1; \">" + stt + "</td>");
                    content += ("<td style=\"border-style: solid; border-width: 1; \">" + lamviec.NhanVien.NVTen + "</td>");

                    Models.ChamCongEntity ccEntity = new Models.ChamCongEntity();
                    for (int i = 1; i <= songaytrongthang; i++)
                    {
                        DateTime ngay = Convert.ToDateTime(ngaychamcong.Year + "/" + ngaychamcong.Month + "/" + i);
                        Models.ChamCong chamcong = ccEntity.FindByNgayThangLamViec(lamviec.LVID, ngay);
                        string kyhieu = "";
                        if (chamcong != null)
                            kyhieu = chamcong.LoaiChamCong.LCCKyHieu;

                        if (ngay.DayOfWeek.ToString().Equals("Saturday") || ngay.DayOfWeek.ToString().Equals("Sunday"))
                            content += ("<td style=\"background-color: gray; text-align:center; border-style: solid; border-width: 1; \"> " + kyhieu + " </td>");
                        else
                            content += ("<td style=\"text-align:center; border-style: solid; border-width: 1; \"> " + kyhieu + " </td>");
                    }

                    content += ("<td style=\"text-align:center;border-style: solid; border-width: 1; \"></td><td style=\"text-align:center; border-style: solid; border-width: 1;\"></td><td style=\"text-align:center; border-style: solid; border-width: 1;\"></td>");
                    content += ("</tr>");
                }

                content += ("<tr style=\"text-align: center;\">" +
                    "<td colspan=\"" + (songaytrongthang + 2) + "\" style=\"font-weight: bold; border-style: solid; border-width: 1;\">Cộng</td>");

                content += ("<td style=\"text-align:center; border-style: solid; border-width: 1; \"></td>");
                content += ("<td style=\"text-align:center; border-style: solid; border-width: 1; \"></td>");
                content += ("<td style=\"text-align:center; border-style: solid; border-width: 1; \"></td>");
                content += ("</tr>");
                content += ("</table><br/>");

                content += ("<table style=\"width: 100%; text-align:center\">");
                content += ("<tr>" +
                    "<td><b>Người chấm công</b><br/>(Ký, họ tên)<br/><br/><br/><br/><b>" + _loginACC.NhanVien.NVTen + "</b></td>" +
                    "<td><b>Phụ trách bộ phận</b><br/>(Ký, họ tên)<br/><br/><br/><br/><br/></td>" +
                    "<td><i>Ngày ... tháng ... năm ...</i><br/><b>Thủ trưởng đơn vị<b><br/>(Ký, họ tên)<br/><br/><br/><br/><br/></td>" +
                    "</tr>");
                content += ("</table>");

                content += ("<br/></br/>");
                content += ("<b><u>Ký hiệu chấm công:</u></b><br/>");
                content += ("<table style=\"width: 100%;\">" +
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

                return content;
            }
        }
    }
}