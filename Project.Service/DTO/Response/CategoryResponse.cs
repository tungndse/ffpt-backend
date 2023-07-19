using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Project.Service.Commons;

namespace FFPT_Project.Service.DTO.Response
{
    public class CategoryResponse
    {
        [Int]
        public int Id { get; set; }
        [String]
        public string CategoryName { get; set; }
        [Int]
        public int? Status { get; set; }
        public DateTime CreateAt { get; set; }
        public DateTime? UpdateAt { get; set; }
        public string? Description { get; set; }
    }
}
