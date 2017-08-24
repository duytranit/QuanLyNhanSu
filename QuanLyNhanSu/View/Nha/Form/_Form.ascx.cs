using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.Nha.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _nhaID;
        private Models.NhaEntity _nhaEntity = new Models.NhaEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.RouteData.Values["nha"] != null)
            {
                this.UpdateStatus();
                _nhaID = Convert.ToInt32(this.Page.RouteData.Values["nha"]);
                Models.Nha nha = _nhaEntity.Find(_nhaID);
                _kekhaiID = nha.KKID;
                if (!this.Page.IsPostBack)
                {
                    rblNhaO.SelectedValue = nha.NHAIsNha.ToString();
                    txtLoaiNha.Text = nha.NHALoai;
                    txtDiaChi.Text = nha.NHADiaChi;
                    txtCap.Text = nha.NHACap;
                    txtDienTich.Text = nha.NHADienTich.ToString();
                    if (nha.NHAGiaTri % 1 == 0)
                        txtGiaTri.Text = nha.NHAGiaTri.ToString("###");
                    else
                        txtGiaTri.Text = nha.NHAGiaTri.ToString();
                    txtQuyenSoHuu.Text = nha.NHAQuyenSoHuu;
                    txtGhiChu.Text = nha.NHAGhiChu;
                }
            }else
            {
                this.CreateStatus();
                _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            }
        }

        protected void btCrete_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool nhao = Convert.ToBoolean(rblNhaO.SelectedValue);
                string diachi = txtDiaChi.Text;
                string loainha = txtLoaiNha.Text;
                string cap = txtCap.Text;
                decimal dientich = Convert.ToDecimal(txtDienTich.Text);
                decimal giatri = Convert.ToDecimal(txtGiaTri.Text);
                string quyensohuu = txtQuyenSoHuu.Text;
                string ghichu = txtGhiChu.Text;
                _nhaEntity.Insert(_kekhaiID, diachi, loainha, cap, dientich, giatri, quyensohuu, ghichu, nhao);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                bool nhao = Convert.ToBoolean(rblNhaO.SelectedValue);
                string diachi = txtDiaChi.Text;
                string loainha = txtLoaiNha.Text;
                string cap = txtCap.Text;
                decimal dientich = Convert.ToDecimal(txtDienTich.Text);
                decimal giatri = Convert.ToDecimal(txtGiaTri.Text);
                string quyensohuu = txtQuyenSoHuu.Text;
                string ghichu = txtGhiChu.Text;
                _nhaEntity.Update(_nhaID, diachi, loainha, cap, dientich, giatri, quyensohuu, ghichu, nhao);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _nhaEntity.Delete(_nhaID);
            this.RedirectToIndex();
        }

        protected void btBack_Click(object sender, EventArgs e)
        {
            this.RedirectToIndex();
        }

        private void CreateStatus()
        {
            btCrete.Visible = true;
            btUpdate.Visible = false;
            btDelete.Visible = false;
        }

        private void UpdateStatus()
        {
            btCrete.Visible = false;
            btUpdate.Visible = true;
            btDelete.Visible = true;
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID);
        }
    }
}