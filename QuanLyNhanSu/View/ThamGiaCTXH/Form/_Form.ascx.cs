using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ThamGiaCTXH.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private Models.ThamGiaChinhTriXaHoiEntity _thamgiaCTXHEntity = new Models.ThamGiaChinhTriXaHoiEntity();
        private int _nhanvienID;
        private int _thamgiactxhID;
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                Models.ChinhTriXaHoiEntity ctxhEntity = new Models.ChinhTriXaHoiEntity();
                ctxhEntity.Load_DataSource_DropDownList(RadDropDownListCTXH);
                RadDatePickerTuNgay.SelectedDate = DateTime.Now;
            }

            if (this.Page.RouteData.Values["ctxh"] == null)
            {
                _nhanvienID = Convert.ToInt32(Page.RouteData.Values["nhanvien"]);
                this.CreateStatus();
            }                
            else
            {
                this.UpdateStatus();
                _thamgiactxhID = Convert.ToInt32(this.Page.RouteData.Values["ctxh"]);
                Models.ThamGiaChinhTriXaHois tgctxh = _thamgiaCTXHEntity.Find(_thamgiactxhID);
                _nhanvienID = tgctxh.NVID;
                if (!IsPostBack)
                {
                    RadDropDownListCTXH.SelectedValue = tgctxh.CTXHID.ToString();
                    RadTextBoxChucVu.Text = tgctxh.TGCTXHChucVu;
                    RadDatePickerTuNgay.SelectedDate = tgctxh.TGCTXHTuNgay;
                    RadDatePickerDenNgay.SelectedDate = tgctxh.TGCTXHDenNgay;
                    RadTextBoxNoiDung.Text = tgctxh.TGCTXHNoiDung;
                }
            }
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            int ctxhID = Convert.ToInt32(RadDropDownListCTXH.SelectedValue);
            string chucvu = RadTextBoxChucVu.Text;
            DateTime tungay = Convert.ToDateTime(RadDatePickerTuNgay.SelectedDate);
            string noidung = RadTextBoxNoiDung.Text;
            if (RadDatePickerDenNgay.SelectedDate == null)
                _thamgiaCTXHEntity.Insert(_nhanvienID, ctxhID, chucvu, tungay, noidung);
            else
            {
                DateTime denngay = Convert.ToDateTime(RadDatePickerDenNgay.SelectedDate);
                _thamgiaCTXHEntity.Insert(_nhanvienID, ctxhID, chucvu, tungay, noidung, denngay);
            }
            this.RedirectToIndex();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            int ctxhID = Convert.ToInt32(RadDropDownListCTXH.SelectedValue);
            string chucvu = RadTextBoxChucVu.Text;
            DateTime tungay = Convert.ToDateTime(RadDatePickerTuNgay.SelectedDate);
            string noidung = RadTextBoxNoiDung.Text;
            if (RadDatePickerDenNgay.SelectedDate == null)
                _thamgiaCTXHEntity.Update(_thamgiactxhID, ctxhID, chucvu, tungay, noidung);
            else
            {
                DateTime denngay = Convert.ToDateTime(RadDatePickerDenNgay.SelectedDate);
                _thamgiaCTXHEntity.Update(_thamgiactxhID, ctxhID, chucvu, tungay, noidung, denngay);
            }
            this.RedirectToIndex();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            _thamgiaCTXHEntity.Delete(_thamgiactxhID);
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

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            this.RedirectToIndex();
        }

        private void RedirectToIndex()
        {

            Response.Redirect("~/NhanSu/" + _nhanvienID);
        }
    }
}