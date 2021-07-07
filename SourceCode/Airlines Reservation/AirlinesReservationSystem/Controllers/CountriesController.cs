using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AirlinesReservationSystem.Models;
using AirlinesReservationSystem.Models.arsadmin;

namespace AirlinesReservationSystem.Controllers
{
    public partial class ARSAdminController : Controller
    {
        private AirlineDBEntities db = new AirlineDBEntities();

        // GET: Countries
        public ActionResult Country()
        {
               return View(db.Country.ToList());
        }

        // GET: Countries/Details/5
        //public ActionResult CountryDetails(string id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Country country = db.Country.Find(id);
        //    if (country == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(country);
        //}

        // GET: Countries/Create
        public ActionResult CountryAdd()
        {
            return View();
        }

        // POST: Countries/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CountryAdd(Country country)
        {
            string filename = Path.GetFileNameWithoutExtension(country.ImageFile.FileName);
            string extension = Path.GetExtension(country.ImageFile.FileName);
            filename = filename + DateTime.Now.ToString("yymmssfff") + extension;
            country.CountryFlag = $"/img/" + filename;
            filename = Path.Combine(Server.MapPath("/img/"), filename);
            country.ImageFile.SaveAs(filename);


            using (AirlineDBEntities db = new AirlineDBEntities())
            {
                db.Country.Add(country);
                db.SaveChanges();
            }
            ModelState.Clear();
                //if (ModelState.IsValid)
                //{
                //    db.Country.Add(country);
                //    db.SaveChanges();
                //    return RedirectToAction("Index");
                //}

            return RedirectToAction("Country");
        }

        // GET: Countries/Edit/5
        public ActionResult CountryEdit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Country country = db.Country.Find(id);
            TempData["imgPath"] = country.CountryFlag;
            if (country == null)
            {
                return HttpNotFound();
            }
            
            return View(country);
        }

        // POST: Countries/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CountryEdit(HttpPostedFileBase file, Country country)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    string filename = Path.GetFileNameWithoutExtension(country.ImageFile.FileName);
                    string extension = Path.GetExtension(country.ImageFile.FileName);
                    filename = filename + DateTime.Now.ToString("yymmssfff") + extension;
                    country.CountryFlag = $"/img/" + filename;
                    filename = Path.Combine(Server.MapPath("/img/"), filename);
                    country.ImageFile.SaveAs(filename);

                }
                else
                {
                    country.CountryFlag = TempData["imgPath"].ToString();
                    using (AirlineDBEntities db = new AirlineDBEntities())
                    {
                        db.Entry(country).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                    ModelState.Clear();
                }
            }

            return RedirectToAction("Country");

            //if (ModelState.IsValid)
            //{
            //    db.Entry(country).State = EntityState.Modified;
            //    db.SaveChanges();
            //    return RedirectToAction("Index");
            //}
            //return View(country);
        }

        // GET: Countries/Delete/5
        //public ActionResult CountryDelete(string id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Country country = db.Country.Find(id);
        //    if (country == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(country);
        //}

        // POST: Countries/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult CountryDeleteConfirmed(string id)
        //{
        //    Country country = db.Country.Find(id);
        //    db.Country.Remove(country);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        public ActionResult CountryDelete(string id) => IsLoggedIn() && CountryDAO.DeleteCountry(id) ? Content("OK") : Content("Error");

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
