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

namespace QLD.Controllers.Basic
{
    [Authorize, RoutePrefix("Admin/ServiceOtherPrice")]
    public class ServiceOtherPriceController : Controller
    {
        // GET: ServiceOtherPrice
        private Entities db = new Entities();
        private SharedFuntionController shared = new SharedFuntionController();
        [Route("Index")]
        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceV")]
        public ActionResult Index(string sortOrder, string searchString, int? numberRow, int? page)
        {
            ViewBag.Mess = 0;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NumberRow = Convert.ToInt32(numberRow) <= 0 ? 20 : Convert.ToInt32(numberRow);
            ViewBag.SearchString = searchString;
            DefineSort(sortOrder);
            var obj = db.ServiceOtherPrices.Where(t => t.Status != 3).ToList();
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
        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceV")]
        public ActionResult Index(FormCollection form, string typeName, string searchString, int? numberRow)
        {
            SetDefineSort();
            ViewBag.SearchString = searchString;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NumberRow = Convert.ToInt32(numberRow) <= 0 ? 20 : Convert.ToInt32(numberRow);
            var inputCheck = form.GetValues("inputCheck");
            ViewBag.Mess = EvenList(inputCheck, typeName);
            if (ViewBag.Mess == 7)
                return RedirectToAction("Edit", "ServiceOtherPrice", new { Id = ViewBag.id, mess = 0 });
            var obj = db.ServiceOtherPrices.Where(t => t.Status < 3).ToList();
            obj = Authorities(obj);
            if (typeName == "refresh")
            {
                ViewBag.SearchString = "";
            }
            else if (!String.IsNullOrEmpty(searchString))
            {
                ViewBag.SearchString = searchString;
                searchString = searchString.ToLower();
                obj = db.ServiceOtherPrices.Where(c => (c.Name ?? "").ToLower().Contains(searchString)).ToList();
            }
            int pageSize = (numberRow ?? 20);
            int pageNumber = 1;
            return View(obj.ToPagedList(pageNumber, pageSize));

        }
        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceU")]
        private int EventStatus(string[] inputCheck, string typeName)
        {
            int rowFinish = 0;
            if (inputCheck == null) return rowFinish;
            foreach (var s in inputCheck)
            {
                try
                {
                    int id = Convert.ToInt32(DefineFuntion.Decrypt(s));
                    var obj = db.ServiceOtherPrices.Find(id);
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
            ViewBag.Code = sortOrder == "Code" ? "Code_desc" : "Code";
            ViewBag.Name = sortOrder == "Name" ? "Name_desc" : "Name";
            ViewBag.Status = sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.FromDay = sortOrder == "FromDay" ? "FromDay_desc" : "FromDay";
            ViewBag.ToDay = sortOrder == "ToDay" ? "ToDay_desc" : "ToDay";
            ViewBag.Price = sortOrder == "Price" ? "Price_desc" : "Price";
            ViewBag.PriceAdult = sortOrder == "PriceAdult" ? "PriceAdult_desc" : "PriceAdult";
            ViewBag.PriceChild = sortOrder == "PriceChild" ? "PriceChild_desc" : "PriceChild";
            ViewBag.PriceInfant = sortOrder == "PriceInfant" ? "PriceInfant_desc" : "PriceInfant";
            ViewBag.PriceBaby = sortOrder == "PriceBaby" ? "PriceAdult_desc" : "PriceAdult";
        }
        private List<ServiceOtherPrice> EvenSort(List<ServiceOtherPrice> obj, string sortOrder)
        {
            switch (sortOrder)
            {
                case "Name":
                    obj = obj.OrderBy(s => s.Name).ToList();
                    break;
                case "Name_desc":
                    obj = obj.OrderByDescending(s => s.Name).ToList();
                    break;
                case "Status":
                    obj = obj.OrderBy(s => s.Status).ToList();
                    break;
                case "Status_desc":
                    obj = obj.OrderByDescending(s => s.Status).ToList();
                    break;
                case "FromDay":
                    obj = obj.OrderBy(s => s.FromDay).ToList();
                    break;
                case "FromDay_desc":
                    obj = obj.OrderByDescending(s => s.FromDay).ToList();
                    break;
                case "ToDay":
                    obj = obj.OrderBy(s => s.ToDay).ToList();
                    break;
                case "ToDay_desc":
                    obj = obj.OrderByDescending(s => s.ToDay).ToList();
                    break;
                case "Price":
                    obj = obj.OrderBy(s => s.Price).ToList();
                    break;
                case "Price_desc":
                    obj = obj.OrderByDescending(s => s.Price).ToList();
                    break;
                case "PriceAdult":
                    obj = obj.OrderBy(s => s.PriceAdult).ToList();
                    break;
                case "PriceAdult_desc":
                    obj = obj.OrderByDescending(s => s.PriceAdult).ToList();
                    break;
                case "PriceChild":
                    obj = obj.OrderBy(s => s.PriceChild).ToList();
                    break;
                case "PriceChild_desc":
                    obj = obj.OrderByDescending(s => s.PriceChild).ToList();
                    break;
                case "PriceInfant":
                    obj = obj.OrderBy(s => s.PriceInfant).ToList();
                    break;
                case "PriceInfant_desc":
                    obj = obj.OrderByDescending(s => s.PriceInfant).ToList();
                    break;
                case "PriceBaby":
                    obj = obj.OrderBy(s => s.PriceBaby).ToList();
                    break;
                case "PriceBaby_desc":
                    obj = obj.OrderByDescending(s => s.PriceBaby).ToList();
                    break;
                default:
                    obj = obj.OrderByDescending(s => s.ServiceOtherPriceId).ToList();
                    break;
            }
            return obj;
        }

        private List<ServiceOtherPrice> Authorities(List<ServiceOtherPrice> obj)
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
            ViewBag.Code = "Code";
            ViewBag.Name = "Name";
            ViewBag.Status = "Status";
            ViewBag.FromDay = "FromDay";
            ViewBag.ToDay = "ToDay";
            ViewBag.Price = "Price";
            ViewBag.PriceAdult = "PriceAdult";
            ViewBag.PriceChild = "PriceChild";
            ViewBag.PriceInfant = "PriceInfant";
            ViewBag.PriceBaby = "PriceBaby";

        }
        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceD")]
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
                    ServiceOtherPrice obj = db.ServiceOtherPrices.Find(idMenu);
                    //1-them, 2- sua, 3-xoa, 4- khac
                    shared.CreateHistory(new History()
                    {
                        Name = "Xóa Giá Dịch Vụ",
                        Contens = JsonConvert.SerializeObject(obj, Formatting.Indented, new JsonSerializerSettings() { ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore }),
                        ItemId = obj.ServiceOtherPriceId,
                        Type = (int)DefineFuntion.TypeHistory.ServiceOtherPrice,
                    });
                    db.ServiceOtherPrices.Remove(obj);
                    db.SaveChanges();
                    rowFinish++;

                }
                catch (Exception)
                {
                    int idMenu = Convert.ToInt32(DefineFuntion.Decrypt(s));
                    ServiceOtherPrice obj = db.ServiceOtherPrices.Find(idMenu);
                    obj.Status = 3;
                    db.SaveChanges();

                }
            }
            return rowFinish;
        }
        [Route("Trash")]

        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceV")]

        public ActionResult Trash(string sortOrder, string searchString, int? nunberRow, int? page)
        {
            ViewBag.Mess = 0;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NunberRow = Convert.ToInt32(nunberRow) <= 0 ? 20 : Convert.ToInt32(nunberRow);
            ViewBag.SearchString = searchString;
            ViewBag.CurrentSort = sortOrder;
            ViewBag.IdSortParm = String.IsNullOrEmpty(sortOrder) ? "Id_desc" : "";
            DefineSort(sortOrder);
            var obj = db.ServiceOtherPrices.Where(t => t.Status == 3).ToList();
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

        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceV")]

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
            var obj = db.ServiceOtherPrices.Where(t => t.Status == 3).OrderByDescending(t => t.ServiceOtherPriceId).ToList();
            obj = Authorities(obj);
            if (typeName == "refresh")
            {
                ViewBag.SearchString = "";
            }
            else if (!String.IsNullOrEmpty(searchString))
            {
                ViewBag.SearchString = searchString;
                searchString = searchString.ToLower();
                obj = db.ServiceOtherPrices.Where(c => (c.Name ?? "").ToLower().Contains(searchString)).ToList();
            }
            int pageSize = (nunberRow ?? 20);
            int pageNumber = 1;
            return View(obj.ToPagedList(pageNumber, pageSize));

        }
        [Route("Create")]

        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceC")]

        public ActionResult Create(int? mess)
        {
            ViewBag.Mess = (mess ?? 0);
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", 1);
            ViewBag.ServiceOther = new SelectList(shared.GetServiceOther(), "Value", "Text");
            ViewBag.Provider = new SelectList(shared.GetProvider(), "Value", "Text");
            ViewBag.Contract = new SelectList(shared.GetContract(), "Value", "Text");
            ViewBag.Paymen = new SelectList(shared.GetPaymen(), "Value", "Text");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Create")]
        [ValidateInput(false)]

        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceC")]

        public ActionResult Create(ServiceOtherPrice ServiceOtherPrice, string typeName)
        {
            var shared = new SharedFuntionController();
            int ms = 0;
            try
            {

                db.ServiceOtherPrices.Add(ServiceOtherPrice);
                db.SaveChanges();
                ms = 1;
                //1-them, 2- sua, 3-xoa, 4- khac
                shared.CreateHistory(new History()
                {
                    Name = "Thêm Giá Dịch Vụ",
                    Contens = "",
                    ItemId = ServiceOtherPrice.ServiceOtherPriceId,
                    Type = (int)DefineFuntion.TypeHistory.ServiceOtherPrice,
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
                    return RedirectToAction("Edit", new { id = DefineFuntion.Encrypt(ServiceOtherPrice.ServiceOtherPriceId), mess = ms });
                }
            }
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", ServiceOtherPrice.Status);
            return View("Create", "ServiceOtherPrice");
        }
        // GET: /Menu/Edit/5
        [Route("Edit")]

        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceU")]

        public ActionResult Edit(string id, int? mess)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int obj = Convert.ToInt32(DefineFuntion.Decrypt(id));
            var ServiceOtherPrice = db.ServiceOtherPrices.Find(obj);
            if (ServiceOtherPrice == null)
            {
                return HttpNotFound();
            }
            ViewBag.Mess = (mess ?? 0);
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", ServiceOtherPrice.Status);

            return View(ServiceOtherPrice);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Edit")]
        [ValidateInput(false)]

        [Authorize(Roles = "QL,ServiceOtherPrice,ServiceOtherPriceU")]

        public ActionResult Edit(ServiceOtherPrice ServiceOtherPrice, string codeSystem, string typeName)
        {
            ServiceOtherPrice.ServiceOtherPriceId = Convert.ToInt32(DefineFuntion.Decrypt(codeSystem));
            int ms = 0;
            var me = db.ServiceOtherPrices.Find(ServiceOtherPrice.ServiceOtherPriceId);
            try
            {
                me.Name = ServiceOtherPrice.Name;
                me.Status = ServiceOtherPrice.Status;
                me.FromDay = ServiceOtherPrice.FromDay;
                me.ToDay = ServiceOtherPrice.ToDay;
                me.Price = ServiceOtherPrice.Price;
                me.PriceAdult = ServiceOtherPrice.PriceAdult;
                me.PriceChild = ServiceOtherPrice.PriceChild;
                me.PriceInfant = ServiceOtherPrice.PriceInfant;
                me.PriceBaby = ServiceOtherPrice.PriceBaby;
                db.SaveChanges();
                ms = 3;//Nếu cập nhật thành công
                //1-them, 2- sua, 3-xoa, 4- khac
                shared.CreateHistory(new History()
                {
                    Name = "Cập Nhật Giá Dịch Vụ",
                    Contens = JsonConvert.SerializeObject(me, Formatting.Indented, new JsonSerializerSettings() { ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore }),
                    ItemId = me.ServiceOtherPriceId,
                    Type = (int)DefineFuntion.TypeHistory.ServiceOtherPrice,
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