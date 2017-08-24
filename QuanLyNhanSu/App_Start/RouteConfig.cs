using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace QuanLyNhanSu
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.EnableFriendlyUrls();

            //Đơn vị
            routes.MapPageRoute("DonVi", "DonVi", "~/View/DonVi/Admin/Index.aspx");
            routes.MapPageRoute("DonVi_New", "DonVi/TaoMoi", "~/View/DonVi/Admin/CUD.aspx");
            routes.MapPageRoute("DonVi_Update", "DonVi/{donvi}", "~/View/DonVi/Admin/CUD.aspx");

            //Nhân viên
            routes.MapPageRoute("NhanVien", "NhanSu", "~/View/NhanVien/Admin/Index.aspx");
            routes.MapPageRoute("NhanVien_New", "NhanSu/TaoMoi", "~/View/NhanVien/Admin/CUD.aspx");
            routes.MapPageRoute("NhanVien_Update", "NhanSu/{nhanvien}", "~/View/NhanVien/Admin/CUD.aspx");
            routes.MapPageRoute("CaNhan", "ThongTinCaNhan", "~/View/NhanVien/Admin/CaNhan.aspx");

            //Làm việc
            routes.MapPageRoute("LamViec_New", "NhanSu/{nhanvien}/LamViec", "~/View/LamViec/Admin/CUD.aspx");
            routes.MapPageRoute("LamViec_Update", "LamViec/{lamviec}", "~/View/LamViec/Admin/CUD.aspx");
            routes.MapPageRoute("LamViecTangLuong_Index", "DanhSachTangLuong", "~/View/LamViec/Admin/TangLuong.aspx");

            //Bằng cấp
            routes.MapPageRoute("BangCap", "BangCap", "~/View/BangCap/Index.aspx");

            //Trình độ ngoại ngữ
            routes.MapPageRoute("TrinhDoNgoaiNgu_New", "NhanSu/{nhanvien}/TrinhDoNgoaiNgu", "~/View/TrinhDoNgoaiNgu/Admin/CUD.aspx");
            routes.MapPageRoute("TrinhDoNgoaiNgu_Update", "TrinhDoNgoaiNgu/{trinhdongoaingu}", "~/View/TrinhDoNgoaiNgu/Admin/CUD.aspx");

            //Trình độ tin học
            routes.MapPageRoute("TrinhDoTinHoc_New", "NhanSu/{nhanvien}/TrinhDoTinHoc", "~/View/TrinhDoTinHoc/Admin/CUD.aspx");
            routes.MapPageRoute("TrinhDoTinHoc_Update", "TrinhDoTinHoc/{trinhdotinhoc}", "~/View/TrinhDoTinHoc/Admin/CUD.aspx");

            //Phong tăng danh hiệu
            routes.MapPageRoute("PhongTangDanhHieu_New", "NhanSu/{nhanvien}/PhongTangDanhHieu", "~/View/PhongTangDanhHieu/Admin/CUD.aspx");
            routes.MapPageRoute("PhongTangDanhHieu_Update", "PhongTangDanhHieu/{phongtangdanhhieu}", "~/View/PhongTangDanhHieu/Admin/CUD.aspx");

            //Khen thưởng
            routes.MapPageRoute("KhenThuong_New", "NhanSu/{nhanvien}/KhenThuong", "~/View/KhenThuong/Admin/CUD.aspx");
            routes.MapPageRoute("KhenThuong_Update", "KhenThuong/{khenthuong}", "~/View/KhenThuong/Admin/CUD.aspx");

            //Kỹ luật
            routes.MapPageRoute("KyLuat_New", "NhanSu/{nhanvien}/KyLuat", "~/View/KyLuat/Admin/CUD.aspx");
            routes.MapPageRoute("KyLuat_Update", "KyLuat/{kyluat}", "~/View/KyLuat/Admin/CUD.aspx");

            //Đánh giá
            routes.MapPageRoute("DanhGia_New", "NhanSu/{nhanvien}/DanhGia", "~/View/DanhGia/Admin/CUD.aspx");
            routes.MapPageRoute("DanhGia_Update", "DanhGia/{danhgia}", "~/View/DanhGia/Admin/CUD.aspx");

            //Chính Sách
            routes.MapPageRoute("ChinhSach_New", "NhanSu/{nhanvien}/ChinhSach", "~/View/ChinhSach/Admin/CUD.aspx");
            routes.MapPageRoute("ChinhSach_Update", "ChinhSach/{chinhsach}", "~/View/ChinhSach/Admin/CUD.aspx");

            //Kê khai nhà
            routes.MapPageRoute("Nha_New", "KeKhai/{kekhai}/Nha", "~/View/Nha/Admin/CUD.aspx");
            routes.MapPageRoute("Nha_Update", "Nha/{nha}", "~/View/Nha/Admin/CUD.aspx");

            //Tham gia CTXH            
            routes.MapPageRoute("TGCTXH_New", "NhanSu/{nhanvien}/CTXH", "~/View/ThamGiaCTXH/Admin/CUD.aspx");
            routes.MapPageRoute("TGCTXH_Update", "CTXH/{ctxh}", "~/View/ThamGiaCTXH/Admin/CUD.aspx");

            //Chức vụ
            routes.MapPageRoute("ChucVu", "ChucVu", "~/View/ChucVu/Admin/Index.aspx");
            routes.MapPageRoute("ChucVu_New", "ChucVu/TaoMoi", "~/View/ChucVu/Admin/CUD.aspx");
            routes.MapPageRoute("ChucVu_Update", "ChucVu/{chucvu}", "~/View/ChucVu/Admin/CUD.aspx");

            //Kê khai tài sản
            routes.MapPageRoute("KeKhai_New", "NhanSu/{nhanvien}/KeKhai", "~/View/KeKhai/Admin/CUD.aspx");
            routes.MapPageRoute("KeKhai_Update", "KeKhai/{kekhai}", "~/View/KeKhai/Admin/CUD.aspx");

            //Kê khai tiền
            routes.MapPageRoute("KeKhaiTien_New", "KeKhai/{kekhai}/KeKhaiTien", "~/View/Tien/Admin/CUD.aspx");
            routes.MapPageRoute("KeKhaiTien_Update", "KeKhaiTien/{tien}", "~/View/Tien/Admin/CUD.aspx");

            //Kê khai động sản
            routes.MapPageRoute("KeKhaiDongSan_New", "KeKhai/{kekhai}/KeKhaiDongSan", "~/View/DongSan/Admin/CUD.aspx");
            routes.MapPageRoute("KeKhaiDongSan_Update", "KeKhaiDongSan/{dongsan}", "~/View/DongSan/Admin/CUD.aspx");

            //Kê khai đá quí
            routes.MapPageRoute("KeKhaiDaQui_New", "KeKhai/{kekhai}/KeKhaiDaQui", "~/View/DaQui/Admin/CUD.aspx");
            routes.MapPageRoute("KeKhaiDaQui_Update", "KeKhaiDaQui/{daqui}", "~/View/DaQui/Admin/CUD.aspx");

            //Đất
            routes.MapPageRoute("Dat_New", "KeKhai/{kekhai}/Dat", "~/View/Dat/Admin/CUD.aspx");
            routes.MapPageRoute("Dat_Update", "Dat/{dat}", "~/View/Dat/Admin/CUD.aspx");

            //Tài sản khác
            routes.MapPageRoute("TaiSanKhac_New", "KeKhai/{kekhai}/TaiSanKhac", "~/View/TaiSanKhac/Admin/CUD.aspx");
            routes.MapPageRoute("TaiSanKhac_Update", "TaiSanKhac/{taisan}", "~/View/TaiSanKhac/Admin/CUD.aspx");

            //Tài sản nước ngoài
            routes.MapPageRoute("TaiSanNuocNgoai_New", "KeKhai/{kekhai}/TaiSanNuocNgoai", "~/View/TaiSanNuocNgoai/Admin/CUD.aspx");
            routes.MapPageRoute("TaiSanNuocNgoai_Update", "TaiSanNuocNgoai/{taisan}", "~/View/TaiSanNuocNgoai/Admin/CUD.aspx");

            //Các khoản nợ
            routes.MapPageRoute("KhoanNo_New", "KeKhai/{kekhai}/KhoanNo", "~/View/KhoanNo/Admin/CUD.aspx");
            routes.MapPageRoute("KhoanNo_Update", "KhoanNo/{khoanno}", "~/View/KhoanNo/Admin/CUD.aspx");

            //Thu nhập
            routes.MapPageRoute("ThuNhap_New", "KeKhai/{kekhai}/ThuNhap", "~/View/ThuNhap/Admin/CUD.aspx");
            routes.MapPageRoute("ThuNhap_Update", "ThuNhap/{thunhap}", "~/View/ThuNhap/Admin/CUD.aspx");

            //Giải trình
            routes.MapPageRoute("GiaiTrinh_New", "KeKhai/{kekhai}/GiaiTrinh", "~/View/GiaiTrinh/Admin/CUD.aspx");
            routes.MapPageRoute("GiaiTrinh_Update", "GiaiTrinh/{giaitrinh}", "~/View/GiaiTrinh/Admin/CUD.aspx");

            //Kê khai con
            routes.MapPageRoute("KeKhaiCon_New", "KeKhai/{kekhai}/KeKhaiCon", "~/View/KeKhaiCon/Admin/CUD.aspx");
            routes.MapPageRoute("KeKhaiCon_Update", "KeKhaiCon/{concai}", "~/View/KeKhaiCon/Admin/CUD.aspx");

            //Hệ số lương
            routes.MapPageRoute("HeSoLuong", "HeSoLuong", "~/View/HeSoLuong/Admin/Index.aspx");
            routes.MapPageRoute("HeSoLuong_New", "HeSoLuong/TaoMoi", "~/View/HeSoLuong/Admin/CUD.aspx");
            routes.MapPageRoute("HeSoLuong_Update", "HeSoLuong/{hesoluong}", "~/View/HeSoLuong/Admin/CUD.aspx");

            //Quá trình đào tạo
            routes.MapPageRoute("QuaTrinhDaoTao_New", "NhanSu/{nhanvien}/QuaTrinhDaoTao", "~/View/QuaTrinhDaoTao/Admin/CUD.aspx");
            routes.MapPageRoute("QuaTrinhDaoTao_Update", "QuaTrinhDaoTao/{quatrinhdaotao}", "~/View/QuaTrinhDaoTao/Admin/CUD.aspx");

            //Quan hệ
            routes.MapPageRoute("QuanHe_New", "NhanSu/{nhanvien}/QuanHe", "~/View/QuanHe/Admin/CUD.aspx");
            routes.MapPageRoute("QuanHe_Update", "QuanHe/{quanhe}", "~/View/QuanHe/Admin/CUD.aspx");

            //Quan hệ công tác
            routes.MapPageRoute("QuanHeCongTac_New", "QuanHe/{quanhe}/CongTac", "~/View/QuanHeCongTac/Admin/CUD.aspx");
            routes.MapPageRoute("QuanHeCongTac_Update", "QuanHeCongTac/{quanhecongtac}", "~/View/QuanHeCongTac/Admin/CUD.aspx");

            //Đánh giá lao động
            routes.MapPageRoute("DanhGiaLaoDong_New", "NhanSu/{nhanvien}/DanhGiaLaoDong", "~/View/DanhGiaLaoDong/Admin/CUD.aspx");
            routes.MapPageRoute("DanhGiaLaoDong_Update", "DanhGiaLaoDong/{danhgia}", "~/View/DanhGiaLaoDong/Admin/CUD.aspx");

            //Đánh giá viên chức
            routes.MapPageRoute("DanhGiaVienChuc_New", "NhanSu/{nhanvien}/DanhGiaVienChuc", "~/View/DanhGiaVienChuc/Admin/CUD.aspx");
            routes.MapPageRoute("DanhGiaVienChuc_Update", "DanhGiaVienChuc/{danhgia}", "~/View/DanhGiaVienChuc/Admin/CUD.aspx");

            //Đánh giá đảng viên
            routes.MapPageRoute("DanhGiaDangVien_New","NhanSu/{nhanvien}/DanhGiaDangVien", "~/View/DanhGiaDangVien/Admin/CUD.aspx");
            routes.MapPageRoute("DanhGiaDangVien_Update", "DanhGiaDangVien/{danhgia}", "~/View/DanhGiaDangVien/Admin/CUD.aspx");

            //Tài khoản
            routes.MapPageRoute("Account_Index", "TaiKhoan", "~/View/Account/Admin/Index.aspx");
            routes.MapPageRoute("Account_New", "TaiKhoan/TaoMoi", "~/View/Account/Admin/CUD.aspx");
            routes.MapPageRoute("Account_Update", "TaiKhoan/{account}", "~/View/Account/Admin/CUD.aspx");
            routes.MapPageRoute("Account_OwnAccount", "CapNhatTaiKhoan", "~/View/Account/Admin/LoginAccount.aspx");

            //Chấm công
            routes.MapPageRoute("ChamCong_Index", "ChamCong", "~/View/ChamCong/Admin/Index.aspx");
            routes.MapPageRoute("ChamCong_DonVi", "ChamCong/{donvi}/{ngaythang}", "~/View/ChamCong/Admin/Index.aspx");
            routes.MapPageRoute("ChamCong_New", "LamViec/{lamviec}/ChamCong/{ngaythang}", "~/View/ChamCong/Admin/CUD.aspx");

            //Thống kê chấm công
            routes.MapPageRoute("ThongKeChamCong_Index", "ThongKeChamCong", "~/View/ChamCong/Admin/ThongKe.aspx");
            
            //Phụ trách chấm công
            routes.MapPageRoute("PhuTrachChamCong_Index", "PhuTrachChamCong", "~/View/PhuTrachChamCong/Admin/Index.aspx");
            routes.MapPageRoute("PhuTrachChamCong_New", "PhuTrachChamCong/TaoMoi", "~/View/PhuTrachChamCong/Admin/CUD.aspx");
            routes.MapPageRoute("PhuTrachChamCong_Update", "PhuTrachChamCong/{phutrach}", "~/View/PhuTrachChamCong/Admin/CUD.aspx");
        }
    }
}
