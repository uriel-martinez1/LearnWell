using System;

namespace Capstone.Models
{
    public class Comment
    {
        public int CommentId { get; set; }
        public int SubmittedAssignmentId { get; set; }
        public int CreatedById { get; set; }
        public string CommentEntry { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastUpdated { get; set; }
        public int NumberOfEdits { get; set; }
    }
}
