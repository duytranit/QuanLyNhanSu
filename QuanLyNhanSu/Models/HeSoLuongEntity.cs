using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class HeSoLuongEntity
    {
        public HeSoLuongEntity() { }

        private IEnumerable<object> All
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.HeSoLuongs.OrderBy(x => x.HSLHeSo).OrderBy(x => x.BLID).OrderBy(x => x.NGID).AsEnumerable().Select(x => new
                {
                    HSLID = x.HSLID,
                    HSLNgach = x.Ngach.NGTen,
                    HSLBacLuong = x.BacLuong.BLTen,
                    HSLHeSo = x.HSLHeSo,
                    NGTen = x.Ngach.NGTen,
                    BLTen = x.BacLuong.BLTen
                });
            }
        }

        public Models.HeSoLuong Find(int _hesoID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.HeSoLuongs.FirstOrDefault(x => x.HSLID == _hesoID);
        }

        public void Insert(int _bacluongID, int _ngachID, decimal _heso)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.HeSoLuong hesoluong = new Models.HeSoLuong();
            hesoluong.NGID = _ngachID;
            hesoluong.BLID = _bacluongID;
            hesoluong.HSLHeSo = _heso;
            db.HeSoLuongs.Add(hesoluong);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _hesoluongID, int _bacluongID, int _ngachID, decimal _heso)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.HeSoLuong hesoluong = db.HeSoLuongs.FirstOrDefault(x => x.HSLID == _hesoluongID);
            hesoluong.NGID = _ngachID;
            hesoluong.BLID = _bacluongID;
            hesoluong.HSLHeSo = _heso;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _hesoluongID)
        {
            Models.EmployeeManagementEntities db = new Models.EmployeeManagementEntities();
            Models.HeSoLuong hesoluong = db.HeSoLuongs.FirstOrDefault(x => x.HSLID == _hesoluongID);
            db.HeSoLuongs.Remove(hesoluong);
            db.SaveChanges();
            db.Dispose();
        }

        // LOAD DATASOURCE
        public void Load_DataSource_ComboBox(RadComboBox _comboBox)
        {
            _comboBox.DataSource = this.All.ToList();
            _comboBox.DataValueField = "HSLID";
            _comboBox.DataTextField = "HSLHeSo";
            _comboBox.DataBind();

        }

        public void Load_DataSource_RadGrid(RadGrid _radgrid)
        {
            _radgrid.DataSource = this.All.ToList();
        }
    }
}