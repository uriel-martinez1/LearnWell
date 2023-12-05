using System;

namespace Capstone.Models
{
    public class Source
    {
        public int SourceId { get; set; }
        public int CurriculumElementId { get; set; }
        public string SourceUrl { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastUpdated { get; set; }
    }
}
