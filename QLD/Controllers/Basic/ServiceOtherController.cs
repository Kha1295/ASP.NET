using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using PagedList;
using QLD.Library;
using QLD.Models;
using Microsoft.AspNet.Identity;


namespace QLD.Controllers.Basic
{
    [Authorize, RoutePrefix("Admin/ServiceOther")]
    public class ServiceOtherController : Controller
    {
        // GET: ServiceOther
        private Entities db = new Entities();
        private SharedFuntionController shared = new SharedFuntionController();
        [Route("Index")]
        [Authorize(Roles = "QL,ServiceOther,ServiceOtherV")]
        public ActionResult Index(string sortOrder, string searchString, int? numberRow, int? page)
        {
            ViewBag.Mess = 0;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NumberRow = Convert.ToInt32(numberRow) <= 0 ? 20 : Convert.ToInt32(numberRow);
            ViewBag.SearchString = searchString;
            DefineSort(sortOrder);
            var obj = db.ServiceOthers.Where(t => t.Status != 3).ToList();
            obj = Authorities(obj);
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower();
                var searchStr = DefineFuntion.RemoveCharAndNoSign(searchString);
                obj = obj.Where(s => (s.Name ?? "").ToLower().Contains(searchStr)).ToList();
            }
            obj = EvenSort(obj, sortOrder);
            int pageSize = Convert.ToInt32(numberRow) <= 0 ? 20 : Convert.ToInt32(numberRow);
            int pageNumber = (page ?? 1);
            return View(obj.ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        [Route("Index")]
        [Authorize(Roles = "QL,ServiceOther,ServiceOtherV")]
        public ActionResult Index(FormCollection form, string typeName, string searchString, int? numberRow)
        {
            SetDefineSort();
            ViewBag.SearchString = searchString;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NumberRow = Convert.ToInt32(numberRow) <= 0 ? 20 : Convert.ToInt32(numberRow);
            var inputCheck = form.GetValues("inputCheck");
            ViewBag.Mess = EvenList(inputCheck, typeName);
            if (ViewBag.Mess == 7)
                return RedirectToAction("Edit", "ServiceOther", new { Id = ViewBag.id, mess = 0 });
            var obj = db.ServiceOthers.Where(t => t.Status < 3).ToList();
            obj = Authorities(obj);
            if (typeName == "refresh")
            {
                ViewBag.SearchString = "";
            }
            else if (!String.IsNullOrEmpty(searchString))
            {
                ViewBag.SearchString = searchString;
                searchString = searchString.ToLower();
                obj = db.ServiceOthers.Where(c => (c.Name ?? "").ToLower().Contains(searchString)).ToList();
            }
            int pageSize = (numberRow ?? 20);
            int pageNumber = 1;
            return View(obj.ToPagedList(pageNumber, pageSize));

        }
        [Authorize(Roles = "QL,ServiceOther,ServiceOtherU")]
        private int EventStatus(string[] inputCheck, string typeName)
        {
            int rowFinish = 0;
            if (inputCheck == null) return rowFinish;
            foreach (var s in inputCheck)
            {
                try
                {
                    int id = Convert.ToInt32(DefineFuntion.Decrypt(s));
                    var obj = db.ServiceOthers.Find(id);
                    if (typeName == "activity")
                        obj.Status = 1;//Cho phép dùng
                    else if (typeName == "inactive")
                        obj.Status = 2;//Không cho dung 
                    else if (typeName == "trash")
                        obj.Status = 3;//Dưa vào thùng rác
                    db.Entry(obj).State = EntityState.Modified;
                    db.SaveChanges();
                    rowFinish++;
                }
                catch (Exception) { }
            }
            return rowFinish;
        }
        private int EvenList(string[] inputCheck, string typeName)
        {
            int rowFinish = 0;
            int ms = 0;
            if (inputCheck != null)
            {
                int rowTotla = inputCheck.Count();
                switch (typeName)
                {
                    case "activity":
                        ms = 5; rowFinish = EventStatus(inputCheck, "activity");
                        break;
                    case "inactive":
                        ms = 5; rowFinish = EventStatus(inputCheck, "inactive");
                        break;
                    case "public":
                        ms = 5; rowFinish = EventStatus(inputCheck, "public");
                        break;
                    case "private":
                        ms = 5; rowFinish = EventStatus(inputCheck, "private");
                        break;
                    case "publicnote":
                        ms = 5; rowFinish = EventStatus(inputCheck, "publicnote");
                        break;
                    case "privatenote":
                        ms = 5; rowFinish = EventStatus(inputCheck, "privatenote");
                        break;
                    case "trash":
                        ms = 5; rowFinish = EventStatus(inputCheck, "trash");
                        break;
                    case "delete":
                        ms = 6; rowFinish = DeleteConfirmed(inputCheck);
                        break;
                    case "edit":
                        ms = 7; ViewBag.id = inputCheck.First();
                        break;

                }
                ViewBag.rowError = rowTotla - rowFinish;
            }
            ViewBag.rowFinish = rowFinish;
            return ms;
        }
        private void DefineSort(string sortOrder)
        {
            ViewBag.Status = sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.Name = sortOrder == "Name" ? "Name_desc" : "Name";
            ViewBag.Address = sortOrder == "Address" ? "Address_desc" : "Address";
            ViewBag.AddressShow = sortOrder == "AddressShow" ? "AddressShow_desc" : "AddressShow";
            ViewBag.Description = sortOrder == "Description" ? "Description_desc" : "Description";
            ViewBag.Contents = sortOrder == "Contents" ? "Contents_desc" : "Contents";
            ViewBag.UpdateBy = sortOrder == "UpdateBy" ? "UpdateBy_desc" : "UpdateBy";
            ViewBag.UpdateDay = sortOrder == "UpdateDay" ? "UpdateDay_desc" : "UpdateDay";
        }   
        private List<ServiceOther> EvenSort(List<ServiceOther> obj, string sortOrder)
        {
            switch (sortOrder)
            {
                case "Name":
                    obj = obj.OrderBy(s => s.Name).ToList();
                    break;
                case "Name_desc":
                    obj = obj.OrderByDescending(s => s.Name).ToList();
                    break;
                case "Address":
                    obj = obj.OrderBy(s => s.Address).ToList();
                    break;
                case "Address_desc":
                    obj = obj.OrderByDescending(s => s.Address).ToList();
                    break;
                case "AddressShow":
                    obj = obj.OrderBy(s => s.AddressShow).ToList();
                    break;
                case "AddressShow_desc":
                    obj = obj.OrderByDescending(s => s.AddressShow).ToList();
                    break;
                case "Description":
                    obj = obj.OrderBy(s => s.Description).ToList();
                    break;
                case "Description_desc":
                    obj = obj.OrderByDescending(s => s.Description).ToList();
                    break;
                case "Contents":
                    obj = obj.OrderBy(s => s.Contents).ToList();
                    break;
                case "Contents_desc":
                    obj = obj.OrderByDescending(s => s.Contents).ToList();
                    break;
                case "Status":
                    obj = obj.OrderBy(s => s.Status).ToList();
                    break;
                case "Status_desc":
                    obj = obj.OrderByDescending(s => s.Status).ToList();
                    break;
                case "UpdateBy":
                    obj = obj.OrderBy(s => s.UpdateBy).ToList();
                    break;
                case "UpdateBy_desc":
                    obj = obj.OrderByDescending(s => s.UpdateBy).ToList();
                    break;
                case "UpdateDay":
                    obj = obj.OrderBy(s => s.UpdateDay).ToList();
                    break;
                case "UpdateDay_desc":
                    obj = obj.OrderByDescending(s => s.UpdateDay).ToList();
                    break;
               
                default:
                    obj = obj.OrderByDescending(s => s.ServiceOtherId).ToList();
                    break;
            }
            return obj;
        }

        private List<ServiceOther> Authorities(List<ServiceOther> obj)
        {
            //var objTourGroup = DefineFuntion.CheckRole("CareerGroup");

            //if (objTourGroup)
            //{
            //    var objU = db.Users.AsEnumerable().Where(t => t.Type == 1 && t.UserId == DefineFuntion.UserId()).FirstOrDefault();
            //    var department = objU.Department.Split(',');
            //    obj = obj.AsEnumerable().Where(t => t.DepartmentId != "null" && department.Intersect(JsonConvert.DeserializeObject<string[]>(t.DepartmentId ?? "[]")).Count() > 0).ToList();
            //}

            return obj;
        }
        private void SetDefineSort()
        {
            ViewBag.Status = "Status";
            ViewBag.Name = "Name";
            ViewBag.Address = "Address";
            ViewBag.AddressShow = "AddressShow";
            ViewBag.Description = "Description";
            ViewBag.Contents = "Contents";
            ViewBag.CreateBy = "UpdateBy";
            ViewBag.CreateDay = "UpdateDay";

        }
        [Authorize(Roles = "QL,ServiceOther,ServiceOtherD")]
        public int DeleteConfirmed(string[] inputCheck)
        {
            //System.Windows.Forms.DialogResult dailogresult = System.Windows.Forms.MessageBox.Show("Bạn có chắc chắn xóa!", "Thông báo", System.Windows.Forms.MessageBoxButtons.YesNo);
            int rowFinish = 0;
            if (inputCheck == null) return rowFinish;
            foreach (var s in inputCheck)
            {

                try
                {
                    int idMenu = Convert.ToInt32(DefineFuntion.Decrypt(s));
                    ServiceOther obj = db.ServiceOthers.Find(idMenu);
                    //1-them, 2- sua, 3-xoa, 4- khac
                    shared.CreateHistory(new History()
                    {
                        Name = "Xóa Dịch Vụ",
                        Contens = JsonConvert.SerializeObject(obj, Formatting.Indented, new JsonSerializerSettings() { ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore }),
                        ItemId = obj.ServiceOtherId,
                        Type = (int)DefineFuntion.TypeHistory.ServiceOther,
                    });
                    db.ServiceOthers.Remove(obj);
                    db.SaveChanges();
                    rowFinish++;

                }
                catch (Exception)
                {
                    int idMenu = Convert.ToInt32(DefineFuntion.Decrypt(s));
                    ServiceOther obj = db.ServiceOthers.Find(idMenu);
                    obj.Status = 3;
                    db.SaveChanges();

                }
            }
            return rowFinish;
        }
        [Route("Trash")]

        [Authorize(Roles = "QL,ServiceOther,ServiceOtherV")]

        public ActionResult Trash(string sortOrder, string searchString, int? nunberRow, int? page)
        {
            ViewBag.Mess = 0;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NunberRow = Convert.ToInt32(nunberRow) <= 0 ? 20 : Convert.ToInt32(nunberRow);
            ViewBag.SearchString = searchString;
            ViewBag.CurrentSort = sortOrder;
            ViewBag.IdSortParm = String.IsNullOrEmpty(sortOrder) ? "Id_desc" : "";
            DefineSort(sortOrder);
            var obj = db.ServiceOthers.Where(t => t.Status == 3).ToList();
            obj = Authorities(obj);
            if (!String.IsNullOrEmpty(searchString))
            {
                page = 1;
                obj = obj.Where(s => (s.Name ?? "").ToLower().Contains(searchString.ToLower()) && s.Status == 3).ToList();
            }
            obj = EvenSort(obj, sortOrder);
            int pageSize = Convert.ToInt32(nunberRow) <= 0 ? 20 : Convert.ToInt32(nunberRow);
            int pageNumber = (page ?? 1);
            return View(obj.ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        [Route("Trash")]

        [Authorize(Roles = "QL,ServiceOther,ServiceOtherV")]

        public ActionResult Trash(FormCollection form, string typeName, string searchString, int? nunberRow)
        {
            SetDefineSort();
            ViewBag.SearchString = searchString;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NunberRow = Convert.ToInt32(nunberRow) <= 0 ? 20 : Convert.ToInt32(nunberRow);
            var inputCheck = form.GetValues("inputCheck");
            int rowFinish = 0;
            int ms = 0;
            #region even
            if (inputCheck != null)
            {
                int rowTotla = inputCheck.Count();
                switch (typeName)
                {
                    case "activity":
                        ms = 5; rowFinish = EventStatus(inputCheck, "activity");
                        break;
                    case "inactive":
                        ms = 5; rowFinish = EventStatus(inputCheck, "inactive");
                        break;
                    case "public":
                        ms = 5; rowFinish = EventStatus(inputCheck, "public");
                        break;
                    case "private":
                        ms = 5; rowFinish = EventStatus(inputCheck, "private");
                        break;
                    case "publicnote":
                        ms = 5; rowFinish = EventStatus(inputCheck, "publicnote");
                        break;
                    case "privatenote":
                        ms = 5; rowFinish = EventStatus(inputCheck, "privatenote");
                        break;
                    case "trash":
                        ms = 5; rowFinish = EventStatus(inputCheck, "trash");
                        break;
                    case "delete":
                        ms = 6; rowFinish = DeleteConfirmed(inputCheck);
                        break;
                    case "edit":
                        return RedirectToAction("Edit", new { id = inputCheck.First(), type = "saveedit" });

                }
                ViewBag.rowError = rowTotla - rowFinish;
            }
            ViewBag.rowFinish = rowFinish;
            ViewBag.Mess = ms;
            #endregion
            var obj = db.ServiceOthers.Where(t => t.Status == 3).OrderByDescending(t => t.ServiceOtherId).ToList();
            obj = Authorities(obj);
            if (typeName == "refresh")
            {
                ViewBag.SearchString = "";
            }
            else if (!String.IsNullOrEmpty(searchString))
            {
                ViewBag.SearchString = searchString;
                searchString = searchString.ToLower();
                obj = db.ServiceOthers.Where(c => (c.Name ?? "").ToLower().Contains(searchString)).ToList();
            }
            int pageSize = (nunberRow ?? 20);
            int pageNumber = 1;
            return View(obj.ToPagedList(pageNumber, pageSize));

        }
        [Route("Create")]

        [Authorize(Roles = "QL,ServiceOther,ServiceOtherC")]

        public ActionResult Create(int? mess)
        {
            ViewBag.Mess = (mess ?? 0);
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", 1);
            //ViewBag.CreateBy = shared.GetUser();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Create")]
        [ValidateInput(false)]

        [Authorize(Roles = "QL,ServiceOther,ServiceOtherC")]

        public ActionResult Create(ServiceOther ServiceOther, string typeName)
        {
            var shared = new SharedFuntionController();
            int ms = 0;
            try
            {
                var dat = DateTime.Now.ToString("MM'/'dd'/'yyyy HH:mm:ss");

                ServiceOther.CreateBy = @User.Identity.GetUserName();
                ServiceOther.CreateDay =DateTime.Parse(dat);
                db.ServiceOthers.Add(ServiceOther);
                db.SaveChanges();
                ms = 1;
                //1-them, 2- sua, 3-xoa, 4- khac
                shared.CreateHistory(new History()
                {
                    Name = "Thêm Dịch Vụ",
                    Contens = "",
                    ItemId = ServiceOther.ServiceOtherId,
                    Type = (int)DefineFuntion.TypeHistory.ServiceOther,
                });
            }
            catch (Exception)
            {
                ms = 2;
            }
            if (ms != 2)
            {
                if (typeName == "savenew" || typeName == "")
                    return RedirectToAction("Create", new { mess = ms });
                else
                {
                    return RedirectToAction("Edit", new { id = DefineFuntion.Encrypt(ServiceOther.ServiceOtherId), mess = ms });
                }
            }
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", ServiceOther.Status);
            return View("Create", "ServiceOther");
        }
        // GET: /Menu/Edit/5
        [Route("Edit")]

        [Authorize(Roles = "QL,ServiceOther,ServiceOtherU")]

        public ActionResult Edit(string id, int? mess)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int obj = Convert.ToInt32(DefineFuntion.Decrypt(id));
            var ServiceOther = db.ServiceOthers.Find(obj);
            if (ServiceOther == null)
            {
                return HttpNotFound();
            }
            ViewBag.Mess = (mess ?? 0);
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", ServiceOther.Status);

            return View(ServiceOther);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Edit")]
        [ValidateInput(false)]

        [Authorize(Roles = "QL,ServiceOther,ServiceOtherU")]

        public ActionResult Edit(ServiceOther ServiceOther, string codeSystem, string typeName)
        {
            ServiceOther.ServiceOtherId = Convert.ToInt32(DefineFuntion.Decrypt(codeSystem));
            int ms = 0;
            var me = db.ServiceOthers.Find(ServiceOther.ServiceOtherId);
            try
            {
                var dat = DateTime.Now.ToString("MM'/'dd'/'yyyy HH:mm:ss");

                me.Name = ServiceOther.Name;
                me.Status = ServiceOther.Status;
                me.Address = ServiceOther.Address;
                me.AddressShow = ServiceOther.AddressShow;
                me.Description = ServiceOther.Description;
                me.Contents = ServiceOther.Contents;
                me.UpdateBy = ServiceOther.UpdateBy = @User.Identity.GetUserName();
                me.UpdateDay = ServiceOther.UpdateDay = DateTime.Parse(dat);
                db.SaveChanges();
                ms = 3;//Nếu cập nhật thành công
                //1-them, 2- sua, 3-xoa, 4- khac
                shared.CreateHistory(new History()
                {
                    Name = "Cập Nhật Dịch Vụ",
                    Contens = JsonConvert.SerializeObject(me, Formatting.Indented, new JsonSerializerSettings() { ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore }),
                    ItemId = me.ServiceOtherId,
                    Type = (int)DefineFuntion.TypeHistory.ServiceOther,
                });
            }
            catch (Exception)
            {
                ms = 4;//Nếu cập nhật không thành công
            }
            if (typeName == "savenew" || typeName == "")
                return RedirectToAction("Create", new { mess = ms });
            else
                return RedirectToAction("Edit", new { id = codeSystem, mess = ms });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}