using System;
using System.Collections.Generic;

namespace Capstone.Models.DTO_s
{
    public class AssignmentDTO
    {
        public int assignmentId { get; set; }
        public string assignmentType { get; set; }
        public int curriculumElementId { get; set; }
        public string description { get; set; }
        public string title { get; set; }
        public List<QuestionDTO> questions { get; set; }
        public DateTime? createdDate { get; set; }
        public DateTime? lastUpdated { get; set; }

    }
}