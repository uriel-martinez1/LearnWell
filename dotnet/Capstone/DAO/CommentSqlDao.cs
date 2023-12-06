using Capstone.DAO.SqlDaoInterfaces;
using Capstone.Exceptions;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Principal;

namespace Capstone.DAO
{
    public class CommentSqlDao : ICommentDao
    {
        private readonly string connectionString;
        public CommentSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Comment> GetCommentsByUserId(int studentId)
        {
            List<Comment> comments = new List<Comment>();

            string sql = "select comment_id, submitted_assignment_id,created_by, comment, created_date," +
                " last_updated, number_of_edits from comments where created_by = @userId";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@user_id", studentId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Comment individualComment = MapRowToComment(reader);
                        comments.Add(individualComment);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return comments;
        } 
        public List<Comment> GetCommentsByUserId(int studentId, int teacherId)
        {
            List<Comment> comments = new List<Comment>();

            string sql = "select comment_id, submitted_assignment_id,created_by, comment, created_date," +
                " last_updated, number_of_edits from comments where created_by = @studentId or created_by = @teacherId";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@student_id", studentId);
                    cmd.Parameters.AddWithValue("@teacher_id", teacherId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Comment individualComment = MapRowToComment(reader);
                        comments.Add(individualComment);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return comments;
        }
      
        public Comment MapRowToComment(SqlDataReader reader)
        {
            Comment comment = new Comment();
            comment.CommentId = Convert.ToInt32(reader["comment_id"]);
            comment.SubmittedAssignmentId = Convert.ToInt32(reader["submitted_assignment_id"]);
            comment.CreatedById = Convert.ToInt32(reader["created_by"]);
            comment.CommentEntry = Convert.ToString(reader["comment"]);
            comment.CreatedDate = Convert.ToDateTime(reader["created_date"]);
            comment.LastUpdated = SqlUtil.NullableDateTime(reader["last_updated"]);
            comment.NumberOfEdits = Convert.ToInt32(reader["number_of_edits"]);
            return comment;
        }
    }
}
