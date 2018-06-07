using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using Stefanini.PraticalTest.DAL;
using Stefanini.PraticalTest.Models;

namespace Stefanini.PraticalTest.Controllers
{
    public class LogonController : Controller
    {
        private AppContext db = new AppContext();

        [AllowAnonymous]
        // GET: Logon
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LogonRequest request)
        {
            if (ModelState.IsValid)
            {
                var found = db.GetByEmail(request.Email);
                    
                if (found != null && found.Password == request.Password)
                {
                    FormsAuthentication.RedirectFromLoginPage(request.Email, false);

                    return RedirectToAction("List", "Customer");
                }
                else
                {
                    ModelState.AddModelError("", "The e-mail and/or password entered is invalid. Please try again.");
                    ModelState.AddModelError("Email", " ");
                    ModelState.AddModelError("Password"," ");
                    
                }
            }
            
            return View("Index");
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            return RedirectToAction("Index", "Logon");
        }
    }
}
