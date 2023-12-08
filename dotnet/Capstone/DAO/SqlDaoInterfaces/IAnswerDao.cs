using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IAnswerDao
    {
        List<Answer> GetAnswersBySubmitedAssignmentId(int submitedAssignmentId);
      Answer MapRowToAnswer(SqlDataReader reader);

    }
}
