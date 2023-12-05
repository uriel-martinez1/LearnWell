using System;

namespace Capstone.Models
{
    public class Course
    {
        public int CourseId { get; set; }
        public int TeacherId { get; set; }
        public string CourseName { get; set; }
        public string Description { get; set; }
        public int Difficulty { get; set; }
        public decimal Cost { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastUpdated { get; set; }

    }
}
