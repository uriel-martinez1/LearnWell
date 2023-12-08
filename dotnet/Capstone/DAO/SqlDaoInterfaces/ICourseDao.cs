using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ICourseDao
    {
        List<Course> GetCoursesByUserId(int id);
        List<Course> GetCoursesByStudentId(int id);
        List<Course> GetCoursesByUserName(string username);
        Course GetCourseByCourseId(int id);
        Course MapRowToCourse(SqlDataReader reader);
    }
}
