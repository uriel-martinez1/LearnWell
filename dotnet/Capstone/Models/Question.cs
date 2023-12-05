using System;

namespace Capstone.Models
{
    public class Question
    {
        public int QuestionId {get; set;}
        public string Prompt { get; set; }
        public string QuestionType { get; set; }
        public string Answer1 { get; set; }
        public string Answer2 { get; set; }
        public string Answer3 { get; set; }
        public string Answer4 { get; set; }
        public int? CorrectChoiceAnswer { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastUpdated { get; set; }
    }
}
