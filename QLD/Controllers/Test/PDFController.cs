using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Rotativa;
using QLD.Models;
using PagedList.Mvc;
using QLD.Library;

namespace QLD.Controllers.Test
{
    public class PDFController : Controller
    {
        // GET: PDF
        private Entities db = new Entities();

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

        [HttpGet]
        public ActionResult HTMLToPDF()
        {
            var obj = db.Paymen.ToList<Payman>();
            return new ActionAsPdf("index", obj);
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