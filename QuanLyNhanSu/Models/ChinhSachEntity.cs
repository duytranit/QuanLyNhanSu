using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class ChinhSachEntity
    {
        public ChinhSachEntity() { }

        private IEnumerable<Models.ChinhSach> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.ChinhSaches.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.CSID);
        }

        public Models.ChinhSach Find(int _chinhsachID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.ChinhSaches.FirstOrDefault(x => x.CSID == _chinhsachID);
        }

        public void Insert(int _nhanvienID, string _noidung, DateTime _ngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChinhSach chinhsach = new ChinhSach();
            chinhsach.NVID = _nhanvienID;
            chinhsach.CSTen = _noidung;
            chinhsach.CSNgay = _ngay;
            db.ChinhSaches.Add(chinhsach);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _chinhsachID, string _noidung, DateTime _ngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChinhSach chinhsach = db.ChinhSaches.FirstOrDefault(x => x.CSID == _chinhsachID);
            chinhsach.CSTen = _noidung;
            chinhsach.CSNgay = _ngay;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _chinhsachID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChinhSach chinhsach = db.ChinhSaches.FirstOrDefault(x => x.CSID == _chinhsachID);
            db.ChinhSaches.Remove(chinhsach);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllChinhSachOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}