using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ToDoAPI.API.Models;
using ToDoAPI.DATA.EF;
using System.Web.Http.Cors;

namespace ToDoAPI.API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CategoriesController : ApiController
    {

        GroceryListEntities db = new GroceryListEntities();

        //GET
        public IHttpActionResult GetCategories()
        {
            List<CategoryViewModel> cats = db.Categories.Select(c => new CategoryViewModel()
            {
                CategoryId = c.CategoryId,
                DepartmentName = c.DepartmentName
            }).ToList<CategoryViewModel>();


            if (cats.Count == 0)
                return NotFound();

            return Ok(cats);
        }//end GetCategories()

        //GET - api/Categories/id (HttpGet)
        public IHttpActionResult GetCategory(int id)
        {
            CategoryViewModel cat = db.Categories.Where(c => c.CategoryId == id).Select(c => new CategoryViewModel()
            {
                CategoryId = c.CategoryId,
                DepartmentName = c.DepartmentName             
            }).FirstOrDefault();

            if (cat == null)
            {
                return NotFound();
            }//end if

            return Ok(cat);

        }//end GetCategory()

        //POST - api/categories (HttpPost)
        public IHttpActionResult PostCategory(CategoryViewModel cat)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid Data");
            }//end if

            db.Categories.Add(new Category()
            {
                CategoryId = cat.CategoryId,
                DepartmentName = cat.DepartmentName
            });

            db.SaveChanges();
            return Ok();

        }//end PostCategory()

        //PUT -- api/categories (HttpPut)
        public IHttpActionResult PutCategory(CategoryViewModel cat)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid Data");
            }//end if

            Category existingCat = db.Categories.Where(c => c.CategoryId == cat.CategoryId).FirstOrDefault();

            if (existingCat != null)
            {
                existingCat.DepartmentName = cat.DepartmentName;              
                db.SaveChanges();
                return Ok();
            }
            else
            {
                return NotFound();
            }//end if/else

        }//end PutCategory()

        //DELETE api/categories/id (HttpDelete)
        public IHttpActionResult DeleteCategory(int id)
        {
            Category cat = db.Categories.Where(c => c.CategoryId == id).FirstOrDefault();

            if (cat != null)
            {
                db.Categories.Remove(cat);
                db.SaveChanges();
                return Ok();
            }
            else
            {
                return NotFound();
            }//end if/else
        }//end DeleteCategory()

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }//end Dispose()

    }//end class
}//end namespace
