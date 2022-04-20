using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ToDoAPI.API.Models
{
    public class CategoryViewModel
    {
        public int CategoryId { get; set; }
        public string DepartmentName { get; set; }
    }//end class

    public class GroceryItemViewModel
    {
        public int GroceryItemId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Nullable<int> CategoryId { get; set; }

        public virtual CategoryViewModel Category { get; set; }
    }//end class

}//end namespace