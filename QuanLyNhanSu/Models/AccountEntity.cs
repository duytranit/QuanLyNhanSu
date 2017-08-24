using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;

namespace QuanLyNhanSu.Models
{
    public class AccountEntity
    {
        public AccountEntity() { }

        private string ConvertStatus(Models.Account _acc)
        {
            if (_acc.ACCStatus)
                return "Kích hoạt";
            else
                return "Khóa";
        }

        private string ConvertChucNang(Models.Account _acc)
        {
            string chucnang = "Chức năng nhân viên";
            switch (_acc.ACCChucNang)
            {
                case 0:
                    chucnang = "Chức năng quản trị";
                    break;
                case 1:
                    chucnang = "Chức năng quản lý";
                    break;
                default:
                    chucnang = "Chức năng nhân viên";
                    break;
            }
            return chucnang;
        }

        private IEnumerable<object> All
        {
            get
            {
                Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
                return db.Accounts.Where(x => x.ACCChucNang > 0).OrderByDescending(x => x.ACCID).AsEnumerable().Select(x => new
                {
                    ACCID = x.ACCID,
                    ACCEmail = x.ACCEmail,
                    ACCStatus = this.ConvertStatus(x),
                    ACCChucNang = this.ConvertChucNang(x),
                    NVTen = x.NhanVien.NVTen
                });
            }
        }

        public Models.Account Find(int _accountID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.Accounts.FirstOrDefault(x => x.ACCID == _accountID);
        }

        public Models.Account FindByEmail(string _email)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.Accounts.FirstOrDefault(x => x.ACCEmail.Equals(_email));
        }

        public Models.Account Login(string _email, string _password)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            return db.Accounts.FirstOrDefault(x => x.ACCEmail.Equals(_email) && x.ACCPassword.Equals(_password));
        }

        public void Insert(int _nhanvienID, string _email, string _password, int _chucnang, bool _status, bool _upThongTinCaNhan, 
            bool _upLyLich, bool _inLyLich, bool _inKeKhai, bool _upKeKhai, bool _inDanhGia, bool _upDanhGia)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Account account = new Account();
            account.NVID = _nhanvienID;
            account.ACCEmail = _email;
            account.ACCPassword = _password;
            account.ACCChucNang = _chucnang;
            account.ACCStatus = _status;
            account.ACCUpThongTinCaNhan = _upThongTinCaNhan;
            account.ACCUpLyLich = _upLyLich;
            account.ACCInLyLich = _inLyLich;
            account.ACCInKeKhai = _inKeKhai;
            account.ACCUpKeKhai = _upKeKhai;
            account.ACCInDanhGia = _inDanhGia;
            account.ACCUpDanhGia = _upDanhGia;
            db.Accounts.Add(account);
            db.SaveChanges();
            db.Dispose();
        }

        public void Update(int _nhanvienID, int _accountID, int _chucnang, bool _status, bool _upThongTinCaNhan, 
            bool _upLyLich, bool _inLyLich, bool _inKeKhai, bool _upKeKhai, bool _inDanhGia, bool _upDanhGia)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Account account = db.Accounts.FirstOrDefault(x => x.ACCID == _accountID);
            account.NVID = _nhanvienID;
            account.ACCChucNang = _chucnang;
            account.ACCStatus = _status;
            account.ACCUpThongTinCaNhan = _upThongTinCaNhan;
            account.ACCUpLyLich = _upLyLich;
            account.ACCInLyLich = _inLyLich;
            account.ACCInKeKhai = _inKeKhai;
            account.ACCUpKeKhai = _upKeKhai;
            account.ACCInDanhGia = _inDanhGia;
            account.ACCUpDanhGia = _upDanhGia;
            db.SaveChanges();
            db.Dispose();
        }

        public void UpdateOwnAccount(string _email, string _password)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Account account = db.Accounts.FirstOrDefault(x => x.ACCEmail.Equals(_email));
            account.ACCPassword = _password;
            db.SaveChanges();
            db.Dispose();
        }

        public void Delete(int _accountID)
        {
            Models.EmployeeManagementEntities db = new EmployeeManagementEntities();
            Models.Account account = db.Accounts.FirstOrDefault(x => x.ACCID == _accountID);
            db.Accounts.Remove(account);
            db.SaveChanges();
            db.Dispose();
        }

        public void Load_AllAccount_ToRadGrid(RadGrid _rg)
        {
            _rg.DataSource = this.All.ToList();
        }

        public void Load_AllAccount_ToRadComboBox(RadComboBox _cbb)
        {
            _cbb.DataSource = this.All.ToList();
            _cbb.DataTextField = "ACCEmail";
            _cbb.DataValueField = "ACCID";
            _cbb.DataBind();
        }
    }
}