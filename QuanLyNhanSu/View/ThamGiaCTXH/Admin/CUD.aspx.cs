using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ThamGiaCTXH.Admin
{
    public partial class CUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (this.Page.RouteData.Values["ctxh"] != null)
                try
                {
                    int thamgiaID = Convert.ToInt32(this.Page.RouteData.Values["ctxh"]);
                    Models.ThamGiaChinhTriXaHoiEntity thamgiaEntity = new Models.ThamGiaChinhTriXaHoiEntity();
                    Models.ThamGiaChinhTriXaHois thamgia = thamgiaEntity.Find(thamgiaID);
                    if (thamgia == null)
                        Response.Redirect("~/NhanSu");
                    else
                        lblNhanVien.Text = thamgia.NhanVien.NVTen;
                }
                catch (Exception)
                {
                    Response.Redirect("~/NhanSu");
                }
            else if (this.Page.RouteData.Values["nhanvien"] != null)
            {
                try
                {
                    int nhanvienID = nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                    Models.NhanVienEntity nhanvienEntity = new Models.NhanVienEntity();
                    Models.NhanVien nhanvien = nhanvienEntity.Find_NhanVien(nhanvienID);
                    if (nhanvien == null)
                        Response.Redirect("~/NhanSu");
                    else
                        lblNhanVien.Text = nhanvien.NVTen;
                }
                catch (Exception) { }
            }
            else
                Response.Redirect("~/NhanSu");
        }
    }
}