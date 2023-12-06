using System;

namespace Capstone.Models
{
    public class Answer
    {
        public int AnswerId { get; set; }
        public int SubmittedAssignmentId { get; set; }
        public string QuestionType { get; set; }
        public int? AnswerChoice { get; set; }
        public string AnswerText { get; set; }
        public string AnswerExternal { get; set; }
        public bool IsCorrect { get; set; }
        public DateTime? LastUpdated { get; set; }
        public int NubmerOfEdits { get; set;  }
    }
}
