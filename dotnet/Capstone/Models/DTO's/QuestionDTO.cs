using System;

namespace Capstone.Models.DTO_s
{
    public class QuestionDTO
    {
        public int questionId { get; set; }
        public string prompt { get; set; }
        public string questionType { get; set; }
        public string answer1 { get; set; }
        public string answer2 { get; set; }
        public string answer3 { get; set; }
        public string answer4 { get; set; }
        public int? correctChoiceAnswer { get; set; }
        public DateTime? createdDate { get; set; }
        public DateTime? lastUpdated { get; set; }

    }
}

