using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public class AssignmentSqlDao : IAssignmentDao
    {

        private readonly string connectionString;

        public AssignmentSqlDao(string connString)
        {
            connectionString = connString;
        }

        public List<Assignment> GetAssignmentsByCurriculumElementId(int id)
        {

        }
    }
}
