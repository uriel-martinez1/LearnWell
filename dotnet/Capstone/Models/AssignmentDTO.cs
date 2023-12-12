using System;
using System.Collections.Generic;

namespace Capstone.Models
{
    public class AssignmentDTO : Assignment
    {
        public List<Question> Questions { get; set; }

        public AssignmentDTO() { }
        public AssignmentDTO(Assignment assignment)
        {
            AssignmentId = assignment.AssignmentId;
            CurriculumElementId = assignment.CurriculumElementId;
            Title = assignment.Title;
            Description = assignment.Description;
            AssignmentType = assignment.AssignmentType;
            CreatedDate = assignment.CreatedDate;
            LastUpdated = assignment.LastUpdated;

    }
}
}
