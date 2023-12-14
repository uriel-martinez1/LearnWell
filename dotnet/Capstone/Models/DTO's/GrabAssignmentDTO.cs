using System;
using System.Collections.Generic;

namespace Capstone.Models
{
    public class GrabAssignmentDTO : Assignment
    {
        public List<Question> Questions { get; set; }

        public GrabAssignmentDTO() { }
        public GrabAssignmentDTO(Assignment assignment)
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
