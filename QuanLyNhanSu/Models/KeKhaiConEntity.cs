using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class KeKhaiConEntity
    {
        public KeKhaiConEntity() { }

        public IEnumerable<Models.KeKhaiCon> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KeKhaiCons.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.KKCID);
        }

        public Models.KeKhaiCon Find(int _concaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.KeKhaiCons.FirstOrDefault(x => x.KKCID == _concaiID);
        }

        public void Insert(int _kekhaiID, string _ten, DateTime _dob, string _hokhau, string _choo)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KeKhaiCon con = new KeKhaiCon();
            con.KKID = _kekhaiID;
            con.KKCTen = _ten;
            con.KKCDOB = _dob;
            con.KKCHoKhau = _hokhau;
            con.KKCChoO = _choo;
            db.KeKhaiCons.Add(con);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _kekhaiconID, string _ten, DateTime _dob, string _hokhau, string _choo)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KeKhaiCon con = db.KeKhaiCons.FirstOrDefault(x => x.KKCID == _kekhaiconID);
            con.KKCTen = _ten;
            con.KKCDOB = _dob;
            con.KKCHoKhau = _hokhau;
            con.KKCChoO = _choo;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _kekhaiconID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.KeKhaiCon con = db.KeKhaiCons.FirstOrDefault(x => x.KKCID == _kekhaiconID);
            db.KeKhaiCons.Remove(con);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllConOfKeKhai_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToArray();
        }

    }
}