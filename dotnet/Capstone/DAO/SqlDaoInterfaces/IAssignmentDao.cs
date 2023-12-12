using Capstone.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface IAssignmentDao
    {

        List<Assignment> GetAssignmentsByCurriculumElementId(int id);
        List<Assignment> GetAssignmentsByCourseId(int id);
        Assignment MapRowToAssignment(SqlDataReader reader);

    }
}
