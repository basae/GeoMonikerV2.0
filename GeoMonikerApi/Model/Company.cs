using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Company
    {
        public long? CompanyId { get; set; }
        public string Name { get; set; }
        public DateTime FoundationDate { get; set; }
        public string ContactPhone { get; set; }
        public string Representative { get; set; }
        public Address Address { get; set; }

        public Company()
        {
            Address = new Address();
        }
    }
}
