using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class PhongTangDanhHieuEntity
    {
        public PhongTangDanhHieuEntity() { }

        private IEnumerable<Models.PhongTangDanhHieu> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.PhongTangDanhHieux.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.PTDHID);
        }

        public Models.PhongTangDanhHieu Find(int _danhhieuID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.PhongTangDanhHieux.FirstOrDefault(x => x.PTDHID == _danhhieuID);
        }

        public void Insert(int _nhanvienID, string _danhhieu, DateTime _ngaythang, string _hoidong)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.PhongTangDanhHieu danhhieu = new PhongTangDanhHieu();
            danhhieu.NVID = _nhanvienID;
            danhhieu.PTDHTen = _danhhieu;
            danhhieu.PTDHNgay = _ngaythang;
            danhhieu.PTDHHoiDong = _hoidong;
            db.PhongTangDanhHieux.Add(danhhieu);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _danhhieuID, string _danhhieu, DateTime _ngaythang, string _hoidong)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.PhongTangDanhHieu danhhieu = db.PhongTangDanhHieux.FirstOrDefault(x => x.PTDHID == _danhhieuID);
            danhhieu.PTDHTen = _danhhieu;
            danhhieu.PTDHNgay = _ngaythang;
            danhhieu.PTDHHoiDong = _hoidong;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _danhhieuID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.PhongTangDanhHieu danhhieu = db.PhongTangDanhHieux.FirstOrDefault(x => x.PTDHID == _danhhieuID);
            db.PhongTangDanhHieux.Remove(danhhieu);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllPhongTangDanhHieuOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}