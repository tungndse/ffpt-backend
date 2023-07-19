using Project.Service.Commons;

namespace Project.Service.DTO.Request
{
    public class CreateCustomerRequest
    {
        [String]
        public string Name { get; set; }
        [String]
        public string Phone { get; set; }
        [String]
        public string Email { get; set; }
        public string ImageUrl { get; set; }
    }
}
