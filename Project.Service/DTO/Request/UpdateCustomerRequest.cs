using Project.Service.Commons;

namespace Project.Service.DTO.Request
{
    public class UpdateCustomerRequest
    {
        [String]
        public string Name { get; set; }
        [String]
        public string Phone { get; set; }
        public string ImageUrl { get; set; }
    }
}
