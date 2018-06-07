using System.Linq;
using System.Web.Mvc;
using Stefanini.PraticalTest.DAL;
using Stefanini.PraticalTest.Models;

namespace Stefanini.PraticalTest.Controllers
{
    [Authorize]
    public class CustomerController : Controller
    {
        private AppContext db = new AppContext();

        public ActionResult List()
        {
            Load(new CustomerSearchRequest());
            
            return View();
        }
        
        [HttpPost]
        public ActionResult Search(CustomerSearchRequest model)
        {
            Load(model);

            return View("List", model);
        }

        public JsonResult RegionByCityId(int? cityId)
        {
            if (cityId != null)
            {
                var region = db.GetRegionByCityId(cityId.Value);
                return Json(new[] {region}, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(db.GetRegions(), JsonRequestBehavior.AllowGet);
            }
        }

        private void Load(CustomerSearchRequest model)
        {
            var currentUser = db.GetByEmail(HttpContext.User.Identity.Name);
            
            if (currentUser.IsAdmin == false)
            {
                model.SellerId = currentUser.Id;
            }
            
            var customers = db.FindCustomers(model);

            PopulateCityDropDownList(model.CityId);
            PopulateGenderDropDownList(model.GenderId);
            PopulateSellerDropDownList(model.SellerId);
            PopulateRegionDropDownList(model.RegionId);
            PopulateClassificationDropDownList(model.ClassificationId);

            ViewBag.Customers = customers;
            ViewBag.IsAdmin = currentUser.IsAdmin;
        }

        private void PopulateClassificationDropDownList(int? x)
        {
            var cities = db.GetClassifications();
            ViewBag.ClassificationId = new SelectList(cities, "Id", "Name", x);
        }

        private void PopulateRegionDropDownList(int? x)
        {
            var cities = db.GetRegions();
            ViewBag.RegionId = new SelectList(cities, "Id", "Name", x);
        }

        private void PopulateCityDropDownList(object selectedCity = null)
        {
            var cities = db.GetCities();
            ViewBag.CityId = new SelectList(cities, "Id", "Name", selectedCity);
        }
        
        private void PopulateGenderDropDownList(object selectedGender = null)
        {
            var g = db.GetGenders();
            ViewBag.GenderId = new SelectList(g, "Id", "Name", selectedGender);
        }
        
        private void PopulateSellerDropDownList(object x = null)
        {
            var g = db.GetSellers();
            ViewBag.SellerId = new SelectList(g, "Id", "Login", x);
        }


    }
}
