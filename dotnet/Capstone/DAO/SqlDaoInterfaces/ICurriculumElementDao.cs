using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ICurriculumElementDao
    {
        public List<CurriculumElement> GetCurriculumElementsByCourse(int courseId);
        public CurriculumElement MapRowToCurriculumElement(SqlDataReader reader);
    }
}
