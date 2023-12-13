using Capstone.Models;
using Capstone.Models.NewFolder;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IQuestionDao
    {

        List<Question> GetQuestionsByAssignmentId(int id);
        List<int> AddQuestionsByAssignmentId(CurriculumElementDTO incoming, int assignmentId, int assignmentIndex);

        Question MapRowToQuestion(SqlDataReader reader);


    }
}
