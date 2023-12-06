using Capstone.Exceptions;
using Capstone.Models;
using System;
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

        public List<Course> GetCoursesByUserId(int id)
        {
            List<Course> courses = new List<Course>();

            string sql = "SELECT course_id, teacher_id, course_name, description, difficulty, cost, created_date, last_updated FROM courses WHERE teacher_id = @id";

            try
            {

                using (SqlConnection conn = new SqlConnection())
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Course nextCourse = MapRowToCourse(reader);
                        courses.Add(nextCourse);
                    }
                }

            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return courses;
        }

        public List<Course> GetCoursesByUserName(string username)
        {
            List<Course> courses = new List<Course>();

            string sql = "SELECT course_id, teacher_id, course_name, description, difficulty, cost, created_date, last_updated FROM courses WHERE teacher_id = @username";

            try
            {

                using (SqlConnection conn = new SqlConnection())
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@username", username);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Course nextCourse = MapRowToCourse(reader);
                        courses.Add(nextCourse);
                    }
                }

            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return courses;
        }

        public Course GetCourseByCourseId(int id)
        {
            Course course = new Course();

            string sql = "SELECT course_id, teacher_id, course_name, description, difficulty, cost, created_date, last_updated FROM courses WHERE course_id = @id";

            try
            {

                using (SqlConnection conn = new SqlConnection())
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        course = MapRowToCourse(reader);
                    }
                }

            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return course;
        }

        public Course MapRowToCourse(SqlDataReader reader)
        {
            Course newCourse = new Course();

            newCourse.CourseId = Convert.ToInt32(reader["course_id"]);
            newCourse.TeacherId = Convert.ToInt32(reader["teacher_id"]);
            newCourse.CourseName = Convert.ToString(reader["course_name"]);
            newCourse.Description = Convert.ToString(reader["description"]);
            newCourse.Difficulty = Convert.ToInt32(reader["difficulty"]);
            newCourse.Cost = Convert.ToInt32(reader["cost"]);
            newCourse.CreatedDate = Convert.ToDateTime(reader["created_date"]);
            newCourse.LastUpdated = SqlUtil.NullableDateTime(reader["last_updated"]);

            return newCourse;
        }

    }
}
