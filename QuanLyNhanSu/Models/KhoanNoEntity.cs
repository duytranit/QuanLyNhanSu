using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class KhoanNoEntity
    {
        public KhoanNoEntity() { }

        private string ConvertGiaTri(Models.KhoanNo _khoanno)
        {
            if (_khoanno.KNGiaTri % 1 == 0)
                return _khoanno.KNGiaTri.ToString("#,###");
            else
                return _khoanno.KNGiaTri.ToString("#,###.##");
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KhoanNos.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.KNID).AsEnumerable().Select(x => new
            {
                KNID = x.KNID,
                KNTen = x.KNTen,
                KNSoLuong = x.KNSoLuong,
                KNGiaTri = this.ConvertGiaTri(x)
            });
        }

        public Models.KhoanNo Find(int _khoannoID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KhoanNos.FirstOrDefault(x => x.KNID == _khoannoID);
        }

        public void Insert(int _kekhaiID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KhoanNo khoanno = new KhoanNo();
            khoanno.KKID = _kekhaiID;
            khoanno.KNTen = _ten;
            khoanno.KNSoLuong = _soluong;
            khoanno.KNGiaTri = _giatri;
            db.KhoanNos.Add(khoanno);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _khoannoID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KhoanNo khoanno = db.KhoanNos.FirstOrDefault(x => x.KNID == _khoannoID);
            khoanno.KNTen = _ten;
            khoanno.KNSoLuong = _soluong;
            khoanno.KNGiaTri = _giatri;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _khoannoID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KhoanNo khoanno = db.KhoanNos.FirstOrDefault(x => x.KNID == _khoannoID);
            db.KhoanNos.Remove(khoanno);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllKhoanNoOfKeKhai_ToRadGrid(RadGrid _rg, int _kekhaiID)
        {
            _rg.DataSource = this.All(_kekhaiID).ToList();
        }
    }
}