using Capstone.Models;
using Capstone.Models.NewFolder;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ICurriculumElementDao
    {
        List<CurriculumElement> GetCurriculumElementsByCourse(int courseId);
        CompleteCurriculumElement AddCompleteCurriculumElement(CurriculumElementDTO incoming, ISourceDao sourceDao, IAssignmentDao assignmentDao, IQuestionDao questionDao);

        CurriculumElement GetCurriculumElementByCurriculumId(int id);

        CurriculumElement MapRowToCurriculumElement(SqlDataReader reader);

    }
}
