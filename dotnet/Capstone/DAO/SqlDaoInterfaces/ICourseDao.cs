using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO.SqlDaoInterfaces
{
    public interface ICourseDao
    {
        public List<Course> GetCoursesByUserId(int id);
        public List<Course> GetCoursesByUserName(string username);
        public Course GetCourseByCourseId(int id);
        public Course MapRowToCourse(SqlDataReader reader);
    }
}
