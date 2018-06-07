using System;

namespace Stefanini.PraticalTest.Models
{
    public class CustomerSearchRequest
    {
        public string Name { get; set; }
        public int? GenderId { get; set; }
        public int? SellerId { get; set; }
        public int? CityId { get; set; }
        public int? RegionId { get; set; }
        public int? ClassificationId { get; set; }
        public DateTime? LastPurchase { get; set; }
        public DateTime? Until { get; set; }
    }
}
