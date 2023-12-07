using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IAssignmentDao
    {

        List<Assignment> GetAssignmentsByCurriculumElementId(int id);
        Assignment MapRowToAssignment(SqlDataReader reader);

    }
}
