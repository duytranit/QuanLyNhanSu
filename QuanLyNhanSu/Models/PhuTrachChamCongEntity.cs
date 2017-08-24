using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class PhuTrachChamCongEntity
    {
        private string ConvertStatus(Models.PhuTrachChamCong _ptcc)
        {
            if (_ptcc.PCCCStatus)
                return "Kích hoạt";
            else
                return "Khóa";
        }

        public IEnumerable<Models.PhuTrachChamCong> AllPhuTrachChamCongModels
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.PhuTrachChamCongs.OrderByDescending(x => x.PTCCID);
            }
        }

        private IEnumerable<object> All
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.PhuTrachChamCongs.OrderByDescending(x => x.PTCCID).AsEnumerable().Select(x => new
                {
                    PTCCID = x.PTCCID,
                    NVTen = x.Account.NhanVien.NVTen,
                    ACCEmail = x.Account.ACCEmail,
                    DVTen = x.DonVi.DVTen,
                    PTCCStatus = this.ConvertStatus(x)
                });
            }
        }

        public Models.PhuTrachChamCong Find(int _phutrachID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.PhuTrachChamCongs.FirstOrDefault(x => x.PTCCID == _phutrachID);
        }

        public void Insert(int _accountID, int _donviID, bool _trangthai)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.PhuTrachChamCong phutrach = db.PhuTrachChamCongs.FirstOrDefault(x => x.ACCID == _accountID && x.DVID == _donviID);
            if (phutrach != null)
            {
                db.PhuTrachChamCongs.Remove(phutrach);
            }
            
            phutrach = new PhuTrachChamCong();
            phutrach.ACCID = _accountID;
            phutrach.DVID = _donviID;
            phutrach.PCCCStatus = _trangthai;
            db.PhuTrachChamCongs.Add(phutrach);

            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _phutrachID, int _accountID, int _donviID, bool _trangthai)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.PhuTrachChamCong phutrach = db.PhuTrachChamCongs.FirstOrDefault(x => x.PTCCID == _phutrachID);
            phutrach.ACCID = _accountID;
            phutrach.DVID = _donviID;
            phutrach.PCCCStatus = _trangthai;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _phutrachID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.PhuTrachChamCong phutrach = db.PhuTrachChamCongs.FirstOrDefault(x => x.PTCCID == _phutrachID);
            db.PhuTrachChamCongs.Remove(phutrach);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllPhuTrach_ToRadGrid(RadGrid _rg)
        {
            _rg.DataSource = this.All.ToList();
        }
    }
}