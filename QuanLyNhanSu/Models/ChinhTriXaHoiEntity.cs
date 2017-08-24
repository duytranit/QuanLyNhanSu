using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class ChinhTriXaHoiEntity
    {
        public ChinhTriXaHoiEntity() { }

        // PRIVATES
        private bool Is_Existing(int _nhanvienID, int _ctxhID)
        {
            bool flag = false;

            EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.NhanVien nhanvien = db.NhanViens.FirstOrDefault(x => x.NVID == _nhanvienID);
            IEnumerable<Models.ThamGiaChinhTriXaHois> tgctxhs = nhanvien.ThamGiaChinhTriXaHois;

            foreach (Models.ThamGiaChinhTriXaHois tgctxh in tgctxhs)
                if (tgctxh.CTXHID == _ctxhID)
                {
                    flag = true;
                    break;
                }

            return flag;
        }

        private IEnumerable<Models.ChinhTriXaHois> All
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.ChinhTriXaHois;
            }
        }

        // ATTRIBUTES
        public IEnumerable<Models.ChinhTriXaHois> CTXH_Not_Of_NhanVien(int _nhanvienID)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<Models.ChinhTriXaHois> ctxhs = (from ctxh in db.ChinhTriXaHois
                                         where !db.ThamGiaChinhTriXaHois.Any(x => (x.NVID == _nhanvienID) && (x.CTXHID == ctxh.CTXHID))
                                         select ctxh);
            return ctxhs;
        }

        public Models.ChinhTriXaHois Find(int _ctxhID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.ChinhTriXaHois.FirstOrDefault(x => x.CTXHID == _ctxhID);
        }

        public void Insert(string _ten, string _diachi, string _sdt, string _fax, string  _email, string _website, string _gioithieu)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChinhTriXaHois ctxh = new ChinhTriXaHois();
            ctxh.CTXHTen = _ten;
            ctxh.CTXHDiaChi = _diachi;
            ctxh.CTXHDienThoai = _sdt;
            ctxh.CTXHFax = _fax;
            ctxh.CTXHEmail = _email;
            ctxh.CTXHWebsite = _website;
            ctxh.CTXHGioiThieu = _gioithieu;
            db.ChinhTriXaHois.Add(ctxh);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _ctxhID,string _ten, string _diachi, string _sdt, string _fax, string _email, string _website, string _gioithieu)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChinhTriXaHois ctxh = db.ChinhTriXaHois.FirstOrDefault(x => x.CTXHID == _ctxhID);
            ctxh.CTXHTen = _ten;
            ctxh.CTXHDiaChi = _diachi;
            ctxh.CTXHDienThoai = _sdt;
            ctxh.CTXHFax = _fax;
            ctxh.CTXHEmail = _email;
            ctxh.CTXHWebsite = _website;
            ctxh.CTXHGioiThieu = _gioithieu;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _ctxhID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChinhTriXaHois ctxh = db.ChinhTriXaHois.FirstOrDefault(x => x.CTXHID == _ctxhID);
            db.ChinhTriXaHois.Remove(ctxh);
            db.SaveChanges();
            db.Dispose();
        }

        // LOAD DATASOURCE
        public void Load_DataSource_RadGrid(RadGrid _radgrid)
        {
            _radgrid.DataSource = this.All.ToList();
        }

        public void Load_DataSource_CheckBoxList(CheckBoxList _checkboxlist)
        {
            _checkboxlist.DataSource = this.All.ToList();
            _checkboxlist.DataTextField = "CTXHTen";
            _checkboxlist.DataValueField = "CTXHID";
            _checkboxlist.DataBind();
        }

        public void Load_DataSource_Not_Of_NhanVien_DropDownList(RadDropDownList _dropdownlist, int _nhanvienID)
        {
            _dropdownlist.DataSource = this.CTXH_Not_Of_NhanVien(_nhanvienID).ToList();
            _dropdownlist.DataTextField = "CTXHTen";
            _dropdownlist.DataValueField = "CTXHID";
            _dropdownlist.DataBind();
            _dropdownlist.SelectedIndex = 0;
        }

        public void Load_DataSource_DropDownList(RadDropDownList _dropdownlist)
        {
            _dropdownlist.DataSource = this.All.ToList();
            _dropdownlist.DataTextField = "CTXHTen";
            _dropdownlist.DataValueField = "CTXHID";
            _dropdownlist.DataBind();
            _dropdownlist.SelectedIndex = 0;
        }
    }
}