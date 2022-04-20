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
    public class GroceryItemController : ApiController
    {
        GroceryListEntities db = new GroceryListEntities();

        //GET - api/groceryitems (HttpGet)
        public IHttpActionResult GetGroceryItems()
        {
            List<GroceryItemViewModel> gros = db.GroceryItems.Select(g => new GroceryItemViewModel()
            {
                GroceryItemId = g.GroceryItemId,
                Description = g.Description,
                Name = g.Name,
                CategoryId = g.CategoryId
            }).ToList<GroceryItemViewModel>();

            if (gros.Count == 0)
                return NotFound();

            return Ok(gros);

        }//end GetGroceryItems()

        //GET - api/GroceryItem (HttpGet)
        public IHttpActionResult GetGroceryItem(int id)
        {
            GroceryItemViewModel gro = db.GroceryItems.Where(g => g.GroceryItemId == id).Select(g => new GroceryItemViewModel()
            {
                GroceryItemId = g.GroceryItemId,
                Name = g.Name,
                Description = g.Description,
                CategoryId = g.CategoryId
            }).FirstOrDefault();

            if (gro == null)
            {
                return NotFound();
            }//end if

            return Ok(gro);

        }//end GetGroceryItem()

        //POST - api/GroceryItem (HttpPost)
        public IHttpActionResult PostGroceryItem(GroceryItemViewModel gro)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid Data");
            }//end if

            db.GroceryItems.Add(new GroceryItem()
            {
                Name = gro.Name,
                Description = gro.Description,
                CategoryId = gro.CategoryId
            });

            db.SaveChanges();
            return Ok();

        }//end PostGroceryItem()

        //PUT - api/GroceryItem (HttpPut)
        public IHttpActionResult PutGroceryItem(GroceryItemViewModel gro)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Invalid Data");
            }//end if

            GroceryItem exisitingGro = db.GroceryItems.Where(g => g.GroceryItemId == gro.GroceryItemId).FirstOrDefault();

            if (exisitingGro != null)
            {
                exisitingGro.Name = gro.Name;
                exisitingGro.Description = gro.Description;
                exisitingGro.CategoryId = gro.CategoryId;
                db.SaveChanges();
                return Ok();
            }
            else
            {
                return NotFound();
            }//end else/if

        }//end PutGroceryItem()

        //DELETE - api/GroceryItem/id
        public IHttpActionResult DeleteGroceryItem(int id)
        {
            GroceryItem groceryItem = db.GroceryItems.Where(g => g.GroceryItemId == id).FirstOrDefault();

            if (groceryItem != null)
            {
                db.GroceryItems.Remove(groceryItem);

                db.SaveChanges();
                return Ok();
            }

            else
            {
                return NotFound();
            }//end if/else

        }//end DeleteGroceryItem()

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
