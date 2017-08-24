using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class GiaiTrinhEntity
    {
        public GiaiTrinhEntity() { }

        public decimal ConvertSoLuongVSTang(Models.GiaiTrinh _gt)
        {
            if (_gt.GTIsTang)
                return _gt.GTSoLuong;
            else
                return (-1) * _gt.GTSoLuong;
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.GiaiTrinhs.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.GTID).AsEnumerable().Select(x => new
            {
                GTID = x.GTID,
                LGTTenChung = x.LoaiGiaiTrinh.LGTTenChung,
                GTSoLuong = this.ConvertSoLuongVSTang(x),
                GTNoiDung = x.GTNoiDung
            });
        }

        public Models.GiaiTrinh Find(int _giaitrinhID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.GiaiTrinhs.FirstOrDefault(x => x.GTID == _giaitrinhID);
        }

        public void Insert(int _kekhaiID, int _lgtID, decimal _soluong, bool _tang, string _noidung)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.GiaiTrinh giaitrinh = new GiaiTrinh();
            giaitrinh.KKID = _kekhaiID;
            giaitrinh.LGTID = _lgtID;
            giaitrinh.GTSoLuong = _soluong;
            giaitrinh.GTIsTang = _tang;
            giaitrinh.GTNoiDung = _noidung;
            db.GiaiTrinhs.Add(giaitrinh);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _giaitrinhID, int _lgtID, decimal _soluong, bool _tang, string _noidung)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.GiaiTrinh giaitrinh = db.GiaiTrinhs.FirstOrDefault(x => x.GTID == _giaitrinhID);
            giaitrinh.LGTID = _lgtID;
            giaitrinh.GTSoLuong = _soluong;
            giaitrinh.GTIsTang = _tang;
            giaitrinh.GTNoiDung = _noidung;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _giaitrinhID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.GiaiTrinh giaitrinh = db.GiaiTrinhs.FirstOrDefault(x => x.GTID == _giaitrinhID);
            db.GiaiTrinhs.Remove(giaitrinh);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllGiaiTrinhOfKeKhai_ToRadGrid(RadGrid _rg, int _kekhaiID)
        {
            _rg.DataSource = this.All(_kekhaiID).ToList();
        }
    }
}