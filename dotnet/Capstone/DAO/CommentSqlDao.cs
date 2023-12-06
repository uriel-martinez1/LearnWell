using Capstone.Exceptions;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Principal;

namespace Capstone.DAO
{
    public class CommentSqlDao
    {
        private readonly string connectionString;
        public CommentSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Comment> GetCommentsByUserId(int userId)
        {
            List<Comment> comments = new List<Comment>();
            string comment = "";

            string sql = "select comment_id, submitted_assignment_id,created_by, comment, created_date," +
                " last_updated, number_of_edits from comments where created_by = @userId";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        comment = MapRowToComment(reader);
                        comments.Add(comment);

                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return comments;
        }
        private Comment MapRowToComment(SqlDataReader reader)
        {
            Comment comment = new Comment();
            comment.CommentId = Convert.ToInt32(reader["comment_id"]);
            comment.SubmittedAssignmentId = Convert.ToInt32(reader["submitted_assignment_id"]);
            comment.CreatedById = Convert.ToInt32(reader["created_by"]);
            comment.CommentEntry = Convert.ToString(reader["comment"]);
            comment.CreatedDate = Convert.ToDateTime(reader["created_date"]);
            comment.LastUpdated = 
            return comment;
        }
        public DateTime CreatedDate { get; set; }
        public DateTime? LastUpdated { get; set; }
        public int NumberOfEdits { get; set; }
    }
}
