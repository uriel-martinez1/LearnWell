using Capstone.Models.DTO_s;
using System;
using System.Collections.Generic;

namespace Capstone.Models.NewFolder
{
    public class CurriculumElementDTO
    {
        public int curriculumElementId { get; set; }
        public int courseId { get; set; }
        public int courseOrder { get; set; }
        public string description { get; set; }
        public string lectureContent { get; set; }
        public DateTime? createdDate { get; set; }
        public DateTime? lastUpdated { get; set; }
        public List<SourceDTO> sources { get; set; }
        public List<AssignmentDTO> assignments { get; set; }
    }
}



