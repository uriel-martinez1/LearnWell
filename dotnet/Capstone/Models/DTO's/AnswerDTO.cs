namespace Capstone.Models.DTO_s
{
    public class AnswerDTO : Answer
    {
        public int submittedAssignmentId { get; set; }
        public int questionId {get;set;}
        public string answerText { get; set; }
    }
}
