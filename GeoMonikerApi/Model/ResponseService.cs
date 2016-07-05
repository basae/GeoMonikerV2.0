using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ResponseService<T>
    {
        public bool Error { get; set; }
        public string Message { get; set; }
        public IEnumerable<T> List { get; set; }
        public T Result { get; set; }

        public ResponseService()
        {
            this.Error = false;
            this.Message = string.Empty;
            this.List = null;
        }
    }
}
