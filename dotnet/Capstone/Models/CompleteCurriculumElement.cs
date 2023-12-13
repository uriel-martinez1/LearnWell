using System;
using System.Collections.Generic;

namespace Capstone.Models
{
    public class CompleteCurriculumElement
    {
        public int CurriculumElementId { get; set; }
        public int CourseId { get; set; }
        public int CourseOrder { get; set; }
        public string Description { get; set; }
        public string LectureContent { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastUpdated { get; set; }
        public List<Source> Sources { get; set; }
        public List<CompleteAssignment> Assignments { get; set; }

    }
}
