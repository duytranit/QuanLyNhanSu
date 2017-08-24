using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DongSanEntity
    {
        public DongSanEntity() { }

        private string ConvertGiaTri(Models.DongSan _dongsan)
        {
            if (_dongsan.DSGiaTri % 1 == 0)
                return _dongsan.DSGiaTri.ToString("#,###");
            else
                return _dongsan.DSGiaTri.ToString("#,###.##");
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DongSans.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.DSID).AsEnumerable().Select(x => new
            {
                DSID = x.DSID,
                DSTen = x.DSTen,
                DSSoLuong = x.DSSoLuong,
                DSGiaTri = this.ConvertGiaTri(x)
            });
        }

        public Models.DongSan Find(int _dongsanID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DongSans.FirstOrDefault(x => x.DSID == _dongsanID);
        }

        public void Insert(int _kekhaiID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DongSan dongsan = new DongSan();
            dongsan.KKID = _kekhaiID;
            dongsan.DSTen = _ten;
            dongsan.DSSoLuong = _soluong;
            dongsan.DSGiaTri = _giatri;
            db.DongSans.Add(dongsan);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _dongsanID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DongSan dongsan = db.DongSans.FirstOrDefault(x => x.DSID == _dongsanID);
            dongsan.DSTen = _ten;
            dongsan.DSSoLuong = _soluong;
            dongsan.DSGiaTri = _giatri;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _dongsanID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DongSan dongsan = db.DongSans.FirstOrDefault(x => x.DSID == _dongsanID);
            db.DongSans.Remove(dongsan);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllDongSanOfKeKhai_ToRadGrid(RadGrid _rg, int _kekhaiID)
        {
            _rg.DataSource = this.All(_kekhaiID).ToList();
        }
    }
}