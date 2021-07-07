using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AirlinesReservationSystem.Models.ars
{
    public class AirlineDAO
    {
       
        private static AirlineDBEntities db = new AirlineDBEntities();

        //get a list of airline
        public static IEnumerable<Airline> GetAirlines() => db.Airline;
    }
}