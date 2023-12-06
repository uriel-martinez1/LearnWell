using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IAnswerDao
    {
      List<Answer> GetAnswersByStudentId(int studentId);
      Answer MapRowToAnswer(SqlDataReader reader);

    }
}
