using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.QuanHeCongTac.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _quanheID;
        private int _congtacID;
        private Models.QuanHeCongTacEntity _congtacEntity = new Models.QuanHeCongTacEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                RadDatePickerTuNgay.SelectedDate = DateTime.Now;

            if (this.Page.RouteData.Values["quanhecongtac"] != null)
            {
                this.UpdateStatus();
                _congtacID = Convert.ToInt32(Page.RouteData.Values["quanhecongtac"]);
                Models.QuanHeCongTac quanhecongtac = _congtacEntity.Find(_congtacID);
                _quanheID = quanhecongtac.QHID;
                if (!IsPostBack)
                {
                    RadDatePickerTuNgay.SelectedDate = quanhecongtac.QHCTTuNgay;
                    RadDatePickerDenNgay.SelectedDate = quanhecongtac.QHCTDenNgay;
                    RadTextBoxDonVi.Text = quanhecongtac.QHCTDonVi;
                    RadTextBoxChucVu.Text = quanhecongtac.QHCTChucVu;
                    RadTextBoxNgheNghiep.Text = quanhecongtac.QHCTNgheNghiep;
                    RadTextBoxGhiChu.Text = quanhecongtac.QHCTNoiDung;
                }
            }
            else
            {
                this.CreateStatus();
                _quanheID = Convert.ToInt32(this.Page.RouteData.Values["quanhe"]);
            }                
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            _congtacEntity.Delete(_congtacID);
            this.RedirectToIndex();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string donvi = RadTextBoxDonVi.Text;
                string chucvu = RadTextBoxChucVu.Text;
                string nghenghiep = RadTextBoxNgheNghiep.Text;
                string ghichu = RadTextBoxGhiChu.Text;
                DateTime tungay = Convert.ToDateTime(RadDatePickerTuNgay.SelectedDate);
                DateTime denngay = Convert.ToDateTime(RadDatePickerDenNgay.SelectedDate);

                _congtacEntity.Update(_congtacID, donvi, chucvu, nghenghiep, ghichu, tungay, denngay);
                this.RedirectToIndex();
            }            
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string donvi = RadTextBoxDonVi.Text;
                string chucvu = RadTextBoxChucVu.Text;
                string nghenghiep = RadTextBoxNgheNghiep.Text;
                string ghichu = RadTextBoxGhiChu.Text;
                DateTime tungay = Convert.ToDateTime(RadDatePickerTuNgay.SelectedDate);
                DateTime denngay = Convert.ToDateTime(RadDatePickerDenNgay.SelectedDate);
                _congtacEntity.Insert(_quanheID, donvi, chucvu, nghenghiep, ghichu, tungay, denngay);
                this.RedirectToIndex();
            }
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/QuanHe/" + _quanheID);
        }

        private void CreateStatus()
        {
            ButtonCreate.Visible = true;
            ButtonUpdate.Visible = false;
            ButtonDelete.Visible = false;
        }

        private void UpdateStatus()
        {
            ButtonCreate.Visible = false;
            ButtonUpdate.Visible = true;
            ButtonDelete.Visible = true;
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            this.RedirectToIndex();
        }
    }
}