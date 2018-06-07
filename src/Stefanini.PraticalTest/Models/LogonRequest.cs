using System.ComponentModel.DataAnnotations;

namespace Stefanini.PraticalTest.Models
{
    public class LogonRequest
    {
        [Required]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
    }
}