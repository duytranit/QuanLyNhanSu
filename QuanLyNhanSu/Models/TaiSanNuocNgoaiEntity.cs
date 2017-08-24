using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class TaiSanNuocNgoaiEntity
    {
        public TaiSanNuocNgoaiEntity() { }

        private string ConvertGiaTri(Models.TaiSanNuocNgoai _taisan)
        {
            if (_taisan.TSNNGiaTri % 1 == 0)
                return _taisan.TSNNGiaTri.ToString("#,###");
            else
                return _taisan.TSNNGiaTri.ToString("#,###.##");
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.TaiSanNuocNgoais.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.TSNNID).AsEnumerable().Select(x => new
            {
                TSNNID = x.TSNNID,
                TSNNTen = x.TSNNTen,
                TSNNSoLuong = x.TSNNSoLuong,
                TSNNGiaTri = this.ConvertGiaTri(x)
            });
        }

        public Models.TaiSanNuocNgoai Find(int _taisanID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.TaiSanNuocNgoais.FirstOrDefault(x => x.TSNNID == _taisanID);
        }

        public void Insert(int _kekhaiID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TaiSanNuocNgoai taisan = new TaiSanNuocNgoai();
            taisan.KKID = _kekhaiID;
            taisan.TSNNTen = _ten;
            taisan.TSNNSoLuong = _soluong;
            taisan.TSNNGiaTri = _giatri;
            db.TaiSanNuocNgoais.Add(taisan);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _taisanID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TaiSanNuocNgoai taisan = db.TaiSanNuocNgoais.FirstOrDefault(x => x.TSNNID == _taisanID);
            taisan.TSNNTen = _ten;
            taisan.TSNNSoLuong = _soluong;
            taisan.TSNNGiaTri = _giatri;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _taisanID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TaiSanNuocNgoai taisan = db.TaiSanNuocNgoais.FirstOrDefault(x => x.TSNNID == _taisanID);
            db.TaiSanNuocNgoais.Remove(taisan);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllTaiSanOfKeKhai_ToRadGrid(RadGrid _rg, int _kekhaiID)
        {
            _rg.DataSource = this.All(_kekhaiID).ToList();
        }
    }
}