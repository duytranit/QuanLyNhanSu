using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class TaiSanKhacEntity
    {
        public TaiSanKhacEntity() { }

        private string ConvertGiaTri(Models.TaiSanKhac _taisan)
        {
            if (_taisan.TSKGiaTri % 1 == 0)
                return _taisan.TSKGiaTri.ToString("#,###");
            else
                return _taisan.TSKGiaTri.ToString("#,###.##");
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.TaiSanKhacs.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.TSKID).AsEnumerable().Select(x => new
            {
                TSKID = x.TSKID,
                TSKTen = x.TSKTen,
                TSKSoLuong = x.TSKSoLuong,
                TSKGiaTri = this.ConvertGiaTri(x)
            });
        }

        public Models.TaiSanKhac Find(int _taisanID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.TaiSanKhacs.FirstOrDefault(x => x.TSKID == _taisanID);
        }

        public void Insert(int _kekhaiID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TaiSanKhac taisan = new TaiSanKhac();
            taisan.KKID = _kekhaiID;
            taisan.TSKTen = _ten;
            taisan.TSKSoLuong = _soluong;
            taisan.TSKGiaTri = _giatri;
            db.TaiSanKhacs.Add(taisan);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _taisanID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TaiSanKhac taisan = db.TaiSanKhacs.FirstOrDefault(x => x.TSKID == _taisanID);
            taisan.TSKTen = _ten;
            taisan.TSKSoLuong = _soluong;
            taisan.TSKGiaTri = _giatri;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _taisanID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TaiSanKhac taisan = db.TaiSanKhacs.FirstOrDefault(x => x.TSKID == _taisanID);
            db.TaiSanKhacs.Remove(taisan);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllTaiSanKhacOfKeKhai_ToRadGrid(RadGrid _rg, int _kekhaiID)
        {
            _rg.DataSource = this.All(_kekhaiID).ToList();
        }
    }
}