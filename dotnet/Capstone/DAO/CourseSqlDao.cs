using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class CourseSqlDao : ICourseDao
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

                using (SqlConnection conn = new SqlConnection(connectionString))
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

        public List<Course> GetCoursesByStudentId(int id)
        {
            List<Course> courses = new List<Course>();

            string sql = "SELECT courses.course_id, teacher_id, course_name, description, difficulty, cost, courses.created_date, last_updated FROM courses " +
                "JOIN courses_students ON courses.course_id = courses_students.course_id " +
                "WHERE courses_students.student_id = @id";

            try
            {

                using (SqlConnection conn = new SqlConnection(connectionString))
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

        //TODO fix this to acutally use the username
        public List<Course> GetCoursesByUserName(string username)
        {
            List<Course> courses = new List<Course>();

            string sql = "SELECT courses.course_id, teacher_id, course_name, description, difficulty, cost, courses.created_date, courses.last_updated " +
                "FROM courses " +
                "JOIN courses_students ON courses_students.course_id = courses.course_id " +
                "JOIN users ON courses_students.student_id = users.user_id " +
                "WHERE users.username = @username;";

            try
            {

                using (SqlConnection conn = new SqlConnection(connectionString))
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

                using (SqlConnection conn = new SqlConnection(connectionString))
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

        //TODO add course method
        //TODO edit course method
        //TODO delete course method

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
