using System.Collections.Generic;
using System;

namespace Capstone.Models.DTO_s
{
    public class SubmittedAssignmentDTO
    {
        public int AssignmentId { get; set; }
        public int StudentId { get; set; }
        public int TeacherId { get; set; }
        public int CourseId { get; set; }
        public int Score { get; set; }
        public int NumberOfEdits { get; set; }
        public List<Answer> Answers { get; set; }
    }
}
