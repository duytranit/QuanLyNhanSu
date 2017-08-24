using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class TrinhDoTinHocEntity
    {
        public TrinhDoTinHocEntity() { }

        public Models.TrinhDoTinHoc Find(int _trinhdotinhocID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.TrinhDoTinHocs.FirstOrDefault(x => x.TDTHID == _trinhdotinhocID);
        }

        private string ConvertChungChi(Models.TrinhDoTinHoc _trinhdotinhoc)
        {
            if (_trinhdotinhoc.TDChungChi)
                return "Chứng chỉ";
            else
                return "Hình thức khác";
        }

        private IEnumerable<object> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.TrinhDoTinHocs.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.TDTHID).AsEnumerable().Select(x => new
            {
                TDTHID = x.TDTHID,
                TDTHTen = x.TDTHTen,
                TDTHChungChi = this.ConvertChungChi(x)
            });
        }

        public void Insert(int _nhanvienID, string _trinhdotinhoc, bool _chungchi)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TrinhDoTinHoc tinhoc = new TrinhDoTinHoc();
            tinhoc.NVID = _nhanvienID;
            tinhoc.TDTHTen = _trinhdotinhoc;
            tinhoc.TDChungChi = _chungchi;
            db.TrinhDoTinHocs.Add(tinhoc);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _trinhdotinhocID, string _trinhdotinhoc, bool _chungchi)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TrinhDoTinHoc tinhoc = db.TrinhDoTinHocs.FirstOrDefault(x => x.TDTHID == _trinhdotinhocID);
            tinhoc.TDTHTen = _trinhdotinhoc;
            tinhoc.TDChungChi = _chungchi;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _trinhdotinhocID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TrinhDoTinHoc tinhoc = db.TrinhDoTinHocs.FirstOrDefault(x => x.TDTHID == _trinhdotinhocID);
            db.TrinhDoTinHocs.Remove(tinhoc);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllTrinhDoTinHocOfNhanVien_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}