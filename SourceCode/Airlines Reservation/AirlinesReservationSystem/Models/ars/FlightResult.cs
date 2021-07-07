using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AirlinesReservationSystem.Models.ars
{
    //create flight result class that set and get flight and route 
    public class FlightResult
    {
        public Flight FlightVM { get; set; }
        public Route RouteVM { get; set; }
    }
}