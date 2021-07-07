using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AirlinesReservationSystem.Models.arsadmin
{
    public class AircraftDAO
    {
        static AirlineDBEntities db = new AirlineDBEntities();
        public static IEnumerable<Aircraft> GetAircraftList() => db.Aircraft;

        public static Aircraft GetAircraft(string AircraftID)
        {
            db = new AirlineDBEntities();
            return db.Aircraft.Where(a => a.AircraftID == AircraftID).FirstOrDefault();
        }

        public static bool DeleteAircraft(string AircraftID)
        {
            var a = GetAircraft(AircraftID);
            if (a != null)
            {
                if (db.Airline.FirstOrDefault(al => al.AirlineID == AircraftID) == null)
                {
                    db.Aircraft.Remove(a);
                    db.SaveChanges();
                    return true;
                }
            }
            return false;
        }
    }
}