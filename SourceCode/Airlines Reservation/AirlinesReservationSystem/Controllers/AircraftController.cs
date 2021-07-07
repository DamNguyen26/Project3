using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
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

        // GET: Aircraft
        public ActionResult Aircraft()
        {
            return View(db.Aircraft.ToList());
        }

        // GET: Aircraft/Details/5
        public ActionResult AircraftDetai(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Aircraft aircraft = db.Aircraft.Find(id);
            if (aircraft == null)
            {
                return HttpNotFound();
            }
            return View(aircraft);
        }

        // GET: Aircraft/Create
        public ActionResult AircraftAdd()
        {
            return View();
        }

        // POST: Aircraft/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AircraftAdd([Bind(Include = "AircraftID,AircraftName,FirstClassSeats,BussinessSeats,EconomySeats,Range,ServiceFee")] Aircraft aircraft)
        {
            if (ModelState.IsValid)
            {
                db.Aircraft.Add(aircraft);
                db.SaveChanges();
                return RedirectToAction("Aircraft");
            }

            return View(aircraft);
        }

        // GET: Aircraft/Edit/5
        public ActionResult AircraftEdit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Aircraft aircraft = db.Aircraft.Find(id);
            if (aircraft == null)
            {
                return HttpNotFound();
            }
            return View(aircraft);
        }

        // POST: Aircraft/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AircraftEdit([Bind(Include = "AircraftID,AircraftName,FirstClassSeats,BussinessSeats,EconomySeats,Range,ServiceFee")] Aircraft aircraft)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aircraft).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(aircraft);
        }

        // GET: Aircraft/Delete/5
        public ActionResult AircraftDelete(string id) => IsLoggedIn() && AircraftDAO.DeleteAircraft(id) ? Content("OK") : Content("Error");

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}
