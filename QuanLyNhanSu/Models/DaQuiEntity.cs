using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class DaQuiEntity
    {
        public DaQuiEntity() { }

        private string ConvertGiaTri(Models.DaQui _daqui)
        {
            if (_daqui.DQGiaTri % 1 == 0)
                return _daqui.DQGiaTri.ToString("#,###");
            else
                return _daqui.DQGiaTri.ToString("#,###,##");
        }

        private IEnumerable<object> All(int _kekhaiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DaQuis.Where(x => x.KKID == _kekhaiID).OrderByDescending(x => x.DQID).AsEnumerable().Select(x => new
            {
                DQID = x.DQID,
                DQTen = x.DQTen,
                DQSoLuong = x.DQSoLuong,
                DQGiaTri = this.ConvertGiaTri(x)
            });
        }

        public Models.DaQui Find(int _daquiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.DaQuis.FirstOrDefault(x => x.DQID == _daquiID);
        }

        public void Insert(int _kekhaiID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DaQui daqui = new DaQui();
            daqui.KKID = _kekhaiID;
            daqui.DQTen = _ten;
            daqui.DQSoLuong = _soluong;
            daqui.DQGiaTri = _giatri;
            db.DaQuis.Add(daqui);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _daquiID, string _ten, decimal _soluong, decimal _giatri)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DaQui daqui = db.DaQuis.FirstOrDefault(x => x.DQID == _daquiID);
            daqui.DQTen = _ten;
            daqui.DQSoLuong = _soluong;
            daqui.DQGiaTri = _giatri;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _daquiID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.DaQui daqui = db.DaQuis.FirstOrDefault(x => x.DQID == _daquiID);
            db.DaQuis.Remove(daqui);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllDaQuiOfNhanVien_ToRadGrid(RadGrid _radgrid, int _kekhaiID)
        {
            _radgrid.DataSource = this.All(_kekhaiID);
        }
    }
}