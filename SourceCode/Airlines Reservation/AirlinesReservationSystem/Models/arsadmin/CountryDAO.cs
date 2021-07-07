using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AirlinesReservationSystem.Models.arsadmin
{
    public class CountryDAO
    {
        static AirlineDBEntities db = new AirlineDBEntities();

        public static IEnumerable<Country> GetCountryList()
        {
            db = new AirlineDBEntities(); //refresh cache
            return db.Country;
        }

        public static Country GetCountry(string CountryID)
        {
            db = new AirlineDBEntities();
            return db.Country.Where(r => r.CountryID == CountryID).FirstOrDefault();
        }

        public static bool DeleteCountry(string CountryID)
        {
            var c = GetCountry(CountryID);
            if (c != null)
            {
                if (db.Airline.FirstOrDefault(a => a.AirlineID == CountryID) == null)
                {
                    db.Country.Remove(c);
                    db.SaveChanges();
                    return true;
                }
            }
            return false;
        }

    }
}