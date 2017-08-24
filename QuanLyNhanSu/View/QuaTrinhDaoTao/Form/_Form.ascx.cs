using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.QuaTrinhDaoTao.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.QuaTrinhDaoTaoEntity _qtdtEntity = new Models.QuaTrinhDaoTaoEntity();
        private int _nhanvienID;
        private int _qtdtID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadDatePickerTuNgay.SelectedDate = DateTime.Now;
                RadDatePickerDenNgay.SelectedDate = DateTime.Now.AddMonths(1);
            }

            if (this.Page.RouteData.Values["quatrinhdaotao"] != null)
            {
                _qtdtID = Convert.ToInt32(this.Page.RouteData.Values["quatrinhdaotao"]);
                this.UpdateStatus();
                Models.QuaTrinhDaoTao qtdt = _qtdtEntity.Find(_qtdtID);
                _nhanvienID = qtdt.NVID;
                if (!IsPostBack)
                {
                    RadTextBoxTruong.Text = qtdt.QTDTTruong;
                    RadTextBoxChuyenNganh.Text = qtdt.QTDTChuyenNganh;
                    RadDatePickerTuNgay.SelectedDate = qtdt.QTDTTuNgay;
                    RadDatePickerDenNgay.SelectedDate = qtdt.QTDTDenNgay;
                    RadTextBoxHinhThuc.Text = qtdt.QTDTHinhThuc;
                    RadTextBoxVanBang.Text = qtdt.QTDTVanBang;
                }
            }
            else
            {
                _nhanvienID = Convert.ToInt32(this.Page.RouteData.Values["nhanvien"]);
                this.CreateStatus();
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string truong = RadTextBoxTruong.Text;
                string chuyennganh = RadTextBoxChuyenNganh.Text;
                DateTime tungay = Convert.ToDateTime(RadDatePickerTuNgay.SelectedDate);
                DateTime denngay = Convert.ToDateTime(RadDatePickerDenNgay.SelectedDate);
                string hinhthuc = RadTextBoxHinhThuc.Text;
                string vanbang = RadTextBoxVanBang.Text;
                _qtdtEntity.Update(_qtdtID, truong, chuyennganh, tungay, denngay, hinhthuc, vanbang);
                this.RedirectToIndex();
            }            
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            _qtdtEntity.Delete(_qtdtID);
            this.RedirectToIndex();
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                int nhanvienID = Convert.ToInt32(Page.RouteData.Values["nhanvien"]);
                string truong = RadTextBoxTruong.Text;
                string chuyennganh = RadTextBoxChuyenNganh.Text;
                DateTime tungay = Convert.ToDateTime(RadDatePickerTuNgay.SelectedDate);
                DateTime denngay = Convert.ToDateTime(RadDatePickerDenNgay.SelectedDate);
                string hinhthuc = RadTextBoxHinhThuc.Text;
                string vanbang = RadTextBoxVanBang.Text;

                _qtdtEntity.Insert(_nhanvienID, truong, chuyennganh, tungay, denngay, hinhthuc, vanbang);

                this.RedirectToIndex();
            }            
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            this.RedirectToIndex();
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

        private void RedirectToIndex()
        {
            Response.Redirect("~/NhanSu/" + _nhanvienID);
        }
    }
}