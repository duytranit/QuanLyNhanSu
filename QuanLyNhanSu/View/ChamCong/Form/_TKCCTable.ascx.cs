using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.View.ChamCong.Form
{
    public partial class _TKCCTable : System.Web.UI.UserControl
    {
        private Models.LamViecEntity _lvEntity = new Models.LamViecEntity();
        protected IEnumerable<Models.LamViec> _lamviecs;
        private int _nam;
        private int _donviID;

        public IEnumerable<Models.LamViec> LamViecs
        {
            get
            {
                return _lamviecs;
            }
        }

        public int NamChamCong
        {
            get
            {
                return _nam;
            }
        }

        public int DonViChamCongID
        {
            get
            {
                return _donviID;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            _donviID = 0;
            _lamviecs = _lvEntity.FindByDenNgayYear(DateTime.Now.Year);
            _nam = DateTime.Now.Year;

            if (!this.Page.IsPostBack)
            {
                Models.DonViEntity dvEntity = new Models.DonViEntity();
                dvEntity.Load_DataSource_RadDropDownTree(ddtDonVi);
                this.LoadYearToDropDownList();
                ddlNam.SelectedValue = DateTime.Now.Year.ToString();
            }
        }

        protected void btThongKe_Click(object sender, EventArgs e)
        {
            _nam = Convert.ToInt32(ddlNam.SelectedValue);
            if (ddtDonVi.SelectedValue.Equals(""))
                _lamviecs = _lvEntity.FindByDenNgayYear(_nam);
            else
            {
                _donviID = Convert.ToInt32(ddtDonVi.SelectedValue);                
                _lamviecs = _lvEntity.FindByDonViAndDenNgayYear(_donviID, _nam);
            }
        }

        public int SoSoLuong_ChamCong(Models.LamViec _lamviec, int _loaichamcongID)
        {
            return _lvEntity.SoLuong_ChamCong(_lamviec, _loaichamcongID, _nam);
        }

        public decimal SoNgayPhepCongLai(Models.LamViec _lamviec)
        {
            return _lvEntity.SoNgayPhepConLai(_lamviec, _nam);
        }

        private void LoadYearToDropDownList()
        {
            List<YearObject> years = new List<YearObject>();
            for (int i = DateTime.Now.Year - 50; i <= DateTime.Now.Year + 50; i++)
            {
                years.Add(new YearObject() { Ten = i.ToString(), Value = i.ToString() });
            }
            ddlNam.DataSource = years;
            ddlNam.DataTextField = "Ten";
            ddlNam.DataValueField = "Value";
            ddlNam.DataBind();
        }

        public class YearObject
        {
            public string Ten { get; set; }
            public string Value { get; set; }
        }
    }
}