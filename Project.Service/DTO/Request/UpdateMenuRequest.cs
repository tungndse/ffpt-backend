﻿using Project.Service.Commons;

namespace Project.Service.DTO.Request
{
    public class UpdateMenuRequest
    {
        [String]
        public string? MenuName { get; set; }
        [Int]
        public int? Type { get; set; }
        [Int]
        public int TimeSlotId { get; set; }
    }
}
