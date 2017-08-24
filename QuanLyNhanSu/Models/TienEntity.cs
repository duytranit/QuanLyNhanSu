using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class TienEntity
    {
        public TienEntity() { }

        private string ConvertSoLuong(Models.Tien _tien)
        {
            if (_tien.TIESoLuong % 1 == 0)
                return _tien.TIESoLuong.ToString("#,###");
            else
                return _tien.TIESoLuong.ToString("#,###.##");
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.Tiens.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.TIEID).AsEnumerable().Select(x => new
            {
                TIEID = x.TIEID,
                TIENoiDung = x.TIENoiDung,
                TIESoLuong = this.ConvertSoLuong(x),
                TIETienTe = x.TIETienTe
            });
        }

        public Models.Tien Find(int _tienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.Tiens.FirstOrDefault(x => x.TIEID == _tienID);
        }

        public void Insert(int _kekhaiID, decimal _soluong, string _tiente, string _noidung)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Tien tien = new Tien();
            tien.KKID = _kekhaiID;
            tien.TIESoLuong = _soluong;
            tien.TIETienTe = _tiente;
            tien.TIENoiDung = _noidung;
            db.Tiens.Add(tien);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _tienID, decimal _soluong, string _tiente, string _noidung)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Tien tien = db.Tiens.FirstOrDefault(x => x.TIEID == _tienID);
            tien.TIESoLuong = _soluong;
            tien.TIETienTe = _tiente;
            tien.TIENoiDung = _noidung;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _tienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Tien tien = db.Tiens.FirstOrDefault(x => x.TIEID == _tienID);
            db.Tiens.Remove(tien);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllTienOfKeKhai_ToRadGrid(RadGrid _rg, int _kekhaiID)
        {
            _rg.DataSource = this.All(_kekhaiID).ToList();
        }
    }
}