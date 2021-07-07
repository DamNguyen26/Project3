using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AirlinesReservationSystem.Models;

namespace AirlinesReservationSystem.Models.arsadmin
{
    public class AirlinesController : Controller
    {
        private AirlineDBEntities db = new AirlineDBEntities();

        // GET: Airlines
        public ActionResult Index()
        {
            var airline = db.Airline.Include(a => a.Country);
            return View(airline.ToList());
        }

        // GET: Airlines/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Airline airline = db.Airline.Find(id);
            if (airline == null)
            {
                return HttpNotFound();
            }
            return View(airline);
        }

        // GET: Airlines/Create
        public ActionResult Create()
        {
            ViewBag.AirlineCountry = new SelectList(db.Country, "CountryID", "CountryName");
            return View();
        }

        // POST: Airlines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AirlineID,AirlineCountry,AirlineName,AirlineIcon")] Airline airline)
        {
            if (ModelState.IsValid)
            {
                db.Airline.Add(airline);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AirlineCountry = new SelectList(db.Country, "CountryID", "CountryName", airline.AirlineCountry);
            return View(airline);
        }

        // GET: Airlines/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Airline airline = db.Airline.Find(id);
            if (airline == null)
            {
                return HttpNotFound();
            }
            ViewBag.AirlineCountry = new SelectList(db.Country, "CountryID", "CountryName", airline.AirlineCountry);
            return View(airline);
        }

        // POST: Airlines/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AirlineID,AirlineCountry,AirlineName,AirlineIcon")] Airline airline)
        {
            if (ModelState.IsValid)
            {
                db.Entry(airline).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AirlineCountry = new SelectList(db.Country, "CountryID", "CountryName", airline.AirlineCountry);
            return View(airline);
        }

        // GET: Airlines/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Airline airline = db.Airline.Find(id);
            if (airline == null)
            {
                return HttpNotFound();
            }
            return View(airline);
        }

        // POST: Airlines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Airline airline = db.Airline.Find(id);
            db.Airline.Remove(airline);
            db.SaveChanges();
            return RedirectToAction("Index");
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
