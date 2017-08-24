using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DanhGiaEntity
    {
        public DanhGiaEntity() { }

        private IEnumerable<Models.DanhGia> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DanhGias.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.DGID);
        }

        public Models.DanhGia Find(int _danhgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DanhGias.FirstOrDefault(x => x.DGID == _danhgiaID);
        }

        public void Insert(int _nhanvienID, string _noidung, DateTime _ngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGia danhgia = new DanhGia();
            danhgia.NVID = _nhanvienID;
            danhgia.DGNoiDung = _noidung;
            danhgia.DGNgay = _ngay;
            db.DanhGias.Add(danhgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _danhgiaID, string _noidung, DateTime _ngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGia danhgia = db.DanhGias.FirstOrDefault(x => x.DGID == _danhgiaID);
            danhgia.DGNoiDung = _noidung;
            danhgia.DGNgay = _ngay;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _danhgiaID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DanhGia danhgia = db.DanhGias.FirstOrDefault(x => x.DGID == _danhgiaID);
            db.DanhGias.Remove(danhgia);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllDanhGiaOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}