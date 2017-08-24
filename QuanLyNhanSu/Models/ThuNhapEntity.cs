using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class ThuNhapEntity
    {
        public ThuNhapEntity() { }

        private string ConvertTien(Models.ThuNhap _thunhap)
        {
            if (_thunhap.TNTien % 1 == 0)
                return _thunhap.TNTien.ToString("#,###");
            else
                return _thunhap.TNTien.ToString("#,###.##");
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.ThuNhaps.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.TNID).AsEnumerable().Select(x => new
            {
                TNID = x.TNID,
                TNTen = x.TNTen,
                TNTien = this.ConvertTien(x)
            });
        }

        public Models.ThuNhap Find(int _thunhapID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.ThuNhaps.FirstOrDefault(x => x.TNID == _thunhapID);
        }

        public void Insert(int _kekhaiID, string _ten, decimal _tien)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThuNhap thunhap = new ThuNhap();
            thunhap.KKID = _kekhaiID;
            thunhap.TNTen = _ten;
            thunhap.TNTien = _tien;
            db.ThuNhaps.Add(thunhap);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _thunhapID, string _ten, decimal _tien)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThuNhap thunhap = db.ThuNhaps.FirstOrDefault(x => x.TNID == _thunhapID);
            thunhap.TNTen = _ten;
            thunhap.TNTien = _tien;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _thunhapID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ThuNhap thunhap = db.ThuNhaps.FirstOrDefault(x => x.TNID == _thunhapID);
            db.ThuNhaps.Remove(thunhap);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllThuNhapOfKeKhai_ToRadGrid(RadGrid _rg, int _kekhaiID)
        {
            _rg.DataSource = this.All(_kekhaiID).ToArray();
        }
    }
}