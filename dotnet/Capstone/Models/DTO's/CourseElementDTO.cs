using Capstone.Models.DTO_s;
using System;
using System.Collections.Generic;

namespace Capstone.Models.DTO_s
{
    public class CourseElementDTO
    {
        public int courseId { get; set; }
        public int teacherId { get; set; }
        public string courseName { get; set; }
        public string description { get; set; }
        public int difficulty { get; set; }
        public decimal cost { get; set; }
        public DateTime createdDate { get; set; }
        public DateTime? lastUpdated { get; set; }
        public bool isActive { get; set; }

    }
}
