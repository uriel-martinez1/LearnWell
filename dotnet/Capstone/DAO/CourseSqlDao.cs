using Capstone.Exceptions;
using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class CourseSqlDao
    {

        private readonly string connectionString;

        public CourseSqlDao(string connString)
        {
            connectionString = connString;
        }

        public List<Course> GetCourses()
        {
            List<Course> courses = new List<Course>();

            string sql = "";

            try
            {

                using (SqlConnection conn = new SqlConnection())
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Course nextCourse = 
                    }
                }

            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }
        }

    }
}
