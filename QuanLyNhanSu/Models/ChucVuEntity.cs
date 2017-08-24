using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class ChucVuEntity
    {
        public ChucVuEntity() { }

        // ATTRIBUTES
        private IEnumerable<Models.ChucVu> All
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.ChucVus.OrderBy(x => x.CVTen);
            }
        }

        public bool Is_Existing(string _ten)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChucVu chucvu = db.ChucVus.FirstOrDefault(x => x.CVTen.Equals(_ten));
            if (chucvu == null)
                return false;
            else
                return true;
        }

        public Models.ChucVu Default_ChucVu()
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChucVu chucvu = db.ChucVus.FirstOrDefault(x => x.CVID == 1);
            return chucvu;
        }

        public Models.ChucVu Find(int _chucvuID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.ChucVus.FirstOrDefault(x => x.CVID == _chucvuID);
        }

        public void Insert(string _ten)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChucVu chucvu = new ChucVu();
            chucvu.CVTen = _ten;
            db.ChucVus.Add(chucvu);
            db.SaveChanges();
            db.Dispose();
        }
        
        public void Update(int _chucvuID, string _ten)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChucVu chucvu = db.ChucVus.FirstOrDefault(x => x.CVID == _chucvuID);
            chucvu.CVTen = _ten;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _chucvuID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChucVu chucvu = db.ChucVus.FirstOrDefault(x => x.CVID == _chucvuID);
            db.ChucVus.Remove(chucvu);
            db.SaveChanges();
            db.Dispose();
        }

        // LOAD DATASOURCE
        public void Load_AllChucVu_RadComboBox(RadComboBox _cbb)
        {
            _cbb.DataSource = this.All.ToList();
            _cbb.DataTextField = "CVTen";
            _cbb.DataValueField = "CVID";
            _cbb.DataBind();
        }

        public void Load_DataSource_RadGrid(RadGrid _radgrid)
        {
            EmployeeManagementEntities db = new EmployeeManagementEntities();
            IEnumerable<object> chucvus = db.ChucVus.OrderBy(x => x.CVTen).AsEnumerable().Select(x => new
                                           {
                                               CVID = x.CVID,
                                               CVTen = x.CVTen,
                                               CVSoLuongNV = x.LamViecs.Where(y => y.LVDenNgay == null).Count()
                                           });
            _radgrid.DataSource = chucvus.ToList();
        }
    }
}