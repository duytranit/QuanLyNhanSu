using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class KyLuatEntity
    {
        public KyLuatEntity() { }

        private IEnumerable<Models.KyLuat> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KyLuats.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.KLID);
        }

        public Models.KyLuat Find(int _kyluatID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KyLuats.FirstOrDefault(x => x.KLID == _kyluatID);
        }

        public void Insert(int _nhanvienID, string _noidung, string _hoidong, DateTime _ngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KyLuat kyluat = new KyLuat();
            kyluat.NVID = _nhanvienID;
            kyluat.KLNoiDung = _noidung;
            kyluat.KLCap = _hoidong;
            kyluat.KLNgay = _ngay;
            db.KyLuats.Add(kyluat);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _kyluatID, string _noidung, string _hoidong, DateTime _ngay)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KyLuat kyluat = db.KyLuats.FirstOrDefault(x => x.KLID == _kyluatID);
            kyluat.KLNoiDung = _noidung;
            kyluat.KLCap = _hoidong;
            kyluat.KLNgay = _ngay;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _kyluatID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KyLuat kyluat = db.KyLuats.FirstOrDefault(x => x.KLID == _kyluatID);
            db.KyLuats.Remove(kyluat);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllKyLuatOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}