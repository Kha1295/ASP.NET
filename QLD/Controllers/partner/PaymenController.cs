﻿using Newtonsoft.Json;
using PagedList;
using QLD.Library;
using QLD.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace QLD.Controllers
{
    [Authorize, RoutePrefix("Admin/paymen")]
    public class PaymenController : Controller
    {
        private Entities db = new Entities();
        private SharedFuntionController shared = new SharedFuntionController();
        // GET: Paymen
        [Route("Index")] 
        [Authorize(Roles = "QL,Paymen,PaymenV")]
        public ActionResult Index(string sortOrder, string searchString, int? numberRow, int? page)
        {
            ViewBag.Mess = 0;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NumberRow = Convert.ToInt32(numberRow) <= 0 ? 20 : Convert.ToInt32(numberRow);
            ViewBag.SearchString = searchString;
            DefineSort(sortOrder);
            var obj = db.Paymen.Where(t => t.Status != 3).ToList();
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
        [Authorize(Roles = "QL,Paymen,PaymenV")]
        public ActionResult Index(FormCollection form, string typeName, string searchString, int? numberRow)
        {
            SetDefineSort();
            ViewBag.SearchString = searchString;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NumberRow = Convert.ToInt32(numberRow) <= 0 ? 20 : Convert.ToInt32(numberRow);
            var inputCheck = form.GetValues("inputCheck");
            ViewBag.Mess = EvenList(inputCheck, typeName);
            if (ViewBag.Mess == 7)
                return RedirectToAction("Edit", "Paymen", new { Id = ViewBag.id, mess = 0 });
            var obj = db.Paymen.Where(t => t.Status < 3).ToList();
            obj = Authorities(obj);
            if (typeName == "refresh")
            {
                ViewBag.SearchString = "";
            }
            else if (!String.IsNullOrEmpty(searchString))
            {
                ViewBag.SearchString = searchString;
                searchString = searchString.ToLower();
                obj = db.Paymen.Where(c => (c.Name ?? "").ToLower().Contains(searchString)).ToList();
            }
            int pageSize = (numberRow ?? 20);
            int pageNumber = 1;
            return View(obj.ToPagedList(pageNumber, pageSize));

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
        private int EventStatus(string[] inputCheck, string typeName)
        {
            int rowFinish = 0;
            if (inputCheck == null) return rowFinish;
            foreach (var s in inputCheck)
            {
                try
                {
                    int id = Convert.ToInt32(DefineFuntion.Decrypt(s));
                    var obj = db.Paymen.Find(id);
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
        [Authorize(Roles = "QL,Paymen,PaymenD")]
        public int DeleteConfirmed(string[] inputCheck)
        {
            int rowFinish = 0;
            if (inputCheck == null) return rowFinish;
            foreach (var s in inputCheck)
            {

                try
                {
                    int idMenu = Convert.ToInt32(DefineFuntion.Decrypt(s));
                    Payman obj = db.Paymen.Find(idMenu);
                    //1-them, 2- sua, 3-xoa, 4- khac
                    shared.CreateHistory(new History()
                    {
                        Name = "Xóa thanh toán",
                        Contens = JsonConvert.SerializeObject(obj, Formatting.Indented, new JsonSerializerSettings() { ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore }),
                        ItemId = obj.PaymenId,
                        Type = (int)DefineFuntion.TypeHistory.paymen,
                    });
                    db.Paymen.Remove(obj);
                    db.SaveChanges();
                    rowFinish++;

                }
                catch (Exception)
                {
                    int idMenu = Convert.ToInt32(DefineFuntion.Decrypt(s));
                    Payman obj = db.Paymen.Find(idMenu);
                    obj.Status = 3;
                    db.SaveChanges();

                }
            }
            return rowFinish;
        }
        private void SetDefineSort()
        {
            ViewBag.Code = "Code";
            ViewBag.Name = "Name";
            ViewBag.Status = "Status";
            ViewBag.CreateBy = "CreateBy";
            ViewBag.CreateDay = "CreateDay";

        }
        [Route("Trash")]
        [Authorize(Roles = "QL,Paymen,PaymenV")]
        public ActionResult Trash(string sortOrder, string searchString, int? nunberRow, int? page)
        {
            ViewBag.Mess = 0;
            ViewBag.ArrRow = DefineFuntion.ArrRow;
            ViewBag.NunberRow = Convert.ToInt32(nunberRow) <= 0 ? 20 : Convert.ToInt32(nunberRow);
            ViewBag.SearchString = searchString;
            ViewBag.CurrentSort = sortOrder;
            ViewBag.IdSortParm = String.IsNullOrEmpty(sortOrder) ? "Id_desc" : "";
            DefineSort(sortOrder);
            var obj = db.Paymen.Where(t => t.Status == 3).ToList();
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
        [Authorize(Roles = "QL,Paymen,PaymenV")]
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
            var obj = db.Paymen.Where(t => t.Status == 3).OrderByDescending(t => t.PaymenId).ToList();
            obj = Authorities(obj);
            if (typeName == "refresh")
            {
                ViewBag.SearchString = "";
            }
            else if (!String.IsNullOrEmpty(searchString))
            {
                ViewBag.SearchString = searchString;
                searchString = searchString.ToLower();
                obj = db.Paymen.Where(c => (c.Name ?? "").ToLower().Contains(searchString)).ToList();
            }
            int pageSize = (nunberRow ?? 20);
            int pageNumber = 1;
            return View(obj.ToPagedList(pageNumber, pageSize));

        }
        [Route("Edit")]
        [Authorize(Roles = "QL,Paymen,PaymenU")]
        public ActionResult Edit(string id, int? mess)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int obj = Convert.ToInt32(DefineFuntion.Decrypt(id));
            var paymen = db.Paymen.Find(obj);
            if (paymen == null)
            {
                return HttpNotFound();
            }
            ViewBag.Mess = (mess ?? 0);
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", paymen.Status);

            return View(paymen);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Edit")]
        [ValidateInput(false)]
        [Authorize(Roles = "QL,Paymen,PaymenU")]
        public ActionResult Edit(Payman payman, string codeSystem, string typeName)
        {
            payman.PaymenId = Convert.ToInt32(DefineFuntion.Decrypt(codeSystem));
            int ms = 0;
            var me = db.Paymen.Find(payman.PaymenId);
            try
            {
                me.Name = payman.Name;
                me.Status = payman.Status;
                me.Note = payman.Note;
                db.SaveChanges();
                ms = 3;//Nếu cập nhật thành công
                //1-them, 2- sua, 3-xoa, 4- khac
                shared.CreateHistory(new History()
                {
                    Name = "Xóa ngành",
                    Contens = JsonConvert.SerializeObject(me, Formatting.Indented, new JsonSerializerSettings() { ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore }),
                    ItemId = me.PaymenId,
                    Type = (int)DefineFuntion.TypeHistory.paymen,
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
        private List<Payman> EvenSort(List<Payman> obj, string sortOrder)
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

                default:
                    obj = obj.OrderByDescending(s => s.PaymenId).ToList();
                    break;
            }
            return obj;
        }
        [Route("Create")]
        [Authorize(Roles = "QL,Paymen,PaymenC")]
        public ActionResult Create(int? mess)
        {
            ViewBag.Mess = (mess ?? 0);
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", 1);
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Create")]
        [ValidateInput(false)]
        public ActionResult Create(Payman payman, string typeName)
        {
            var shared = new SharedFuntionController();
            int ms = 0;
            try
            {

                db.Paymen.Add(payman);
                db.SaveChanges();
                ms = 1;
                //1-them, 2- sua, 3-xoa, 4- khac
                shared.CreateHistory(new History()
                {
                    Name = "Thêm ngành",
                    Contens = "",
                    ItemId = payman.PaymenId,
                    Type = (int)DefineFuntion.TypeHistory.paymen,
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
                    return RedirectToAction("Edit", new { id = DefineFuntion.Encrypt(payman.PaymenId), mess = ms });
                }
            }
            ViewBag.Status = new SelectList(DefineFuntion.ListStatus, "Value", "Text", payman.Status);
            return View();
        }

        private List<Payman> Authorities(List<Payman> obj)
        {
            return obj;
        }

        private void DefineSort(string sortOrder)
        {
            ViewBag.Code = sortOrder == "Code" ? "Code_desc" : "Code";
            ViewBag.Name = sortOrder == "Name" ? "Name_desc" : "Name";
            ViewBag.Status = sortOrder == "Status" ? "Status_desc" : "Status";
            ViewBag.CreateBy = sortOrder == "CreateBy" ? "CreateBy_desc" : "CreateBy";
            ViewBag.CreateDay = sortOrder == "CreateDay" ? "CreateDay_desc" : "CreateDay";
        }
    }
}