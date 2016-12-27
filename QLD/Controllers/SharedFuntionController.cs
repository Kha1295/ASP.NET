using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using System.Web.Handlers;
using System.Xml;
using System.Xml.Linq;
using System.Data.Entity.SqlServer;
using Newtonsoft.Json;
using System.Diagnostics;
using QLD.Library;
using QLD.Models;

namespace QLD.Controllers
{
    public class SharedFuntionController : Controller
    {
        private Entities db = new Entities();

        //public List<Role> GetRole()
        //{
        //    var roleList = new List<Role>();
        //    var a = db.Roles.Where(t => t.Parent == null && t.Status == 1);

        //    foreach (var cate in a)
        //    {
        //        roleList.Add(cate);
        //        var obj = db.Roles.Where(t => t.Parent == cate.RoleId && t.Status == 1);
        //        if (obj.Count() > 0)
        //        {
        //            roleList = GetRoleChild(roleList, cate.RoleId, 1);
        //        }
        //    }
        //    return roleList;
        //}
        //public List<Role> GetRoleChild(List<Role> roleList, int idParent, int leve)
        //{
        //    var a = db.Roles.Where(t => t.Parent == idParent && t.Status == 1);
        //    string s = "..................................";
        //    foreach (var cate in a)
        //    {
        //        cate.Name = s.Substring(0, leve * 3) + cate.Name;
        //        roleList.Add(cate);
        //        var obj = db.Roles.Where(t => t.Parent == cate.RoleId && t.Status == 1);
        //        if (obj.Count() > 0)
        //        {
        //            leve = leve + 1;
        //            roleList = GetRoleChild(roleList, cate.RoleId, leve); leve = leve - 1;
        //        }
        //    }
        //    return roleList;
        //}
        #region Hàm thông dụng
        public SelectList GetStatus(int? status)
        {
            var obj = new SelectList(DefineFuntion.ListStatus, "Value", "Text", status);
            return obj;
        }
        public SelectList GetUser()
        {
            User model = new Models.User();
            //var usr= Session["Account"];
            var obj1 = new SelectList(db.Users.Where(t => t.Status == 1 & t.Account==model.Account), "UserId", "Name");

            //Session["Account"] = obj.Account;
            //Session["UserId"] = obj.UserId;
            return obj1;
        }
        //public SelectList GetUser()
        //{
        //    var obj = new SelectList(db.Users.Where(t => t.Status == 1), "Name", "Name");
        //    return obj;
        //}

        public User GetUserById(int? id)
        {
            if (id != null)
            {
                var user = db.Users.Find(id);
                return user;
            }
            else
            {
                return new User();
            }
        }

        public SelectList GetServiceOther()
        {
            var obj = new SelectList(db.ServiceOthers, "ServiceOtherId", "Name");
            return obj;
        }
        public SelectList GetProvider()
        {
            var obj = new SelectList(db.Providers, "ProviderId", "Name");
            return obj;
        }
        public SelectList GetContract()
        {
            var obj = new SelectList(db.Contracts, "ContractId", "Name");
            return obj;
        }
        public SelectList GetPaymen()
        {
            var obj = new SelectList(db.Paymen, "PaymenId", "Name");
            return obj;
        }

        #endregion

        #region Lay ma tu dong
        public string GetOrderCode(string code)
        {
            return DateTime.Now.ToString("ddMMyyyymmhhss");
        }
        public string GetCodeExport(string codeFirst, string code)
        {
            var number = "0000000000";
            if (code == null) return codeFirst + "0000000001";
            code = code.Replace(codeFirst, "");
            var count = number.Length;
            var codeN = Convert.ToInt32(code);
            code = codeFirst + number.Substring(0, count - codeN.ToString().Length) + (codeN + 1);
            return code;
        }
        public string GetViewCode(string code)
        {
            return DateTime.Now.ToString("yyyyddMMmmhhss");
        }

        #endregion
        #region MyRegion
        public DateTime MondayOfWeek(DateTime date)
        {
            var dayOfWeek = date.DayOfWeek;

            if (dayOfWeek == DayOfWeek.Sunday)
            {
                //xét chủ nhật là đầu tuần thì thứ 2 là ngày kế tiếp nên sẽ tăng 1 ngày  
                //return date.AddDays(1);  

                // nếu xét chủ nhật là ngày cuối tuần  
                return date.AddDays(-6);
            }

            // nếu không phải thứ 2 thì lùi ngày lại cho đến thứ 2  
            int offset = dayOfWeek - DayOfWeek.Monday;
            return date.AddDays(-offset);
        }

        public DateTime SaturdayOfWeek(DateTime date)
        {
            return MondayOfWeek(DateTime.Now).AddDays(7);
        }
        public string[] UrlToStringArray()
        {
            System.Web.HttpContext curContext = System.Web.HttpContext.Current;
            var str = curContext.Request.Url.AbsoluteUri.Replace("//", "/");
            if (str.Contains("%"))
            {
                str = HttpUtility.UrlDecode(str);
                if (str.Contains("%"))
                {
                    str = HttpUtility.UrlDecode(str);
                }
            }
            return str.Split('/');
        }
        public string UrlDecode(string slug)
        {
            var str = slug;
            if (str.Contains("%"))
            {
                str = HttpUtility.UrlDecode(str);
                if (str.Contains("%"))
                {
                    str = HttpUtility.UrlDecode(str);
                }
            }
            return str;
        }

        #endregion
        public string[] GetRolesUser()
        {
            //var userId = DefineFuntion.UserId();
            //var objRS = db.UserGroupDetails.Where(t => t.UserId == userId).Select(t => t.RoleGroupId).ToArray();
            //var roler = db.RoleGroupDetails.Where(t => objRS.Contains(t.RoleGroupId)).Select(t => t.Role.Code).ToArray();
            //if (roler.Count() > 0) { return roler; }
            //else { return new String[] { };
            return new String[] { "QL" };

        }
        public string[] GetRolesUser(int idUser)
        {
            //var userId = DefineFuntion.UserId();
            //var objRS = db.UserGroupDetails.Where(t => t.UserId == userId).Select(t => t.RoleGroupId).ToArray();
            //var roler = db.RoleGroupDetails.Where(t => objRS.Contains(t.RoleGroupId)).Select(t => t.Role.Code).ToArray();
            //if (roler.Count() > 0) { return roler; }
            //else { return new String[] { }; }
            return new String[] { "QL" };
        }
        public string[] GetRolesUserMenu()
        {
            //var userId = DefineFuntion.UserId();
            //var objRS = db.UserGroupDetails.Where(t => t.UserId == userId).Select(t => t.RoleGroupId).ToArray();
            //var roler = db.RoleGroupDetails.Where(t => objRS.Contains(t.RoleGroupId)).Select(t => t.Role.Link).ToArray();
            //if (roler.Count() > 0) { return roler; }
            //else { return new String[] { }; }
            return new String[] { "QL" };
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);

        }
        public void CreateHistory(History history)
        {
            try
            {

                //history.CreateBy = DefineFuntion.UserAcount() + "";
                //history.CreateDay = DateTime.Now;
                //db.Histories.Add(history);
                //db.SaveChanges();
            }
            catch (Exception)
            { }

        }
        public int GetYear()
        {
            //var obj = db.WebConfigs.FirstOrDefault();
            //return obj.YearNow ?? 0;
            return 0;

        }
    }
}