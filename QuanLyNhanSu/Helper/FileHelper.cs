using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace QuanLyNhanSu.Helper
{
    public class FileHelper
    {
        public FileHelper() { }

        public void DownloadFile(string _path, string _filename, string _fileType)
        {
            try
            {
                _path = GetOnServerFileUrl() + _path + _filename;
                //string type = attachment["type"].ToString();
                HttpContext.Current.Response.ContentType = _fileType;
                String Header = "DownloadedFile; Filename=" + _filename;
                HttpContext.Current.Response.AppendHeader("Content-Disposition", Header);
                System.IO.FileInfo Dfile = new System.IO.FileInfo(_path);
                HttpContext.Current.Response.WriteFile(Dfile.FullName);
                HttpContext.Current.Response.End();
            }
            catch { }

        }

        public string SetFileUploadedName(string extension)
        {
            DateTime date = DateTime.Now;
            string year = date.Year.ToString();
            string month = date.Month.ToString();
            string day = date.Day.ToString();
            string hour = date.Hour.ToString();
            string minute = date.Minute.ToString();
            string second = date.Second.ToString();
            return year + month + day + hour + minute + second + extension;
        }

        public void SaveFile(FileUpload fileupload, string path, string fileName)
        {
            path = HttpContext.Current.Server.MapPath("~") + "\\Uploads\\" + path;
            //path = serverpath + "\\Uploads\\" + path;
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            fileupload.SaveAs(path + "\\" + fileName);
        }

        public void DeleteFile(string path)
        {
            path = HttpContext.Current.Server.MapPath("~") + "\\Uploads\\" + path;
            //path = serverpath + "\\Uploads\\" + path;

            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }
        }

        public string GetFileUrl()
        {
            return "http://" + HttpContext.Current.Request.ServerVariables["HTTP_HOST"];
        }

        public string GetOnServerFileUrl()
        {
            return HttpContext.Current.Server.MapPath("~");
        }
    }
}