using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Address
    {
        public string Street { get; set; }
        public string InStreetNumber { get; set; }
        public string ExStreetNumber { get; set; }
        public string Neighborhood { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }

    }
}
