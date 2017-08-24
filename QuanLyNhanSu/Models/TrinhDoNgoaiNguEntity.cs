using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class TrinhDoNgoaiNguEntity
    {
        public TrinhDoNgoaiNguEntity() { }

        private string ConvertChungChi(Models.TrinhDoNgoaiNgu _ngoaingu)
        {
            if (_ngoaingu.TDNNChungChi)
                return "Chứng chỉ";
            else
                return "Hình thức khác";
        }

        private string ConvertTiengDanToc(Models.TrinhDoNgoaiNgu _ngoaingu)
        {
            if (_ngoaingu.TDNNTiengDanToc)
                return "Tiếng dân tộc";
            else
                return "Tiếng quốc ngữ";
        }

        private IEnumerable<object> All(int _nhanvienID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.TrinhDoNgoaiNgus.Where(x => x.NVID == _nhanvienID).OrderByDescending(x => x.TDNNID).AsEnumerable().Select(x => new
            {
                TDNNID = x.TDNNID,
                TDNNTen = x.TDNNTen,
                TDNNChungChi = this.ConvertChungChi(x),
                TDNNTiengDanToc = this.ConvertTiengDanToc(x)
            });
        }

        public Models.TrinhDoNgoaiNgu Find(int _ngoainguID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.TrinhDoNgoaiNgus.FirstOrDefault(x => x.TDNNID == _ngoainguID);
        }

        public void Insert(int _nhanvienID, string _ten, bool _chungchi, bool _tiengdantoc)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TrinhDoNgoaiNgu ngoaingu = new TrinhDoNgoaiNgu();
            ngoaingu.NVID = _nhanvienID;
            ngoaingu.TDNNTen = _ten;
            ngoaingu.TDNNChungChi = _chungchi;
            ngoaingu.TDNNTiengDanToc = _tiengdantoc;
            db.TrinhDoNgoaiNgus.Add(ngoaingu);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _ngoainguID, string _ten, bool _chungchi, bool _tiengdantoc)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TrinhDoNgoaiNgu ngoaingu = db.TrinhDoNgoaiNgus.FirstOrDefault(x => x.TDNNID == _ngoainguID);
            ngoaingu.TDNNTen = _ten;
            ngoaingu.TDNNChungChi = _chungchi;
            ngoaingu.TDNNTiengDanToc = _tiengdantoc;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _ngoainguID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.TrinhDoNgoaiNgu ngoaingu = db.TrinhDoNgoaiNgus.FirstOrDefault(x => x.TDNNID == _ngoainguID);
            db.TrinhDoNgoaiNgus.Remove(ngoaingu);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllTrinhDoNgoaiNgu_ToRadGrid(RadGrid _rg, int _nhanvienID)
        {
            _rg.DataSource = this.All(_nhanvienID).ToList();
        }
    }
}