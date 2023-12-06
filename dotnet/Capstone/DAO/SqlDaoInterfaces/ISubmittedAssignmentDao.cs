using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ISubmittedAssignmentDao
    {
        public List<SubmittedAssignment> GetSubmittedAssignmentsByAssignmentId(int assignmentId);
        public SubmittedAssignment MapRowToSubmittedAssignment(SqlDataReader reader);
    }
}
