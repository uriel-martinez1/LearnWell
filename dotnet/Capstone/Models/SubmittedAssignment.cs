using System;
using System.Collections.Generic;

namespace Capstone.Models
{
    public class SubmittedAssignment
    {
        public int SubmittedAssignmentId { get; set; }
        public int AssignmentId { get; set; }
        public int StudentId { get; set; }
        public int TeacherId { get; set; }
        public int CourseId { get; set; }
        public int Score { get; set; }
        public DateTime? GradedDate { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastEdited { get; set; }
        public int NumberOfEdits { get; set; }
        public List<Answer> Answers { get; set; } = new List<Answer>();
        public List<Comment> Comments { get; set; } = new List<Comment>();

    }
}
