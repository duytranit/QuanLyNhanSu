using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyNhanSu.Helper
{
    public class ExportHelper
    {
        public ExportHelper() { }

        public void ExportWordFile(string _filename, string _htmlcontent, bool _portrait)
        {
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/vnd.ms-word";
            //HttpContext.Current.Response.ContentEncoding = System.Text.UnicodeEncoding.UTF8;
            HttpContext.Current.Response.Charset = "UTF-8";
            string strFileName = _filename + ".doc";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + strFileName);
            HttpContext.Current.Response.Write("<html>");
            HttpContext.Current.Response.Write("<head>");
            HttpContext.Current.Response.Write("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">");
            HttpContext.Current.Response.Write("<meta name=ProgId content=Word.Document>");
            HttpContext.Current.Response.Write("<meta name=Generator content=\"Microsoft Word 9\">");
            HttpContext.Current.Response.Write("<meta name=Originator content=\"Microsoft Word 9\">");
            HttpContext.Current.Response.Write("<style>");
            HttpContext.Current.Response.Write("@page Section1 {size:595.45pt 841.7pt; margin:1.0in 1.25in 1.0in 1.25in;mso-header-margin:.5in;mso-footer-margin:.5in;mso-paper-source:0;}");
            HttpContext.Current.Response.Write("div.Section1 {page:Section1;}");
            HttpContext.Current.Response.Write("@page Section2 {size:841.7pt 595.45pt;mso-page-orientation:landscape;margin:0.5in 0.5in 0.5in 0.5in;mso-header-margin:.5in;mso-footer-margin:.5in;mso-paper-source:0;}");
            HttpContext.Current.Response.Write("div.Section2 {page:Section2;}");
            HttpContext.Current.Response.Write("</style>");
            HttpContext.Current.Response.Write("</head>");
            HttpContext.Current.Response.Write("<body>");
            if (_portrait)
                HttpContext.Current.Response.Write("<div class=Section1>");
            else
                HttpContext.Current.Response.Write("<div class=Section2>");
            HttpContext.Current.Response.Write(_htmlcontent);
            HttpContext.Current.Response.Write("</div>");
            HttpContext.Current.Response.Write("</body>");
            HttpContext.Current.Response.Write("</html>");
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
    }
}