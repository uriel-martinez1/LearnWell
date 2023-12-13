using Microsoft.AspNetCore.Components.Forms;
using System;
using System.Collections.Generic;

namespace Capstone.Models
{
    public class CompleteAssignment
    {
        public int AssignmentId { get; set; }
        public int CurriculumElementId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string AssignmentType { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastUpdated { get; set; }
        public List<Question> Questions { get; set; }
    }
}
