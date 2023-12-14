using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public class UserSqlDao : IUserDao
    {
        private readonly string connectionString;

        public UserSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public IList<User> GetUsers()
        {
            IList<User> users = new List<User>();

            string sql = "SELECT user_id, first_name, last_name, email, username, password_hash, salt, user_role, isTeacher FROM users";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        User user = MapRowToUser(reader);
                        users.Add(user);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return users;
        }

        public List<User> GetStudentsByTeacherId(int id)
        {
            List<User> students = new List<User>();

            string sql = "SELECT DISTINCT user_id, first_name, last_name, email, username, password_hash, salt, user_role, isTeacher FROM users " +
                "JOIN courses_students ON courses_students.student_id = users.user_id " +
                "WHERE courses_students.course_id IN (SELECT course_id FROM courses WHERE teacher_id = @id);";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("id", id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        User student = MapRowToUser(reader);
                        students.Add(student);
                    }
                }

            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return students;
        }

        public User GetUserById(int userId)
        {
            User user = null;

            string sql = "SELECT user_id, first_name, last_name, email, username, password_hash, salt, user_role, isTeacher FROM users WHERE user_id = @user_id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read()) 
                    {
                        user = MapRowToUser(reader);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return user;
        }

        public User GetUserByUsername(string username)
        {
            User user = null;

            string sql = "SELECT user_id, first_name, last_name, email, username, password_hash, salt, user_role, isTeacher FROM users WHERE username = @username";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        user = MapRowToUser(reader);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return user;
        }

        public User CreateUser(string firstName, string lastName, string email, string username, string password, string role, string teacherKey )
        {

            string teacherKeyActual = "";

            if (!String.IsNullOrEmpty(teacherKey))
            {

                string teacherSql = "SELECT teacher_key FROM teacher_keys WHERE username = @username;";

                try
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();

                        SqlCommand cmd = new SqlCommand(teacherSql, conn);
                        cmd.Parameters.AddWithValue("@username", username);

                        teacherKeyActual = Convert.ToString(cmd.ExecuteScalar());

                        if (String.IsNullOrEmpty(teacherKeyActual))
                        {
                            throw new DaoException("You are not authorized to register as a teacher");
                        }
                    }
                }
                catch (SqlException ex)
                {

                    throw new DaoException("SQL exception occurred", ex);
                }

            }


            User newUser = null;

            IPasswordHasher passwordHasher = new PasswordHasher();
            PasswordHash hash = passwordHasher.ComputeHash(password);

            string userSql = "INSERT INTO users (first_name, last_name, email, username, password_hash, salt, user_role, isTeacher, isAdmin, isActive) " +
                         "OUTPUT INSERTED.user_id " +
                         "VALUES (@first_name, @last_name, @email, @username, @password_hash, @salt, @user_role, @isTeacher, 0, 1)";

            int newUserId = 0;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(userSql, conn);
                    cmd.Parameters.AddWithValue("@first_name", firstName);
                    cmd.Parameters.AddWithValue("@last_name", lastName);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password_hash", hash.Password);
                    cmd.Parameters.AddWithValue("@salt", hash.Salt);
                    cmd.Parameters.AddWithValue("@user_role", role);
                    if (!String.IsNullOrEmpty(teacherKeyActual))
                    {
                        cmd.Parameters.AddWithValue("@isTeacher", 1);
                    }
                    cmd.Parameters.AddWithValue("@isTeacher", 0);



                    newUserId = Convert.ToInt32(cmd.ExecuteScalar());
                    
                }
                newUser = GetUserById(newUserId);
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return newUser;
        }

        public User MapRowToUser(SqlDataReader reader)
        {
            User user = new User();

            user.UserId = Convert.ToInt32(reader["user_id"]);
            user.FirstName = Convert.ToString(reader["first_name"]);
            user.LastName = Convert.ToString(reader["last_name"]);
            user.Email = Convert.ToString(reader["email"]);
            user.Username = Convert.ToString(reader["username"]);
            user.PasswordHash = Convert.ToString(reader["password_hash"]);
            user.Salt = Convert.ToString(reader["salt"]);
            user.Role = Convert.ToString(reader["user_role"]);
            user.isTeacher = Convert.ToBoolean(reader["isTeacher"]);

            return user;
        }
    }
}
