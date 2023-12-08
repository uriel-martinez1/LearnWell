using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ICurriculumElementDao
    {
        List<CurriculumElement> GetCurriculumElementsByCourse(int courseId);
        CurriculumElement MapRowToCurriculumElement(SqlDataReader reader);

        CurriculumElement GetCurriculumElementByCurriculumId(int id);
    }
}
