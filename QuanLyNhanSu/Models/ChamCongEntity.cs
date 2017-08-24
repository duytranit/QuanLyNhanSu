using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class ChamCongEntity
    {
        public ChamCongEntity() { }
        private Models.DonVi _firstDonViChamCong = new DonVi();
               

        private List<Models.DonVi> DonViChamCongList (Models.Account _loginAccount)
        {
            List<Models.DonVi> donvilist = new List<DonVi>();
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            if (_loginAccount.ACCChucNang == 0)
                donvilist = db.DonVis.Where(x => x.DVTrangThai == true).ToList();
            else
            {
                IEnumerable<Models.PhuTrachChamCong> ptccs = _loginAccount.PhuTrachChamCongs.Where(x => x.PCCCStatus == true);
                foreach (Models.PhuTrachChamCong phutrach in ptccs)
                    donvilist.Add(phutrach.DonVi);
            }
            return donvilist;
        }

        public Models.ChamCong Find(int _chamcongID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.ChamCongs.FirstOrDefault(x => x.CCID == _chamcongID);
        }

        public Models.ChamCong FindByNgayThangLamViec(int _lamviecID, DateTime _ngaythang)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.ChamCongs.FirstOrDefault(x => x.CCDATE == _ngaythang && x.LVID == _lamviecID);
        }

        public void Insert(int _lamviecID, DateTime _ngaythang, int _loaichamcongID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.ChamCong chamcong = db.ChamCongs.FirstOrDefault(x => x.LVID == _lamviecID && x.CCDATE ==_ngaythang);
            if (chamcong != null)
                db.ChamCongs.Remove(chamcong);
            chamcong = new ChamCong();
            chamcong.LVID = _lamviecID;
            chamcong.CCDATE = _ngaythang;
            chamcong.LCCID = _loaichamcongID;
            db.ChamCongs.Add(chamcong);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_DonViChamCongList_ToRadComboBox(RadComboBox _cbb, Models.Account _loginAccount)
        {
            List<Models.DonVi> donvis = this.DonViChamCongList(_loginAccount);
            _firstDonViChamCong = donvis.FirstOrDefault();
            _cbb.DataSource = donvis;
            _cbb.DataTextField = "DVTen";
            _cbb.DataValueField = "DVID";
            _cbb.DataBind();
        }
    }
}