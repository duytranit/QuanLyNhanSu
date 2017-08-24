using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class KhenThuongEntity
    {
        public KhenThuongEntity() { }

        private IEnumerable<Models.KhenThuong> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KhenThuongs.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.KTID);
        }

        public Models.KhenThuong Find(int _khenthuongID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KhenThuongs.FirstOrDefault(x => x.KTID == _khenthuongID);
        }

        public void Insert(int _nhanvienID, string _noidung, string _capquyetdinh, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KhenThuong khenthuong = new KhenThuong();
            khenthuong.NVID = _nhanvienID;
            khenthuong.KTNoiDung = _noidung;
            khenthuong.KTCapQuyetDinh = _capquyetdinh;
            khenthuong.KTNgay = _ngaythang;
            db.KhenThuongs.Add(khenthuong);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _khenthuongID, string _noidung, string _capquyetdinh, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KhenThuong khenthuong = db.KhenThuongs.FirstOrDefault(x => x.KTID == _khenthuongID);
            khenthuong.KTNoiDung = _noidung;
            khenthuong.KTCapQuyetDinh = _capquyetdinh;
            khenthuong.KTNgay = _ngaythang;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _khenthuongID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KhenThuong khenthuong = db.KhenThuongs.FirstOrDefault(x => x.KTID == _khenthuongID);
            db.KhenThuongs.Remove(khenthuong);
            db.SaveChanges();
        }

        public void Load_AllKhenThuongOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}