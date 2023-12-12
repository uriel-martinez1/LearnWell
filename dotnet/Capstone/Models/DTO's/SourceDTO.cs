using System;

namespace Capstone.Models.DTO_s
{
    public class SourceDTO
    {
        public int sourceId { get; set; }
        public int curriculumElementId { get; set; }
        public string sourceUrl { get; set; }
        public DateTime? createdDate { get; set; }
        public DateTime? lastUpdated { get; set; }
    }
}


