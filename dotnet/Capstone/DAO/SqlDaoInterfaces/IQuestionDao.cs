using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IQuestionDao
    {

        List<Question> GetQuestionsByAssignmentId(int id);
        Question MapRowToQuestion(SqlDataReader reader);


    }
}
