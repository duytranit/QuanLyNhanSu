using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.QuaTrinhDaoTao.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["account"] != null)
            {
                Models.AccountEntity accEntity = new Models.AccountEntity();
                string email = Session["account"].ToString();
                Models.Account account = accEntity.FindByEmail(email);
                if (account == null || account.ACCChucNang > 1)
                    Response.Redirect("~/");
                else if (this.Page.RouteData.Values["quatrinhdaotao"] != null)
                    try
                    {
                        int qtdtID = Convert.ToInt32(this.Page.RouteData.Values["quatrinhdaotao"]);
                        Models.QuaTrinhDaoTaoEntity qtdtEntity = new Models.QuaTrinhDaoTaoEntity();
                        Models.QuaTrinhDaoTao qtdt = qtdtEntity.Find(qtdtID);
                        if (qtdt == null)
                            Response.Redirect("~/");
                        else
                            lblNhanVien.Text = qtdt.NhanVien.NVTen;
                    }
                    catch (Exception)
                    {
                        Response.Redirect("~/");
                    }
                else if (this.Page.RouteData.Values["nhanvien"] != null)
                {
                    try
                    {
                        int nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                        Models.NhanVienEntity nhanvienEntity = new Models.NhanVienEntity();
                        Models.NhanVien nhanvien = nhanvienEntity.Find_NhanVien(nhanvienID);
                        if (nhanvien == null)
                            Response.Redirect("~/");
                        else
                            lblNhanVien.Text = nhanvien.NVTen;
                    }
                    catch (Exception) { }
                }
                else
                    Response.Redirect("~/");
            }
            else
                Response.Redirect("~/");
        }
    }
}