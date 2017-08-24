using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.TaiSanNuocNgoai.Form
{
    public partial class _Form : System.Web.UI.UserControl
    {
        private int _kekhaiID;
        private int _taisanID;
        private Models.TaiSanNuocNgoaiEntity _tsEntity = new Models.TaiSanNuocNgoaiEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(this.Page.RouteData.Values["taisan"] != null)
            {
                this.UpdateStatus();
                _taisanID = Convert.ToInt32(this.Page.RouteData.Values["taisan"]);
                Models.TaiSanNuocNgoai taisan = _tsEntity.Find(_taisanID);
                _kekhaiID = taisan.KKID;
                if (!this.Page.IsPostBack)
                {
                    txtTen.Text = taisan.TSNNTen;
                    txtSoLuong.Text = taisan.TSNNSoLuong.ToString();
                    if (taisan.TSNNGiaTri % 1 == 0)
                        txtGiaTri.Text = taisan.TSNNGiaTri.ToString("###");
                    else
                        txtGiaTri.Text = taisan.TSNNGiaTri.ToString();
                }
            }else
            {
                this.CreateStatus();
                _kekhaiID = Convert.ToInt32(this.Page.RouteData.Values["kekhai"]);
            }
        }

        protected void btCreate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                decimal giatri = Convert.ToDecimal(txtGiaTri.Text);
                _tsEntity.Insert(_kekhaiID, ten, soluong, giatri);
                this.RedirectToIndex();
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                string ten = txtTen.Text;
                decimal soluong = Convert.ToDecimal(txtSoLuong.Text);
                decimal giatri = Convert.ToDecimal(txtGiaTri.Text);
                _tsEntity.Update(_taisanID, ten, soluong, giatri);
                this.RedirectToIndex();
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            _tsEntity.Delete(_taisanID);
            this.RedirectToIndex();
        }

        protected void btBack_Click(object sender, EventArgs e)
        {
            this.RedirectToIndex();
        }

        private void CreateStatus()
        {
            btCreate.Visible = true;
            btUpdate.Visible = false;
            btDelete.Visible = false;
        }

        private void UpdateStatus()
        {
            btCreate.Visible = false;
            btUpdate.Visible = true;
            btDelete.Visible = true;
        }

        private void RedirectToIndex()
        {
            Response.Redirect("~/KeKhai/" + _kekhaiID);
        }
    }
}